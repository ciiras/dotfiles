require('nvim-tree').setup({
    git = {
        ignore = false,
    },
    hijack_unnamed_buffer_when_opening = true,
    open_on_setup = false,
    open_on_setup_file = false,
    view = {
        adaptive_size = true,
    },
    notify = {
        threshold = vim.log.levels.ERROR,
    },
})

