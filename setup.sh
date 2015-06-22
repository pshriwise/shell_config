

#Replace original ssh config w/ symbolic link if one does not already exist
if [ -f ~/.ssh/config ]
then 
    echo "ssh configure file already exists!"
else
    ln -s ~/.bash/ssh_config ~/.ssh/config
fi


#Add the .emacs symbolic link if one does not exist
if [ -f ~/.emacs ]
then
    echo ".emacs file already existst!"
else 
    ln -s ~/.bash/emacs/.emacs ~/.emacs
fi 


#Add the displays setup if the machine's name is serenity
MACHINE_NAME="$(hostname)"

if [ $MACHINE_NAME != "serenity" ]
then
    echo "No display settings for this machine."
else
    ln -s ~/.bash/displays.sh ~/.config/displays.sh
fi


