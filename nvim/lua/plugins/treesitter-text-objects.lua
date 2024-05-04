return {
    'nvim-treesitter/nvim-treesitter-textobjects',
    dependecies = {
        'nvim-treesitter/nvim-treesitter',
    },
    config = function()
        require('nvim-treesitter.configs').setup({ ---@diagnostic disable-line missing-fields
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",
                    },
                },
            },
        })
    end,
    event = 'VeryLazy',
}
