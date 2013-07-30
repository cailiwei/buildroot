#!/bin/bash
# set server-url: "http://git.buildroot.net/git/buildroot.git" or "git://git.buildroot.net/buildroot"
git remote set-url origin http://git.buildroot.net/git/buildroot.git
git remote show origin
git fetch
git pull --rebase
# ----------------------------------------------------------
# set server-url: "https://github.com/cailiwei/buildroot.git" or "git@github.com:cailiwei/buildroot.git"
git remote set-url origin https://github.com/cailiwei/buildroot.git
git remote show origin
git push origin master
# ----------------------------------------------------------

echo "Code sync process end !!!"
