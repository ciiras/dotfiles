local previewers = require('telescope.previewers')
local builtin = require('telescope.builtin')

local M = {}

local delta = previewers.new_termopen_previewer {
    get_command = function(entry)
        return {
            'git',
            '-c', 'core.pager=delta',
            '-c', 'delta.side-by-side=false',
            '-c', 'delta.features=diff-so-fancy-evolution',
            'diff',
            entry.path,
        }
    end
}

M.git_status = function(opts)
    opts = opts or {}
    opts.previewer = delta

    builtin.git_status(opts)
end

return M
