return {
    'folke/zen-mode.nvim',
    event = 'VeryLazy',
    keys = {
        { '<leader>m', '<cmd>ZenMode<CR>', { desc = 'Zen Mode Toggle' } },
    },
    opts ={
        window = {
            width = 240,
        },
    },
}
