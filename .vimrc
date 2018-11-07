set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'kien/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tomtom/tcomment_vim'

call vundle#end()
filetype plugin indent on

colorscheme murphy

""""""""
if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

set autoindent
set backspace=indent,eol,start
set complete-=i
set showmatch
set showmode
set smarttab
set nrformats-=octal
set shiftround
set ttimeout
set ttimeoutlen=50
set incsearch
set laststatus=2
set ruler
set showcmd
set wildmenu
set autoread
set encoding=utf-8
set tabstop=2 shiftwidth=2 expandtab
set listchars=tab:▒░,trail:▓
set list
set number
set hlsearch
set ignorecase
set smartcase
set hidden
set nobackup
set nowritebackup
set noswapfile
set fileformats=unix,dos,mac
set completeopt=menuone,longest,preview

inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

"
" Plugins config
"

" CtrlP
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,node_modules/*
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
  \ --ignore .git
  \ --ignore .svn
  \ --ignore .hg
  \ --ignore .DS_Store
  \ --ignore "**/*.pyc"
  \ -g ""'

" Basic shortcuts definitions
"  most in visual mode / selection (v or ⇧ v)
"

" exit insert mode
inoremap jk <Esc>

" Don't use Ex mode, use Q for formatting
map Q gq

" indend / deindent after selecting the text with (⇧ v), (.) to repeat.
vnoremap <Tab> >
vnoremap <S-Tab> <
" comment / decomment & normal comment behavior
noremap <C-/> gc
" Disable tComment to escape some entities
let g:tcomment#replacements_xml={}

" buffers as tabs
nnoremap <C-j>  :bp<CR>
inoremap <C-j>  <Esc>:bp<CR>i
nnoremap <C-k>  :bn<CR>
inoremap <C-k>  <Esc>:bn<CR>i
nnoremap <C-x>  :bd<CR>
inoremap <C-x>  <Esc>:bd<CR>i

" lazy ':'
map \ :

let mapleader = ','
" paste without yanking
vnoremap <leader>p "_dP
noremap <C-n> :NERDTreeToggle<CR>

" this machine config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

let g:gitgutter_realtime = 1
autocmd BufWritePre * :%s/\s\+$//e
autocmd StdinReadPre * let s:std_in=1

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
set clipboard=unnamed
