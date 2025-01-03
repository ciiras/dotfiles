return {
    'romgrk/barbar.nvim',
    commit = 'd181f2cfd4b828f9c6f1e10e69c68241de59f54f', -- file name display is broken in latest commit
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
