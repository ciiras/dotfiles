local tb = require('telescope.builtin')

local function buildBufferOptions(bufNum, desc)
    return {
        buffer = bufNum,
        desc = desc,
        noremap = true,
        silent = true,
    }
end

local function format()
    vim.lsp.buf.format({ async = true })
end

return {
    'neovim/nvim-lspconfig',
    config = function()
        local on_attach = function(client, bufNum) ---@diagnostic disable-line unused-local
            -- Neovim already sets omnifunc/tagfunc/etc on attach by default in newer versions, but keeping this is harmless if you like it.
            vim.bo[bufNum].omnifunc = 'v:lua.vim.lsp.omnifunc'

            vim.keymap.set('n', '[d', '<Cmd>Lspsaga diagnostic_jump_prev<CR>', buildBufferOptions(bufNum, 'Diag Prev'))
            vim.keymap.set('n', ']d', '<Cmd>Lspsaga diagnostic_jump_next<CR>', buildBufferOptions(bufNum, 'Diag Next'))

            vim.keymap.set('n', 'K',      '<Cmd>Lspsaga hover_doc<CR>', buildBufferOptions(bufNum, 'Hover'))

            vim.keymap.set('n', 'gd', '<Cmd>Glance definitions<CR>', buildBufferOptions(bufNum, 'Definition'))
            vim.keymap.set('n', 'gr', '<Cmd>Glance references<CR>', buildBufferOptions(bufNum, 'References'))

            vim.keymap.set('n', '<leader>ls', tb.lsp_document_symbols,  buildBufferOptions(bufNum, 'Symbols in File'))
            vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, buildBufferOptions(bufNum, 'LSP Code Actions'))
            vim.keymap.set('n', '<leader>lf', format, buildBufferOptions(bufNum, 'LSP Format'))
            vim.keymap.set('n', '<leader>lr', '<Cmd>Lspsaga rename<CR>', buildBufferOptions(bufNum, 'LSP Rename'))
            vim.keymap.set('n', '<leader>lq', tb.diagnostics, buildBufferOptions(bufNum, 'Telescope Diagnostics Toggle'))
            vim.keymap.set('n', '<leader>lQ', '<cmd>Trouble diagnostics toggle<cr>', buildBufferOptions(bufNum, 'Trouble Diagnostics Toggle'))
        end

        vim.lsp.config('bashls', {
            filetypes = { 'sh', 'bash', 'zsh' },
            on_attach = on_attach,
        })

        vim.lsp.config('eslint', {
            on_attach = on_attach,
        })

        vim.lsp.config('jdtls', {
            cmd = { 'jdtls' },
            on_attach = on_attach,
        })

        vim.lsp.config('kotlin_language_server', {
            on_attach = on_attach,
        })

        vim.lsp.config('lua_ls', {
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
                            'nvmap',
                            'nxmap',
                            'opt',
                            'vim',
                            'vmap',
                            'xmap',
                        },
                    },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file('', true),
                    },
                },
            },
        })

        vim.lsp.config('marksman', {
            on_attach = on_attach,
        })

        vim.lsp.config('rust_analyzer', {
            on_attach = on_attach,
        })

        vim.lsp.config('ts_ls', {
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
            on_attach = function(client, bufNum)
                on_attach(client, bufNum)

                local utils = require('nvim-lsp-ts-utils')
                utils.setup({
                    filter_out_diagnostics_by_code = {
                        6133,  -- No unused local variables
                        6198,  -- No all destructured values unused
                        7016,  -- Type definitions missing from JS package
                        80001, -- CommonJS module may be converted to ES module
                    },
                })
                utils.setup_client(client)
            end,
        })

        vim.lsp.enable({
            'bashls',
            'eslint',
            'jdtls',
            'kotlin_language_server',
            'lua_ls',
            'marksman',
            'rust_analyzer',
            'ts_ls',
        })
    end,
    event = {
        'BufReadPre',
        'BufNewFile',
    },
}
