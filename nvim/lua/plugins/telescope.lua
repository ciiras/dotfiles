local select_one_or_multi = function(prompt_bufnr)
    local actions = require('telescope.actions')
    local picker = require('telescope.actions.state').get_current_picker(prompt_bufnr)

    local multi = picker:get_multi_selection()
    if not vim.tbl_isempty(multi) then
        actions.close(prompt_bufnr)
        for _, j in pairs(multi) do
            if j.path ~= nil then
                vim.cmd(string.format('%s %s', 'edit', j.path))
            end
    end
    else
        actions.select_default(prompt_bufnr)
    end
end

return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'debugloop/telescope-undo.nvim',
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-file-browser.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make'
        },
        'nvim-telescope/telescope-node-modules.nvim',
        'piersolenski/telescope-import.nvim',
    },
    config = function()
        local telescope = require('telescope')
        local actions = require('telescope.actions')

        telescope.setup({
            defaults = {
                entry_prefix = '  ',
                initial_mode = 'insert',
                layout_config = {
                    width = 0.95,
                    prompt_position = 'bottom',
                    preview_cutoff = 20,
                    horizontal = {
                        preview_width = 0.5,
                        mirror = false
                    },
                    vertical = {
                        preview_height = 0.5,
                        mirror = false
                    },
                },
                layout_strategy = 'flex',
                mappings = {
                    i = {
                        ['<ESC>'] = actions.close,
                        ['<CR>'] = select_one_or_multi,

                        ['<C-N>'] = actions.move_selection_next,
                        ['<C-P>'] = actions.move_selection_previous,

                        ['<C-H>'] = actions.preview_scrolling_left,
                        ['<C-J>'] = actions.preview_scrolling_down,
                        ['<C-K>'] = actions.preview_scrolling_up,
                        ['<C-L>'] = actions.preview_scrolling_right,

                        ['<C-D>'] = actions.cycle_history_next,
                        ['<C-U>'] = actions.cycle_history_prev,
                    },
                },
                path_display = {
                    'filename_first',
                },
                prompt_prefix = ' ',
                selection_caret = ' ',
                set_env = {['COLORTERM'] = 'truecolor'},
                vimgrep_arguments = { -- live_grep()
                    'rg', '--follow', '--color=never', '--no-heading', '--with-filename',
                    '--line-number', '--column', '--smart-case', '--hidden', '--no-ignore',
                    '--glob', '!.3T',
                    '--glob', '!.android',
                    '--glob', '!.bundle',
                    '--glob', '!.cache',
                    '--glob', '!.cocoapods',
                    '--glob', '!.config',
                    '--glob', '!.docker',
                    '--glob', '!.eslintcache',
                    '--glob', '!.flipper',
                    '--glob', '!.git',
                    '--glob', '!.git',
                    '--glob', '!.jenv',
                    '--glob', '!.local',
                    '--glob', '!.mongodb',
                    '--glob', '!.next',
                    '--glob', '!.next',
                    '--glob', '!.nodenv',
                    '--glob', '!.npm',
                    '--glob', '!.rbenv',
                    '--glob', '!.tmux',
                    '--glob', '!.Trash',
                    '--glob', '!/node_modules',
                    '--glob', '!android',
                    '--glob', '!build',
                    '--glob', '!build-node-docker/node_modules',
                    '--glob', '!consul-keys.ctmpl',
                    '--glob', '!consul.js',
                    '--glob', '!ios',
                    '--glob', '!karabiner/assets',
                    '--glob', '!karabiner/automatic_backups',
                    '--glob', '!package-lock.json',
                    '--glob', '!projects/**/node_modules',
                    '--glob', '!Session.vim',
                    '--glob', '!vendor',
                },
            },
            extensions = {
                file_browser = {
                    hidden = true,
                    hijack_netrw = true,
                },
            },
            pickers = {
                find_files = {
                    find_command = {
                        'rg', '--hidden', '--files', '--no-ignore',
                        '--glob', '!.3T',
                        '--glob', '!.android',
                        '--glob', '!.bundle',
                        '--glob', '!.cache',
                        '--glob', '!.cocoapods',
                        '--glob', '!.config',
                        '--glob', '!.docker',
                        '--glob', '!.eslintcache',
                        '--glob', '!.flipper',
                        '--glob', '!.git',
                        '--glob', '!.git',
                        '--glob', '!.jenv',
                        '--glob', '!.local',
                        '--glob', '!.mongodb',
                        '--glob', '!.next',
                        '--glob', '!.next',
                        '--glob', '!.nodenv',
                        '--glob', '!.npm',
                        '--glob', '!.rbenv',
                        '--glob', '!.tmux',
                        '--glob', '!.Trash',
                        '--glob', '!/node_modules',
                        '--glob', '!android',
                        '--glob', '!build',
                        '--glob', '!build-node-docker/node_modules',
                        '--glob', '!consul-keys.ctmpl',
                        '--glob', '!consul.js',
                        '--glob', '!ios',
                        '--glob', '!karabiner/assets',
                        '--glob', '!karabiner/automatic_backups',
                        '--glob', '!projects/**/node_modules',
                        '--glob', '!Session.vim',
                        '--glob', '!vendor',
                    },
                }
            },
        })

        telescope.load_extension('ascii')
        telescope.load_extension('file_browser')
        telescope.load_extension('fzf')
        telescope.load_extension('import')
        telescope.load_extension('node_modules')
        telescope.load_extension('noice')
        telescope.load_extension('notify')
        telescope.load_extension('undo')
    end,
    event = 'VeryLazy',
}
