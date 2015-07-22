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
autocmd ColorScheme * highlight CursorLine ctermbg=Black

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

" tab
nnoremap t <Nop>
nnoremap tt :<C-u>tabnew<CR>
nnoremap <expr> tf ":<C-u>tabnew ".GetRelativePath()

function! GetRelativePath()
    let path = expand("%:~:.:h")
    if path == "."
        return ""
    else
        return path."/"
    endif
endfunction

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


NeoBundle 'Yggdroot/indentLine'
let g:indentLine_faster = 1

NeoBundle 'Townk/vim-autoclose'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'tpope/vim-surround'
NeoBundle 'scrooloose/nerdtree'
command Dir :NERDTree

NeoBundle 'tomtom/tcomment_vim'

" unite.vim config
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
" unite prefix
nnoremap [unite] <Nop>
nmap <Space>u [unite]
let g:unite_enable_start_insert=1
let g:unite_source_file_mru_limit=50
let g:unite_source_file_mru_filename_format=''
" open menu
nnoremap <silent> [unite]cd :<C-u>Unite<Space>file<CR>
nnoremap <silent> [unite]b  :<C-u>Unite<Space>buffer<CR>
nnoremap <silent> [unite]r  :<C-u>Unite<Space>file_mru<CR>
nnoremap <silent> [unite]f  :<C-u>Unite<Space>bookmark<CR>
nnoremap <silent> [unite]a  :<C-u>UniteBookmarkAdd<CR>
autocmd FileType unite call s:unite_setting()
function! s:unite_setting()"{{{
    nmap <buffer><Esc> <Plug>(unite_exit)
    nnoremap <silent> <buffer> <expr> <Space> unite#do_action('vsplit')
    nnoremap <silent> <buffer> <expr> <Space><Space> unite#do_action('split')
    nnoremap <silent> <buffer> <expr> <Space><Space><Space> unite#do_action('open')
    inoremap <silent> <buffer> <expr> <Space> unite#do_action('vsplit')
    inoremap <silent> <buffer> <expr> <Space><Space> unite#do_action('split')
    inoremap <silent> <buffer> <expr> <Space><Space><Space> unite#do_action('open')
endfunction"}}}

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
