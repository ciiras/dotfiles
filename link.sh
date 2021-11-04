curDir=$(pwd)

ln -sfF ~/.vim/ ~/.config/nvim/
ln -sfF ${curDir}/.vimrc ~/.config/nvim/init.vim
ln -sfF ${curDir}/.config/nvim/coc-settings.json ~/.config/nvim/coc-settings.json

ln -sfF ${curDir}/.gitconfig ~/.gitconfig
ln -sfF ${curDir}/.gitignore ~/.gitignore
ln -sfF ${curDir}/.tmux.conf ~/.tmux.conf
ln -sfF ${curDir}/.vimrc ~/.vimrc
ln -sfF ${curDir}/.zshrc ~/.zshrc
