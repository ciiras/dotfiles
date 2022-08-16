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

-- Plugins {{{

vim.cmd([[
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  au VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'tpope/vim-fugitive'                                                           " Exposes git commands
Plug 'tpope/vim-obsession'                                                          " Session.vim reload
Plug 'tpope/vim-repeat'                                                             " Expands repeat support to plugins
Plug 'tpope/vim-surround'                                                           " Surround tool
Plug 'vimwiki/vimwiki'                                                              " Vimwiki

call plug#end()
]])

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

-- tpope/vim-obsession {{{
vim.cmd([[
augroup ObsessionGroup
  au!
  au VimEnter * nested if !&modified && empty(v:this_session) | Obsession | echo '' | endif
augroup END
]])
-- }}}

-- vimwiki/vimwiki {{{
global.vimwiki_list = {{path = '~/Library/Mobile Documents/com~apple~CloudDocs/Documents/vimwiki'}}
global.vimwiki_url_maxsave = 0
-- }}}

-- tpope/vim-fugitive {{{
nmap('<leader>gb', ':G blame<CR>')
nmap('<leader>gd', ':Gdiff<CR>')
nmap('<leader>gD', ':G diff<CR>')
nmap('<leader>gs', ':Git<CR>')
-- }}}

-- Plugins }}}

-- Key Mappings {{{

nmap('<leader>r', ':source $MYVIMRC<CR> :echo \'---.vimrc reloaded---\'<CR>')

-- Buffers {{{
nmap('<leader>bl', ':ls<CR>')
nmap('<leader>bp', ':bp<CR>')
nmap('<leader>bn', ':bn<CR>')
nmap('<leader>bd', ':bd<CR>')
nmap('<leader>bD', ':%bd<CR>')
nmap('<leader>bo', ':on<CR>')
nmap('<leader>bs', ':new<CR>')
-- }}}

nmap('<esc>', ':nohlsearch<CR>')

-- Splits {{{
nmap('<M-h>', '<C-W>>')
nmap('<M-l>', '<C-W><')
nmap('<M-j>', '<C-W>-')
nmap('<M-k>', '<C-W>+')
nmap('<M-=>', '<C-W>=')
nmap('<leader>s', '<C-W>s')
nmap('<leader>v', '<C-W>v')
-- }}}

nmap('q:', '<Nop>')
xmap('p', 'pgvy')


-- kyazdani42/nvim-tree.lua {{{
nmap('<leader>.', ':NvimTreeFindFileToggle<CR>')
-- }}}

-- Key Mappings }}}

-- Auto Commands {{{

vim.cmd([[
function! StripTrailingWhitespace()
    if &ft =~ 'markdown' | return | endif
    %s/\s\+$//e
endfunction

function! TurnOnRelativeNumber()
    if &ft =~ 'NvimTree' | return | endif
    set number relativenumber
endfunction

function! TurnOffRelativeNumber()
    if &ft =~ 'NvimTree' | return | endif
    set number norelativenumber
endfunction
]])

local turn_on_relative_number = function()
    vim.api.nvim_call_function('TurnOnRelativeNumber', {})
end
create_autocmd({ 'BufEnter', 'FocusGained', 'InsertLeave' }, { callback = turn_on_relative_number })

local turn_off_relative_number = function()
    vim.api.nvim_call_function('TurnOffRelativeNumber', {})
end
create_autocmd({ 'BufLeave', 'FocusLost', 'InsertEnter' }, { callback = turn_off_relative_number })

create_autocmd({ 'WinEnter', 'BufReadPre' }, { command = 'setlocal cursorline' })
create_autocmd({ 'WinLeave' }, { command = 'setlocal nocursorline' })

create_autocmd({ 'BufRead' }, { command = 'setlocal foldmethod=marker' })

local strip_trailing_white_space = function()
    vim.api.nvim_call_function('StripTrailingWhitespace', {})
end
create_autocmd({ 'BufWritePre' }, { callback = strip_trailing_white_space })

create_autocmd({ 'FileType' }, { command = 'setlocal formatoptions-=c formatoptions-=r formatoptions-=o' })

-- Auto Commands }}}
