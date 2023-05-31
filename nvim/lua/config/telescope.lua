local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup({
    defaults = {
        vimgrep_arguments = { -- live_grep()
            'rg', '--follow', '--color=never', '--no-heading', '--with-filename',
            '--line-number', '--column', '--smart-case', '--hidden', '--no-ignore',
            '--glob', '!.git',
            '--glob', '!/node_modules',
            '--glob', '!.next',
            '--glob', '!build',
            '--glob', '!projects/**/node_modules',
            '--glob', '!build-node-docker/node_modules',
            '--glob', '!android',
            '--glob', '!ios',
            '--glob', '!Session.vim',
            '--glob', '!package-lock.json',
            '--glob', '!consul.js',
            '--glob', '!consul-keys.ctmpl',
            '--glob', '!.eslintcache',
        },
        mappings = {
            i = {
                ['<esc>'] = actions.close,
                ['<Tab>'] = actions.move_selection_next,
                ['<S-Tab>'] = actions.move_selection_previous,
            },
        },
        prompt_prefix = ' ',
        selection_caret = ' ',
        entry_prefix = '  ',
        initial_mode = 'insert',
        layout_strategy = 'flex',
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
        set_env = {['COLORTERM'] = 'truecolor'},
    },
    extensions = {
        file_browser = {
            hidden = true,
        },
    },
    pickers = {
        find_files = {
            find_command = {
                'rg', '--hidden', '--files', '--no-ignore',
                '--glob', '!.git',
                '--glob', '!/node_modules',
                '--glob', '!.next',
                '--glob', '!build',
                '--glob', '!projects/**/node_modules',
                '--glob', '!build-node-docker/node_modules',
                '--glob', '!android',
                '--glob', '!ios',
                '--glob', '!Session.vim',
                '--glob', '!consul.js',
                '--glob', '!consul-keys.ctmpl',
                '--glob', '!.eslintcache',
            },
        }
    },
})

telescope.load_extension('fzf')
telescope.load_extension('file_browser')