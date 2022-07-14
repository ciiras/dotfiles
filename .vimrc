" Leader
:let mapleader = ","

" Settings {{{

" mouse
set mouse=a

" Switch syntax highlighting on, when the terminal has colors
syntax on

" Give more space for displaying messages
set cmdheight=2

" Having longer updatetime (default is 4000 ms) leads to noticeable delays
set updatetime=300

" Use vim, not vi api
set nocompatible

" No backup files
set nobackup

" No write backup
set nowritebackup

" No swap file
set noswapfile

" Command history
set history=100

" Always show cursor
set ruler

" Show incomplete commands
set showcmd

" Incremental searching (search as you type)
set incsearch

" Highlight search matches
set hlsearch

" Ignore case in search
set smartcase

" Make sure any searches /searchPhrase doesn't need the \c escape character
set ignorecase

" A buffer is marked as ‘hidden’ if it has unsaved changes, and it is not currently loaded in a window
" if you try and quit Vim while there are hidden buffers, you will raise an error:
" E162: No write since last change for buffer “a.txt”
set hidden

" Turn word wrap off
set nowrap

" Allow backspace to delete end of line, indent and start of line characters
set backspace=indent,eol,start

" Convert tabs to spaces
set expandtab

" Set tab size in spaces (this is for manual indenting)
set tabstop=4

" The number of spaces inserted for a tab (used for auto indenting)
set shiftwidth=4

" Turn on line numbers
set number
set relativenumber

" Current line highlighting
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

" Highlight whitespace
set listchars=tab:›\ ,eol:¬,space:⋅
set nolist

" Get rid of the delay when pressing O (for example)
set timeout timeoutlen=1000 ttimeoutlen=0

" Always show status bar
set laststatus=2

" Hide the toolbar
set guioptions-=T

" UTF encoding
set encoding=UTF-8

" Autoload files that have changed outside of vim
set autoread

" Use system clipboard
" http://stackoverflow.com/questions/8134647/copy-and-paste-in-vim-via-keyboard-between-different-mac-terminals
set clipboard+=unnamed

" Don't show intro
set shortmess+=I

" Don't pass messages to |ins-completion-menu|
set shortmess+=c

" Better splits (new windows appear below and to the right)
set splitbelow
set splitright

" Ensure Vim doesn't beep at you every time you make a mistype
set visualbell

" Visual autocomplete for command menu (e.g. :e ~/path/to/file)
set wildmenu
" set wildmode=longest:full,full
" :b<Tab>

" redraw only when we need to (i.e. don't redraw when executing a macro)
set lazyredraw

" highlight a matching [{()}] when cursor is placed on start/end character
set showmatch

" Set built-in file system explorer to use layout similar to the NERDTree plugin
let g:netrw_liststyle=3

" Always highlight column 80
set colorcolumn=80

" Persistent undo
set undodir=~/.vim/undodir
set undofile

" Cursor
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175

" Always show the signcolumn
set signcolumn=yes

" }}}

" Plugins {{{

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  au VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'airblade/vim-gitgutter'                                                       " Git diff line indicator
Plug 'airblade/vim-tag-closer'                                                      " Close tags - ctrl+g/
Plug 'ap/vim-css-color'                                                             " Color highlighter
Plug 'christoomey/vim-sort-motion'                                                  " Sort items in text objects
Plug 'christoomey/vim-tmux-navigator'                                               " Navigation between tmux and vim
Plug 'cohama/lexima.vim'                                                            " Auto close parentheses
Plug 'easymotion/vim-easymotion'                                                    " Enhanced char and word search
Plug 'fladson/vim-kitty'                                                            " Kitty config syntax highlighting
Plug 'fsharp/vim-fsharp', { 'for': 'fsharp', 'do': 'make fsautocomplete' }          " F#
Plug 'HerringtonDarkholme/yats.vim'                                                 " Yet Another TypeScript Syntax
Plug 'ianding1/leetcode.vim'                                                        " leetcode
Plug 'junegunn/fzf.vim'                                                             " ripgrep fuzzy search
Plug 'junegunn/vim-peekaboo'                                                        " Show clipboard/macro registers
Plug 'justinmk/vim-sneak'                                                           " Search by two chars
Plug 'lifepillar/vim-solarized8', { 'dir': '~/.vim/colors/solarized8' }             " Theme
Plug 'luochen1990/rainbow'                                                          " Rainbow paranthesis
Plug 'kana/vim-textobj-line'                                                        " Create own text objects
Plug 'kana/vim-textobj-user'                                                        " Create own text objects
Plug 'markstory/vim-zoomwin'                                                        " Toggle show current split only
Plug 'mattn/emmet-vim'                                                              " Markup expansion
Plug 'mg979/vim-visual-multi', {'branch': 'master'}                                 " Multiple Cursors
Plug 'moll/vim-node'                                                                " Allow file navigation with require('...')
Plug 'nelstrom/vim-visual-star-search'                                              " Visual mode */# search
Plug 'neoclide/coc.nvim', {'branch': 'release'}                                     " Intellisense
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}                         " Treesitter
Plug 'preservim/nerdtree'                                                           " Directory side panel
Plug 'tmux-plugins/vim-tmux-focus-events'                                           " Adds FocusGained/FocusLost events back for other plugins
Plug 'tomtom/tcomment_vim'                                                          " Comments
Plug 'tpope/vim-fugitive'                                                           " Exposes git commands
Plug 'tpope/vim-obsession'                                                          " Session.vim reload
Plug 'tpope/vim-repeat'                                                             " Expands repeat support to plugins
Plug 'tpope/vim-surround'                                                           " Surround tool
Plug 'tpope/vim-unimpaired'                                                         " Adds utility key bindings
Plug 'vim-airline/vim-airline'                                                      " Status bar and tabs
Plug 'vim-airline/vim-airline-themes'                                               " Airline themes
Plug 'vimwiki/vimwiki'                                                              " Vimwiki
Plug 'Xuyuanp/nerdtree-git-plugin'                                                  " Adds git information to directory side panel

Plug 'ryanoasis/vim-devicons' " Has to be loaded at the end

call plug#end()

" vim-sort-motion
let g:sort_motion_flags = "ui"

" Rainbow {{{
let g:rainbow_active = 1
let g:rainbow_conf = {
\   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\   'ctermfgs': ['red', 'lightblue', 'green', '142'],
\   'operators': '_,_',
\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\   'separately': {
\      '*': {},
\      'tex': {
\      	'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\      },
\      'lisp': {
\      	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\      },
\      'vim': {
\      	'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\      },
\      'html': 0,
\      'css': 0,
\      'scss': 0,
\      'nerdtree': 0,
\      'vimwiki': 0,
\      'fzf': 0,
\      'ts': 0,
\   }
\}

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

" vim-devicons
set guifont=DroidSansMono_Nerd_Font:h13

" vim-obsession
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
      \   echo "Recording new session" |
      \ endif
augroup END

" vim-tmux-focus-events
au FocusGained, BufEnter * :checktime

" Airline {{{

let g:airline_powerline_fonts = 1
let g:airline_section_b = ''                                    " Current directory limited to 100 characters
let g:airline_theme = 'light'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1

nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

" }}}

" Gist authorization settings
let g:github_user = $GITHUB_USER
let g:github_token = $GITHUB_TOKEN
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" Git Gutter
au BufWritePost * GitGutter
let g:gitgutter_enabled = 1
let g:gitgutter_eager = 1
highlight clear SignColumn

" NERDTree {{{

map <silent> <leader>. :NERDTreeToggle<cr>

let g:NERDTreeShowHidden=1
let g:NERDTreeSortOrder=[]
let g:NERDTreeShowLineNumbers=1
let g:NERDTreeWinSize=40
let g:NERDTreeFileExtensionHighlightFullName=1
let g:NERDTreeExactMatchHighlightFullName=1
let g:NERDTreePatternMatchHighlightFullName=1
let g:NERDTreeHighlightFoldersFullName=1
let g:NERDTreeLimitedSyntax = 1

" }}}

" Markdown Preview
let vim_markdown_preview_github=1

" vim-session
let g:session_autosave = 'no'

" vim-javascript/vim-typescript {{{

set conceallevel=1
let g:javascript_conceal_function             = "ƒ"
" let g:javascript_conceal_null                 = "ø"
" let g:javascript_conceal_this                 = "@"
" let g:javascript_conceal_return               = "⇚"
" let g:javascript_conceal_undefined            = "¿"
" let g:javascript_conceal_NaN                  = "ℕ"
" let g:javascript_conceal_prototype            = "¶"
" let g:javascript_conceal_static               = "•"
" let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"

" }}}

" easymotion
autocmd User EasyMotionPromptBegin silent! CocDisable
autocmd User EasyMotionPromptEnd silent! CocEnable

" vimwiki
let g:vimwiki_list = [{'path': '~/Library/Mobile\ Documents/com~apple~CloudDocs/Documents/vimwiki'}]
let g:vimwiki_url_maxsave = 0

" leetcode
let g:leetcode_browser = 'firefox'
let g:leetcode_solution_filetype = 'javascript'

nnoremap <leader>lcl :LeetCodeList<cr>
nnoremap <leader>lct :LeetCodeTest<cr>
nnoremap <leader>lcs :LeetCodeSubmit<cr>
nnoremap <leader>lci :LeetCodeSignIn<cr>

" nvim-treesitter {{{

lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "c_sharp", "dockerfile", "html", "javascript", "lua", "make", "markdown", "rust", "scss", "tsx", "typescript", "vim", "yaml" },
  sync_install = false,
  auto_install = true,
  ignore_install = {},
  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = false,
  },
}
EOF
" }}}

" }}}

" Mappings {{{

" Reload .vimrc
nnoremap <silent> <leader>r :source $MYVIMRC<cr> :echo '---.vimrc reloaded---'<cr>

" Clear search highlight w/ esc key press
nnoremap <silent> <esc> :nohlsearch<cr>

" Buffers
map <silent> <leader>bl :ls<cr>                 " List
map <silent> <leader>bp :bp<cr>                 " Previous
map <silent> <leader>bn :bn<cr>                 " Next
map <silent> <leader>bd :bd<cr>                 " Close
map <silent> <leader>bD :%bd<cr>                " Close All
map <silent> <leader>bo <C-W>o                  " Only
map <silent> <leader>bs :new<cr>                " Create Vertical

" Split resizing
map <M-h> <C-W>>
map <M-l> <C-W><
map <M-j> <C-W>-
map <M-k> <C-W>+

map <M-=> <C-W>= " Equalize split size

" Make splitting Vim windows easier
map <leader>s <C-W>s
map <leader>v <C-W>v

" Git Fugitive
map <leader>gb :G blame<cr>
map <leader>gd :Gdiff<cr>
map <leader>gD :G diff<cr>
map <leader>gs :Gstatus<cr>

" <C-N>/<C-P> Vim Pop Up Menu Navigation
inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "\<C-k>"

" Ex Mode Disable
nnoremap Q <Nop>

" JSON Formating
map <leader>jf <Esc>:%!python3 -c "import json, sys, collections; print(json.dumps(json.loads(sys.stdin.read(), object_pairs_hook=collections.OrderedDict), indent=4))"<cr>

" XML Formatting
map <leader>xf <Esc>:%!python3 -c "import xml.dom.minidom, sys; print(xml.dom.minidom.parse(sys.stdin).toprettyxml())"<cr>

" Always have the same thing in the clipboard
xnoremap p pgvy

" }}}

" Commands {{{
" jump to last cursor

fun! StripTrailingWhitespace()
  " don't strip on these filetypes
  if &ft =~ 'markdown'
    return
  endif
  %s/\s\+$//e
endfun
au BufWritePre * call StripTrailingWhitespace()

" file formats
au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
au Filetype gitcommit setlocal spell textwidth=72
au Filetype markdown setlocal wrap linebreak nolist textwidth=0 wrapmargin=0 " http://vim.wikia.com/wiki/Word_wrap_without_line_breaks
au FileType sh,cucumber,ruby,zsh,vim,json setlocal shiftwidth=4 tabstop=4 expandtab
au FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
au FileType json syntax match Comment +\/\/.\+$+
au FileType json setlocal conceallevel=0


" specify syntax highlighting for specific files
au Bufread,BufNewFile *.spv set filetype=php
au Bufread,BufNewFile *.md set filetype=markdown " Vim interprets .md as 'modula2' otherwise, see :set filetype?

" Close all folds when opening a new buffer
au BufRead * setlocal foldmethod=marker
au BufRead * normal zM

" }}}

" Theme {{{

set background=dark
set t_Co=256
colorscheme solarized8

hi Comment ctermfg=101
hi Folded ctermbg=240 ctermfg=39
hi CursorLine ctermbg=235
hi LineNr ctermbg=0 ctermfg=60
hi CursorLineNr ctermbg=238 ctermfg=39
hi ActiveWindow ctermbg=0
hi InactiveWindow ctermbg=236
hi Normal ctermbg=0

function FocusGainedFunc()
    hi ActiveWindow ctermbg=0 | hi InactiveWindow ctermbg=236
    set winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
endfunction

augroup FocusGainedGroup
    au!
    au FocusGained * call FocusGainedFunc()
augroup END

function FocusLostFunc()
    hi ActiveWindow ctermbg=236 | hi InactiveWindow ctermbg=236
    set winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
endfunction

augroup FocusLostGroup
    au!
    au FocusLost * call FocusLostFunc()
augroup END

" }}}
