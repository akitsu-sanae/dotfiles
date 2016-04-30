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

set runtimepath+=~/.vim/bundle/neobundle.vim/

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'


NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neocomplcache-clang_complete'

let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_force_overwrite_completefunc = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

function! s:my_cr_function()
    return neocomplcache#smart_close_popup() . "\<CR>"
endfunction

inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

NeoBundle 'rust-lang/rust.vim'
NeoBundle 'racer-rust/vim-racer'
let g:rustfmt_autosave = 1
let g:rustfmt_command = '$HOME/.cargo/bin/rustfmt'
set hidden
let g:racer_cmd = '$HOME/.cargo/bin/racer'
let $RUST_SRC_PATH="/usr/local/src/rust-1.7.0/src"


NeoBundle 'tomtom/tcomment_vim'

NeoBundleLazy 'tpope/vim-endwise',{
        \ 'autoload' : { 'insert' : 1,}}

NeoBundle 'Townk/vim-autoclose'
NeoBundle 'Yggdroot/indentLine'
let g:indentLine_faster = 1

NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'tpope/vim-surround'
NeoBundle 'scrooloose/nerdtree'
command Dir :NERDTree

" for twitter
NeoBundle 'TwitVim'
let twitvim_force_ssl = 1
let twitvim_count = 40
command Twtl :FriendsTwitter
command Twref :RefreshTwitter
nnoremap tj :NextTwitter <CR>
nnoremap tk :PreviousTwitter <CR>

" status line
set laststatus=2
NeoBundle 'itchyny/lightline.vim'

let g:lightline = {
    \ 'colorscheme' : 'wombat',
    \ 'active' : {
    \    'left' : [ ['mode', 'paste'],
    \        ['fugitive', 'readonly', 'filename', 'modified']
    \    ]
    \ },
    \ 'component_function' : {
    \    'fugitive' : 'LightLineFugtive',
    \    'readonly' : 'LightLineReadonly',
    \    'modified' : 'LightLineModified'
    \ },
    \ 'separator' : { 'left' : '', 'right' : '' },
    \ 'subseparator' : { 'left' : '|', 'right' : '|' }
    \ }

function! LightLineModified()
    if &filetype == "help"
        return ""
    elseif &modified
        return "+"
    elseif &modifiable
        return ""
    else
        return ""
    endif
endfunction

function! LightLineReadonly()
    if &filetype == "help"
        return ""
    elseif &readonly
        return "✖"
    else
        return ""
    endif
endfunction

function! LightLineFugtive()
    return exists('*fugitive#head')? fugitive#head() : ''
endfunction

" colorschemes
NeoBundle 'tomasr/molokai'
NeoBundle 'sjl/badwolf'
NeoBundle 'sheerun/vim-wombat-scheme'
NeoBundle 'Vim-scripts/Zenburn'
NeoBundle 'rhysd/wallaby.vim'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

syntax on
set t_Co=256
colorscheme wallaby
highlight Normal ctermbg=none

if has("autocmd")
        autocmd BufReadPost *
                \ if line("'\"") > 0 && line ("'\"") <= line("$") |
                \   exe "normal! g'\"" |
                \ endif
endif
