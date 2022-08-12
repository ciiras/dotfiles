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

-- Settings {{{

global.mapleader = ','
global.netrw_liststyle = 3
global.session_autosave = 'no'
global.tmux_navigator_preserve_zoom = 1

opt.autoread = true
opt.backspace = 'indent,eol,start'
opt.backup = false
opt.clipboard = 'unnamedplus'
opt.cmdheight = 2
opt.colorcolumn = '80'
opt.compatible = false
opt.encoding = 'UTF-8'
opt.expandtab = true
opt.hidden = true
opt.history = 100
opt.hlsearch = true
opt.ignorecase = true
opt.incsearch = true
opt.laststatus = 2
opt.lazyredraw = true
opt.list = true
opt.listchars = {tab = '›~', eol = '¬', space = '⋅'}
opt.mouse = 'a'
opt.number = true
opt.relativenumber = true
opt.ruler = true
opt.scl = 'yes'
opt.shiftwidth = 4
opt.shortmess:append('c')
opt.shortmess:append('I')
opt.showcmd = true
opt.showmatch = true
opt.smartcase = true
opt.smartindent = true
opt.splitbelow = true
opt.splitright = true
opt.swapfile = false
opt.tabstop = 4
opt.timeout = true
opt.timeoutlen = 1000
opt.ttimeoutlen = 0
opt.undodir = os.getenv('HOME') .. '/.config/nvim/undodir'
opt.undofile = true
opt.updatetime = 300
opt.visualbell = true
opt.wrap = false

-- Settings }}}

-- Plugins {{{

vim.cmd([[
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  au VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'ap/vim-css-color'                                                             " Color highlighter
Plug 'christoomey/vim-sort-motion'                                                  " Sort items in text objects
Plug 'christoomey/vim-tmux-navigator'                                               " Navigation between tmux and vim
Plug 'cohama/lexima.vim'                                                            " Auto close parentheses
Plug 'dstein64/vim-startuptime'                                                     " Startup time monitor
Plug 'easymotion/vim-easymotion'                                                    " Enhanced char and word search
Plug 'EdenEast/nightfox.nvim'                                                       " Color scheme
Plug 'fladson/vim-kitty'                                                            " Kitty config syntax highlighting
Plug 'fsharp/vim-fsharp', { 'for': 'fsharp', 'do': 'make fsautocomplete' }          " F#
Plug 'junegunn/fzf.vim'                                                             " ripgrep fuzzy search
Plug 'junegunn/vim-peekaboo'                                                        " Show clipboard/macro registers
Plug 'kyazdani42/nvim-web-devicons'                                                 " Dev icons
Plug 'kyazdani42/nvim-tree.lua'                                                     " File explorer
Plug 'lewis6991/gitsigns.nvim'                                                      " Git diff line indicator
Plug 'kana/vim-textobj-line'                                                        " Create own text objects
Plug 'kana/vim-textobj-user'                                                        " Create own text objects
Plug 'kyazdani42/nvim-web-devicons'                                                 " Icons
Plug 'markstory/vim-zoomwin'                                                        " Toggle show current split only
Plug 'moll/vim-node'                                                                " Allow file navigation with require('...')
Plug 'nelstrom/vim-visual-star-search'                                              " Visual mode */# search
Plug 'neoclide/coc.nvim', {'branch': 'release'}                                     " Intellisense
Plug 'nvim-lualine/lualine.nvim'                                                    " Status bar and tabs
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}                         " Treesitter
Plug 'p00f/nvim-ts-rainbow'                                                         " Rainbow parentheses
Plug 'tmux-plugins/vim-tmux-focus-events'                                           " Adds FocusGained/FocusLost events back for other plugins
Plug 'tomtom/tcomment_vim'                                                          " Comments
Plug 'tpope/vim-fugitive'                                                           " Exposes git commands
Plug 'tpope/vim-obsession'                                                          " Session.vim reload
Plug 'tpope/vim-repeat'                                                             " Expands repeat support to plugins
Plug 'tpope/vim-surround'                                                           " Surround tool
Plug 'tpope/vim-unimpaired'                                                         " Adds utility key bindings
Plug 'vimwiki/vimwiki'                                                              " Vimwiki

call plug#end()
]])

-- vim-sort-motion {{{
global.sort_motion_flags = 'ui'
-- }}}

-- coc {{{
global.coc_global_extensions = {'coc-tsserver', 'coc-tslint-plugin', 'coc-angular', 'coc-eslint', 'coc-json', 'coc-spell-checker', 'coc-actions', 'coc-prettier'}

function show_documentation()
    local filetype = vim.bo.filetype
    if filetype == 'vim' or filetype == 'help' then
        vim.api.nvim_command("h " .. vim.fn.expand('<cword>'))
    elseif vim.fn['coc#rpc#ready']() then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command(
            '!' .. vim.bo.keywordprg .. ' ' .. vim.fn.expand('<cword>')
        )
    end
end

local coc_highlight = function()
    vim.api.nvim_call_function('CocActionAsync', { 'highlight' })
end
create_autocmd('CursorHold', { callback = coc_highlight })

vim.cmd([[
augroup mygroup
  au!
  au FileType typescript,json setl formatexpr=CocAction('formatSelected')
  au User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<cr>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<cr>"
endif
]])

create_usercmd('Prettier', ':CocCommand prettier.formatFile', {})

nmap('[g', '<Plug>(coc-diagnostic-prev)')
nmap(']g', '<Plug>(coc-diagnostic-next)')

nmap('gd', '<Plug>(coc-definition)')
nmap('gy', '<Plug>(coc-type-definition)')
nmap('gi', '<Plug>(coc-implementation)')
nmap('gr', '<Plug>(coc-references)')

nmap('K', ':lua show_documentation() <cr>')

nmap('<leader>rn', '<Plug>(coc-rename)')

nmap('<leader>ac', '<Plug>(coc-codeaction)')
nmap('<leader>qf', '<Plug>(coc-fix-current)')

nmap('<space>a', ':<C-u>CocList diagnostics<cr>')
nmap('<space>o', ':<C-u>CocList outline<cr>')
nmap('<space>y', ':<C-u>CocList -I symbols<cr>')

vmap('<leader>lf', ':Prettier<cr>')
nmap('<leader>lf', ':Prettier<cr>')
vmap('<leader>ls', '<Plug>(coc-format-selected)')
nmap('<leader>ls', '<Plug>(coc-format-selected)')
xmap('<leader>ls', '<Plug>(coc-format-selected)')
-- }}}

-- fzf {{{
opt.rtp:append('/usr/local/opt/fzf') -- Maps fzf to the fzf.vim

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

nmap('<leader>ff', ':Files<cr>')
nmap('<leader>fg', ':GitFiles?<cr>')
nmap('<leader>fh', ':History<cr>')
nmap('<leader>fl', ':BLines<cr>')
nmap('<leader>fr', ':RG<cr>')
-- }}}

-- vim-obsession {{{
vim.cmd([[
augroup ObsessionGroup
  au!
  au VimEnter * nested if !&modified && empty(v:this_session) | Obsession | echo "" | endif
augroup END
]])
-- }}}

-- vimwiki {{{
global.vimwiki_list = {{path = '~/Library/Mobile Documents/com~apple~CloudDocs/Documents/vimwiki'}}
global.vimwiki_url_maxsave = 0
-- }}}

-- nvim-treesitter {{{

    local cyan = "51"
    local gold = "142"
    local white = "15"
    local red = "9"
    local yellow = "11"
    local lime = "10"
    local blue = "12"


    require("nvim-treesitter.configs").setup {
        ensure_installed = { "c", "c_sharp", "dockerfile", "html", "javascript", "lua", "make", "markdown", "rust", "scss", "tsx", "typescript", "vim", "yaml" },
        sync_install = false,
        auto_install = true,
        ignore_install = {},
        highlight = {
            enable = true,
            disable = {},
            additional_vim_regex_highlighting = true,
        },
        rainbow = {
            disable = {},
            enable = true,
            extended_mode = true,
            termcolors = { cyan, gold, white, red, yellow, lime, blue }
        }
    }
-- }}}

-- gitsigns.nvim {{{
require('gitsigns').setup({
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        map('n', ']c', function()
          if vim.wo.diff then return ']c' end
          vim.schedule(function() gs.next_hunk() end)
          return '<Ignore>'
        end, {expr=true})

        map('n', '[c', function()
          if vim.wo.diff then return '[c' end
          vim.schedule(function() gs.prev_hunk() end)
          return '<Ignore>'
        end, {expr=true})

        map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>')
        map('n', '<leader>hS', gs.stage_buffer)
        map('n', '<leader>hu', gs.undo_stage_hunk)
        map('n', '<leader>hR', gs.reset_buffer)
        map('n', '<leader>hp', gs.preview_hunk)
        map('n', '<leader>hb', function() gs.blame_line{full=true} end)
        map('n', '<leader>tb', gs.toggle_current_line_blame)
        map('n', '<leader>hd', gs.diffthis)
        map('n', '<leader>hD', function() gs.diffthis('~') end)
    end
})
-- }}}

-- nightfox {{{
require('nightfox').setup({
    options = {
        transparent = true,
        dim_inactive = true,
        styles = {
            keywords = 'bold',
        },
    },
    groups = {
        all = {
            NormalNC = { bg = '#303030' },
            Search = { fg ='#393b44', bg = '#ffff00' },
            CursorLine = { bg = '#1c1c1c' },
            Substitute = { fg ='#FFFFFF' },
        },
    },
})

vim.cmd("colorscheme nightfox")
-- }}}

-- lualine {{{
local modifiedColors = function(section)
   return { fg = '#dfdfe0', bg = vim.bo.modified and '#c94f6d' or '#39506d' }
end

require('lualine').setup({
    options = {
        disabled_filetypes = { 'NvimTree' },
    },
    sections = {
        lualine_b = {},
        lualine_c = {
            {
                'filename',
                color = modifiedColors,
                path =  3,
                shorting_target = 10,
            },
        },
        lualine_x = {
            {
              'filetype',
              icon_only = true,
            },
        },
        lualine_y = {},
    },
    tabline = {
        lualine_a = {
            {
                'buffers',
                mode = 2,
            },
        },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    }
})

nmap('<leader>1', ':LualineBuffersJump 1<cr>')
nmap('<leader>2', ':LualineBuffersJump 2<cr>')
nmap('<leader>3', ':LualineBuffersJump 3<cr>')
nmap('<leader>4', ':LualineBuffersJump 4<cr>')
nmap('<leader>5', ':LualineBuffersJump 5<cr>')
nmap('<leader>6', ':LualineBuffersJump 6<cr>')
nmap('<leader>7', ':LualineBuffersJump 7<cr>')
nmap('<leader>8', ':LualineBuffersJump 8<cr>')
nmap('<leader>9', ':LualineBuffersJump 9<cr>')

-- }}}

-- nvim-tree {{{
require("nvim-tree").setup({
    view = {
        adaptive_size = true,
    },
})

nmap('<leader>.', ':NvimTreeFindFileToggle<cr>')
-- }}}

-- vim-easymotion {{{
create_autocmd('User', { pattern = 'EasyMotionPromptBegin', command = 'CocDisable' })
create_autocmd('User', { pattern = 'EasyMotionPromptEnd', command = 'CocEnable' })
-- }}}

-- Git Fugitive {{{
nmap('<leader>gb', ':G blame<cr>')
nmap('<leader>gd', ':Gdiff<cr>')
nmap('<leader>gD', ':G diff<cr>')
nmap('<leader>gs', ':Git<cr>')
-- }}}

-- Plugins }}}

-- Key Mappings {{{

nmap('<leader>r', ':source $MYVIMRC<cr> :echo \'---.vimrc reloaded---\'<cr>')

-- Buffers
nmap('<leader>bl', ':ls<cr>')
nmap('<leader>bp', ':bp<cr>')
nmap('<leader>bn', ':bn<cr>')
nmap('<leader>bd', ':bd<cr>')
nmap('<leader>bD', ':%bd<cr>')
nmap('<leader>bo', ':on<cr>')
nmap('<leader>bs', ':new<cr>')

nmap('<esc>', ':nohlsearch<cr>')

-- Splits
nmap('<M-h>', '<C-W>>')
nmap('<M-l>', '<C-W><')
nmap('<M-j>', '<C-W>-')
nmap('<M-k>', '<C-W>+')
nmap('<M-=>', '<C-W>=')
nmap('<leader>s', '<C-W>s')
nmap('<leader>v', '<C-W>v')

nmap('q', '<Nop>')
xmap('p', 'pgvy')

imap('<C-J>', 'pumvisible() ? "<C-N>" : "<Nop>"', { expr = true })
imap('<C-K>', 'pumvisible() ? "<C-P>" : "<Nop>"', { expr = true })

-- Key Mappings }}}

-- Auto Commands {{{

vim.cmd([[
function! StripTrailingWhitespace()
  if &ft =~ 'markdown'
    return
  endif
  %s/\s\+$//e
endfunction
]])

create_autocmd({ 'WinEnter', 'BufReadPre' }, { command = 'setlocal cursorline' })
create_autocmd('WinLeave', { command = 'setlocal nocursorline' })

create_autocmd({ 'BufEnter', 'FocusGained', 'InsertLeave' }, { command = 'set number relativenumber' })
create_autocmd({ 'BufLeave', 'FocusLost', 'InsertEnter' }, { command = 'set number norelativenumber' })

create_autocmd('BufRead', { command = 'setlocal foldmethod=marker' })

local stripWhiteSpace = function()
    vim.api.nvim_call_function('StripTrailingWhitespace', {})
end
create_autocmd('BufWritePre', { callback = stripWhiteSpace })

-- Auto Commands }}}
