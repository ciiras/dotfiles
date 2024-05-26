local function buildBufferOptions(bufNum, desc)
    return {
        buffer = bufNum,
        desc = desc,
        noremap = true,
        silent = true,
    }
end

return {
    'neovim/nvim-lspconfig',
    config = function()
        local lspConfig = require('lspconfig')

        local on_attach = function(client, bufNum) ---@diagnostic disable-line unused-local
            vim.api.nvim_buf_set_option(bufNum, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

            vim.keymap.set('n', '[d', '<Cmd>Lspsaga diagnostic_jump_prev<CR>', keymap_options)
            vim.keymap.set('n', ']d', '<Cmd>Lspsaga diagnostic_jump_next<CR>', keymap_options)
            vim.keymap.set('n', 'gd', '<Cmd>Glance definitions<CR>', buildBufferOptions(bufNum, 'LSP Definition'))
            vim.keymap.set('n', 'gr', '<Cmd>Glance references<CR>', buildBufferOptions(bufNum, 'LSP References'))
            vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', buildBufferOptions(bufNum, 'LSP Hover'))
            vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition,
                buildBufferOptions(bufNum, 'LSP Type Definition'))
            vim.keymap.set('n', '<space>rn', '<Cmd>Lspsaga rename<CR>', buildBufferOptions(bufNum, 'LSP Rename'))
            vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, buildBufferOptions(bufNum, 'LSP Code Actions'))
            vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format({ async = true }) end,
                buildBufferOptions(bufNum, 'LSP Format'))
        end

        local on_attach_tsserver = function(client, bufNum)
            on_attach(client, bufNum)

            local utils = require('nvim-lsp-ts-utils')
            utils.setup({
                filter_out_diagnostics_by_code = {
                    7016,  -- Type definitions missing from JS package
                    80001, -- CommonJS module may be converted to ES module
                },
            })
            utils.setup_client(client)
        end

        lspConfig.bashls.setup({
            filetypes = {
                'sh',
                'bash',
                'zsh',
            },
            on_attach = on_attach,
        })

        lspConfig.biome.setup({
            on_attach = on_attach,
        })

        lspConfig.eslint.setup({
            on_attach = on_attach,
        })

        lspConfig.jdtls.setup({
            cmd = {
                'jdtls',
            },
            on_attach = on_attach,
        })

        lspConfig.kotlin_language_server.setup({
            on_attach = on_attach,
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

        lspConfig.marksman.setup({
            on_attach = on_attach,
        })

        lspConfig.rust_analyzer.setup({
            on_attach = on_attach,
        })

        lspConfig.tsserver.setup({
            filetypes = {
                'javascript',
                'json',
                'typescript',
                'typescript.tsx',
                'typescriptreact',
            },
            init_options = {
                preferences = {
                    disableSuggestions = false,
                },
            },
            on_attach = on_attach_tsserver,
        })
    end,
    event = {
        'BufReadPre',
        'BufNewFile',
    },
}
