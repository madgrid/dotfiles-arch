#!/bin/bash
#  ██                       
# ░██                       
# ░██       ██████   ██████ 
# ░██████  ░░░░░░██ ░░██░░█ 
# ░██░░░██  ███████  ░██ ░  
# ░██  ░██ ██░░░░██  ░██    
# ░██████ ░░████████░███    
# ░░░░░    ░░░░░░░░ ░░░     
# nxll <nxll@teknik.io>

#RESTART
#pkill lemonbar

#COLORS
fg="#B8B9B4"
bg="#21211F"

hint="#5E5E5C"
nblk="#292927"
bblk="#2E2E2C"
nred="#939490"
bred="#989995"
ngrn="#5E5E5C"
bgrn="#636361"
nylw="#B6B8B3"
bylw="#BBBDB8"
nblu="#727370"
bblu="#777875"
nmag="#D1D1CB"
bmag="#D6D6D0"
ncyn="#636361"
bcyn="#696966"
nwht="#AAABA6"
bwht="#AFB0AB"

#VARS
font="-*-fixed-*-*-*-*-14-*-*-*-*-*-*-*"
#font="-terminus-medium-r-normal--12-120-72-72-c-60-iso8859-1"
#font="-*-envy code r-medium-r-*-*-16-*-*-*-*-*-*-*"
#font="-kakwa-kakwafont-medium-r-normal--12-120-72-72-c-60-iso8859-1"
glyph="-wuncon-siji-medium-r-normal--10-100-75-75-c-80-iso10646-1"
height=18
border=8
muslength=60
interface=wls1
#actchar="+"
#selchar="+"
#actchar=""
#selchar=""

if pgrep herbstluftwm; then
	monitor=${1:-0}
	bh=$(( $height + ($border * 2)))
	herbstclient pad $monitor $bh
fi

WRKL() {
	wrkspce=$(xprop -root _NET_CURRENT_DESKTOP | sed -e 's/_NET_CURRENT_DESKTOP(CARDINAL) = //')
	
	if [ "${wrkspce}" = "0" ] ;
	then 
		echo "%{B$hint} %{F$bg}000%{F-} %{B$nblk} 001 010 011 100 %{B-}"
	elif [ "${wrkspce}" = "1" ] ;
	then
		echo "%{B$nblk} 000 %{B$hint} %{F$bg}001%{F-} %{B$nblk} 010 011 100 %{B-}"
	elif [ "${wrkspce}" = "2" ] ;
	then 
		echo "%{B$nblk} 000 001 %{B$hint} %{F$bg}010%{F-} %{B$nblk} 011 100 %{B-}"
	elif [ "${wrkspce}" = "3" ] ;
	then 
		echo "%{B$nblk} 000 001 010 %{B$hint} %{F$bg}011%{F-} %{B$nblk} 100 %{B-}"
	elif [ "${wrkspce}" = "4" ] ;
	then 
		echo "%{B$nblk} 000 001 010 011 %{B$hint} %{F$bg}100%{F-} %{B-}"
    else
		echo "%{B$hint} %{F$bg}NONE%{F-} %{B-}"
	fi
}

WRK() {
	wrkspce=$(xprop -root _NET_CURRENT_DESKTOP | sed -e 's/_NET_CURRENT_DESKTOP(CARDINAL) = //')
	
	if [ "${wrkspce}" = "0" ] ;
	then 
		echo "%{B$hint} %{F$bg}0:0%{F-} %{B-}"
	elif [ "${wrkspce}" = "1" ] ;
	then
		echo "%{B$hint} %{F$bg}0:1%{F-} %{B-}"
	elif [ "${wrkspce}" = "2" ] ;
	then 
		echo "%{B$hint} %{F$bg}0:2%{F-} %{B-}"
	elif [ "${wrkspce}" = "3" ] ;
	then 
		echo "%{B$hint} %{F$bg}0:3%{F-} %{B-}"
	elif [ "${wrkspce}" = "4" ] ;
	then 
		echo "%{B$hint} %{F$bg}0:4%{F-} %{B-}"
    else
		echo "%{B$hint} %{F$bg}NONE%{F-} %{B-}"
	fi
}

WIN() {
    #echo -n "%{B$hint}%{F$bg}  %{F-}%{B-}"
	echo -n "%{B$bblk}%{F$fg} $(wname $(pfw)) %{F-}%{B-}"
}


BAT() {
    percent=$(cat /sys/class/power_supply/BAT0/capacity)
    status=$(cat /sys/class/power_supply/BAT0/status)

    if test $status = "Charging"; then
        symbol=""
        echo -n "%{B$bblk} ${symbol} %{B-}"
    elif test $status = "Full"; then
        symbol=""
        echo -n "%{B$bblk} ${symbol} %{B-}"
    else
        if test $percent -gt 66; then
            symbol=""
            echo -n "%{B$bblk} ${symbol} %{B-}"
        elif test $percent -gt 34; then
            symbol=""
            echo -n "%{B$bblk} ${symbol} %{B-}"
        else
		symbol=""
            echo -n "%{B$bblk} ${symbol} %{B-}"
        fi
    fi

	echo -e "%{B$nblk} $percent% %{B-}"
}


BAT1() {
    percent=$(cat /sys/class/power_supply/BAT1/capacity)
    status=$(cat /sys/class/power_supply/BAT1/status)

    if test $status = "Charging"; then
        symbol=""
        echo -n "%{B$bblk} ${symbol} %{B-}"
    elif test $status = "Full"; then
        symbol=""
        echo -n "%{B$bblk} ${symbol} %{B-}"
    else
        if test $percent -gt 66; then
            symbol=""
            echo -n "%{B$bblk} ${symbol} %{B-}"
        elif test $percent -gt 34; then
            symbol=""
            echo -n "%{B$bblk} ${symbol} %{B-}"
        else
		        symbol=""
            echo -n "%{B$bblk} ${symbol} %{B-}"
        fi
    fi

	  echo -e "%{B$nblk} $percent% %{B-}"
}

# NET() {
# 	symbol="%{B$bblk}  %{B-}"
# 	disconnected=$(iw $interface link | awk '/Not/ {print $1}')

# 	ssid=$(
# 	if [ "$disconnected" = "Not" ]; then
# 		echo "NOT CONNECTED"
# 	else
# 		iw $interface link | grep 'SSID' | sed 's/SSID: //' | sed 's/\t//'
# 	fi)
# 	echo -n "${symbol}%{B$nblk} ${ssid} %{B-}"
# }
DATE() {
    echo -n "%{B$bblk} %{F$fg}$(date "+%d/%m")%{F-} %{B-}"
}
CLOCK() {
    echo -n "%{B$hint}%{F$bg} $(date "+%H:%M") %{F-}%{B-}"
}
BAR() {
    #ADD ALL THE THINGS
    while true; do
		    buf="$(WRK) %{c}%{r}$(BAT) $(BAT1) $(DATE) $(CLOCK)" 
		echo "$buf"	
        sleep 0.1
    done | lemonbar -f $glyph \
        -f "$font" \
        -F "$fg" \
        -B "$bg" \
        -u "$border" \
        -u "$border" \
		# -r "$border" \
		# -R "$bg" \
        -g "1264x$height+0+0" | sh &

}
BAR > /dev/null
