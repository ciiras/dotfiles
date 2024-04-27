local function get_config(name)
    return load(string.format('require("config/%s")', name))
end

return {
    'folke/noice.nvim',
    dependencies = {
        {
            'MunifTanjim/nui.nvim',
        },
        {
            'rcarriga/nvim-notify',
            config = function()
                local notify = require('notify')

                notify.setup({
                    background_colour = '#000000',
                    timeout = 1000,
                })
            end,
        },
    },
    config = function()
        local noice = require('noice')

        noice.setup({
            background_color = '#000000',
            cmdline = {
                view = 'cmdline',
            },
            lsp = {
                override = {
                     ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
                     ['vim.lsp.util.stylize_markdown'] = true,
                     ['cmp.entry.get_documentation'] = true,
                },
                progress = {
                    enabled = false,
                },
            },
        })
    end,
    event = 'VeryLazy',
}
