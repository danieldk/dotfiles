" Load bundles via Pathogen
call pathogen#infect()

filetype off
filetype plugin indent on

" Do not put backups and swap files in the currenty directory.
set backupdir=~/.backup,.,/tmp
set directory=~/.backup,.,/tmp

set nocompatible

syntax on

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
set colorcolumn=+1

set list
set listchars=tab:▸\ ,eol:¬

nnoremap ; :


nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

nnoremap <leader>q gqip

" Vertical split
nnoremap <leader>v <C-w>v<C-w>l

" Horizontal split
nnoremap <leader>w <C-w><C-s><C-w>j

" Simpler window navigation
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
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gl :Glog<cr>
nnoremap <leader>go :Git stash pop<cr>
nnoremap <leader>gp :Git push<cr>
nnoremap <leader>gt :Git stash<cr>
nnoremap <leader>gu :Git pull<cr>

" tag list
nnoremap <leader>c :TlistToggle<cr><C-w>h

" quickfix list
nnoremap <leader>f :cwindow<cr>

" ctrl-p
nnoremap <leader>t :CtrlP<cr>

" TeX {{{

augroup ft_tex
  au!

  au BufNewFile,BufRead *.tex set filetype=tex
  au Syntax tex setlocal spell
  au Syntax tex setlocal formatoptions=tqrn1
augroup END

" }}}
"

" Kill arrow keys
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
