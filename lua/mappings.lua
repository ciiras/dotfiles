nmap('<leader>r', ':source $MYVIMRC<CR> :echo \'---.vimrc reloaded---\'<CR>')

nmap('<leader>bl', '<cmd>ls<CR>')
nmap('<leader>bp', '<cmd>bp<CR>')
nmap('<leader>bn', '<cmd>bn<CR>')
nmap('<leader>bd', '<cmd>bd<CR>')
nmap('<leader>bD', '<cmd>%bd<CR>')
nmap('<leader>bo', '<cmd>on<CR>')
nmap('<leader>bs', '<cmd>new<CR>')

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

nmap('<leader>da', 'ggvGg_d')
nmap('<leader>va', 'ggvGg_')
nmap('<leader>ya', 'ggvGg_y')

nmap('<leader>.', '<cmd>NvimTreeFindFileToggle<CR>')
