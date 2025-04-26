return {
    'nvim-treesitter/nvim-treesitter',
    build = function()
        require('nvim-treesitter.install').update({ with_sync = true })
    end,
    config = function()
        require('nvim-treesitter.configs').setup({ ---@diagnostic disable-line missing-fields
            auto_install = true,
            ensure_installed = {
                'bash', 'c', 'c_sharp', 'diff', 'dockerfile', 'git_config',
                'git_rebase', 'gitcommit', 'gitignore', 'html', 'javascript',
                'kotlin', 'lua', 'make', 'markdown', 'markdown_inline',
                'query', 'rust', 'scss', 'tmux', 'toml', 'tsx', 'typescript',
                'vim', 'vimdoc', 'xml', 'yaml'
            },
            highlight = {
                enable = true,
            },
            ignore_install = {},
            query_linter = {
                enable = true,
                use_virtual_text = true,
                lint_events = {'BufWrite', 'CursorHold'},
            },
            sync_install = false,
        })
    end,
    event = 'VeryLazy',
}
