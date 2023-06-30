#!/bin/zsh

cd `dirname $0`

PID=`/usr/local/bin/pidof fswatch`
FILELIST="$HOME.vimrc $HOME/.zprezto/runcoms"

if [ -n "$PID" ] ; then
    exit 1;
fi

(/usr/local/bin/fswatch -r -o $FILELIST | xargs -n1 -I{} ./commit_configs.sh) &
