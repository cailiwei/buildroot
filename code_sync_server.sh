#!/bin/bash
# set server-url: "http://git.buildroot.net/git/buildroot.git" or "git://git.buildroot.net/buildroot"
echo "############### Begin sync local code to remote origin #########################"
echo

proxy=$1

if [ "$proxy" = "http" ]; then
	git remote set-url origin http://git.buildroot.net/git/buildroot.git
else
	git remote set-url origin git://git.buildroot.net/buildroot
fi
git fetch
git pull --rebase
# Look for the remote origin
echo "##################################################################################"
echo
git remote show origin
echo "##################################################################################"
echo

# ----------------------------------------------------------
# set server-url: "https://github.com/cailiwei/buildroot.git" or "git@github.com:cailiwei/buildroot.git"
if [ "$proxy" = "http" ]; then
	git remote set-url origin https://github.com/cailiwei/buildroot.git
else
	git remote set-url origin git@github.com:cailiwei/buildroot.git
fi

# there is a bug: if master pull failed then push to next, it's an error
echo "New, you need to confirm 'git pull --rebase' successfully ???"
echo "And then type 'y' to push local master branch to server origin next branch, type 'n' to quit convertion..."
read reply leftover
case $reply in
	y* | Y*)
		echo "git push origin master:next!"
		git push origin master:next;;
	*)
		echo "Well, you quited convertion!"
		exit 0;;
esac

git pull --rebase
var=`git branch | awk '{print $1}' | grep "next"`
if [ "$var" = "next" ]; then
	echo
	echo "Already have the 'next' branch, so execute: git pull --rebase "
	git stash
	git checkout next
else
	echo
	echo "Don't have the 'next' branch, so execute: git checkout -b next origin/next "
	git stash
	git checkout -b next origin/next
fi

git pull --rebase
git checkout master
git stash pop
git merge next
# Look for the remote origin info
git remote show origin
# ----------------------------------------------------------

echo "################### End of sync ######################################################"

echo "Now please execute: 'git push origin master' to sync local to server 'master' branch"
echo
