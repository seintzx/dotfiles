" general ---------------------------------------------------------------------
syntax on
syntax enable
colorscheme nightshade
set t_Co=256
set background=dark
set shell=zsh
set ttimeoutlen=50

" appearance ------------------------------------------------------------------
set laststatus=2
set showtabline=2
set number
" set textwidth=80
set colorcolumn=80
set modeline
set modelines=5
set scrolloff=6
set cursorline
set ruler

" clipboard -------------------------------------------------------------------
set clipboard=unnamedplus
set pastetoggle=<F12>

" encoding --------------------------------------------------------------------
set encoding=utf-8
set fileencoding=utf-8

" indentation -----------------------------------------------------------------
set expandtab
set autoindent
set smartindent
set smarttab
set linebreak
set nojoinspaces
set backspace=indent,eol,start
" set shiftwidth=4
" set softtabstop=4
" set tabstop=4
set shiftwidth=2
set softtabstop=2
set tabstop=2
set list
set listchars=tab:›\ ,trail:•

" mouse -----------------------------------------------------------------------
set mouse=a
set mousehide
set gcr=a:blinkon0

" persistence -----------------------------------------------------------------
set hidden
set autoread
set showcmd

" search ----------------------------------------------------------------------
set ignorecase
set smartcase
set incsearch
set hlsearch
set showmatch
set matchtime=1
set matchpairs+=<:>

" wildmenu --------------------------------------------------------------------
set wildmenu
set noshowmode

" tabline ---------------------------------------------------------------------
:hi TabLineFill ctermfg=Black       ctermbg=Grey
:hi TabLineSel  ctermfg=DarkGreen   ctermbg=Black
:hi TabLine     ctermfg=Blue        ctermbg=Black

" airline ---------------------------------------------------------------------
let g:airline_theme                         = 'murmur'
let g:airline_powerline_fonts               = 1
let g:airine#extensions#tabline#enable      = 1
let g:airline_skip_empty_sections           = 0
let g:airline#extensions#hunks#enabled      = 0
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#ycm#enabled        = 1
let g:airline#extensions#ymc#error_symbol   = 'E:'
let g:airline#extensions#ymc#warning_symbol = 'W:'

" airline statusbar -----------------------------------------------------------
let g:airline_section_z = 'L %l : C %c'       " Number of line and column

" vim-plug --------------------------------------------------------------------
call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-markdown'                       " Markdown support
Plug 'vim-airline/vim-airline'                  " Airline
Plug 'vim-airline/vim-airline-themes'           " Airline themes
Plug 'raimondi/delimitmate'                     " Autocomplete parenthesis
Plug 'tpope/vim-commentary'                     " Easily comment toggling
Plug 'majutsushi/tagbar'                        " Show tab options
Plug 'tpope/vim-fugitive'                       " git wrapper
Plug 'donraphaco/neotex', { 'for': 'tex' }      " latex
Plug 'lervag/vimtex'                            " latex syntax
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " auto-complete
call plug#end()

" markdown --------------------------------------------------------------------
filetype plugin on
let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0
let g:vim_markdown_folding_disabled = 1
let g:markdown_fenced_languages = ['python', 'bash=sh']
let g:markdown_syntax_conceal = 0

" deoplete --------------------------------------------------------------------
let g:python3_host_prog = '/usr/bin/python3'
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 'ignorecase'

" neotex ----------------------------------------------------------------------
" ''% NeoTex: mainfile=main.tex:''
" to be added at the end of every file, except main
let g:tex_flavor = 'latex'
noremap <F4> :NeoTex<cr>
