nmap('<leader>fd', '<cmd>lua require("telescope.builtin").diagnostics()<CR>')
nmap('<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<CR>')
nmap('<leader>fg', '<cmd>lua require("modules.telescope.git_status").git_status()<CR>')
nmap('<leader>fr', '<cmd>lua require("telescope.builtin").live_grep()<CR>')
