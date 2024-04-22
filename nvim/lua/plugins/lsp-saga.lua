return {
    'glepnir/lspsaga.nvim',
    branch = 'main',
    config = function()
        local lsp_saga = require('lspsaga')
        lsp_saga.setup({
            server_filetype_map = {
                typescript = 'typescript'
            },
            symbol_in_winbar = {
                enable = false,
            },
            rename = {
                whole_project = true,
            },
        })
    end,
    event = 'VeryLazy',
}
