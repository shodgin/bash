# Color Promt
# Start color scheme: \e[x;ym
# End color scheme:   \e[m

# Black      0;30  Dark Gray    1;30
# Blue 	     0;34  Light Blue   1;34
# Green      0;32  Light Green  1;32
# Cyan       0;36  Light Cyan   1;36 
# Red        0;31  Light Red    1;31
# Purple     0;35  Light Purple 1;35
# Brown      0;33  Yellow       1;33
# Light Gray 0;37  White        1;37

PS1="\e[0;33m\h:\e[m \w\n"

if [ $(whoami) == 'root' ]; then
	PS1="$PS1\e[0;31m#\e[m"
else
	PS1="$PS1\e[0;32m\$\e[m"
fi


# Rsync Backups
IPLOCAL="$USER@10.0.0.5"
IPREMOTE="$USER@66.173.144.186"
CLIENTDIR="$HOME/"
HOSTDIR="/media/data/backup/user/$USER/"
BACKDIR="/media/data/backup/user/$USER~/"
INCLDFILE="$HOME/.rsync/include"
EXCLDFILE="$HOME/.rsync/exclude"
# --verbose --recursive --perms --owner --group --times --compress --update
ARGS1="-vrpogtzu --include-from=$INCLDFILE --exclude-from=$EXCLDFILE"
ARGS2="-b --backup-dir=$BACKDIR --delete"
SSHARG=("--rsh=ssh -p2205" "--timeout=60")

function backup()
{
	# Cygwin on remote network
	echo "Backing up with Cygwin to remote server"
	rsync $ARGS1 $ARGS2 "${SSHARG[@]}" $CLIENTDIR $IPREMOTE:$HOSTDIR
}

function update()
{
	# Cygwin on remote server network
	echo "Updating with Cygwin from remote server"
	rsync $ARGS1 --delete -b --backup-dir="/home/$USER/.backup/" "${SSHARG[@]}" $IPREMOTE:$HOSTDIR $CLIENTDIR
}


#cygwin help
cd ~
export INPUTRC=$HOME/.inputrc
PATH=/usr/bin:$PATH
