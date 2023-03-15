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
alias ssn="sudo systemctl poweroff"
alias sr="sudo systemctl reboot"
alias hib="/usr/bin/systemctl hibernate"

#apolo ssh connect
alias apolo_ssh_tmux="ssh jeavendanc@apolo.eafit.edu.co"
alias apolo_ssh="bash ~/bin/apolo_ssh.sh"
alias apolo="cd /home/gleipnir/workspace/Apolo"

PF_ALIGN="10" PF_INFO="ascii title os kernel uptime pkgs" pfetch
alias dot='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

#mount onedrive
alias college="rclone --vfs-cache-mode writes mount "college":  ~/workspace/college/ &"

alias tools='cd /home/gleipnir/workspace/subjects/OrgComp/nand2tetris/tools'

export QT_STYLE_OVERRIDE=Dracula
export QT_QPA_PLATFORMTHEME=gtk2
export SHUX_API_SA="$HOME/workspace/secrets/serviceaccount.json"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

img=$(/usr/bin/ls $HOME/Pictures/onefetch | sort -R | head -1)
img_path=$HOME/Pictures/onefetch/$img

LAST_REPO=""
cd() {
    builtin cd "$@";
    git rev-parse 2>/dev/null;

    if [ $? -eq 0 ]; then
        if [ "$LAST_REPO" != $(basename $(git rev-parse --show-toplevel)) ]; then
		onefetch -d project dependencies authors contributors url license -i $img_path
        LAST_REPO=$(basename $(git rev-parse --show-toplevel))
        fi
    fi
}

take () {
  mkdir "$1"
  cd "$1"
}
