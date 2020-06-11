curDir=$(pwd)

ls -s ~/.vim/ ~/.config/nvim/
ln -s ${curDir}/.vimrc ~/.config/nvim/init.vim
ln -s ${curDir}/.config/nvim/coc-settings.json ~/.config/nvim/coc-settings.json

ln -s ${curDir}/.gitconfig ~/.gitconfig
ln -s ${curDir}/.gitignore ~/.gitignore
ln -s ${curDir}/.tmux.conf ~/.tmux.conf
ln -s ${curDir}/.vimrc ~/.vimrc
ln -s ${curDir}/.zshrc ~/.zshrc
