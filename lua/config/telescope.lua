local telescope = require('telescope')
local actions = require('telescope.actions')

local rg = {
    'rg', '--follow', '--color=never', '--no-heading',
    '--with-filename', '--line-number', '--column', '--smart-case',
    '--hidden', '--no-ignore', '--glob', '!.git/*'
}

telescope.load_extension('fzf')

telescope.setup({
    defaults = {
        vimgrep_arguments = rg,
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
        selection_strategy = 'reset',
        sorting_strategy = 'descending',
        layout_strategy = 'flex',
        layout_config = {
            width = 0.75,
            prompt_position = 'bottom',
            preview_cutoff = 120,
            horizontal = {mirror = false},
            vertical = {mirror = true}
        },
        file_sorter = require('telescope.sorters').get_fzf_sorter,
        generic_sorter = require('telescope.sorters').get_fzf_sorter,
        winblend = 0,
        border = {},
        borderchars = {'─', '│', '─', '│', '╭', '╮', '╯', '╰'},
        color_devicons = true,
        use_less = true,
        set_env = {['COLORTERM'] = 'truecolor'} -- default = nil,
    },
    pickers = {
        find_command = rg,
    },
})
