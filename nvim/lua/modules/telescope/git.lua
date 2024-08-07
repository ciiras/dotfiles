local previewers = require('telescope.previewers')
local builtin = require('telescope.builtin')

local function trim(str)
    return str:match("^%s*(.-)%s*$")
end

local function git_status_includes_rename(status)
  return status:sub(1, 1) == 'R'
end

local function parse_new_path_from_git_rename(str)
    local result = {}
    local delimiter = '->'
    local pattern = '(.-)' .. delimiter

    for part in (str .. delimiter):gmatch(pattern) do
      if part ~= "" then
        table.insert(result, part)
      end
    end

  return trim(result[#result])
end

local function buildDiff(diffOptions)
    return previewers.new_termopen_previewer({
        get_command = function(entry)
            local path = entry.path
            if git_status_includes_rename(entry.status) then -- Renamed file format: old path -> new path
                path = parse_new_path_from_git_rename(entry.path)
            end

            local cmd = {
                'git',
                '-c', 'core.pager=delta',
                '-c', 'delta.side-by-side=false',
                '-c', 'delta.features=diff-so-fancy-evolution',
                'diff',
            }

            if (diffOptions) then
                table.insert(cmd, diffOptions)
            end
            table.insert(cmd, path)

            return cmd;
        end
    })
end

local M = {}

M.git_status = function(opts)
    opts = opts or {}
    opts.previewer = buildDiff()

    builtin.git_status(opts)
end

M.git_status_staged = function(opts)
    opts = opts or {}
    opts.previewer = buildDiff('--staged')

    builtin.git_status(opts)
end

return M
