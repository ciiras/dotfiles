local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.diagnostics.codespell,
        null_ls.builtins.diagnostics.cspell,
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.completion.spell,
    }
})
