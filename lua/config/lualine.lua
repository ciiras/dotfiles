local modifiedColors = function(section)
   return { fg = '#dfdfe0', bg = vim.bo.modified and '#c94f6d' or '#39506d' }
end

require('lualine').setup({
    options = {
        disabled_filetypes = { 'NvimTree' },
    },
    sections = {
        lualine_b = {},
        lualine_c = {
            {
                'filename',
                color = modifiedColors,
                path =  3,
                shorting_target = 10,
            },
        },
        lualine_x = {
            {
              'filetype',
              icon_only = true,
            },
        },
        lualine_y = {},
    },
    tabline = {
        lualine_a = {
            {
                'buffers',
                mode = 2,
            },
        },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    }
})

nmap('<leader>1', '<cmd>LualineBuffersJump 1<CR>')
nmap('<leader>2', '<cmd>LualineBuffersJump 2<CR>')
nmap('<leader>3', '<cmd>LualineBuffersJump 3<CR>')
nmap('<leader>4', '<cmd>LualineBuffersJump 4<CR>')
nmap('<leader>5', '<cmd>LualineBuffersJump 5<CR>')
nmap('<leader>6', '<cmd>LualineBuffersJump 6<CR>')
nmap('<leader>7', '<cmd>LualineBuffersJump 7<CR>')
nmap('<leader>8', '<cmd>LualineBuffersJump 8<CR>')
nmap('<leader>9', '<cmd>LualineBuffersJump 9<CR>')
