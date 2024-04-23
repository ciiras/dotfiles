return {
    'glepnir/lspsaga.nvim',
    branch = 'main',
    config = function()
        local lsp_saga = require('lspsaga')
        lsp_saga.setup({
            diagnostic = {
                show_code_action = false,
            },
            rename = {
                whole_project = true,
            },
            server_filetype_map = {
                typescript = 'typescript'
            },
            symbol_in_winbar = {
                enable = false,
            },
        })
    end,
    event = 'VeryLazy',
}
