return {
    'EdenEast/nightfox.nvim',
    config = function()
        local nightfox = require('nightfox')

        nightfox.setup({
            options = {
                transparent = true,
                dim_inactive = false,
                styles = {
                    keywords = 'bold',
                },
            },
            groups = {
                all = {
                    Border = {
                        fg = '#719CD6'
                    },
                    Cursor = {
                        bg = '#86ABDC'
                    },
                    CursorColumn = {
                        bg = '#1C1C1C'
                    },
                    CursorLine = {
                        bg = '#1C1C1C'
                    },
                    Folded = {
                        fg = '#719CD6'
                    },
                    IncSearch = {
                        bg = '#F6B079',
                        fg = '#393B44',
                    },
                    NoiceVirtualText = {
                        bg = '#30323A',
                        fg = '#F6B079',
                    },
                    Search = {
                        bg = '#F6B079',
                        fg = '#393B44',
                    },
                    Substitute = {
                        fg = '#FFFFFF'
                    },
                    TelescopeBorder = {
                        fg = '#AAC4E6'
                    },
                    TelescopeSelection = {
                        bg = '#212121'
                    },
                    Visual = {
                        fg = '#86ABDC'
                    },
                    WinSeparator = {
                        fg = '#719CD6'
                    },
                },
            },
        })
    end,
}
