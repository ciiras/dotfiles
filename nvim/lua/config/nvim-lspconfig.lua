require('mason').setup({
    providers = {
        'mason.providers.client',
        'mason.providers.registry-api',
    }
})

require('mason-lspconfig').setup({
    ensure_installed = {
        'bashls',
        'jdtls',
        'lua_ls',
        'rust_analyzer',
        'tsserver',
    }
})

local lspConfig = require('lspconfig')

local on_attach = function(client, bufNum)
    vim.api.nvim_buf_set_option(bufNum, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local bufOpts = { noremap=true, silent=true, buffer=bufNum }
    vim.keymap.set('n', '[d', '<Cmd>Lspsaga diagnostic_jump_prev<CR>', keymap_options)
    vim.keymap.set('n', ']d', '<Cmd>Lspsaga diagnostic_jump_next<CR>', keymap_options)
    vim.keymap.set('n', 'gd', '<Cmd>Glance definitions<CR>', bufOpts)
    vim.keymap.set('n', 'gr', '<Cmd>Glance references<CR>', bufOpts)
    vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', bufOpts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufOpts)
    vim.keymap.set('n', '<space>rn', '<Cmd>Lspsaga rename<CR>', bufOpts)
    vim.keymap.set('n', '<space>ca', '<cmd>Lspsaga code_action<CR>', bufOpts)
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufOpts)
end

local on_attach_tsserver = function(client, bufNum)
    on_attach(client, bufNum)

    local utils = require('nvim-lsp-ts-utils')
    utils.setup({
        filter_out_diagnostics_by_code = {
            7016,       -- Type definitions missing from JS package
            80001,      -- CommonJS module may be converted to ES module
        },
    })
    utils.setup_client(client)
end

lspConfig.tsserver.setup({
    init_options = {
        preferences = {
            disableSuggestions = false,
        },
    },
    on_attach = on_attach_tsserver,
    filetypes = {
        'javascript',
        'json',
        'typescript',
        'typescript.tsx',
        'typescriptreact',
    },
})

lspConfig.lua_ls.setup({
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = {
                    'cmap',
                    'create_autocmd',
                    'exec',
                    'fn',
                    'global',
                    'imap',
                    'keymap',
                    'keymap_options',
                    'nmap',
                    'nxmap',
                    'opt',
                    'vim',
                    'vmap',
                    'xmap',
                },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
        },
    }
})

lspConfig.jdtls.setup({
    cmd = {
        'jdtls',
    },
    on_attach = on_attach,
})

lspConfig.rust_analyzer.setup({
    on_attach = on_attach,
})

lspConfig.bashls.setup({
    on_attach = on_attach,
})
