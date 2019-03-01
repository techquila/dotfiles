# Begin ~/.bash_profile

# Source defaults
. /usr/share/defaults/etc/profile

# Source my prefs
## puppetize the following once new puppet master set up

DOTPATH="$HOME/code/src/github.com/techquila/dotfiles"

if [ ! -d ~/.profile.d ]; then
    echo "no .profile.d directory exists. Trying to rectify..." && ln -s $DOTPATH/.profile.d/ ~/
fi
if [ -d ~/.profile.d ]; then
    for script in ~/.profile.d/*.sh
    do
	. $script
    done
    unset script
fi

# End ~/.bash_profile
