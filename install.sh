# Getting Omzsh & fonts for iterm
git clone git@github.com:Baaaaam/oh-my-zsh.git oh-my-zsh
git clone https://github.com/powerline/fonts.git

cd ..
# Backing-up the existing file
mv .zshrc .zshrc_bak
mv .gitconfig .gitconfig_bak
mv .vimrc .vimrc_bak
mv .vim .vim_bak

# Installing the new config
ln -s .zsh_config/zshrc .zshrc
ln -s .zsh_config/gitconfig .gitconfig
ln -s .zsh_config/vim .vim
ln -s .zsh_config/vimrc .vimrc
ln -s .zsh_config/git-change-url .local/bin/
