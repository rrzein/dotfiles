set nocompatible              " be iMproved, required
filetype off                  " required

" Vundle stuff
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage plugins
Plugin 'gmarik/Vundle.vim'

" Git wrapper for Vim
Plugin 'tpope/vim-fugitive'

" Fuzzy search
Plugin 'kien/ctrlp.vim'

" Syntax checking plugin
Plugin 'scrooloose/syntastic'

" For displaying the file tree
Plugin 'scrooloose/nerdtree'

" For commenting stuff
Plugin 'scrooloose/nerdcommenter'

" Run your RSpec tests
Plugin 'skalnik/vim-vroom'

" Solarized color theme
Plugin 'altercation/vim-colors-solarized'

" For easy motion
Plugin 'Lokaltog/vim-easymotion'

call vundle#end()
filetype plugin indent on

filetype plugin on

" Show line numbers
" set number

" Relative line numbers
set rnu

" Makes text wrap downwards instead of cutting it off
set display+=lastline

" Faster scrolling
set lazyredraw

" Smarter indentation
set smartindent

" Reasonable tabs (two spaces)
set textwidth=0 tabstop=2 shiftwidth=2 softtabstop=2 expandtab

" Map Control+n to open up NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Use ack instead of grep
set grepprg=ack

" Maps control-p to searching with ctrl-p
let g:ctrlp_map = '<c-p>'

" Maps control-] to moving to next buffer
nnoremap <C-]> :bn<cr>

" Maps jj to leaving insert mode (press twice quickly)
imap jj <ESC>

" Maps leader (\) to apostrophe
let mapleader = ","

" Maps : to ;, removing the shift step
nnoremap ; :

" Enable syntax highlighting
syntax enable

" Use solarized color scheme
set background=dark
colorscheme solarized
let g:solarized_termtrans = 1
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"

" Automatically reload vimrc once it's saved
augroup AutoReloadVimRC
    au!
      au BufWritePost $MYVIMRC so $MYVIMRC
    augroup END

" Highlights results as you type out a search
set incsearch
set showmatch
set hlsearch

" Strip whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWritePre * :%s/\s\+$//e

" use hotkeys for navigating windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif

" Keep 50 lines of command line history
set history=50

" Show the cursor position all the time
set ruler

set showcmd		" display incomplete commands

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Set Solarized compatibility for the Terminal
if !has('gui_running')
  " Compatibility for Terminal
  let g:solarized_termtrans=1

  " Make Solarized use 16 colors for Terminal support
  let g:solarized_termcolors=256
endif
