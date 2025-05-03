return {
    'svampkorg/moody.nvim',
    event = { 'ModeChanged', 'BufWinEnter', 'WinEnter' },
    dependencies = {
        "kevinhwang91/nvim-ufo"
    },
    opts = {
        blends = {
            normal = 0.2,
            insert = 0.2,
            visual = 0.25,
            command = 0.2,
            operator = 0.2,
            replace = 0.2,
            select = 0.2,
            terminal = 0.2,
            terminal_n = 0.2,
        },
        colors = {
            normal = "#719CD6",
            insert = "#81B29A",
            visual = "#9D79D6",
            command = "#C94F6D",
            operator = "#F4A261",
            replace = "#D16983",
            select = "#9D79D6",
            terminal = "#4CD4BD",
            terminal_n = "#00BBCC",
        },
        disabled_filetypes = { "TelescopePrompt" },
    },
}
