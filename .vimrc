set nocompatible              " be iMproved, required
filetype off                  " required

" Plugs will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Let Vundle manage plugins
Plug 'gmarik/Vundle.vim'

" Git wrapper for Vim
Plug 'tpope/vim-fugitive'

" Fuzzy search
Plug 'kien/ctrlp.vim'

" For displaying the file tree
Plug 'scrooloose/nerdtree'

" For working with delimiters
Plug 'tpope/vim-surround'

" For commenting stuff
Plug 'scrooloose/nerdcommenter'

" For using ag in Vim
Plug 'rking/ag.vim'

" For automatically closing brackets
Plug 'Raimondi/delimitMate'

" Much better Javascript support for Vim
Plug 'pangloss/vim-javascript'

" ES6 Syntax Highlighting
Plug 'isRuslan/vim-es6'

" Highlighting support for JSX
Plug 'mxw/vim-jsx'

" Indentation helpers
Plug 'nathanaelkane/vim-indent-guides'

" Tab autocomplete
Plug 'ervandew/supertab'

" Async Lint Engine
Plug 'w0rp/ale'

" Fast HTML and CSS pluging for Vim
Plug 'mattn/emmet-vim'

" Vim Plug for Blade
Plug 'jwalton512/vim-blade'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" ReasonML support
Plug 'reasonml-editor/vim-reason-plus'
"
" for neovim
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
endif

" LanguageClient support
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" nice to have
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'

" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'

" List ends here. Plugs become visible to Vim after this call.
call plug#end()

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

"  Default to new right window when vertical splitting
set splitright

" Default to new bottom window when horizontal splitting
set splitbelow

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

" Maps jk to leaving insert mode (press twice quickly)
imap jk <ESC>

" Maps leader (\) to space
let mapleader = "\<Space>"

" Maps : to ;, removing the shift step
nnoremap ; :

" Maps leader ; to viewing buffers and going to new buffer
nnoremap <leader>; :ls<CR>:b<Space>

" Copies current file path to the clipboard
nmap <silent> <leader>cp :let @+ = expand("%")<CR>

" Enters the current highlighted term into a find and replace
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" Enters a search command for the current highlighted term
vnoremap <C-f> "hy:Ag <C-r>h

" Allows you to find the current file in NERDTree
nmap <leader>f :NERDTreeFind<CR>

" Enable syntax highlighting
syntax enable

" Display buffers in airline if only one tab open
let g:airline#extensions#tabline#enabled = 1

" Enable syntax highlighting for flow
let g:javascript_plugin_flow = 1

" Allow JSX highlighting for non .jsx files
let g:jsx_ext_required = 0

" Use molokai color scheme
colorscheme molokai
let g:rehash265 = 1

" Use badwolf theme for airline
let g:airline_theme='badwolf'

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
  \ 'file': '\.so$\|\.dat$|\.DS_Store$|\.js.map$|\.graphql\.js$'
  \ }

let g:ctrlp_max_files = 0

" Highlights results as you type out a search
set incsearch
set showmatch
set hlsearch

" Lets you search using '/' ignoring case. Smart enough to see caps
set ignorecase
set smartcase

" Unsaved changes causes file to be hidden instead of closed
set hidden

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

" Lets you copy to osx clipboard
set clipboard=unnamed

" Ignore the typescript ale linter
let g:ale_linters = {
      \ 'javascript': ['eslint', 'flow', 'flow-language-server', 'jshint', 'standard']
\}

" After this is configured, :ALEFix will try and fix your JS code with ESLint.
let g:ale_fixers = {
\   'javascript': ['eslint'],
\}

" Set this setting in vimrc if you want to fix files automatically on save.
" This is off by default.
let g:ale_fix_on_save = 1

let @r = "\/* @flow */\n
\import * as React from 'react';\n
\\n
\type Props = {};\n
\\n
\class ComponentName extends React.Component<Props> {\n
\render() {\n
\\n
\}\n
\}\n
\\n
\export default ComponentName;"

" LanguageClient defaults
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> gf :call LanguageClient#textDocument_formatting()<cr>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>


let g:LanguageClient_serverCommands = {
    \ 'reason': ['/Users/ricky/.vim/reason-language-server.exe'],
    \ }

" enable autocomplete
let g:deoplete#enable_at_startup = 1

" Make supertab work nicely with deoplete (fix tabbing being backward)
let g:SuperTabDefaultCompletionType = "<c-n>"

" [TEMP] Map leader-m-m to convert a Relay component file to Relay compat
nnoremap <leader>mm :!jscodeshift -t ~/Code/relay-codemod/transforms/migrate-to-modern-1.0.js %:p<cr>
