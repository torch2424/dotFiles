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

" Editor Config
Plugin 'editorconfig/editorconfig-vim'

" () and {} autocomplete
Plugin 'tpope/vim-surround'

" Syntax Checking
Plugin 'vim-syntastic/syntastic'

" Inline Git
Plugin 'airblade/vim-gitgutter'

" Fuzzy Finding
Plugin 'ctrlpvim/ctrlp.vim'

" Better JS Support
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

" Linting
Plugin 'w0rp/ale'

"Vim scrolling that wont make your eyes bleed
Plugin 'yuttie/comfortable-motion.vim'

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

" We need this for plugins like Syntastic and vim-gitgutter which put symbols
" in the sign column.
hi clear SignColumn

" ----- scrooloose/syntastic settings -----
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
  au!
  au FileType tex let b:syntastic_mode = "passive"
augroup END

" ALE Linter settings
let g:ale_sign_column_always = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {'javascript': ['prettier']}
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']

" Comfortable motion Mouse support
let g:comfortable_motion_no_default_key_mappings = 1
noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(55)<CR>
noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-55)<CR>
let g:comfortable_motion_friction = 22.0
let g:comfortable_motion_air_drag = 8.5

" --- PLUGIN SETTINGS END   ---

" Use the mouse for everything
" http://vim.wikia.com/wiki/Make_mouse_drag_not_select_text_or_go_into_visual_mode
set mouse=a
" Copy paste only:
" set mouse=r

" Fix Copy Paste
" https://stackoverflow.com/questions/17561706/vim-yank-does-not-seem-to-work
if system('uname -s') == "Darwin\n"
  set clipboard=unnamed "OSX
else
  set clipboard=unnamedplus "Linux
endif

" Stop auto comment insertion
set formatoptions-=cro

" Ctrl s to save
nmap <c-s> :w<cr>
imap <c-s> <esc>:w<cr>a

" Ctrl q to quit
nmap <c-q> :q<cr>
imap <c-q> <esc>:q<cr>a

" Tabs to spaces, and indentation
:set tabstop=2
:set shiftwidth=2
:set expandtab

" Disable swap files for git
set noswapfile
