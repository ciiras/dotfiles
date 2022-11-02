local opts = { noremap = true, silent = true }
vim.keymap.set('n', '[d', '<Cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
vim.keymap.set('n', ']d', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)

local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'gd', '<Cmd>Lspsaga lsp_finder<CR>', bufopts)
    vim.keymap.set('n', 'gp', '<Cmd>Lspsaga peek_definition<CR>', bufopts)
    vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', '<Cmd>Lspsaga rename<CR>', bufopts)
    vim.keymap.set('n', '<space>ca', '<cmd>Lspsaga code_action<CR>', bufopts)
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)

    local utils = require('nvim-lsp-ts-utils')
    utils.setup({
        filter_out_diagnostics_by_code = {
            7016,       -- Type definitions missing from JS package
            80001,      -- CommonJS module may be converted to ES module
        },
    })
    utils.setup_client(client)
end

require('lspconfig').tsserver.setup({
    init_options = {
        preferences = {
            disableSuggestions = false,
        },
    },
    on_attach = on_attach,
})
