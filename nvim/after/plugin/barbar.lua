nmap('<C-p>', '<Cmd>BufferPick<CR>', { desc = 'Choose Buffer' })

nmap('<A-,>', '<Cmd>BufferPrevious<CR>', { desc = 'Previous Buffer' })
nmap('<A-.>', '<Cmd>BufferNext<CR>', { desc = 'Next Buffer' })

nmap('<leader>bo', '<Cmd>BufferCloseAllButCurrentOrPinned<CR><Cmd>on<CR>', { desc = 'Close All Buffers but Current' })
nmap('<leader>bd', '<Cmd>BufferClose<CR>', { desc = 'Close Current Buffer' })
nmap('<leader>ba', '<Cmd>bufdo confirm bwipeout<CR>', { desc = 'Close All Buffers' })

