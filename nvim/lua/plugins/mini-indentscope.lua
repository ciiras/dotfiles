return {
    'echasnovski/mini.surround',
    branch = 'stable',
    config = function()
        local mini_surround = require('mini.surround')

        mini_surround.setup({
            mappings = {
                add = 'S',
                delete = 'ds',
                find = '',
                find_left = '',
                highlight = '',
                replace = 'cs',
                update_n_lines = '',
            },
        })
    end,
    event = 'VeryLazy',
}
