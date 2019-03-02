#!/usr/bin/env bash
# begin ~/.bashrc

# Shell Options
# ========================================

## Correct basic typo's when changing directories
shopt -q -s cdspell

## Make sure display is updated when terminal window is resized
shopt -q -s checkwinsize

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"

# GPG 
# ========================================

## invoke gpg agent
GPG_TTY=$(tty)
export GPG_TTY

# SSH 
# ========================================

## add key to ssh-agent
if [ ! -S ~/.ssh/ssh_auth_sock ]; then
    eval "$(ssh-agent)"
    ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi

export SSH_AUTH_SOCK=$HOME/.ssh/ssh_auth_sock
ssh-add -l | grep "The agent has no identities" && ssh-add

## Add tab completion for SSH hostnames based on ~/.ssh/config
## (https://github.com/paulirish/dotfiles/blob/master/.bash_profile)
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# Conveniences
# ========================================

# emacs as default. emacs is life.
export EDITOR="emacs"
export ORG_HOME="$HOME/Dropbox/org"

# load alias' if exist
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

# Paths
# ========================================

# where ya bin?
export PATH=$PATH:$HOME/bin

# path to source directories
export SRCDIR="$HOME/code/src"

# path to bitbucket
export BITDIR="$SRCDIR/bitbucket.com/techquila"

# path to github
export GITDIR="$SRCDIR/github.com/techquila"

# path to dotfiles
export DOTDIR="$GITDIR/dotfiles"

# path to golang
export GOPATH="$HOME/go"
export PATH=$PATH:$GOPATH

# node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# python
## ensure new python projects use python3
VIRTUALENVWRAPPER_PYTHON='/usr/bin/python3'

## Setup Virtualenvs home
export WORKON_HOME="$HOME/.virtualenvs"
export PROJECT_HOME=$GITDIR

# Use virtualenvwrapper
source /usr/bin/virtualenvwrapper.sh

# Powerline - (https://github.com/powerline/powerline)
# (https://getsol.us/articles/software/powerline-shell-prompt/en/)
# ========================================
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
source /usr/lib/python3.6/site-packages/powerline/bindings/bash/powerline.sh


# end ~/.bashrc
