nmap('<esc>', '<cmd>nohlsearch<CR>', { desc = 'escape w/ clear highlights' })

nmap('<leader>%', '<C-w>s', { desc = 'split horizontal' })
nmap('<leader>"', '<C-w>v', { desc = 'split vertical' })

nmap('WW', ':wa<Enter>', { desc = 'buffer save all' })
nmap('XX', ':xa<Enter>', { desc = 'buffer save all and quit' })

nvmap('E', 'g_', { desc = 'end of line motion' })
nvmap('B', '^', { desc = 'beginning of line motion' })

xmap('p', 'pgvy', { desc = 'always keep current value in yank buffer' })

nmap('<leader>da', 'ggVGd', { desc = 'buffer delete all' })
nmap('<leader>va', 'ggVGg_', { desc = 'buffer visually select all' })
nmap('<leader>ya', 'gg0vGg_y', { desc = 'buffer yank all' })
