# Begin ~/profile.d/10-path.sh
if [ -s "$HOME/bin/" ]; then
    export PATH=$PATH:$HOME/bin
fi

if [ -d "$HOME/go/" ]; then
    export PATH=$PATH:$HOME/go
fi


# End ~/profile.d/10-path.sh
