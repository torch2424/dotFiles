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

" Vim Multiple Cursors
Plugin 'terryma/vim-multiple-cursors'

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
noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(30)<CR>
noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-30)<CR>
let g:comfortable_motion_friction = 35.0
let g:comfortable_motion_air_drag = 9.75

" --- PLUGIN SETTINGS END   ---

" Use the mouse for everything
" http://vim.wikia.com/wiki/Make_mouse_drag_not_select_text_or_go_into_visual_mode
set mouse=a
" Copy paste only:
" set mouse=r
" Mouse select on long lines
" https://stackoverflow.com/questions/7000960/in-vim-why-doesnt-my-mouse-work-past-the-220th-column
set ttymouse=sgr

" Fix Copy Paste
" https://stackoverflow.com/questions/17561706/vim-yank-does-not-seem-to-work
if system('uname -s') == "Darwin\n"
  set clipboard=unnamed "OSX
else
  set clipboard=unnamedplus "Linux
endif

" Stop auto comment insertion
" https://superuser.com/questions/271023/can-i-disable-continuation-of-comments-to-the-next-line-in-vim
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

" Ctrl s to save
nmap <c-s> :w<cr>
imap <c-s> <esc>:w<cr>a

" Ctrl q to quit
nmap <c-q> :q<cr>
imap <c-q> <esc>:q<cr>a

" Ctrl p to paste like a normal person (with auto fixing indentation)
" http://vim.wikia.com/wiki/Format_pasted_text_automatically
nmap p p=`]
nmap <c-v> p

" Vim Tips for normal Copy/Pase/Undo, etc..
" http://vim.wikia.com/wiki/VimTip356
vmap <C-c> y<Esc>i
vmap <C-x> d<Esc>i
imap <C-v> <Esc>pi
imap <C-y> <Esc>ddi
map <C-z> <Esc>
imap <C-z> <Esc>ui

" Reselect visual paste after shifting block
" https://vi.stackexchange.com/questions/598/faster-way-to-move-a-block-of-text
xnoremap > >gv
xnoremap < <gv

" Tabs to spaces, and indentation
:set tabstop=2
:set shiftwidth=2
:set expandtab

" Disable swap files for git
set noswapfile

" Change cursor for normal vs insert mode
" https://stackoverflow.com/questions/15217354/how-to-make-cursor-change-in-different-modes-in-vim
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

" Change Vim Cursor Depending on mode:
" http://vim.wikia.com/wiki/Change_cursor_shape_in_different_modes
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"
