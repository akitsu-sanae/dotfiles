syntax on
set smartindent

set ignorecase
set smartcase
set wrapscan

set autoindent
set expandtab

set list
set number
set incsearch
set cursorline

set showmatch
set hlsearch

set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4

set matchpairs& matchpairs+=<:>
set nowritebackup
set nobackup
set noswapfile

inoremap jj <Esc>
inoremap aa ->

inoremap <LEFT> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Right> <Nop>

nnoremap <LEFT> gT
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Right> gt

inoremap <C-h> <LEFT>
inoremap <C-j> <DOWN>
inoremap <C-k> <UP>
inoremap <C-l> <RIGHT>

inoremap <silent> <C-p> <Esc>$<Insert><Right>;

nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

set runtimepath+=~/.vim/bundle/neobundle.vim/

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc',{
        \ 'build' : {
        \   'windows' : 'make -f make_mingw32.mak',
        \   'cygwin'  : 'make -f make_cygwin.mak',
        \   'mac'     : 'make -f make_mac.mak',
        \   'unix'     : 'make -f make_unix.mak',
        \ },
        \}

NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neocomplcache-clang_complete'
NeoBundle 'Rip-Rip/clang_complete'

let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_force_overwrite_completefunc = 1
let g:clang_complete_auto = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

function! s:my_cr_function()
    return neocomplcache#smart_close_popup() . "\<CR>"
endfunction

inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

let g:clang_use_library=1
let g:clang_library_path='/usr/lib/llvm-3.5/lib'

let g:clang_complete_copen=1
let g:clang_use_library=1
let g:clang_user_options='-std=c++11 -stdlib=libc++'

NeoBundle 'Yggdroot/indentLine'
let g:indentLine_faster = 1

NeoBundle 'Townk/vim-autoclose'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'tpope/vim-surround'
NeoBundle 'Shougo/unite.vim'

NeoBundleLazy 'tpope/vim-endwise',{
        \ 'autoload' : { 'insert' : 1,}}

" colorschemes
NeoBundle 'vim-scripts/rdark'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'sjl/badwolf'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

colorscheme badwolf

if has("autocmd")
        autocmd BufReadPost *
                \ if line("'\"") > 0 && line ("'\"") <= line("$") |
                \   exe "normal! g'\"" |
                \ endif
endif
