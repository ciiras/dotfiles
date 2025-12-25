return {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
        'williamboman/mason.nvim',
    },
    config = function()
        require('mason').setup()

        require('mason-lspconfig').setup({
            ensure_installed = {
                'bashls',
                'eslint',
                'jdtls',
                'kotlin_language_server',
                'lua_ls',
                'marksman',
                'rust_analyzer',
                'ts_ls',
            },
            automatic_installation = true,
        })
    end,
    lazy = false,
}
