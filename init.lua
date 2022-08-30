-- Lua {{{

create_autocmd = vim.api.nvim_create_autocmd
create_usercmd = vim.api.nvim_create_user_command
global = vim.g
opt = vim.opt
fn = vim.fn
exec = vim.api.nvim_exec

keymap_options = { noremap = true, silent = true }

function merge(tbl1, tbl2)
    for k,v in pairs(tbl1) do
        tbl2[k] = v
    end
    return tbl2
end

function map(mode, keymap, cmd, opts)
    vim.api.nvim_set_keymap(mode, keymap, cmd, merge(opts, keymap_options))
end
function cmap(keymap, cmd, opts)
    opts = opts or {}
    map('c', keymap, cmd, opts)
end
function imap(keymap, cmd, opts)
    opts = opts or {}
    map('i', keymap, cmd, opts)
end
function nmap(keymap, cmd, opts)
    opts = opts or {}
    map('n', keymap, cmd, opts)
end
function vmap(keymap, cmd, opts)
    opts = opts or {}
    map('v', keymap, cmd, opts)
end
function xmap(keymap, cmd, opts)
    opts = opts or {}
    map('x', keymap, cmd, opts)
end

-- Lua }}}

require('plugins')
require('options')
require('mappings')
require('autocmds')

vim.lsp.set_log_level('debug')
