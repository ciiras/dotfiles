return {
    'romgrk/barbar.nvim',
    config = function()
        require('barbar').setup({
            icons = {
                buffer_index = true,
            },
            insert_at_end = true,
        })
    end,
    dependencies = {
        'lewis6991/gitsigns.nvim',
        'nvim-tree/nvim-web-devicons',
    },
    event = 'VimEnter',
}
