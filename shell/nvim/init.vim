" general ---------------------------------------------------------------------
syntax on
syntax enable
colorscheme nightshade
set t_Co=256
set background=dark
set gcr=a:blinkon0
set encoding=utf-8
set fileencoding=utf-8
set shell=zsh
set hidden
set autoread
set showcmd
set mousehide
set wildmenu
set noshowmode
set ttimeoutlen=50
set mouse=a

" search ----------------------------------------------------------------------
set ignorecase
set smartcase 
set incsearch
set hlsearch
set showmatch

" indentation -----------------------------------------------------------------
set expandtab
set autoindent
set smartindent
set smarttab
set linebreak
set nojoinspaces
set backspace=indent,eol,start
set shiftwidth=4
set softtabstop=4
set tabstop=4

" appearance ------------------------------------------------------------------
set laststatus=2
set showtabline=2
set number
set textwidth=80
set colorcolumn=80
set modeline
set modelines=5
set scrolloff=6
set clipboard=unnamedplus
" set cursorline

" TabLine ---------------------------------------------------------------------
:hi TabLineFill ctermfg=Black       ctermbg=Grey
:hi TabLineSel  ctermfg=DarkGreen   ctermbg=Black
:hi TabLine     ctermfg=Blue        ctermbg=Black
:hi Title       ctermfg=Red         ctermbg=Yellow

" airline ---------------------------------------------------------------------
let g:airline_theme                         = 'dark'
let g:airline_powerline_fonts               = 1
let g:airine#extensions#tabline#enable      = 1
let g:airline_skip_empty_sections           = 0
let g:airline#extensions#hunks#enabled      = 0
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#ycm#enabled        = 1
let g:airline#extensions#ymc#error_symbol   = 'E:'
let g:airline#extensions#ymc#warning_symbol = 'W:'

" airline statusbar -----------------------------------------------------------
let g:airline_section_y = 'L %l : C %c'     " Number of line and column
let g:airline_section_z = '%m %r %h %w'     " Gutter Flag (modified, read-only, help, preview)

" vim-plug --------------------------------------------------------------------
call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-markdown'               " Markdown support
Plug 'vim-airline/vim-airline'          " Airline
Plug 'vim-airline/vim-airline-themes'   " Airline themes
Plug 'raimondi/delimitmate'             " Autocomplete parenthesis
Plug 'tpope/vim-commentary'             " Easily comment toggling
Plug 'majutsushi/tagbar'                " Show tab options
Plug 'tpope/vim-fugitive'               " git wrapper
Plug 'neomake/neomake'                  " code-formatting tool
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } "
call plug#end()

" markdown --------------------------------------------------------------------
filetype plugin on 
let g:instant_markdown_slow = 1
let g:vim_markdown_folding_disabled = 1
let g:instant_markdown_autostart = 1

" neomake ---------------------------------------------------------------------
let g:neomake_verbose = 0
autocmd! BufWritePost,BufEnter * Neomake
let g:neomake_python_enabled_makers = ['flake8']
noremap <F3> :Autoformat<cr>
autocmd FileType python map <buffer> <F3> :!yapf -i % --style=pep8;<cr>

" deoplete --------------------------------------------------------------------
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 'ignorecase'
