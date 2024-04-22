return {
    'numToStr/Comment.nvim',
    dependencies = {
        {
            'JoosepAlviste/nvim-ts-context-commentstring',
            config = function()
                local ts_context_commentstring = require('ts_context_commentstring')
                ts_context_commentstring.setup { ---@diagnostic disable-line missing-fields
                    enable_autocmd = false,
                }
            end,
        },
    },
    config = function()
        local comment = require('Comment')
        comment.setup({
            pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
        })
    end,
    event = 'VeryLazy',
}
