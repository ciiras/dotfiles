-- Lua {{{

create_autocmd = vim.api.nvim_create_autocmd
create_usercmd = vim.api.nvim_create_user_command
global = vim.g
opt = vim.opt

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

-- junegunn/fzf.vim {{{
opt.rtp:append('/usr/local/opt/fzf')

vim.cmd([[
function! RipgrepFzf(query, fullscreen)
    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
]])
create_usercmd('RG', 'call RipgrepFzf(<q-args>, <bang>0)', { bang = true })

nmap('<leader>ff', ':Files<CR>')
nmap('<leader>fg', ':GitFiles?<CR>')
nmap('<leader>fh', ':History<CR>')
nmap('<leader>fl', ':BLines<CR>')
nmap('<leader>fr', ':RG<CR>')
-- }}}
