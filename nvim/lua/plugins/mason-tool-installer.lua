return {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    dependencies = {
        {
            'williamboman/mason.nvim',
        },
    },
    config = function()
        local mason_tool_installer = require('mason-tool-installer')
        mason_tool_installer.setup({
            ensure_installed = {
                'ktlint',
                'prettier',
                'stylua',
            },
        })
    end,
    lazy = false,
}
