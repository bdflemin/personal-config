#!/bin/zsh

cd `dirname $0`

# make sure .zprezto exists
mkdir -p ./.zprezto/runcoms

# grab brew information
`which brew` leaves > ./my-casks.txt

# grab zsh configs for zprezto
cp -R $HOME/.zprezto/runcoms/z* .zprezto/runcoms/

# grab vimrc config
cp $HOME/.vimrc .

# complete the git calls to commit code
git add --all
git commit -q -m "Sync system config files for Bryan"
git push -q origin main
