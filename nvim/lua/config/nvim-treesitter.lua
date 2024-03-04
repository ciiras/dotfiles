require('nvim-treesitter.configs').setup({ ---@diagnostic disable-line missing-fields
    auto_install = true,
    ensure_installed = {
        'bash', 'c', 'c_sharp', 'diff', 'dockerfile', 'git_config',
        'git_rebase', 'gitcommit', 'gitignore', 'html', 'javascript', 'lua',
        'make', 'markdown', 'markdown_inline', 'query', 'rust', 'scss', 'tmux',
        'toml', 'tsx', 'typescript', 'vim', 'vimdoc', 'xml', 'yaml'
    },
    highlight = {
        enable = true,
        disable = function(lang, buf)
            local max_filesize = 1000 * 1024 -- 1 MB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                local buffer_name = vim.api.nvim_buf_get_name(buf)
                print('Disabled treesitter highlighting for', buffer_name, 'with size', stats.size, 'bytes')
                return true
            end

            return false
        end
    },
    ignore_install = {},
    query_linter = {
        enable = true,
        use_virtual_text = true,
        lint_events = {'BufWrite', 'CursorHold'},
    },
    sync_install = false,
})
