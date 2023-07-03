#!/bin/zsh

cd `dirname $0`

PID=`/usr/local/bin/pidof fswatch`
FSWATCHCMD='/usr/local/bin/fswatch'
FILELIST="$HOME/.vimrc $HOME/.zprezto/runcoms"

if [ -n "$PID" ] ; then
    exit 1;
fi

(${FSWATCHCMD} -Lr -o ${FILELIST} | xargs -n1 -I{} ./commit_configs.sh) &
