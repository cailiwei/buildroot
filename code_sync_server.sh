#!/bin/bash
# set server-url: "http://git.buildroot.net/git/buildroot.git" or "git://git.buildroot.net/buildroot"
echo "############### Begin sync local code to remote origin #########################"
proxy=$1

if [ "$proxy" = "http" ]; then
	git remote set-url origin http://git.buildroot.net/git/buildroot.git
	git fetch
	git pull --rebase
else
	git remote set-url origin git://git.buildroot.net/buildroot
	git fetch
	git pull --rebase
fi
# Look for the remote origin
echo "##################################################################################"
git remote show origin
echo "##################################################################################"

# ----------------------------------------------------------
# set server-url: "https://github.com/cailiwei/buildroot.git" or "git@github.com:cailiwei/buildroot.git"
if [ "$proxy" = "http" ]; then
	git remote set-url origin https://github.com/cailiwei/buildroot.git
	git push origin master:next
	git pull --rebase
	var=`git branch | grep next`
	if [ "$var" = "next" ]; then
		git pull --rebase
	else
		git checkout -b next origin/next
	fi
	git checkout master
	git merge next
	git push origin master
else
	git remote set-url origin git@github.com:cailiwei/buildroot.git
	git push origin master:next
	git pull --rebase
	var=`git branch | grep next`
	if [ "$var" = "next" ]; then
		git pull --rebase
	else
		git checkout -b next origin/next
	fi
	git checkout master
	git merge next
	git push origin master
fi

# Look for the remote origin info
git remote show origin
# ----------------------------------------------------------

echo "################### End of sync ######################################################"
echo "Code sync process end !!!"
