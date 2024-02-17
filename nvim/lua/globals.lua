create_autocmd = vim.api.nvim_create_autocmd
exec = vim.api.nvim_exec
fn = vim.fn
global = vim.g
keymap = vim.api.nvim_set_keymap
opt = vim.opt

keymap_options = { noremap = true, silent = true }

local function merge(tbl1, tbl2)
    local tbl = {}

    for k,v in pairs(tbl1) do
        tbl[k] = v
    end
    for k,v in pairs(tbl2) do
        tbl[k] = v
    end

    return tbl
end

local function map(mode, keymap, cmd, opts)
    vim.keymap.set(mode, keymap, cmd, merge(opts, keymap_options))
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

function nxmap(keymap, cmd, opts)
    opts = opts or {}
    map({"n","x"}, keymap, cmd, opts)
end
