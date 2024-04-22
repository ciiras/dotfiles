return {
    'williamboman/mason.nvim',
    dependencies = {
        {
            'williamboman/mason-lspconfig.nvim',
            lazy = false,
        },
        {
            'WhoIsSethDaniel/mason-tool-installer.nvim',
            lazy = false,
        },
    },
    config = function()
        local mason = require('mason')
        mason.setup({
            providers = {
                'mason.providers.client',
                'mason.providers.registry-api',
            }
        })

        local mason_lspconfig = require('mason-lspconfig')
        mason_lspconfig.setup({
            ensure_installed = {
                'bashls',
                'jdtls',
                'kotlin_language_server',
                'lua_ls',
                'marksman',
                'rust_analyzer',
                'tsserver',
            }
        })

        -- local mason_tool_installer = require('mason-tool-installer')
        -- mason_tool_installer.setup({
        --     ensure_installed = {
        --         'prettier',
        --         'stylua',
        --         'eslint_d',
        --     },
        -- })
    end,
}
