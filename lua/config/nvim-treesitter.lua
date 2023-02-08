require('nvim-treesitter.configs').setup({
    auto_install = true,
    ensure_installed = {
        'c', 'c_sharp', 'dockerfile', 'html', 'javascript', 'lua', 'make',
        'markdown', 'rust', 'scss', 'toml', 'tsx', 'typescript', 'vim', 'yaml'
    },
    highlight = {
        enable = true,
        disable = {},
    },
    ignore_install = {},
    playground = {
        enable = true,
        disable = {},
        updatetime = 25,
        persist_queries = true,
    },
    query_linter = {
        enable = true,
        use_virtual_text = true,
        lint_events = {'BufWrite', 'CursorHold'},
    },
    sync_install = false,
})
