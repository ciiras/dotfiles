return {
    'DNLHC/glance.nvim',
    config = function()
        local glance = require('glance')

        glance.setup({
            border = {
                enable = true,
            },
            height = 40,
        })
    end,
    event = {
        'BufNewFile',
        'BufReadPre',
    },
}
