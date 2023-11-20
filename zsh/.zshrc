source ~/.config/zsh/antigen.zsh

# The following lines were added by compinstall
zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' list-colors ''
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install

# ************ Custom Config ************
#
source ~/.config/zsh/prompt
source "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"

export user_color="blue"
export EDITOR="nvim"
export SVDIR="$HOME/.services"

export PASSWORD_STORE_ENABLE_EXTENSIONS="true"
export PASSWORD_STORE_LOGIN_PREFIX="user|email"

alias cat="bat"
alias ll="ls -lh"
alias la="ls -A"
alias ls="lsd"

alias rm="rm -i"
alias sudo="echo Use doas! "
alias u="date '+%s' | wl-copy"

alias t="task"
alias tt="task context"
alias ssh="TERM='xterm-256color' ssh"

alias tm="timew start \"Meeting\""
alias ts="timew sum"
alias tp="timew stop"
alias tw="timew week"
alias tk="timew continue"
alias ty="timew sum :yest"

alias c="code ."

gsource() {
  if [ -n "$1" ]; then
    source <(gpg -d "$1" 2> /dev/null) ${@:2}
  else
    echo "Missing file path"
  fi
}

# Restart Task
tr() {
  if [ -n "$1" ]
  then
    task $1 stop
    task $1 start
  else
      echo "Missing task id"
  fi
}

[ -f ~/.config/zsh/custom.zsh ] && source ~/.config/zsh/custom.zsh
#
# ************ ****** ****** ************

# ************ Plugins ************
#

antigen bundle zsh-users/zsh-autosuggestions
antigen bundle jeffreytse/zsh-vi-mode

# This has to be the last line
antigen bundle z-shell/F-Sy-H --branch=main
# ************ ******* ************


antigen apply

eval "$(zoxide init --cmd f zsh)"
