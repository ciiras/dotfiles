nmap('<leader>r', ':source $MYVIMRC<CR> :echo \'---.vimrc reloaded---\'<CR>')

-- Buffers {{{
nmap('<leader>bl', '<cmd>ls<CR>')
nmap('<leader>bp', '<cmd>bp<CR>')
nmap('<leader>bn', '<cmd>bn<CR>')
nmap('<leader>bd', '<cmd>bd<CR>')
nmap('<leader>bD', '<cmd>%bd<CR>')
nmap('<leader>bo', '<cmd>on<CR>')
nmap('<leader>bs', '<cmd>new<CR>')
-- }}}

nmap('<esc>', '<cmd>nohlsearch<CR>')

-- Splits {{{
nmap('<M-h>', '<C-W>>')
nmap('<M-l>', '<C-W><')
nmap('<M-j>', '<C-W>-')
nmap('<M-k>', '<C-W>+')
nmap('<M-=>', '<C-W>=')
nmap('<leader>s', '<C-W>s')
nmap('<leader>v', '<C-W>v')
-- }}}

nmap('q:', '<Nop>')
xmap('p', 'pgvy')

nmap('<leader>ya', 'ggvGY')
nmap('<leader>da', 'ggvGD')

-- kyazdani42/nvim-tree.lua {{{
nmap('<leader>.', '<cmd>NvimTreeFindFileToggle<CR>')
-- }}}
