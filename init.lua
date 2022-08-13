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

function! UpdateRemotePlugins(...)
    " Needed to refresh runtime files
    let &rtp=&rtp
    UpdateRemotePlugins
endfunction


call plug#begin()

Plug 'ap/vim-css-color'                                                             " Color highlighter
Plug 'christoomey/vim-sort-motion'                                                  " Sort items in text objects
Plug 'christoomey/vim-tmux-navigator'                                               " Navigation between tmux and vim
Plug 'dstein64/vim-startuptime'                                                     " Startup time monitor
Plug 'easymotion/vim-easymotion'                                                    " Enhanced char and word search
Plug 'EdenEast/nightfox.nvim'                                                       " Color scheme
Plug 'fladson/vim-kitty'                                                            " Kitty config syntax highlighting
Plug 'fsharp/vim-fsharp', { 'for': 'fsharp', 'do': 'make fsautocomplete' }          " F#
Plug 'gelguy/wilder.nvim', { 'do': function('UpdateRemotePlugins') }                " Wildmenu extension
Plug 'junegunn/fzf.vim'                                                             " ripgrep fuzzy search
Plug 'junegunn/vim-peekaboo'                                                        " Show clipboard/macro registers
Plug 'kyazdani42/nvim-web-devicons'                                                 " Dev icons
Plug 'kyazdani42/nvim-tree.lua'                                                     " File explorer
Plug 'lewis6991/gitsigns.nvim'                                                      " Git diff line indicator
Plug 'kyazdani42/nvim-web-devicons'                                                 " Icons
Plug 'markstory/vim-zoomwin'                                                        " Toggle show current split only
Plug 'moll/vim-node'                                                                " Allow file navigation with require('...')
Plug 'nelstrom/vim-visual-star-search'                                              " Visual mode */# search
Plug 'neoclide/coc.nvim', {'branch': 'release'}                                     " Intellisense
Plug 'nvim-lualine/lualine.nvim'                                                    " Status bar and tabs
Plug 'nvim-treesitter/nvim-treesitter'                                              " Treesitter
Plug 'nvim-treesitter/playground'                                                   " Treesitter playground
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

-- christoomey/vim-sort-motion {{{
global.sort_motion_flags = 'ui'
-- }}}

-- cocneoclide/coc.nvim {{{
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

inoremap <silent><expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : CheckBackspace() ? "\<Tab>" : coc#refresh()
inoremap <expr><S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<C-H>"

inoremap <silent><expr> <C-J> coc#pum#visible() ? coc#pum#next(1) : pumvisible() ? "\<C-N>" : "\<C-J>"
inoremap <silent><expr> <C-K> coc#pum#visible() ? coc#pum#prev(1) : pumvisible() ? "\<C-P>" : "\<C-K>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-G>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-U>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-U>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@
]])

create_usercmd('Prettier', ':CocCommand prettier.formatFile', {})

nmap('[g', '<Plug>(coc-diagnostic-prev)')
nmap(']g', '<Plug>(coc-diagnostic-next)')

nmap('gd', '<Plug>(coc-definition)')
nmap('gy', '<Plug>(coc-type-definition)')
nmap('gi', '<Plug>(coc-implementation)')
nmap('gr', '<Plug>(coc-references)')

nmap('K', ':lua show_documentation() <CR>')

nmap('<leader>rn', '<Plug>(coc-rename)')

nmap('<leader>ac', '<Plug>(coc-codeaction)')
vmap('<leader>a', '<Plug>(coc-codeaction-selected)')
nmap('<leader>a', '<Plug>(coc-codeaction-selected)')

nmap('<leader>qf', '<Plug>(coc-fix-current)')

nmap('<space>a', ':<C-U>CocList diagnostics<CR>')
nmap('<space>o', ':<C-U>CocList outline<CR>')
nmap('<space>y', ':<C-U>CocList -I symbols<CR>')

vmap('<leader>lf', ':Prettier<CR>')
nmap('<leader>lf', ':Prettier<CR>')
vmap('<leader>ls', '<Plug>(coc-format-selected)')
nmap('<leader>ls', '<Plug>(coc-format-selected)')
xmap('<leader>ls', '<Plug>(coc-format-selected)')
-- }}}

-- EdenEast/nightfox.nvim {{{
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
            IncSearch = { fg ='#393b44', bg = '#F4A261' },
            NormalNC = { bg = '#303030' },
            Search = { fg ='#393b44', bg = '#F4A261' },
            CursorLine = { bg = '#1C1C1C' },
            Substitute = { fg ='#FFFFFF' },
        },
    },
})

vim.cmd("colorscheme nightfox")
-- }}}

-- easymotion/vim-easymotion {{{
create_autocmd('User', { pattern = 'EasyMotionPromptBegin', command = 'CocDisable' })
create_autocmd('User', { pattern = 'EasyMotionPromptEnd', command = 'CocEnable' })
-- }}}

-- junegunn/fzf.vim {{{
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

nmap('<leader>ff', ':Files<CR>')
nmap('<leader>fg', ':GitFiles?<CR>')
nmap('<leader>fh', ':History<CR>')
nmap('<leader>fl', ':BLines<CR>')
nmap('<leader>fr', ':RG<CR>')
-- }}}

-- kyazdani42/nvim-tree.lua {{{
require("nvim-tree").setup({
    view = {
        adaptive_size = true,
    },
})

nmap('<leader>.', ':NvimTreeFindFileToggle<CR>')
-- }}}

-- lewis6991/gitsigns.nvim {{{
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

-- nvim-lualine/lualine.nvim {{{
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

nmap('<leader>1', ':LualineBuffersJump 1<CR>')
nmap('<leader>2', ':LualineBuffersJump 2<CR>')
nmap('<leader>3', ':LualineBuffersJump 3<CR>')
nmap('<leader>4', ':LualineBuffersJump 4<CR>')
nmap('<leader>5', ':LualineBuffersJump 5<CR>')
nmap('<leader>6', ':LualineBuffersJump 6<CR>')
nmap('<leader>7', ':LualineBuffersJump 7<CR>')
nmap('<leader>8', ':LualineBuffersJump 8<CR>')
nmap('<leader>9', ':LualineBuffersJump 9<CR>')

-- }}}

-- nvim-treesitter/nvim-treesitter {{{
    local cyan = "51"
    local gold = "142"
    local white = "15"
    local red = "9"
    local yellow = "11"
    local lime = "10"
    local blue = "12"

    require("nvim-treesitter.configs").setup({
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
        }
    })
-- }}}

-- nvim-tresitter/playground {{{
require "nvim-treesitter.configs".setup {
    playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
        keybindings = {
            toggle_query_editor = 'o',
            toggle_hl_groups = 'i',
            toggle_injected_languages = 't',
            toggle_anonymous_nodes = 'a',
            toggle_language_display = 'I',
            focus_language = 'f',
            unfocus_language = 'F',
            update = 'R',
            goto_node = '<CR>',
            show_help = '?',
        },
    }
}
-- }}}

-- tpope/vim-obsession {{{
vim.cmd([[
augroup ObsessionGroup
  au!
  au VimEnter * nested if !&modified && empty(v:this_session) | Obsession | echo "" | endif
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

-- gelguy/wilder.nvim {{{
local wilder = require('wilder')

wilder.setup({
    modes = {':'},
    next_key = '<C-J>',
    previous_key = '<C-K>',
})

wilder.set_option('renderer', wilder.popupmenu_renderer({
    highlighter = wilder.basic_highlighter(),
    left = {' ', wilder.popupmenu_devicons()},
    right = {' ', wilder.popupmenu_scrollbar()},
}))

wilder.set_option('renderer', wilder.popupmenu_renderer(
    wilder.popupmenu_border_theme({
        highlights = {
            border = 'Normal',
        },
        border = 'rounded',
    })
))
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
