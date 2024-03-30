local M = {}

M.get_palette = function()
    local palette = require('nightfox.palette').load("nightfox")
    print(vim.inspect(palette))
end

return M
