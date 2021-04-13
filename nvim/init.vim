" vim-plug --------------------------------------------------------------------
let g:ale_completion_enabled = 1
call plug#begin('~/.local/share/nvim/plugged')
Plug 'mindriot101/vim-yapf'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'morhetz/gruvbox'                          " Colorscheme
Plug 'tpope/vim-markdown'                       " Markdown support
Plug 'vim-airline/vim-airline'                  " Airline
Plug 'vim-airline/vim-airline-themes'           " Airline themes
Plug 'raimondi/delimitmate'                     " Autocomplete parenthesis
Plug 'tpope/vim-commentary'                     " Easily comment toggling
Plug 'majutsushi/tagbar'                        " Show tab options
Plug 'tpope/vim-fugitive'                       " git wrapper
Plug 'scrooloose/nerdtree'

" php
" Plug 'alvan/vim-php-manual'
" Plug 'w0rp/ale'
" Plug 'embear/vim-localvimrc'
call plug#end()

" airline ---------------------------------------------------------------------
" let g:airline_theme                         = 'murmur'
let g:airline_theme                         = 'gruvbox'
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

" markdown --------------------------------------------------------------------
filetype plugin on
let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0
let g:vim_markdown_folding_disabled = 1
let g:markdown_fenced_languages = ['python', 'bash=sh']
let g:markdown_syntax_conceal = 0

" gruvbox ---------------------------------------------------------------------
let g:gruvbox_contrast_dark = 'hard'

" general ---------------------------------------------------------------------
syntax on
syntax enable
" colorscheme nightshade
colorscheme gruvbox
set background=dark
set shell=zsh
set ttimeoutlen=50

" appearance ------------------------------------------------------------------
set laststatus=2
set showtabline=2
set number
set textwidth=80
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
set shiftwidth=4
set softtabstop=4
set tabstop=4
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
" :hi TabLineFill ctermfg=Black       ctermbg=Grey
" :hi TabLineSel  ctermfg=DarkGreen   ctermbg=Black
" :hi TabLine     ctermfg=Blue        ctermbg=Black

" keybind ---------------------------------------------------------------------
" map <F11> :%!python -m json.tool <enter>
