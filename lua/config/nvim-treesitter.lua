require('nvim-treesitter.configs').setup({
    auto_install = true,
    ensure_installed = {
        'c', 'c_sharp', 'dockerfile', 'html', 'javascript', 'lua', 'make',
        'markdown', 'rust', 'scss', 'tsx', 'typescript', 'vim', 'yaml',
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
        persist_queries = false,
        keybindings = {
            toggle_query_editor = 'o',
            toggle_hl_groups = 'i',
            toggle_injected_languages = 't',
            toggle_anonymous_nodes = 'a',
            toggle_language_display = 'I',
            focus_language = 'f',
            unfocus_language = 'F',
            update = 'R',
            goto_node = '<CR>',
            show_help = '?',
        },
    },
    query_linter = {
        enable = true,
        use_virtual_text = true,
        lint_events = {'BufWrite', 'CursorHold'},
    },
    rainbow = {
        disable = {},
        enable = true,
        extended_mode = true,
    },
    sync_install = false,
})
