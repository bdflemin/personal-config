# personal-config
configs needed for zsh, brew or other services when needed

Currently looking for the following configs

* brew casks
* vimrc
* everything in .config

most of the configs are `cp` options into the profile but the `brew` part will need ot be done doing the following:

```
xargs brew install < my-casks.txt
```

`pip` will also need to be ran to update using the following:
```
pip install -r ./my-pip.txt
```

# Setup on system
Wanted to make it simple so I made the `sync-configs.sh` script executable and ran in a cron job every 5 minutes to make sure it will check to see if the `fswatch` was already active and if so, exit. If it didn't find the `fswatch` process, it will start it as a background process.

## Prerequisite
Installed the following using `brew`:
```
brew install fswatch pidof tmux
```
Also, this is used to grab `zprezto` data and not `oh-my-zsh` data but that can be added if needed to make it robust enough for all zsh users.
