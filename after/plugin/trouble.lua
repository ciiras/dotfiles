local keymap = vim.api.nvim_set_keymap
local opts = { silent = true, noremap = true }

keymap('n', '<space>q', '<cmd>TroubleToggle<cr>', opts)
