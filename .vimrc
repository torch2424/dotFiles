" Use double quotes to write a comment, with no closing quote

" https://github.com/jez/vim-as-an-ide/commit/dff7da3

" Need to run ':PluginInstall' for Vundle Plugins

" Enable most vim settings
set nocompatible

" Vundle Setup
filetype off
 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
 
" Vundle set up
Plugin 'VundleVim/Vundle.vim'

" Vim Powerling clone
Plugin 'itchyny/lightline.vim'

" Color Scheme
Plugin 'morhetz/gruvbox'

call vundle#end()
 
filetype plugin indent on

" General Vim Settings
set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set hlsearch
syntax on

" --- PLUGIN SETTINGS START ---

" Theme
colorscheme gruvbox
set background=dark
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

" --- PLUGIN SETTINGS END   ---

" Use the mouse for everything
set mouse=a
" Copy paste only:
" set mouse=r

" Indenting in vim: http://stackoverflow.com/questions/234564/tab-key-4-spaces-and-auto-indent-after-curly-braces-in-vim
filetype plugin indent on

" show existing tab with 4 spaces width
set tabstop=42

" when indenting with '>', use 4 spaces width
set shiftwidth=42

" On pressing tab, insert 4 spaces
set expandtab

" File tree for current directory
" https://shapeshed.com/vim-netrw/#netrw-the-unloved-directory-browser
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :Vexplore
augroup END
