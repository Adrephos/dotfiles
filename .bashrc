#
# ~/.bashrc
#

# If not running interactively, don't do anything

[[ $- != *i* ]] && return

# Make nvim the default editor


COLOR="\[$(tput setab 98)\]"
COLOR_FG="\[$(tput setaf 98)\]"
RESET="\[$(tput sgr0)\]"

PS1="${COLOR} \u@\h \W ${RESET}${COLOR_FG}${RESET} "

export EDITOR='nvim'

#ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"

#list
alias ls='ls -a --color=auto'
alias ll='ls -lah --color=auto'

#shutdown or reboot
alias ssn="sudo systemctl poweroff"
alias sr="sudo systemctl reboot"
alias hib="/usr/bin/systemctl hibernate"

alias gpom="git push -u origin main"
alias gpo="git push origin"

#apolo ssh connect
alias apolo_ssh="zellij --layout /home/gleipnir/.config/zellij/layouts/apolo.kdl"
alias atalaya="zellij --layout /home/gleipnir/.config/zellij/layouts/atalaya.kdl"
alias apolo="cd /home/gleipnir/workspace/apolo"

PF_ALIGN="10" PF_INFO="ascii title os kernel uptime pkgs" pfetch
alias dot='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

#utils
alias nnn='nnn -d -e -H -r'
alias cat='bat --theme Dracula'
alias cdw='cd $HOME/workspace/ && nnn'
alias cdg='cd $HOME/workspace/github.com/ && nnn'
alias cdf='cd $(find ~/ -path ~/onedrive -prune , -path ~/Qt -prune , -path ~/dotfiles -prune -o -type d | fzf) && zellij'
alias ssh='env TERM=xterm-256color ssh'
alias ssh_sudo='sudo env TERM=xterm-256color ssh'
alias venv='source ./venv/bin/activate'
alias update='sudo pacman -Syu'
alias vagrant='TERM=xterm-256color vagrant'

# Vagrant vm's with zellij
alias vm_ssh="zellij --layout /home/gleipnir/.config/zellij/layouts/vagrant.kdl"

#battery mng
thresh () {
	sudo bat-asus-battery threshold "$1"
}

export QT_STYLE_OVERRIDE=Dracula
export QT_QPA_PLATFORMTHEME=gtk2

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
		if [ "$LAST_REPO" != $(basename $(git rev-parse --show-toplevel))  ] && [ -z "${ZELLIJ}" ]; then
			onefetch -d dependencies authors contributors license -i $img_path --image-protocol kitty
			LAST_REPO=$(basename $(git rev-parse --show-toplevel))
		fi
	fi
}

take () {
  mkdir "$1"
  cd "$1"
}

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export PATH=$PATH:/home/gleipnir/.spicetify

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/gleipnir/google-cloud-sdk/path.bash.inc' ]; then . '/home/gleipnir/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/gleipnir/google-cloud-sdk/completion.bash.inc' ]; then . '/home/gleipnir/google-cloud-sdk/completion.bash.inc'; fi
