local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.load_extension('fzf')

telescope.setup({
    defaults = {
        vimgrep_arguments = { -- live_grep()
            'rg', '--follow', '--color=never', '--no-heading',
            '--with-filename', '--line-number', '--column', '--smart-case',
            '--hidden', '--no-ignore', '--glob', '!.git/*', '--glob',
            '!/node_modules',
        },
        mappings = {
            i = {
                ['<esc>'] = actions.close,
                ['<C-j>'] = actions.move_selection_next,
                ['<C-k>'] = actions.move_selection_previous,
            },
        },
        prompt_prefix = ' ',
        selection_caret = ' ',
        entry_prefix = '  ',
        initial_mode = 'insert',
        layout_strategy = 'flex',
        layout_config = {
            width = 0.75,
            prompt_position = 'bottom',
            preview_cutoff = 120,
            horizontal = {mirror = false},
            vertical = {mirror = true}
        },
        set_env = {['COLORTERM'] = 'truecolor'},
    },
    pickers = {
        find_files = {
            find_command = {
                'rg', '--hidden', '--files', '--no-ignore', '--glob',
                '!.git/*', '--glob', '!/node_modules',
            },
        }
    },
})
