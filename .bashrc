#
# ~/.bashrc
#

# If not running interactively, don't do anything

[[ $- != *i* ]] && return

# Make nvim the default editor


# COLOR="\[$(tput setab 98)\]"
# COLOR_FG="\[$(tput setaf 98)\]"
# RESET="\[$(tput sgr0)\]"
# 
# PS1="${COLOR} \u@\h \W ${RESET}${COLOR_FG}${RESET} "

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

alias dot='/home/gleipnir/.nix-profile/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

#utils
alias ssh='env TERM=xterm-256color ssh'
alias ssh_sudo='sudo env TERM=xterm-256color ssh'
alias venv='source ./venv/bin/activate'

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

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export PATH=$PATH:/home/gleipnir/.spicetify

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/gleipnir/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/home/gleipnir/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/gleipnir/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/home/gleipnir/Downloads/google-cloud-sdk/completion.bash.inc'; fi

# pnpm
export PNPM_HOME="/home/gleipnir/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
