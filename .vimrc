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

" File Tree
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

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

" File tree
" ----- jistr/vim-nerdtree-tabs -----
" Open/close NERDTree Tabs with \t
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
" To have NERDTree always open on startup
let g:nerdtree_tabs_open_on_console_startup = 1
let NERDTreeShowHidden=1
autocmd VimEnter * call NERDTreeAddKeyMap({ 'key': '<2-LeftMouse>', 'scope': "FileNode", 'callback': "OpenInTab", 'override':1 })
    function! OpenInTab(node)
        call a:node.activate({'reuse': 'all', 'where': 't'})
    endfunction

" --- PLUGIN SETTINGS END   ---

" Use the mouse for everything
" http://vim.wikia.com/wiki/Make_mouse_drag_not_select_text_or_go_into_visual_mode
set mouse=nicr
" Copy paste only:
" set mouse=r

" Stop auto comment insertion
set formatoptions-=cro

" Ctrl s to save
nmap <c-s> :w<cr>
imap <c-s> <esc>:w<cr>a

" Ctrl q to quit
nmap <c-q> :q<cr>
imap <c-q> <esc>:q<cr>a
