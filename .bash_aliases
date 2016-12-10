# General system aliases
alias sudo="sudo " # mind = blown
alias chown="chown -h"
alias ls='ls -hX --group-directories-first --time-style=+"%d/%m/%Y %H:%M:%S" --color=auto -F --quoting-style=literal'
alias ll='ls -l'
alias la='ls -Al'
alias cal='cal -3'
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"
alias df='df -h'
alias free='free -m'
alias dfc='dfc -d -t -tmpfs,devtmpfs -w'
alias telnet="telnet --escape='^E'"
alias du='du -h'
alias nmcli='nmcli -a'
alias diff='diff -u'
alias vmstat="vmstat -S m"
alias w="w -i"
alias last="last -w"
alias pinky="pinky -w"
alias htop="htop -d 4"
alias tee="tee -a"
alias nmap="nmap -v"
alias startx="startx ~/.xinitrc"
alias mupdf="mupdf -r 144"
alias vim="vim -i ~/.vim/viminfo -p"
alias clearvim="rm -rf $HOME/.vim/{undo,swap,backup}/*"
alias xz="xz -T 0"
alias inxi="inxi -F"
which colordiff &>/dev/null && alias diff='colordiff'
[ -f $HOME/.vim/bundle/vimpager/vimcat ] &>/dev/null && \
	alias cat="$HOME/.vim/bundle/vimpager/vimcat"
[ -f $HOME/.vim/bundle/vimpager/vimpager ] &>/dev/null && \
	alias vimpager="$HOME/.vim/bundle/vimpager/vimpager"


# Helpful things
alias hdd_poff="udisksctl power-off -b"
alias fssize="sudo du -hs / --exclude=/dev --exclude=/run --exclude=/sys --exclude=/proc --exclude=/home --exclude=/media --exclude=/srv"
alias homesize="du -s ~/"
alias xev=" xev | grep -A2 --line-buffered '^KeyRelease' | sed -n '/keycode /s/^.*keycode \([0-9]*\).* (.*, \(.*\)).*$/\1 \2/p'"
# Pacman orphan removal.
alias pacro="pacman -Qtdq > /dev/null && sudo pacman -Rns \$(pacman -Qtdq | sed -e ':a;N;$!ba;s/\n/ /g')"

# git-related aliases
alias gs="git status"
alias ga="git add"
alias gb="git branch -vvaa"
alias gc="git commit"
alias gd="git diff HEAD"
alias go="git checkout"
alias gf="git fetch --all"
alias gp="git pull --ff-only"
alias gr="git remote -vvv"

# TTY-things
# Use VLC in a virtual console
alias vlctty="cvlc -I ncurses -V fb"
alias vlcascii="cvlc -I ncurses -V caca"
alias mpvtty="mpv --vo=opengl:backend=drm-egl"
# Display images in a TTY
alias fbi="fbi --autodown"

# Digital Ocean Server
alias pinecone="ssh -t pineman@pineman.win"
# IST Sigma
alias sigma="ssh -K ist425386@sigma01.tecnico.ulisboa.pt"

# web stuff
#alias www="rsync -avhzlu --exclude '.git' --progress /home/pineman/www/ -e 'ssh -p 62000' pineman@pineman.me:/home/pineman/www/"
#alias force_www="rsync -avhzl --delete-after --progress /home/pineman/www/ -e 'ssh -p 62000' pineman@pineman.me:/home/pineman/www/"
#alias reverse_www="rsync -avhzlu --progress -e 'ssh -p 62000' pineman@pineman.me:/home/pineman/www/ /home/pineman/www/"
#alias sync-cyberstash="rsync -avhzlu --progress -e ssh /home/pineman/Pictures/cyberstash pineman@pineman.sexy:/home/pineman/"
#alias lesscmin="lessc --clean-css"
#alias rsync_test='rsync -avhzHAXcP --fake-super --stats --preallocate -e "ssh" pineman@pineman.win:~/.config/ test'


# Personal things
alias grub-update="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias winboot="sudo efibootmgr -n 0019 && reboot"
alias i="curl ipv4.icanhazip.com"
alias i6="curl ipv6.icanhazip.com"
alias n="ncmpcpp --bindings $HOME/.config/ncmpcpp/bindings"
alias nh="ssh -t 192.168.1.2 ncmpcpp"
alias mpc="mpc -h ~/.config/mpd/socket"
alias p="mpc toggle"
alias mon="systemctl --user start mpd"
alias moff="systemctl --user stop mpd"
alias ytmp3="youtube-dl -x --audio-format mp3 --audio-quality 999k --prefer-ffmpeg"
alias sshtunnel="echo 'SOCKS5 proxy running on 127.0.0.1:1337 through encrypted ssh tunnel'; ssh -T -N pineman@pineman.win -D 1337"
#alias addradio="mpc add http://lainchan.org:8000/lain.ogg ; mpc add http://cyberadio.pw:8000/stream"
#alias ocsync="owncloudcmd Pictures https://owncloud.pineman.sexy/remote.php/webdav/pictures && owncloudcmd Documents https://owncloud.pineman.sexy/remote.php/webdav/documents"
alias h="feh ~/ist/a2s1/horas.png"
alias d="feh ~/ist/a2s1/duvidas.png"
alias t="trackpoint"
alias pt="setxkbmap pt && xmodmap ~/.Xmodmap.PT"
alias us="setxkbmap us && xmodmap ~/.Xmodmap.US"


# Fun stuff
alias randomfact='wget randomfunfacts.com -qO- 2>/dev/null | grep \<strong\> | sed "s;^.*<i>\(.*\)</i>.*$;\1;"'
alias cmdusage="history | awk '{CMD[\$2]++;count++;}END { for (a in CMD)print CMD[a] \" \" CMD[a]/count*100 \"% \" a;}' | grep -v \"./\" | column -c3 -s \" \" -t | sort -nr | nl |  head -n10"
alias cmatrix="cmatrix -u 7"
alias matrix='echo -e "\e[32m"; while :; do for i in {1..16}; do r="$(($RANDOM % 2))"; if [[ $(($RANDOM % 5)) == 1 ]]; then if [[ $(($RANDOM % 4)) == 1 ]]; then v+="\e[1m $r   "; else v+="\e[2m $r   "; fi; else v+="     "; fi; done; echo -e "$v"; v=""; done'
alias matrix2='echo -e "\e[31m"; while $t; do for i in `seq 1 30`;do r="$[($RANDOM % 2)]";h="$[($RANDOM % 4)]";if [ $h -eq 1 ]; then v="\e[1m $r";else v="\e[2m $r";fi;v2="$v2 $v";done;echo -e $v2;v2="";done;'
alias matrix3='COL=$(( $(tput cols) / 2 )); clear; tput setaf 2; while :; do tput cup $((RANDOM%COL)) $((RANDOM%COL)); printf "%$((RANDOM%COL))s" $((RANDOM%2)); done'
alias matrix4='echo -ne "\e[32m" ; while true ; do echo -ne "\e[$(($RANDOM % 2 + 1))m" ; tr -c "[:print:]" " " < /dev/urandom | dd count=1 bs=50 2> /dev/null ; done'
alias matrix5='tr -c "[:digit:]" " " < /dev/urandom | dd cbs=$COLUMNS conv=lcase,unblock | GREP_COLOR="1;32" grep --color "[^ ]"'
alias colorrainbow='yes "$(seq 1 255)" | while read i; do printf "\x1b[48;5;${i}m\n"; sleep .01; done'
alias screenfetch="echo; screenfetch -c 41,12"

# power-related aliases
alias physlock="physlock -dsm"
alias lock="dm-tool lock"
#alias lock="lxdm -c USER_SWITCH"
alias susp="systemctl suspend"
alias hib="systemctl hibernate"
alias hyb="systemctl hybrid-sleep"
alias slock="susp && lock"
alias shib="hib && lock"
#alias shyb="hyb && lock"
alias s="xset dpms force off"
alias inhib_charge="sudo tpacpi-bat -s IC 1 1"
alias enable_charge="sudo tpacpi-bat -s IC 1 0"
alias inhib_susp="setsid systemd-inhibit --what=sleep --who='THE ROCK' --why='CAN YOU SMEEEEEEEEEEEEELLLLLLLLLL WHAT THE ROCK IS COOKING' sleep 500d"
alias enable_susp="killall systemd-inhibit sleep"

# ex - archive extractor
# usage: ex <file>
function ex ()
{
	if [ -f $1 ] ; then
		case $1 in
			*.tar)		tar -xf $1    	;;
			*.tar.xz)	tar -xJf $1   	;;
			*.txz)		tar -xJf $1   	;;
			*.tar.bz2)	tar -xjf $1   	;;
			*.tbz2)		tar -xjf $1   	;;
			*.tar.gz)	tar -xzf $1   	;;
			*.tgz)		tar -xzf $1   	;;
			*.tar.pixz)	tar -Ipixz -xf $1;;
			*.tpxz)		tar -Ipixz -xf $1;;
			*.xz)		xz -d $1		;;
			*.pixz)		pixz -d $1		;;
			*.gz)		gunzip $1    	;;
			*.bz2)		bunzip2 $1   	;;
			*.rar)		unrar -x $1		;;
			*.zip)		unzip $1     	;;
			*.Z)		uncompress $1	;;
			*.7z)		7z -x $1      	;;
			*)			echo "'$1' cannot be extracted via ex()" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}

function up()
{
	LIMIT=${1:-1}
	P=$PWD
	for ((i=1; i <= LIMIT; i++)) do
		P=$P/..
	done
	cd $P
}

function u()
{
	urxvtc -cd $PWD
}
