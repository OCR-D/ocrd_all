#!/usr/bin/env bash
 #set -x

# SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
# PATH="$SCRIPTDIR:$PATH"
SCRIPTNAME=$(basename $0)

version=$(date +'v%Y-%m-%d')
previous_version=$(git describe --tags $(git rev-list --tags --max-count=1))
if [[ -z "$previous_version" ]];then
    echo "Could not detect previous version :("
    exit 1
fi

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

loginfo () {
    echo >&2 $(date) "$@"
}

submodule_url () {
    local sm="$1"
    git config --file .gitmodules --get-regexp "$sm.url" |cut -d' ' -f 2|sed 's,\.git$,,'
}

list_all_submodules () {
    git config --file .gitmodules --get-regexp path | awk '{ print $2 }' |sort -n
}

list_changed_submodules () {
    git diff --stat $previous_version $(list_all_submodules)|grep -F '|'|cut -d ' ' -f 2
}

update_one_submodule () {
    local sm="$1"
    local branch="master"
    (
        cd $sm
        git pull --rebase origin "$branch"
        git pull --rebase origin "$branch" --tags
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
    loginfo "Generating changelog for $sm"
    if [ -z "$(git diff --submodule=log "$sm")" ];then
        return
    fi
    git diff --submodule=log "$sm" | sed \
        -e "s,^Submodule \\([^ ]\\+\\) \\([^\.]\\+\\)..\\([^\.]\\+\\):,### [\1]($smurl) [\2]($smurl/commits/\2)..[\3]($smurl/commits/\3)\\n$smtag," \
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
    changelog=$(git diff CHANGELOG.md|grep '^+'|sed -e 's,^.,,' -e 's,",\",g' )
    git add CHANGELOG.md
    git commit -m ":package: $version"
    git tag $version
    git push
    git push --tags
    echo -n "(p)rint changelog, (c)opy changelog to clipboard, (i)gnore? > "
    read resp;
    if [[ $resp = p* || $resp = P* ]];then
        echo "$changelog"
    elif [[ $resp = c* || $resp = C* ]];then
        if command -v pbcopy 2>/dev/null;then
            echo "$changelog" | pbcopy
            echo "Copied to clipboard"
        elif command -v xclip 2>/dev/null;then
            echo "$changelog" | xclip -i
            echo "Copied to clipboard"
        else
            echo "!! Neither xclip nor pbcopy available. Install xclip or pbcopy or copy by hand:"
            echo "$changelog"
        fi
    fi
}

release_dockerhub () {
    docker tag ocrd/all:maximum ocrd/all:${version#v}
    docker push ocrd/all:${version#v}
}


main "$@"
