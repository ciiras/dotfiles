local wilder = require('wilder')

wilder.setup({
    modes = {':'},
})

wilder.set_option('pipeline', {
    wilder.branch(
        wilder.cmdline_pipeline({
            language = 'python',
            fuzzy = 2,
        })
    ),
})

wilder.set_option('renderer', wilder.popupmenu_renderer(
    wilder.popupmenu_border_theme({
        border = 'rounded',
        highlights = {
            border = 'Normal',
        },
        left = {' ', wilder.popupmenu_devicons()},
        right = {' ', wilder.popupmenu_scrollbar()},
    })
))

