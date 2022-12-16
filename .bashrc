#
# ~/.bashrc
#

# If not running interactively, don't do anything

[[ $- != *i* ]] && return

# Make nvim the default editor


COLOR="\[$(tput setaf 213)\]"
RESET="\[$(tput sgr0)\]"

PS1="${COLOR}[\u@\h \W]\$${RESET} "

export EDITOR='nvim'

#ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"

#list
alias ls='ls -a --color=auto'
alias ll='ls -la --color=auto'

#shutdown or reboot
alias ssn="shutdown now"
alias sr="reboot"
alias hib="/usr/bin/systemctl hibernate"

#apolo ssh connect
alias apolo_ssh_tmux="ssh jeavendanc@apolo.eafit.edu.co"
alias apolo_ssh="bash ~/bin/apolo_ssh.sh"
alias apolo="cd /home/gleipnir/workspace/Apolo"

PF_ALIGN="10" PF_INFO="ascii title os kernel uptime pkgs" pfetch
alias dot='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias wper='feh --bg-fill --randomize ~/Pictures/Wallpaper/*'

#mount onedrive
alias college="rclone --vfs-cache-mode writes mount "college":  ~/workspace/college/ &"

export QT_STYLE_OVERRIDE=plastique

source $HOME/.asdf/asdf.sh
source $HOME/.asdf/completions/asdf.bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
