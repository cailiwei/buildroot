#!/bin/bash
# set server-url: "http://git.buildroot.net/git/buildroot.git" or "git://git.buildroot.net/buildroot"
proxy=$1

if [ "$proxy" = "http" ]; then
	git remote set-url origin http://git.buildroot.net/git/buildroot.git
	git remote show origin
	git fetch
	git pull --rebase
else
	git remote set-url origin git://git.buildroot.net/buildroot
	git remote show origin
	git fetch
	git pull --rebase
fi

# ----------------------------------------------------------
# set server-url: "https://github.com/cailiwei/buildroot.git" or "git@github.com:cailiwei/buildroot.git"
if [ "$proxy" = "http" ]; then
	git remote set-url origin https://github.com/cailiwei/buildroot.git
	git remote show origin
	git push origin master
else
	git remote set-url origin git@github.com:cailiwei/buildroot.git
	git remote show origin
	git push origin master
fi
# ----------------------------------------------------------

echo "Code sync process end !!!"
