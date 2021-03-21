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

# ## add key to ssh-agent
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

# Emacs is Life!
# ========================================

## Emacs Server:
## first let's use systemd to start a server process.
## (A systemd service descriptor, named "emacs.service", should be present in "~/.config/systemd/user directory")
systemctl enable --user emacs
systemctl start --user emacs

## now let's set some environment variables that ensure we use client processes that
## connect to our server instance when calling our editor of choice
export EDITOR="emacsclient -s emacs_server0 -t $HOME/src/Dropbox/my/study/studycentral.org"  # $EDITOR opens in terminal
export VISUAL="emacsclient -s emacs_server0 -c $HOME/src/Dropbox/my/study/studycentral.org"  # $VISUAL opens in GUI mode
export ALTERNATE_EDITOR="emacs"

# Bash aliases
# ========================================
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

# Paths
# ========================================

## where you bin?
if [ -s "$HOME/bin/" ]; then
    export PATH=$PATH:$HOME/bin
fi

## path to source directories
export SRCPATH="$HOME/src"

## path to bitbucket
export BITPATH="$SRCPATH/bitbucket/techquila"

## path to github
export GITPATH="$SRCPATH/Github/techquila"

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
# powerline-daemon -q
# POWERLINE_BASH_CONTINUATION=1
# POWERLINE_BASH_SELECT=1

# if [ -f /usr/share/powerline/bindings/bash/powerline.sh ]; then
# source /usr/share/powerline/bindings/bash/powerline.sh
# fi

# Netlify
# ========================================

# The next line updates PATH for Netlify's Git Credential Helper.
if [ -f '/home/techquila/.netlify/helper/path.bash.inc' ]; then source '/home/techquila/.netlify/helper/path.bash.inc'; fi

# end ~/.bashrc
