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

" For SLIM syntax highlighting support
Plugin 'slim-template/vim-slim'

" Less highlighting
Plugin 'groenewege/vim-less'

" For displaying the file tree
Plugin 'scrooloose/nerdtree'

" For working with delimiters
Plugin 'tpope/vim-surround'

" For commenting stuff
Plugin 'scrooloose/nerdcommenter'

" For using ag in Vim
Plugin 'rking/ag.vim'

" For automatically closing brackets
Plugin 'Raimondi/delimitMate'

" Much better Javascript support for Vim
Plugin 'pangloss/vim-javascript'

" ES6 Syntax Highlighting
Plugin 'isRuslan/vim-es6'

" Jade support for Vim
Plugin 'digitaltoad/vim-jade'

" Indentation helpers
Plugin 'nathanaelkane/vim-indent-guides'

" Tab autocomplete
Plugin 'ervandew/supertab'

" CoffeeScript Syntax Highlighting
Plugin 'kchmck/vim-coffee-script'

call vundle#end()
filetype plugin indent on

filetype plugin on

" Show line numbers
 set number

" Makes text wrap downwards instead of cutting it off
set display+=lastline

" Faster scrolling
set lazyredraw

" Smarter indentation
set smartindent

" Always show 20 lines of code above and below the cursor
set scrolloff=20

" Reasonable tabs (two spaces)
set textwidth=0 tabstop=2 shiftwidth=2 softtabstop=2 expandtab

" Auto reload files that may have been modified outside of Vim
set autoread

" Map Control+n to open up NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" create all the swapfiles in a tmp directory
set directory=~/.vim/tmp//

" create all the backup files in the backup directory
set backupdir=~/.vim/backup//

set undodir=~/.vim/undo//

" Use ack instead of grep
set grepprg=Ag

" Maps control-p to searching with ctrl-p
let g:ctrlp_map = '<c-p>'

" Show hidden files with ctrlp
let g:ctrlp_show_hidden = 1

" Show hidden files with NERDTree
let NERDTreeShowHidden = 1

" Maps control-] to moving to previous buffer
nnoremap <C-]> :bp<cr>

" Maps control-\ to moving to next buffer
nnoremap <C-\> :bn<cr>

" Maps jj to leaving insert mode (press twice quickly)
imap jj <ESC>

" Maps leader (\) to space
let mapleader = "\<Space>"

" Maps : to ;, removing the shift step
nnoremap ; :

" Copies current file path to the clipboard
nmap <silent> <leader>cp :let @+ = expand("%")<CR>

" Allows you to find the current file in NERDTree
nmap <leader>f :NERDTreeFind<CR>

" Enable syntax highlighting
syntax enable

" Use molokai color scheme
colorscheme molokai
let g:rehash265 = 1

" Automatically reload vimrc once it's saved
augroup AutoReloadVimRC
    au!
      au BufWritePost $MYVIMRC so $MYVIMRC
    augroup END

" Ignore things ending with a tilde
set wildignore+=*~

" Ignore some folders and files for CtrlP indexing
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|public$|log\|tmp$\|node_modules$',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }

" Highlights results as you type out a search
set incsearch
set showmatch
set hlsearch

" Lets you search using '/' ignoring case. Smart enough to see caps
set ignorecase
set smartcase

" Type // to clear search highlight
map //  :nohlsearch<CR>; echo 'Search highlight cleared' <CR>

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

" Automatically set slimbars files to use Slim syntax highlighting
autocmd BufRead,BufNewFile *.slimbars setlocal filetype=slim

" Lets you copy to osx clipboard
set clipboard=unnamed
