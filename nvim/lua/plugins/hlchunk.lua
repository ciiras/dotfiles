return {
  'shellRaining/hlchunk.nvim',
  config = function()
    require('hlchunk').setup({
        chunk = {
            enable = true,
        },
        indent = {
            enable = true,
        },
        line_num = {
            enable = false,
        },
        blank = {
            enable = false,
        },
    })
  end,
  event = { 'BufReadPre', 'BufNewFile' },
}
