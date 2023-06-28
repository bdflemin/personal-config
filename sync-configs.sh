#!/bin/zsh

cd `dirname $0`

PID=`$(which pidof) fswatch`
FILELIST="$HOME.vimrc $HOME/.zprezto/runcoms"

if [ -n "$PID" ] ; then
    exit 1;
fi

(`which fswatch` -r -o $FILELIST | xargs -n1 -I{} ./commit_configs.sh) &
