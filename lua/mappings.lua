nmap('<leader>r', ':source $MYVIMRC<CR> :echo \'---.vimrc reloaded---\'<CR>')

nmap('<esc>', '<cmd>nohlsearch<CR>')

nmap('<leader>sh', '<C-W>s')
nmap('<leader>sv', '<C-W>v')

nmap('<M-h>', '<C-W>>')
nmap('<M-l>', '<C-W><')
nmap('<M-j>', '<C-W>-')
nmap('<M-k>', '<C-W>+')
nmap('<M-=>', '<C-W>=')

nmap('q:', '<Nop>')
xmap('p', 'pgvy')

nmap('<leader>da', 'ggVGd')
nmap('<leader>va', 'ggVGg_')
nmap('<leader>ya', 'gg0vGg_y')

nmap('<leader>.', '<cmd>NvimTreeFindFileToggle<CR>')
