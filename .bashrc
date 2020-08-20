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

## export tty for gpg agent
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
export ALTERNATE_EDITOR="emacs"
export EDITOR="emacsclient -t"             # $EDITOR opens in terminal
export VISUAL="emacsclient -a '' -c"       # $VISUAL opens in GUI mode
export ORG_HOME="$HOME/Dropbox/org"        # where my .org files live

# load alias' if exist
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

# Paths
# ========================================

## where your bin?
if [ -s "$HOME/bin/" ]; then
    export PATH=$PATH:$HOME/bin
fi

## path to source directories
export SRCPATH="$HOME/code/src"

## path to bitbucket
export BITPATH="$SRCPATH/bitbucket.com/techquila"

## path to github
export GITPATH="$SRCPATH/github.com/techquila"

## path to dotfiles
export DOTPATH="$GITPATH/dotfiles"

## path to golang
export GOPATH="$HOME/go"
export PATH=$PATH:$GOPATH:$GOPATH/bin

# Bash Completion
# ========================================
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Python
# ========================================


## ensure new python projects use python3
VIRTUALENVWRAPPER_PYTHON='/usr/bin/python3'

## Setup Virtualenvs home
export WORKON_HOME="$HOME/.virtualenvs"
export PROJECT_HOME=$GITDIR

# Node
# ========================================

# node version manager
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Powerline - (https://github.com/powerline/powerline)
# (https://getsol.us/articles/software/powerline-shell-prompt/en/)
# ========================================
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1

if [ -f /usr/share/powerline/bindings/bash/powerline.sh ]; then
source /usr/share/powerline/bindings/bash/powerline.sh
fi

# Netlify
# ========================================

# The next line updates PATH for Netlify's Git Credential Helper.
if [ -f '/home/techquila/.netlify/helper/path.bash.inc' ]; then source '/home/techquila/.netlify/helper/path.bash.inc'; fi

# end ~/.bashrc

