# Begin ~/profile.d/50-history.sh

export HISTTIMEFORMAT='%F %T '                 # timestamps 
export HISTCONTROL=ignoredups:erasedups        # no duplicate entries
export HISTSIZE=10000                          # how many commands (default is 500)
export HISTFILESIZE=10000                      # max lines in history (default is 500)
export HISTIGNORE="&:[bf]g:exit:history:ls:ps" # ignore duplicates,bg,fg,ls,ps,history,exit
shopt -s histappend                            # append to history, don't overwrite it

# End ~/profile.d/50-history.sh
