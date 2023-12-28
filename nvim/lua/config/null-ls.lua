local null_ls = require('null-ls')

null_ls.setup({
    debug = false,
    sources = {
        null_ls.builtins.code_actions.cspell.with({
            config = {
                find_json = function(_)
                    return vim.fn.expand('~/.config/cspell.json')
                end
            }
        }),
        null_ls.builtins.code_actions.eslint_d,
        null_ls.builtins.diagnostics.cspell,
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.hover.printenv,
    }
})
