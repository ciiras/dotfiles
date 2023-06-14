require('nvim-treesitter.configs').setup({
    auto_install = true,
    ensure_installed = {
        'c', 'c_sharp', 'dockerfile', 'html', 'javascript', 'lua', 'make',
        'markdown', 'markdown_inline', 'rust', 'scss', 'toml', 'tsx',
        'typescript', 'vim', 'yaml'
    },
    highlight = {
        enable = true,
        disable = {},
    },
    ignore_install = {},
    query_linter = {
        enable = true,
        use_virtual_text = true,
        lint_events = {'BufWrite', 'CursorHold'},
    },
    sync_install = false,
})
