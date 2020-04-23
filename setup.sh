

# make sure submodules are all there
cd ~/.bash && git submodule init && git submodule update --recursive

#Replace original ssh config w/ symbolic link if one does not already exist
if [ -f ~/.ssh/config ]
then
    echo "ssh configure file already exists!"
else
    ln -s ~/.bash/ssh/ssh_config ~/.ssh/config
fi

#Add the .emacs symbolic link if one does not exist
if [ -f ~/.emacs ]
then
    echo ".emacs file already exists!"
else
    ln -s ~/.bash/emacs/.emacs ~/.emacs
fi

if [ -f ~/.tmux.conf ]
then
    echo "tmux configuration file already exists!"
else
    ln -s ~/.bash/config/.tmux.conf ~/.tmux.conf
fi

#Add the displays setup if the machine's name is serenity
MACHINE_NAME="$(hostname)"

if [ $MACHINE_NAME != "serenity" ]
then
    echo "No display settings for this machine."
else
    echo "Display settings for this machine added in ~/.config/"
    ln -s ~/.bash/display_settings/serenity_displays.sh ~/.config/displays.sh
fi


if [ -f ~/.bashrc ]
then
    echo "A .bashrc file already exists!"
    echo "Appending source of commonrc to existing .bashrc..."
    echo "source ~/.bash/common/commonrc" >> ~/.bashrc
else
    ln -s ~/.bash/bash/bashrc ~/.bashrc
fi

if [ -f ~/.h5rc ]
then
    echo "A .h5rc file already exists!"
    echo "Appending source of h5rc to existing .h5rc..."
    tail -n +2 >> ~/.h5rc
else
    ln -s ~/.bashrc/h5sh/h5rc ~/.h5rc
fi

if [ -f ~/.zshrc ]
then
    echo ".zshrc file already exists!"
    echo "Appending source of commonrc to existing .zshrc..."
    echo "source ~/.bash/common/commonrc" >> ~/.zshrc
else
    ln -s ~/.bash/zsh/zshrc ~/.zshrc
fi

# Link programs
if [ -d ~/.local/bin/ ]
then
    # Pandora
    if [ -f ~/.local/bin/pandora ]
    then
	echo "Pandora program already in place"
    else
	ln -s ~/.bash/pandora ~/.local/bin/pandora
    fi
    # GroupMe
    if [ -f ~/.local/bin/grpme ] && [ -d ~/opt/groupme/groupmecli ]
    then
	ln -s ~/.bash/groupme ~/.local/bin/groupme
    else
	echo "Necessary files for GroupMe are not in place."
    fi
fi

user=$(whoami)

if [ "${user}" != "root" ]
then
    sudo="sudo"
else
    sudo=""
fi

## Ask to install standard ubuntu packages
while true; do
    read -p "Install standard set of Ubuntu packages for development? [y/n] " yn
    case $yn in
        [y] ) echo "Installing common Ubuntu packages for dev."; \
              for pkg in $(cat ~/.bash/pkgs); do $sudo apt install -y $pkg; done; \
              break;;
        [n] ) echo "Ok."; exit;;
        * ) echo "Please enter y or n.";;
    esac
done

## git aliases
cat ~/.bash/git/gitconfig >> ~/.gitconfig
