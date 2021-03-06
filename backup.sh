#!/bin/bash

# aliases are expanded in non-interactive shells by default
shopt -s expand_aliases

# re-source the aliases file
source /home/sod/.bash_aliases

# run incremental backup command using designated alias
backup-incr

# # alert if non-zero exit
# EXITVALUE=$?
# if [ $EXITVALUE != 0 ]; then
#     /usr/bin/logger -t backup-incr "ALERT exited abnormally with [$EXITVALUE]"
# fi
# exit $EXITVALUE
