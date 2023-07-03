#!/bin/zsh

cd `dirname $0`

PID=`/usr/local/bin/pidof fswatch`
NOHUPCMD='/usr/bin/nohup'
FSWATCHCMD='/usr/local/bin/fswatch'
FILELIST="$HOME/.vimrc $HOME/.zprezto/runcoms"

if [ -n "$PID" ] ; then
    exit 1;
fi

(${NOHUPCMD} ${FSWATCHCMD} -0 -Lr -o ${FILELIST} | xargs -0 -n1 ./commit_configs.sh) &

