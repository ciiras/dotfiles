vim.keymap.set('n', '[d', '<Cmd>Lspsaga diagnostic_jump_prev<CR>', keymap_options)
vim.keymap.set('n', ']d', '<Cmd>Lspsaga diagnostic_jump_next<CR>', keymap_options)
vim.lsp.set_log_level('off')
