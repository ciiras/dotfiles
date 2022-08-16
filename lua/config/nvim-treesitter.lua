require('nvim-treesitter.configs').setup({
    ensure_installed = { 'c', 'c_sharp', 'dockerfile', 'html', 'javascript', 'lua', 'make', 'markdown', 'rust', 'scss', 'tsx', 'typescript', 'vim', 'yaml' },
    sync_install = false,
    auto_install = true,
    ignore_install = {},
    highlight = {
        enable = true,
        disable = {},
        additional_vim_regex_highlighting = true,
    },
    rainbow = {
        disable = {},
        enable = true,
        extended_mode = true,
    },
    playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
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
    }
})