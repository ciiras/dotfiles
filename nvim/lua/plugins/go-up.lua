return {
    'nullromo/go-up.nvim',
    config = function(_, opts)
        local goUp = require('go-up')
        goUp.setup(opts)
    end,
    event = 'VeryLazy',
    opts = {
        alignOffsetLines = {
            top = 10,
            bottom = 10,
        },
    },
}
