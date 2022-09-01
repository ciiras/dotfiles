local keymap = vim.api.nvim_set_keymap
local opts = { silent = true, noremap = true }

keymap('n', '<leader>xx', '<cmd>Trouble<cr>', opts)
keymap('n', '<leader>xc', '<cmd>TroubleClose<cr>', opts)
keymap('n', '<leader>xw', '<cmd>Trouble workspace_diagnostics<cr>', opts)
keymap('n', '<leader>xd', '<cmd>Trouble document_diagnostics<cr>', opts)
keymap('n', '<leader>xl', '<cmd>Trouble loclist<cr>', opts)
keymap('n', '<leader>xq', '<cmd>Trouble quickfix<cr>', opts)
keymap('n', 'gR', '<cmd>Trouble lsp_references<cr>', opts)
