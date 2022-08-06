" Settings {{{

lua << END
local global = vim.g
global.mapleader = ','
global.netrw_liststyle = 3
global.session_autosave = 'no'

local opt = vim.opt
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
opt.wildmenu = true
opt.wrap = false
END

" }}}

" Plugins {{{

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
Plug 'ianding1/leetcode.vim'                                                        " leetcode
Plug 'junegunn/fzf.vim'                                                             " ripgrep fuzzy search
Plug 'junegunn/vim-peekaboo'                                                        " Show clipboard/macro registers
Plug 'kyazdani42/nvim-web-devicons'                                                 " Dev icons
Plug 'kyazdani42/nvim-tree.lua'                                                     " File explorer
Plug 'lewis6991/gitsigns.nvim'                                                      " Git diff line indicator
Plug 'kana/vim-textobj-line'                                                        " Create own text objects
Plug 'kana/vim-textobj-user'                                                        " Create own text objects
Plug 'kyazdani42/nvim-web-devicons'                                                 " Icons
Plug 'markstory/vim-zoomwin'                                                        " Toggle show current split only
Plug 'mattn/emmet-vim'                                                              " Markup expansion
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

" vim-sort-motion {{{
let g:sort_motion_flags = "ui"
" }}}

" coc {{{

let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-tslint-plugin',
  \ 'coc-angular',
  \ 'coc-eslint',
  \ 'coc-json',
  \ 'coc-spell-checker',
  \ 'coc-actions',
  \ 'coc-prettier',
  \ ]

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<cr>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<cr>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<cr>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
au CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

augroup mygroup
  au!
  " Setup formatexpr specified filetype(s).
  au FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  au User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

vmap <silent> <leader>a <Plug>(coc-codeaction-selected)
nmap <silent> <leader>a <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Mappings using CoCList:
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr> " Show all diagnostics.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr> " Manage extensions.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr> " Show commands.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr> " Find symbol of current document.
nnoremap <space>s :CocSearch<Space>
nnoremap <silent> <space>y  :<C-u>CocList -I symbols<cr> " Search workspace symbols.
nnoremap <silent> <space>j  :<C-u>CocNext<cr> " Do default action for next item.
nnoremap <silent> <space>k  :<C-u>CocPrev<cr> " Do default action for previous item.
nnoremap <silent> <space>p  :<C-u>CocListResume<cr> " Resume latest coc list.
nnoremap <silent> <space>t  :CocToggle<cr>

" Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
vmap <leader>lf  :Prettier<cr>
nmap <leader>lf  :Prettier<cr>
vmap <leader>ls  <Plug>(coc-format-selected)
nmap <leader>ls  <Plug>(coc-format-selected)
xmap <leader>ls  <Plug>(coc-format-selected)

" Toggle Coc
function! CocToggle()
    if g:coc_enabled
        CocDisable
    else
        CocEnable
    endif
endfunction
command! CocToggle :call CocToggle()

" }}}

" fzf {{{
set rtp+=/usr/local/opt/fzf " Maps fzf so the fzf.vim plugin

map <silent> <leader>ff :Files<cr>
map <silent> <leader>fg :GitFiles?<cr>
map <silent> <leader>fh :History<cr>
map <silent> <leader>fl :BLines<cr>
map <silent> <leader>fr :RG<cr>

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" }}}

" vim-obsession {{{
augroup ObsessionGroup
  au!
  " When opening a file, make sure we record the Vim session with its tabs and splits.
  " Checking 'modified' avoids recording a session when reading from stdin.
  " From https://github.com/tpope/vim-obsession/issues/17
  " Calling Obsession when the session is being recorded would pause the recording,
  " that's why we check if v:this_session is empty.
  au VimEnter * nested
      \ if !&modified && empty(v:this_session) |
      \   Obsession |
      \   echo "" |
      \ endif
augroup END
" }}}

" vimwiki {{{
let g:vimwiki_list = [{'path': '~/Library/Mobile\ Documents/com~apple~CloudDocs/Documents/vimwiki'}]
let g:vimwiki_url_maxsave = 0
" }}}

" leetcode {{{
let g:leetcode_browser = 'firefox'
let g:leetcode_solution_filetype = 'javascript'

nnoremap <leader>lcl :LeetCodeList<cr>
nnoremap <leader>lct :LeetCodeTest<cr>
nnoremap <leader>lcs :LeetCodeSubmit<cr>
nnoremap <leader>lci :LeetCodeSignIn<cr>
" }}}

" nvim-treesitter {{{
lua << END

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
END
" }}}

" gitsigns.nvim {{{
lua << END
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
END
" }}}

" nightfox {{{
lua << END
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
END
" }}}

" lualine {{{
lua << END
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
END

nmap <silent> <leader>1 :LualineBuffersJump 1<cr>
nmap <silent> <leader>2 :LualineBuffersJump 2<cr>
nmap <silent> <leader>3 :LualineBuffersJump 3<cr>
nmap <silent> <leader>4 :LualineBuffersJump 4<cr>
nmap <silent> <leader>5 :LualineBuffersJump 5<cr>
nmap <silent> <leader>6 :LualineBuffersJump 6<cr>
nmap <silent> <leader>7 :LualineBuffersJump 7<cr>
nmap <silent> <leader>8 :LualineBuffersJump 8<cr>
nmap <silent> <leader>9 :LualineBuffersJump 9<cr>

" }}}

" nvim-tree {{{
lua << END
require("nvim-tree").setup({
    view = {
        adaptive_size = true,
    },
})
END

map <silent> <leader>. :NvimTreeFindFileToggle<cr>

" }}}

" vim-easymotion {{{
let g:EasyMotion_smartcase = 1

autocmd User EasyMotionPromptBegin silent! CocDisable
autocmd User EasyMotionPromptEnd silent! CocEnable

map f <Plug>(easymotion-bd-f)
map F <Plug>(easymotion-bd-f)
map t <Plug>(easymotion-bd-t)
map W <Plug>(easymotion-bd-w)
" }}}

" Git Fugitive {{{
map <leader>gb :G blame<cr>
map <leader>gd :Gdiff<cr>
map <leader>gD :G diff<cr>
map <leader>gs :Gstatus<cr>
" }}}

" }}}

" Key Mappings {{{

lua << END
local map = vim.api.nvim_set_keymap

map('n', '<leader>r', ':source $MYVIMRC<cr> :echo \'---.vimrc reloaded---\'<cr>', { noremap = true, silent = true })

-- Buffers
map('n', '<leader>bl', ':ls<cr>', { noremap = true, silent = true })
map('n', '<leader>bp', ':bp<cr>', { noremap = true, silent = true })
map('n', '<leader>bn', ':bn<cr>', { noremap = true, silent = true })
map('n', '<leader>bd', ':bd<cr>', { noremap = true, silent = true })
map('n', '<leader>bD', ':%bd<cr>', { noremap = true, silent = true })
map('n', '<leader>bo', ':on<cr>', { noremap = true, silent = true })
map('n', '<leader>bs', ':new<cr>', { noremap = true, silent = true })

map('n', '<esc>', ':nohlsearch<cr>', { noremap = true, silent = true })

-- Splits
map('n', '<M-h>', '<C-W>>', { noremap = true })
map('n', '<M-l>', '<C-W><', { noremap = true })
map('n', '<M-j>', '<C-W>-', { noremap = true })
map('n', '<M-k>', '<C-W>+', { noremap = true })
map('n', '<M-=>', '<C-W>=', { noremap = true })
map('n', '<leader>s', '<C-W>s', { noremap = true })
map('n', '<leader>v', '<C-W>v', { noremap = true })

map('n', 'Q', '<Nop>', { noremap = true }) -- Disable ex mode

map('x', 'p', 'pgvy', { noremap = true })
END

" <C-N>/<C-P> Vim Pop Up Menu Navigation
inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "\<C-k>"

" }}}

" Auto Commands {{{

function! StripTrailingWhitespace()
  if &ft =~ 'markdown'
    return
  endif
  %s/\s\+$//e
endfunction

lua << END
local autocmd = vim.api.nvim_create_autocmd

autocmd({ 'WinEnter', 'BufReadPre' }, { command = 'setlocal cursorline' })
autocmd('WinLeave', { command = 'setlocal nocursorline' })

autocmd('BufRead', { command = 'setlocal foldmethod=marker' })

local stripWhiteSpace = function()
    vim.api.nvim_call_function('StripTrailingWhitespace', {})
end
autocmd('BufWritePre', { callback = stripWhiteSpace })
END

" }}}
