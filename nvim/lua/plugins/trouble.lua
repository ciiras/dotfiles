return {
    'folke/trouble.nvim',
    config = function()
        local trouble = require('trouble')
        trouble.setup({
            cycle_results = false,
            padding = false,
        })
    end,
    event = 'VeryLazy',
}
