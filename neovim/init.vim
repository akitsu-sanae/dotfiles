syntax on

set number
set title
let &titleold=getcwd()

" set tab config
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab

" set indent config
set cindent
set cinoptions+=:0,g0,N-s

" set search config
set ignorecase
set smartcase
set wrapscan
set incsearch
set hlsearch

set showmatch
set scrolloff=8
set showmode
set background=dark
set cursorline
autocmd ColorScheme * highlight CursorLine ctermbg=234

" set C++ template Angle Bracket
set matchpairs& matchpairs+=<:>

" no any temp files
set nowritebackup
set nobackup
set noswapfile

" stop beep
set visualbell t_vb=
set noerrorbells

" insert mode key mappings
inoremap jj <Esc>

inoremap <LEFT> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Right> <Nop>

" normal mode key mappings
nnoremap <LEFT> gT
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Right> gt

nnoremap Q <Nop>
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>

" split config
nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sH <C-w>H
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap s= <C-w>=

" redo
nnoremap r <C-r>
" line visual
nnoremap vv <S-v>

nnoremap <Space>h ^
nnoremap <Space>l $
nnoremap <Space>/ *
nnoremap <Space>m %

" move searched word to center
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" folding
vnoremap fold zf
vnoremap unfold zd

filetype plugin indent on

set t_Co=256
highlight Normal ctermbg=none

if has("autocmd")
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line ("'\"") <= line("$") |
        \   exe "normal! g'\"" |
        \ endif
endif

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

