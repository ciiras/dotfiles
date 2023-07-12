require('nvim-tree').setup({
    git = {
        ignore = false,
    },
    hijack_unnamed_buffer_when_opening = false,
    view = {
        adaptive_size = true,
    },
    notify = {
        threshold = vim.log.levels.ERROR,
    },
})

