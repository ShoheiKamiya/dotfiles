set number
set hls
set modifiable
set clipboard=unnamed
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set noswapfile
set nowrap
set fenc=utf-8
set showcmd
set list
set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%
set ignorecase
set smartcase
set showmatch
set colorcolumn=100
set scrolloff=8
set foldmethod=indent
set foldlevel=0
let loaded_matchparen = 1
nmap <Esc><Esc> :nohlsearch<CR><Esc>
nnoremap <silent> <C-j> :bprev<CR>
nnoremap <silent> <C-k> :bnext<CR>
nnoremap <C-n> :Fern . -reveal=% -drawer -toggle -width=40<CR>
nnoremap <C-p> "0p
vnoremap <C-p> "0p
tnoremap <Esc> <C-\><C-n>

command! CopyPath :!echo % | tr -d '\n' | pbcopy

let mapleader = "\<space>"

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
let g:dein#auto_recache = 1
if dein#load_state($HOME.'/.cache/dein')
  call dein#begin($HOME.'/.cache/dein')
  call dein#load_toml('~/.config/nvim/dein.toml')
  call dein#end()
  call dein#save_state()
endif
if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable
