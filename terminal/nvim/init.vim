" General 3
colorscheme desert
syntax on                           " dunno
syntax enable                       " dunno
set t_Co=256                        " Colors
"set relativenumber                  " Relative Lines Number
set number                          " Lines number
set gcr=a:blinkon0                  " No blink cursor
set encoding=utf-8                  " Encode
set backspace=indent,eol,start      " Enable backspace
set shell=zsh                       " Set default shell
set hidden                          " Buffer with unsaved changes allowed
set autoread                        " Load file even if it has changed disk
set showcmd                         " Show the current command
set mousehide                       " Hide mouse while typing
set wildmenu                        " Better command completition with tab
set noshowmode                      " Hide default mode text
set ttimeoutlen=50                  " Timeout for lag
set clipboard=unnamedplus           " Copy to clipboard instead o buffer 
set mouse=a

" Indentation and spaces
set autoindent                      " Auto-indent
set smartindent                     " smart auto-indent
set smarttab                        " smart tab
set shiftwidth=4                    " tab = 4 spaces
set softtabstop=4                   " dunno
set tabstop=4                       " dunno
set expandtab                       " dunno
set textwidth=80

" Make search more sane
set ignorecase                      " case insensitive search
set smartcase                       " If uppercase is present, become case-sensitive
set incsearch                       " live incremental search
set showmatch                       " live match highlight
set hlsearch                        " highlight matches

" Markdown
filetype plugin on 
let g:instant_markdown_slow = 1
let g:vim_markdown_folding_disabled = 1
let g:instant_markdown_autostart = 1

" TabLine
:hi TabLineFill ctermfg=Black       ctermbg=Grey
:hi TabLineSel  ctermfg=DarkGreen   ctermbg=Black
:hi TabLine     ctermfg=Blue        ctermbg=Black
:hi Title       ctermfg=Red         ctermbg=Yellow

" Vim Airline 
set laststatus=2                                        " Enable powerline with one tab
set showtabline=2                                       " Enable tabline eith one tab
let g:airline_theme                         = 'simple'  " Theme selection
let g:airline_powerline_fonts               = 1         " Set the fonts
let g:airine#extensions#tabline#enable      = 1         " Something 
let g:airline_skip_empty_sections           = 0         " Do not draw separators for empty sections
let g:airline#extensions#hunks#enabled      = 0         " Disable hunks(??)
let g:airline#extensions#whitespace#enabled = 0         " Disable whitespace
let g:airline#extensions#ycm#enabled        = 1         " YMC integration
let g:airline#extensions#ymc#error_symbol   = 'E:'      " Error prefix
let g:airline#extensions#ymc#warning_symbol = 'W:'      " Warning prefix

" Vim Airline Statusbar
" let g:airline_section_b = '%{getcwd()}'     " Working Dir
" let g:aitline_section_c = '%t'              " File name
let g:airline_section_y = 'L %l : C %c'     " Number of line and column
let g:airline_section_z = '%m %r %h %w'     " Gutter Flag (modified, read-only, help, preview)

" Keymap
nmap <F8> :TagbarToggle<CR>     

" Vim-Plug, Plugin
call plug#begin('~/.local/share/nvim/plugged')
"Plug 'valloric/youcompleteme'           " Completition engine for most language
Plug 'vim-airline/vim-airline'          " Airline
Plug 'vim-airline/vim-airline-themes'   " Airline themes
Plug 'raimondi/delimitmate'             " Autocomplete parenthesis
Plug 'tpope/vim-markdown'               " Markdown support
"Plug 'suan/vim-instant-markdown'        " Browser preview of the markdown file (not working now)
Plug 'tpope/vim-commentary'             " Easily comment toggling
Plug 'majutsushi/tagbar'                " Show tab options
Plug 'tpope/vim-fugitive'               " git wrapper
call plug#end()
