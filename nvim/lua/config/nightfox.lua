require('nightfox').setup({
    options = {
        transparent = true,
        dim_inactive = false,
        styles = {
            keywords = 'bold',
        },
    },
    groups = {
        all = {
            CursorColumn = { bg = '#1C1C1C' },
            CursorLine = { bg = '#1C1C1C' },
            IncSearch = { fg ='#393B44', bg = '#F4A261' },
            Search = { fg ='#393B44', bg = '#F4A261' },
            Substitute = { fg ='#FFFFFF' },
            TelescopeBorder = { fg = '#719CD6' },
            WinSeparator = { fg = '#719CD6' },
        },
    },
})
