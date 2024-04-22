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
                    Cursor = { bg = '#86ABDC' },
                    CursorColumn = { bg = '#1C1C1C' },
                    CursorLine = { bg = '#1C1C1C' },
                    Folded = { fg='#719CD6' },
                    IncSearch = { fg ='#393B44', bg = '#E0C989' },
                    Search = { fg ='#393B44', bg = '#E0C989' },
                    Substitute = { fg ='#FFFFFF' },
                    TelescopeBorder = { fg = '#719CD6' },
                    Visual = { fg = '#86ABDC' },
                    WinSeparator = { fg = '#719CD6' },
                },
            },
        })
    end,
}
