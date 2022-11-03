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
                max_length = vim.o.columns,
                mode = 2,
                show_filename_only = false,
                buffers_color = {
                    active = { bg = '#39506d', fg = '#cdcecf' },
                    inactive = { bg = '#39506d', fg = '#719cd6' },
                },
            },
        },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
})
