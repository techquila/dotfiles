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

# Backups
# =====================================================================
alias backup-full="duplicity --encrypt-key D59FA2C2562E4E82 --progress --s3-use-new-style --exclude /proc --exclude /sys --exclude /tmp / s3://s3.ap-southeast-2.amazonaws.com/zeta-restore"
alias backup-incr="duplicity incr --encrypt-key D59FA2C2562E4E82 --progress --s3-use-new-style --exclude /proc --exclude /sys --exclude /tmp / s3://s3.ap-southeast-2.amazonaws.com/zeta-restore"

# DOCKER
# =====================================================================
alias dcl="sudo docker container list"       ## list running containers
alias dcp="sudo docker container prune"      ## rm all stopped containers

alias dcb="sudo docker-compose build"        ## new image build context
alias dcd="sudo docker-compose down"         ## graceful shutdown
alias dce="sudo docker-compose exec"         ## exec shell command in container
alias dcr="sudo docker-compose run"          ## run image in container
alias dcu="sudo docker-compose up"           ## buckle in cowboy!

# Ansible
# =====================================================================

# Create directory structure
alias ansible_skel="mkdir -p ./{production,staging,group_vars/{group1,group2},library,filter_plugins,roles/{common/{default,files,handlers,meta,tasks,templates,vars},webtier,monitoring}}"


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

# Node



# SSH
# =====================================================================
# because we want to reduce lag by compressing, and NO forwarding x11
alias ssh="ssh -Cx"


# Miscellaneous helpers
# =====================================================================

## Generate random password with pwgen
alias pwgen="pwgen -c -n -s -y 16 -N 1"

alias python="python3"
