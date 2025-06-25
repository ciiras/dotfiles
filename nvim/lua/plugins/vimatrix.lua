return {
    'wolfwfr/vimatrix.nvim',
    event = 'VimEnter',
    opts = {
        auto_activation = {
            screensaver = {
                setup_deferral = 0,
                timeout = 600,
                ignore_focus = true,
                block_on_term = true,
                block_on_cmd_line = true,
            },
            on_filetype = {},
        },
        colourscheme = 'blue',
    },
}
