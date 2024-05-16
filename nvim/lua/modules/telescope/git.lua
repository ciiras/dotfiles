local previewers = require('telescope.previewers')
local builtin = require('telescope.builtin')
local conf = require('telescope.config')
local M = {}

local delta = previewers.new_termopen_previewer {
  get_command = function(entry)
      return { 'git', '-c', 'core.pager=delta --diff-so-fancy', '-c', 'delta.side-by-side=false', 'diff', entry.path }
  end
}

M.git_status = function(opts)
  opts = opts or {}
  opts.previewer = delta

  builtin.git_status(opts)
end

return M
