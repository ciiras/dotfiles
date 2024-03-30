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
            Cursor = { bg = '#81B29A' },
            CursorColumn = { bg = '#1C1C1C' },
            CursorLine = { bg = '#1C1C1C' },
            Folded = { fg='#719CD6' },
            IncSearch = { fg ='#393B44', bg = '#F4A261' },
            Search = { fg ='#393B44', bg = '#F4A261' },
            Substitute = { fg ='#FFFFFF' },
            TelescopeBorder = { fg = '#719CD6' },
            Visual = { fg = '#6E9783' },
            WinSeparator = { fg = '#719CD6' },
        },
    },
})
