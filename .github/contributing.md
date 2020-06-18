# ocrd_all Contributing guidelines

For general information on how to use `ocrd_all`, please see the [README](https://github.com/OCR-D/ocrd_all).

Thank you for being interested in contributing to `ocrd_all`!

If you have any questions, feel free to ask them in the [OCR-D gitter chat](https://gitter.im/OCR-D/Lobby).

## How to create PR for updated submodules

1. Create a new branch with any name, e.g. `git checkout -b update-$(date +'%Y-%m-%d')`
2. Selectively update submodules in a way that makes sense to you. To upgrade
  all submodules to the latest upstream versions, run `./release.sh update`. To
  update only a specific submodule, such as `ocrd_cis`, run `./release.sh update
  ocrd_cis`. Or update individual submodules manually: `cd <submodule>; git pull
  origin master` (replace `master` if you want to merge another branch instead)
3. Manually check with `git status` that the changes are consistent with what
  you want to update in the PR.
4. `git add` / `git commit`
5. `git push` to your `ocrd_all` fork on GitHub
6. Open a new PR for that branch (The `git push` request will show you the right URL)

## How to merge update PR for updated submodules

You need to be a "Maintainer" or "Admin" to merge pull requests.

1. Wait for CI to successfully finish (ensuring that the `maximum` image can be built)
2. **Do not merge on GitHub**. Do the following locally:
3. Check out the `master` branch locally, `git pull` to make sure it's up-to-date and `git submodule update --init --recursive` to reset the submodules to the state in master.
4. Merge the PR branch: `git merge pr-branch`
6. Update the submodules to the new state: `git submodule update --recursive --init`
5. Generate the changelog: `./release.sh changelog`.
7. Inspect the CHANGELOG.md and remove superfluous information like merge commits or spurious newlines. Copy the new section to the clipboard (see step 9)
8. Release to GitHub with `./release.sh release-github`. This will take care of comitting, tagging and pushing the release.
9. Create a new release on GitHub, paste the new changelog section as the release notes.
