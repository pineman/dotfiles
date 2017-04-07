alias sudo="sudo " # this enables sudo to use these aliases
alias chown="chown -h"
alias ls='ls -hX --group-directories-first --time-style=+"%d/%m/%Y %H:%M:%S" --color=auto -F --quoting-style=literal'
alias ll='ls -l'
alias la='ls -Al'
alias cal='cal -3'
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"
alias df='df -h'
alias grep="grep --color"
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
alias mupdf="mupdf -r 144"
alias vim="vim -p"
alias clearvim="rm -rf $HOME/.vim/{undo,swap,backup}/* $HOME/.viminfo"
alias xz="xz -T 0"
alias inxi="inxi -F"
alias units="units --verbose"
alias python="python -O"
alias py="python"
which colordiff &>/dev/null && \
	alias diff='colordiff'

# Helpful things
alias ...="cd -- ../.."
alias ....="cd -- ../../.."
alias .....="cd -- ../../../.."
function cd {
	builtin cd "$@" && ll
}
function u {
	(urxvtc -cd $PWD &)
}
alias pacro="yaourt -Rns \$(yaourt -Qttdq)"
alias hddpoff="udisksctl power-off -b"
alias xev=" xev | grep -A2 --line-buffered '^KeyRelease' | sed -n '/keycode /s/^.*keycode \([0-9]*\).* (.*, \(.*\)).*$/\1 \2/p'"
alias winboot="sudo efibootmgr -n 0019 && reboot"
alias g="ping 8.8.8.8"
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
alias addradio="mpc add http://lainchan.org:8000/lain.ogg; mpc add http://cyberadio.pw:8000/stream; mpc add http://streaming.radionomy.com/DRIVE"
alias t="trackpoint"
alias pt="setxkbmap pt && xmodmap ~/.Xmodmap.PT"
alias us="setxkbmap us && xmodmap ~/.Xmodmap.US"
# power-related aliases
alias lock="physlock"
alias slock="systemctl suspend && physlock -d"
alias s="xset dpms force off"
alias inhib_charge="sudo tpacpi-bat -s IC 1 1"
alias enable_charge="sudo tpacpi-bat -s IC 1 0"
alias inhib_susp="setsid systemd-inhibit --what=sleep --who='\$USER' --why='Suspend deliberately inhibited by user.' sleep 500d"
alias enable_susp="killall systemd-inhibit sleep"

# IST Sigma
alias sigma="ssh -K ist425386@sigma01.tecnico.ulisboa.pt"
alias h="feh ~/ist/a2s2/meec-drive/horario/horas.png"
alias d="feh ~/ist/a2s2/d.png"

# git-related aliases
alias gs="git status"
alias gb="git branch -vvaa"
alias gd="git diff"
alias gc="git checkout"
alias gf="git fetch --all"
alias gp="git pull"
alias gr="git remote -vvv"

# TTY-things
alias startx="killall redshift &>/dev/null; \startx ~/.xinitrc; (killall redshift &>/dev/null; redshift -m drm &>/dev/null &)"
# Use VLC in a virtual console
alias vlctty="cvlc -I ncurses -V fb"
alias vlcascii="cvlc -I ncurses -V caca"
# Display images in a TTY
alias fbi="fbi --autodown"

# Digital Ocean Server
alias pinecone="ssh -t pineman@pineman.win"

# ex - archive extractor
# usage: ex <file>
function ex ()
{
	if [ -f $1 ] ; then
		case $1 in
			*.tar)		tar -xf $1		;;
			*.tar.xz)	tar -xJf $1		;;
			*.txz)		tar -xJf $1		;;
			*.tar.bz2)	tar -xjf $1		;;
			*.tbz2)		tar -xjf $1		;;
			*.tar.gz)	tar -xzf $1		;;
			*.tgz)		tar -xzf $1		;;
			*.tar.pixz)	tar -Ipixz -xf $1;;
			*.tpxz)		tar -Ipixz -xf $1;;
			*.xz)		xz -d $1		;;
			*.pixz)		pixz -d $1		;;
			*.gz)		gunzip $1		;;
			*.bz2)		bunzip2 $1		;;
			*.rar)		unrar -x $1		;;
			*.zip)		unzip $1		;;
			*.Z)		uncompress $1	;;
			*.7z)		7z -x $1		;;
			*)			echo "'$1' cannot be extracted via ex()" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}

# Fun stuff
alias randomfact='wget randomfunfacts.com -qO- 2>/dev/null | grep \<strong\> | sed "s;^.*<i>\(.*\)</i>.*$;\1;"'
alias cmdusage="history | awk '{CMD[\$2]++;count++;}END { for (a in CMD)print CMD[a] \" \" CMD[a]/count*100 \"% \" a;}' | grep -v \"./\" | column -c3 -s \" \" -t | sort -nr | nl |  head -n15"
alias cmatrix="cmatrix -u 7"
alias matrix='echo -e "\e[32m"; while :; do for i in {1..16}; do r="$(($RANDOM % 2))"; if [[ $(($RANDOM % 5)) == 1 ]]; then if [[ $(($RANDOM % 4)) == 1 ]]; then v+="\e[1m $r	"; else v+="\e[2m $r   "; fi; else v+="		"; fi; done; echo -e "$v"; v=""; done'
alias matrix2='echo -e "\e[31m"; while $t; do for i in `seq 1 30`;do r="$[($RANDOM % 2)]";h="$[($RANDOM % 4)]";if [ $h -eq 1 ]; then v="\e[1m $r";else v="\e[2m $r";fi;v2="$v2 $v";done;echo -e $v2;v2="";done;'
alias matrix3='COL=$(( $(tput cols) / 2 )); clear; tput setaf 2; while :; do tput cup $((RANDOM%COL)) $((RANDOM%COL)); printf "%$((RANDOM%COL))s" $((RANDOM%2)); done'
alias matrix4='echo -ne "\e[32m" ; while true ; do echo -ne "\e[$(($RANDOM % 2 + 1))m" ; tr -c "[:print:]" " " < /dev/urandom | dd count=1 bs=50 2> /dev/null ; done'
alias matrix5='tr -c "[:digit:]" " " < /dev/urandom | dd cbs=$COLUMNS conv=lcase,unblock | GREP_COLOR="1;32" grep --color "[^ ]"'
alias colorrainbow='yes "$(seq 1 255)" | while read i; do printf "\x1b[48;5;${i}m\n"; sleep .01; done'
alias screenfetch="echo; screenfetch -c 41,12"
alias emacs="sl"
