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
  wilder.popupmenu_palette_theme({
    border = 'rounded',
    highlights = {
        border = 'Border',
    },
    left = {' ', wilder.popupmenu_devicons()},
    max_height = 20,
    min_height = 20,
    prompt_position = 'bottom',
    reverse = 0,
    right = {' ', wilder.popupmenu_scrollbar()},
  })
))

