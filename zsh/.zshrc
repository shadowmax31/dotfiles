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
alias n="nvim ~/.notes"

export user_color="blue"
export EDITOR="nvim"

alias ls="ls --color"
alias ll="ls -lh"
alias la="ls -a"
alias rm="rm -i"
alias sudo="echo Use doas! "

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
