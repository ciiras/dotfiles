nmap('<esc>', '<cmd>nohlsearch<CR>', { desc = 'escape w/ clear highlights' })

nmap('<leader>%', '<C-W>s', { desc = 'split horizontal' })
nmap('<leader>"', '<C-W>v', { desc = 'split vertical' })

nmap('<M-h>', '<C-W>>', { desc = 'tmux resize left' })
nmap('<M-l>', '<C-W><', { desc = 'tmux resize right' })
nmap('<M-j>', '<C-W>-', { desc = 'tmux resize down' })
nmap('<M-k>', '<C-W>+', { desc = 'tmux resize up' })
nmap('<M-=>', '<C-W>=', { desc = 'reset splits' })

nmap('q:', '<Nop>', { desc = 'prevent entering command history' })

nmap('qq', ':q<Enter>', { desc = 'buffer quit' })
nmap('QQ', ':q!<Enter>', { desc = 'buffer quit w/o save' })

nvmap('E', 'g_', { desc = 'end of line motion' })
nvmap('B', '^', { desc = 'beginning of line motion' })

xmap('p', 'pgvy', { desc = 'always keep current value in yank buffer' })

nmap('<leader>da', 'ggVGd', { desc = 'buffer delete all' })
nmap('<leader>va', 'ggVGg_', { desc = 'buffer visually select all' })
nmap('<leader>ya', 'gg0vGg_y', { desc = 'buffer yank all' })
