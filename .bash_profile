#
# ~/.bash_profile
#

[[ -d ~/bin ]] && export PATH=$PATH:~/bin

export EDITOR="vim"
[ -f $HOME/.vim/bundle/vimpager/vimpager ] &>/dev/null && \
	export PAGER="$HOME/.vim/bundle/vimpager/vimpager"

if [ "$TERM" == "linux" ]
then
	setfont ter-116v
	redshift -m drm -o
	setterm --powerdown 60
	setterm --powersave on
	setterm --regtabs 4
	setterm --blength 0
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc
#eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
#export SSH_AUTH_SOCK
