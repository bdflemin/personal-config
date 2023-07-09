#!/bin/zsh

cd `dirname $0`

# get commit number by 1
COMMITNUM=`git rev-list --all --count`
COMMITNUM=$((COMMITNUM+1))

# make sure .zprezto exists
mkdir -p ./.zprezto/runcoms

# grab brew information
`which brew` leaves > ./my-casks.txt

# grab default pip info
`which pip-chill` --no-version > ./my-pip.txt

# grab zsh configs for :prezto
cp -a $HOME/.zprezto/runcoms/z* .zprezto/runcoms/

# grab vimrc and config stuff
cp -a $HOME/.vimrc .
cp -a $HOME/.config .

# complete the git calls to commit code
git add --all
git commit -q -m "Sync system config files for Bryan #${COMMITNUM}"
git push -q origin main
