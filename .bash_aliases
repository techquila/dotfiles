#!/usr/bin/env bash

# Safety first
# =====================================================================

## prompt before every removal.  Annoying but you're a dickhead sometimes.
alias rm="rm -i" 

# Easier navigation of directories
# =====================================================================

alias cd.="cd .."
alias cd..="cd ../.."
alias cd...="cd ../../.."
alias cd....="cd ../../../.."

# Better ls control
# =====================================================================
# -a = all, -d = directories only, -F = append either (*/=>@|),
# -g = group directories before files, -h = human readable sizes

alias la="ls -la"
alias ls="ls -Fh"
alias lsa="ls -agFh"
alias lsd='ls -la | grep "^d"'


# Files and Maintenance
# =====================================================================

## File size
alias fs="stat -f \"%z bytes\""

## Find disk hogs in pwd
alias ducks='du -cks * | sort -rn | head'

# Quick edit files
# =====================================================================

alias edit_aliases="$EDITOR --debug-init ~/.bash_aliases"
alias edit_hosts='sudo $EDITOR --debug-init /etc/hosts'
alias edit_bashrc="$EDITOR --debug-init ~/.bashrc"
alias edit_emacs="$EDITOR --debug-init ~/.emacs.d/sod.org"
alias edit_i3="$EDITOR --debug-init ~/.config/i3/config"
alias edit_i3status="$EDITOR --debug-init ~/.config/i3/i3status.conf"
alias edit_irc="$EDITOR --debug-init ~/.emacs.d/erc-config.org"
alias edit_lxc="$EDITOR --debug-init ~/lxc/default.conf"

# GIT
# =====================================================================

## git root
alias gr='[ ! -z `git rev-parse --show-cdup` ] && cd `git rev-parse --show-cdup || pwd`'

## Undo a `git push`
alias undopush="git push -f origin HEAD^:master"

# Networking
# =====================================================================

# IP addresses
alias whatip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# All the dig info
alias dig="dig +nocmd any +multiline +noall +answer"

# SSH
# =====================================================================
# because we want to reduce lag by compressing, and NO forwarding x11
alias ssh="ssh -Cx"

# Ansible
# =====================================================================

# Create directory structure
alias ansible_skel="mkdir -p ./{production,staging,group_vars/{group1,group2},library,filter_plugins,roles/{common/{default,files,handlers,meta,tasks,templates,vars},webtier,monitoring}}"

# Git
# =====================================================================
function clone() {
GITUSER=$1
GITREPO=$2
    git clone git@github.com:"$GITUSER"/"$GITREPO" ~/code/src/github.com/"$GITUSER"/"$GITREPO" && cd ~/code/src/github.com/"$GITUSER"/"$GITREPO"
}

    function clone {

        if [ $# -eq 0 ]; then
            echo "Please enter repo name or full url:";
            read repo;
            clone $repo;
        elif [[ $1 == --help ]] || [[ $1 == --h ]] || [[ $1 == --? ]]; then
            echo "This will clone a git repo.";
            echo "";
            echo "Option 1: You can just provide the name, eg:";
            echo "$ clone membership";
            echo "This will do: git clone https://github.com/techquila/bamgo.git";
            echo "";
            echo "Option 2: Provide the full URL";
            echo "$ clone https://github.com/facebook/react.git";
            echo "This will do: git clone https://github.com/facebook/react.git";
        else    
            if [[ $1 == https://* ]] || [[ $1 == git://* ]] || [[ $1 == ssh://* ]] ; then
                URL=$1;
            else
                URL='https://github.com/techquila/'$1'.git';
            fi    

            echo git clone "$URL";
            git clone "$URL";
        fi
    }

    export -f clone

# Miscellaneous helpers
# =====================================================================

## Generate random password with pwgen
alias pwgen="pwgen -c -n -s -y 16 -N 1"

