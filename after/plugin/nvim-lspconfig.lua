local opts = { noremap = true, silent = true }

vim.keymap.set('n', '[d', '<Cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
vim.keymap.set('n', ']d', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
vim.lsp.set_log_level('off')
