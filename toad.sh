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

PS1="\e[32m\h:\e[m \w\n"

if [ $(whoami) == 'root' ]; then
	PS1="$PS1\e[31m#\e[0m"
else
	PS1="$PS1\e[32m\$\e[0m"
fi


# Rsync Backup
PATH=/usr/bin:$PATH
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
	# Rsync Server
	echo "Backing up on host server"
	rsync $ARGS1 $ARGS2 $CLIENTDIR $HOSTDIR
}

function update()
{
	# Rsync Server
	echo "Updating host server"
	rsync $ARGS1 --delete -b --backup-dir="/home/$USER/.backup/" $HOSTDIR $CLIENTDIR 
}
