CLICOLOR="xterm-color"  #default ``cons25'', ``xterm-color''
LSCOLORS="gxfxcxdxbxegedabagacad"

# start color scheme: \e[x;ym
# end color scheme:   \e[m

# black      0;30  Dark Gray    1;30
# Blue 	     0;34  Light Blue   1;34
# Green      0;32  Light Green  1;32
# Cyan       0;36  Light Cyan   1;36 
# Red        0;31  Light Red    1;31
# Purple     0;35  Light Purple 1;35
# Brown      0;33  Yellow       1;33
# Light Gray 0;37  White        1;37

PS1="\e[0;35mmacbook:\e[m \w\n"

if [ $(whoami) == 'root' ]; then
	PS1="$PS1\e[0;31m#\e[m"
else
	PS1="$PS1\e[0;32m\$\e[m"
fi
