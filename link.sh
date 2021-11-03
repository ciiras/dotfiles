curDir=$(pwd)

ls -sF ~/.vim/ ~/.config/nvim/
ln -sF ${curDir}/.vimrc ~/.config/nvim/init.vim
ln -sF ${curDir}/.config/nvim/coc-settings.json ~/.config/nvim/coc-settings.json

ln -sF ${curDir}/.gitconfig ~/.gitconfig
ln -sF ${curDir}/.gitignore ~/.gitignore
ln -sF ${curDir}/.tmux.conf ~/.tmux.conf
ln -sF ${curDir}/.vimrc ~/.vimrc
ln -sF ${curDir}/.zshrc ~/.zshrc
