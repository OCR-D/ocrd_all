#!/usr/bin/env bash
# set -ex

# SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
# PATH="$SCRIPTDIR:$PATH"
SCRIPTNAME=$(basename $0)

version=$(git describe --abbrev=0 --tags --exact-match 2>/dev/null||date +'v%Y-%m-%d')

usage () {
    echo "$SCRIPTNAME [options] <command>"
    echo ""
    echo "Options:"
    echo ""
    echo "  -V  Version to release. Default: $version"
    echo "  -h  Show this help"
    echo ""
    echo "Commands:"
    echo ""
    echo "  update              Update all submodules to most recent master/dev branch"
    echo "  changelog           Generate a changelog for all modified submodules"
    echo "  release-github      Release to GitHub as $version"
    echo "  release-dockerhub   Release ocrd/all:maximum as ocrd/all:${version#v} to DockerHub"
}

main () {
    while [[ "$1" = -* ]];do
        case "$1" in
            -V) version="$2";
                if [[ "$version" != v* ]];then
                    echo "Version must start with 'v': $version"
                    exit 1
                fi
                shift; ;;
            -h) usage; exit; ;;
        esac
        shift
    done
    if [[ -z "$1" ]];then
        usage
        exit 1
    fi
    cmd="$1"
    shift
    case "$cmd" in
        update) update_all_submodules "$@" ;;
        changelog) update_changelog ;;
        release-github) release_github ;;
        release-dockerhub) release_dockerhub ;;
        *) usage; exit 1 ;;
    esac
}

submodule_url () {
    local sm="$1"
    git config --file .gitmodules --get-regexp "$sm.url" |cut -d' ' -f 2|sed 's,\.git$,,'
}

list_all_submodules () {
    git config --file .gitmodules --get-regexp path | awk '{ print $2 }' |sort -n
}

list_changed_submodules () {
    git submodule status |grep '^+'|cut -d ' ' -f 2|sort -n
}

update_one_submodule () {
    local sm="$1"
    local branch="master"
    if test $sm = 'ocrd_cis';then
        branch="dev"
    fi
    (
        cd $sm
        git pull origin "$branch"
        git pull origin "$branch" --tags
        git submodule update --init
     )
}

update_all_submodules () {
    if [[ $# -gt 0 ]];then
        sms="$@"
    else
        sms=($(list_all_submodules))
    fi
    for sm in "${sms[@]}";do
        update_one_submodule "$sm"
    done
}

submodule_changelog () {
    local sm="$1"
    local smurl=$(submodule_url "$sm")
    local smtag=$(cd $sm; git describe --abbrev=0 --tags 2>/dev/null|| echo '')
    if [[ -n "$smtag" ]];then
        smtag="\\n> Release: [$smtag]($smurl/releases/$smtag)\\n"
    fi
    git diff --submodule=log "$sm"| sed \
        -e "s,^Submodule \\([^ ]\\+\\) \\([^\.]\\+\\)..\\([^\.]\\+\\):,### [\1]($smurl) [\2]($smurl/commits\2)..[\3]($smurl/commits/\3)\\n$smtag," \
        -e 's,^\s*>,  > *,'
}

update_changelog () {
    (
        echo "# Changelog"
        echo ""
        echo "## [$version](https://github.com/OCR-D/ocrd_all/releases/$version)"
        echo ""
        for sm in $(list_changed_submodules);do
            submodule_changelog $sm
            echo ""
        done
        sed "/^[#] Changelog/d" CHANGELOG.md
    ) > CHANGELOG.md.tmp
    mv CHANGELOG.md.tmp CHANGELOG.md
}

release_github () {
    if [[ "$(git status CHANGELOG.md)" = "" ]];then
        echo "CHANGELOG.md is unmodified. Did you update it?"
        exit 1
    fi
    git add CHANGELOG.md
    git commit -m ":package: v$version"
    git tag $version
    git push
    git push --tags
    echo "Go to https://github.com/OCR-D/ocrd_all/releases/$version and paste"
    echo "the CHANGELOG.md section as release notes"
}

release_dockerhub () {
    docker tag ocrd/all:maximum ocrd/all:${version#v}
    docker push ocrd/all:${version#v}
}


main "$@"
