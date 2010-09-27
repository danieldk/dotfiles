filetype off
filetype plugin indent on

set nocompatible

set modelines=0

set tabstop=2
set shiftwidth=2
"set softtabstop=22
set expandtab

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile

let mapleader = ","

set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

set wrap
set textwidth=76
set formatoptions=qrn1
set colorcolumn=82

set list
set listchars=tab:▸\ ,eol:¬

nnoremap ; :


nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

nnoremap <leader>q gqip

nnoremap <leader>v V`]

nnoremap <leader>w <C-w><C-s><C-w>j

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

colorscheme molokai

" Haskell
au Bufenter *.hs compiler ghc
let g:haddock_browser = "open"
let g:haddock_browser_callformat = "%s %s"

" git
nnoremap <leader>gs :Gstatus<cr>

" tag list
nnoremap <leader>t :TlistToggle<cr><C-w>h
