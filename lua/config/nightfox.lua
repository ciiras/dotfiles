require('nightfox').setup({
    options = {
        transparent = true,
        dim_inactive = true,
        styles = {
            keywords = 'bold',
        },
    },
    groups = {
        all = {
            IncSearch = { fg ='#393b44', bg = '#F4A261' },
            NormalNC = { bg = '#303030' },
            Search = { fg ='#393b44', bg = '#F4A261' },
            CursorLine = { bg = '#1C1C1C' },
            CursorColumn = { bg = '#1C1C1C' },
            Substitute = { fg ='#FFFFFF' },
        },
    },
})
