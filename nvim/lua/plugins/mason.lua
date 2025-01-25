return {
    'williamboman/mason.nvim',
    config = function()
        local mason = require('mason')
        mason.setup({
            providers = {
                'mason.providers.client',
                'mason.providers.registry-api',
            }
        })
    end,
    lazy = false,
}
