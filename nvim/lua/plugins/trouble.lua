return {
    'folke/trouble.nvim',
    config = function()
        local trouble = require('trouble')
        trouble.setup({
            open_no_results = true,
        })
    end,
    event = 'VeryLazy',
}
