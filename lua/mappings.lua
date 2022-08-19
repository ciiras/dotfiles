nmap('<leader>r', ':source $MYVIMRC<CR> :echo \'---.vimrc reloaded---\'<CR>')

-- Buffers {{{
nmap('<leader>bl', ':ls<CR>')
nmap('<leader>bp', ':bp<CR>')
nmap('<leader>bn', ':bn<CR>')
nmap('<leader>bd', ':bd<CR>')
nmap('<leader>bD', ':%bd<CR>')
nmap('<leader>bo', ':on<CR>')
nmap('<leader>bs', ':new<CR>')
-- }}}

nmap('<esc>', ':nohlsearch<CR>')

-- Splits {{{
nmap('<M-h>', '<C-W>>')
nmap('<M-l>', '<C-W><')
nmap('<M-j>', '<C-W>-')
nmap('<M-k>', '<C-W>+')
nmap('<M-=>', '<C-W>=')
nmap('<C-x>', '<C-W>s')
nmap('<C-v>', '<C-W>v')
-- }}}

nmap('q:', '<Nop>')
xmap('p', 'pgvy')


-- kyazdani42/nvim-tree.lua {{{
nmap('<leader>.', ':NvimTreeFindFileToggle<CR>')
-- }}}
