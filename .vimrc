set nocompatible              " be iMproved, required
filetype off                  " required

" Plugs will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Git wrapper for Vim
Plug 'tpope/vim-fugitive'

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

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Smooth scroll
Plug 'terryma/vim-smooth-scroll'

"Plugin to asynchronously run programs
Plug 'neomake/neomake'

" Fuzzy file finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Dracula color theme for Vim
Plug 'dracula/vim'

" Install CoC Language Server
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

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

" *** NERDTree Settings ***
" Show hidden files with NERDTree
let NERDTreeShowHidden = 1

" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Map Control+n to open up NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>

" Never open files in the NERDTree buffer
autocmd FileType nerdtree let t:nerdtree_winnr = bufwinnr('%')
autocmd BufWinEnter * call PreventBuffersInNERDTree()

function! PreventBuffersInNERDTree()
  if bufname('#') =~ 'NERD_tree' && bufname('%') !~ 'NERD_tree'
    \ && exists('t:nerdtree_winnr') && bufwinnr('%') == t:nerdtree_winnr
    \ && &buftype == '' && !exists('g:launching_fzf')
    let bufnum = bufnr('%')
    close
    exe 'b ' . bufnum
    NERDTree
  endif
  if exists('g:launching_fzf') | unlet g:launching_fzf | endif
endfunction

" *** END NERDTree Settings ***

" *** FZF Settings ***
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

let $FZF_DEFAULT_COMMAND = 'ag -g ""'
" *** END FZF Settings ***

" *** COC MAPPINGS ***
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\\s'
endfunction

" Insert mode, Ctrl-space: Refresh Coc suggestions
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Insert mode, tab: If suggestions are visible, go to next suggestion.
" If space behind is empty insert tab
" Otherwise refresh coc suggestions
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Insert mode, enter: If suggestions are visible, use selected suggestion
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
" *** END COC MAPPINGS ***

" Run NeoMake on read and write operations
autocmd! BufReadPost,BufWritePost * Neomake

let g:neomake_serialize = 1
let g:neomake_serialize_abort_on_error = 1

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

if (has("termguicolors"))
 set termguicolors
endif
syntax enable
colorscheme dracula

" Use dracula theme for airline
let g:airline_theme='dracula'

" Automatically reload vimrc once it's saved
augroup AutoReloadVimRC
    au!
      au BufWritePost $MYVIMRC so $MYVIMRC
    augroup END

" Ignore things ending with a tilde
set wildignore+=*~

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

" Smooth scroll
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

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
