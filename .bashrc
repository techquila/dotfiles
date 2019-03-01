#!/usr/bin/env bash

# Shell Options
# ==================================================

## Correct basic typo's when changing directories
shopt -q -s cdspell

## Make sure display is updated when terminal window is resized
shopt -q -s checkwinsize

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"

# GPG 
# ==================================================

## invoke gpg agent
GPG_TTY=$(tty)
export GPG_TTY

# SSH 
# ==================================================

## add key to ssh-agent
if [ ! -S ~/.ssh/ssh_auth_sock ]; then
    eval "$(ssh-agent)"
    ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi

export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
ssh-add -l | grep "The agent has no identities" && ssh-add

## Add tab completion for SSH hostnames based on ~/.ssh/config
## (https://github.com/paulirish/dotfiles/blob/master/.bash_profile)
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# Conveniences
# ==================================================

export PATH=$PATH:$HOME/bin

if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
else
    if [ -f ~/code/src/github.com/techquila/dotfiles/.bash_aliases ]; then
	ln -s ~/code/src/github.com/techquila/dotfiles/.bash_aliases ~/.bash_aliases && source ~/.bash_aliases
    fi
fi


# emacs as default. emacs is life.
export EDITOR="emacs"
export ORG_HOME="~/Dropbox/org"

# Powerline - (https://github.com/powerline/powerline)
# (https://getsol.us/articles/software/powerline-shell-prompt/en/)
# =====================================================================
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
source /usr/lib/python3.6/site-packages/powerline/bindings/bash/powerline.sh

# github path
export DEVPATH="$HOME/code/src/github.com/techquila"

# golang
export GOPATH="$HOME/go"
export PATH=$PATH:$GOPATH

# node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# python
## Make sure my new python projects use python3
VIRTUALENVWRAPPER_PYTHON='/usr/bin/python3'

## Setup Virtualenvs home
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/project

source /usr/bin/virtualenvwrapper.sh

