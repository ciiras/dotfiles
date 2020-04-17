" Leader
:let mapleader = ","

" Maps fzf so the fzf.vim plugin
set rtp+=/usr/local/opt/fzf

" Settings {{{
" Switch syntax highlighting on, when the terminal has colors
syntax on

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
:set number relativenumber

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" Highlight whitespace
set list
set listchars=tab:›\ ,eol:¬,trail:⋅

" Get rid of the delay when pressing O (for example)
set timeout timeoutlen=1000 ttimeoutlen=0

" Always show status bar
set laststatus=2

" Set the status line to something useful
set statusline=%f\ %=L:%l/%L\ %c\ (%p%%)

" Hide the toolbar
set guioptions-=T

" UTF encoding
set encoding=utf-8

" Autoload files that have changed outside of vim
set autoread

" Use system clipboard
" http://stackoverflow.com/questions/8134647/copy-and-paste-in-vim-via-keyboard-between-different-mac-terminals
set clipboard+=unnamed

" Don't show intro
set shortmess+=I

" Better splits (new windows appear below and to the right)
set splitbelow
set splitright

" Highlight the current line
set cursorline

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

" Always highlight column 80 so it's easier to see where
" cutoff appears on longer screens
autocmd BufWinEnter * highlight ColorColumn ctermbg=236
set colorcolumn=80

" Persistent undo
set undodir=~/.vim/undodir
set undofile

" Cursor
:set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175

" }}}

" Plugins {{{

call plug#begin()
Plug 'tomtom/tcomment_vim'
Plug 'dense-analysis/ale'
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf.vim'
Plug 'yggdroot/indentline'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'luochen1990/rainbow'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ap/vim-css-color'
Plug 'airblade/vim-gitgutter'
Plug 'moll/vim-node'
Plug 'tpope/vim-obsession'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
call plug#end()

" LanguageClient-neovim
set hidden

let g:LanguageClient_serverCommands = {
    \ 'javascript': ['tcp://127.0.0.1:2089'],
    \ 'typescript': ['tcp://127.0.0.1:2089']
    \ }

autocmd FileType * call LanguageClientMaps()

function! LanguageClientMaps()
    if has_key(g:LanguageClient_serverCommands, &filetype)
        nnoremap <buffer> <silent> gd :call LanguageClient#textDocument_definition()<CR>
        nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
    endif
endfunction

" indentLine
let g:indentLine_enabled=0
let g:indentLine_char='·'
let g:indentLine_color_term=239
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '·'

au FileType fzf :LeadingSpaceToggle
au FileType nerdtree :LeadingSpaceToggle
au Filetype json :IndentLinesToggle

" vim-tmux-focus-events
au FocusGained, BufEnter * :checktime

" vim-commentary
map <leader>c gcc<esc>

"fzf
map <silent> <leader>ff :Files<cr>
map <silent> <leader>fl :BLines<cr>
map <silent> <leader>fg :GFiles?<cr>

" Ale
let g:ale_linters = {'javascript': ['eslint'], 'typescript': ['tslint']}
let g:ale_fixers = {'javascript': ['eslint'], 'typescript': ['tslint']}
let g:ale_javascript_eslint_executable = 'eslint_d'
let g:ale_javascript_eslint_options = "--ignore-pattern '!node_modules/*'"
let g:ale_linters_explicit=1
highlight clear ALEErrorSign
highlight clear ALEWarningSign
highlight clear SignColumn

map <silent> <leader>lf :ALEFix<cr>
map <silent> <leader>ln :ALENext<cr>
map <silent> <leader>lp :ALEPrevious<cr>

" Airline (status line)
let g:airline_powerline_fonts = 1
let g:airline_section_b = ''
let g:airline_theme = 'light'

" Gist authorization settings
let g:github_user = $GITHUB_USER
let g:github_token = $GITHUB_TOKEN
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" emmet-vim
" <C-y,> Expand; <C-y,n> Next Tag (Default)
let g:user_emmet_leader_key='<leader>'

"<SelfClosingTag />
inoremap <leader>, <esc>:call emmet#expandAbbr(0,"")<cr>h:call emmet#splitJoinTag()<cr>wwi
nnoremap <leader>, :call emmet#expandAbbr(0,"")<cr>h:call emmet#splitJoinTag()<cr>ww
"<Tag></Tag>
inoremap <leader><tab> <esc>:call emmet#expandAbbr(0,"")<cr>
nnoremap <leader><tab> :call emmet#expandAbbr(0,"")<cr>

" Git Gutter
autocmd BufWritePost * GitGutter
let g:gitgutter_enabled = 1
let g:gitgutter_eager = 1
set signcolumn=yes
highlight clear SignColumn

" NERDTree
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

" Markdown Preview
let vim_markdown_preview_github=1

" vim-session
:let g:session_autosave = 'no'

" }}}

" Mappings {{{

" Reload .vimrc
nnoremap <silent> <leader>r :source $MYVIMRC<cr> :echo '---.vimrc reloaded---'<cr>

" Clear search highlight w/ esc key press
nnoremap <silent> <esc> :nohlsearch<cr>

" Command to use sudo when needed
" cmap w!! %!sudo tee > /dev/null %

" Visual Mode Searching
vnoremap // y/<C-R>"<CR>

" Buffers
map <silent> <leader>bl :ls<cr>
map <silent> <leader>bp :bp<cr>
map <silent> <leader>bn :bn<cr>
map <silent> <leader>bd :q<cr>
map <silent> <leader>bo <C-W>o

" Make handling vertical/linear Vim windows easier
map <M-h> 5<C-W>>
map <M-l> 5<C-W><
map <M-j> 5<C-W>-
map <M-k> 5<C-W>+

" Make splitting Vim windows easier
map <leader>s <C-W>s
map <leader>v <C-W>v

" Git Gutter
map <leader>gn ]c " next hunk
map <leader>gp [c " previous hunk

" <C-N>/<C-P> Vim Pop Up Menu Navigation
inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "\<C-k>"

" Ex Mode Disable
:map Q <Nop>

" JSON Format
map <leader>jf <Esc>:%!python -c "import json, sys, collections; print(json.dumps(json.loads(sys.stdin.read(), object_pairs_hook=collections.OrderedDict), indent=4))"<CR>

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
autocmd BufWritePre * call StripTrailingWhitespace()

" file formats
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd Filetype markdown setlocal wrap linebreak nolist textwidth=0 wrapmargin=0 " http://vim.wikia.com/wiki/Word_wrap_without_line_breaks
autocmd FileType sh,cucumber,ruby,zsh,vim,json setlocal shiftwidth=4 tabstop=4 expandtab
autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd FileType json setlocal commentstring=//\ %s


" specify syntax highlighting for specific files
autocmd Bufread,BufNewFile *.spv set filetype=php
autocmd Bufread,BufNewFile *.md set filetype=markdown " Vim interprets .md as 'modula2' otherwise, see :set filetype?

" Close all folds when opening a new buffer
autocmd BufRead * setlocal foldmethod=marker
autocmd BufRead * normal zM

" Rainbow
let g:rainbow_active = 1
let g:rainbow_conf = {
\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\	'ctermfgs': ['red', 'lightblue', 'green', '142'],
\	'operators': '_,_',
\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\	'separately': {
\		'*': {},
\		'tex': {
\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\		},
\		'lisp': {
\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\		},
\		'vim': {
\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\		},
\		'css': 0,
\	}
\}

" Reset spelling colours when reading a new buffer
" This works around an issue where the colorscheme is changed by .local.vimrc
fun! SetSpellingColors()
  highlight SpellBad cterm=bold ctermfg=white ctermbg=red
  highlight SpellCap cterm=bold ctermfg=red ctermbg=white
endfun
autocmd BufWinEnter * call SetSpellingColors()
autocmd BufNewFile * call SetSpellingColors()
autocmd BufRead * call SetSpellingColors()
autocmd InsertEnter * call SetSpellingColors()
autocmd InsertLeave * call SetSpellingColors()

" Change colourscheme when diffing
fun! SetDiffColors()
  highlight DiffAdd    cterm=bold ctermfg=white ctermbg=DarkGreen
  highlight DiffDelete cterm=bold ctermfg=white ctermbg=DarkGrey
  highlight DiffChange cterm=bold ctermfg=white ctermbg=DarkBlue
  highlight DiffText   cterm=bold ctermfg=white ctermbg=DarkRed
endfun
autocmd FilterWritePre * call SetDiffColors()
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

    hi CursorLine ctermbg=235
    hi LineNr ctermbg=0 ctermfg=60
    hi CursorLineNr ctermbg=238 ctermfg=39
endfunction

augroup FocusGainedGroup
    au!
    au FocusGained * call FocusGainedFunc()
augroup END

function FocusLostFunc()
    hi ActiveWindow ctermbg=236 | hi InactiveWindow ctermbg=236
    set winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow

    hi CursorLine ctermbg=236
    hi LineNr ctermbg=236 ctermfg=60
    hi CursorLineNr ctermbg=236 ctermfg=39
endfunction

augroup FocusLostGroup
    au!
    au FocusLost * call FocusLostFunc()
augroup END
" }}}
