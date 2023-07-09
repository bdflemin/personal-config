#!/bin/zsh

cd `dirname $0`

PID=`/usr/local/bin/pidof fswatch`
FSWATCHCMD='/usr/local/bin/fswatch'
FILELIST="$HOME/.vimrc $HOME/.zprezto/runcoms $HOME/.config"

if [ -n "$PID" ] ; then
    exit 1;
fi

SESSION="fswatch"
PANE="${session}.0"
TMUXCMD="/usr/local/bin/tmux"

if [[ -z "$(${TMUXCMD} ls | grep fswatch)" ]]; then
    $TMUXCMD new -d -s ${PANE}
fi
${TMUXCMD} send-keys -t ${PANE} C-z "${FSWATCHCMD} -0 -Lr -o ${FILELIST} | xargs -0 -n1 ./commit-configs.sh" Enter
