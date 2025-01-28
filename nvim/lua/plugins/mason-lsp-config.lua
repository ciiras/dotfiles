return {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
        {
            'williamboman/mason.nvim',
        },
    },
    config = function()
        local mason_lspconfig = require('mason-lspconfig')
        mason_lspconfig.setup({
            automatic_installation = true,
            ensure_installed = {
                'bashls',
                'eslint@4.8.0',
                'jdtls',
                'kotlin_language_server',
                'lua_ls',
                'marksman',
                'rust_analyzer',
                'tsserver',
            }
        })
    end,
    lazy = false,
}
