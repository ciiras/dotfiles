return {
    'svampkorg/moody.nvim',
    event = { 'ModeChanged', 'BufWinEnter', 'WinEnter' },
    dependencies = {
        "kevinhwang91/nvim-ufo"
    },
    opts = {
        blends = {
            normal = 0.25,
            insert = 0.25,
            visual = 0.30,
            command = 0.25,
            operator = 0.25,
            replace = 0.25,
            select = 0.25,
            terminal = 0.25,
            terminal_n = 0.25,
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
