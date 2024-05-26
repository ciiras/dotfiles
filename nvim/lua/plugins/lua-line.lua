return {
    'nvim-lualine/lualine.nvim',
    config = function()
        local modifiedColors = function()
            return { fg = '#dfdfe0', bg = vim.bo.modified and '#c94f6d' or '#39506d' }
        end

        require('lualine').setup({
            options = {
                disabled_filetypes = { 'NvimTree', 'Trouble' },
                globalstatus = true,
            },
            sections = {
                lualine_b = {},
                lualine_c = {
                    {
                        'filename',
                        color = modifiedColors,
                        path = 3,
                        shorting_target = 10,
                    },
                },
                lualine_x = {
                    {
                        'filetype',
                        icon_only = true,
                    },
                    {
                        require('noice').api.status.command.get,
                        cond = require('noice').api.status.command.has,
                        color = { fg = '#FF9E64' },
                    },
                },
                lualine_y = {},
            },
        })
    end,
    event = 'VimEnter',
}
