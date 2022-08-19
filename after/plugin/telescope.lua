nmap('<leader>ff', ':Telescope find_files hidden=true<cr>')
nmap('<leader>fr', ':Telescope live_grep<cr>')

vim.cmd([[
nnoremap <silent> <Leader>fg <cmd>lua require('modules.telescope.git_status').git_status()<CR>
]])
