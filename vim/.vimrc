noremap n j
noremap e k
noremap j m
noremap m n
noremap k e
noremap N J
noremap E K
noremap J M
noremap M N
noremap K E

nnoremap <S-Left> <C-W>h
nnoremap <S-Down> <C-W>j
nnoremap <S-Up> <C-W>k
nnoremap <S-Right> <C-W>l

set wildmenu
set wildmode=list:longest,full
set scrolloff=1
set clipboard=unnamedplus

let mapleader = " "
nnoremap <leader>s /^\s*
nnoremap <leader>S ?^\s*
nnoremap <leader>m /\v^\s*(def<Bar>class<Bar>if<Bar>elif<Bar>else<Bar>for<Bar>while<Bar>try<Bar>except)<CR>
nnoremap <leader>M ?\v^\s*(def<Bar>class<Bar>if<Bar>elif<Bar>else<Bar>for<Bar>while<Bar>try<Bar>except)<CR>
nnoremap <leader>] /\v^\s*(def<Bar>class)<CR>
nnoremap <leader>[ ?\v^\s*(def<Bar>class)<CR>

colorscheme paper

""""""""""
" Cursor "
""""""""""

" let &t_SI = "\e[6 q"
" let &t_EI = "\e[2 q"
" " reset the cursor on start (for older versions of vim, usually not required)
" augroup myCmds
" au!
" " 1: blinking block (supposed to be the default)
" autocmd VimEnter * silent !echo -ne "\e[1 q"
" augroup END

if &term =~ "xterm\\|kitty\\|alacritty\\|tmux"
  let &t_SI = "\e[6 q"  " Insert mode: bar cursor
  let &t_EI = "\e[2 q"  " Normal mode: block cursor
endif

""""""
" UI "
""""""

" disable vi compatibility
set nocompatible

" automatically load changed files
set autoread

" auto-reload vimrc
autocmd! bufwritepost vimrc source ~/.vim/vimrc

" show the filename in the window titlebar
set title

" set encoding
set encoding=utf-8

" directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/swap

" display incomplete commands at the bottom
set showcmd

" mouse support
set mouse=a

" line numbers
set number

" highlight cursor line
set cursorline

" wrapping stuff
" set textwidth=80
" set colorcolumn=88

" ignore whitespace in diff mode
set diffopt+=iwhite

" Be able to arrow key and backspace across newlines
set whichwrap=bs<>[]

" Status bar
set laststatus=2

" remember last cursor position
autocmd BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\ 	exe "normal g`\"" |
	\ endif

" show '>   ' at the beginning of lines that are automatically wrapped
set showbreak=>\ \ \ 

" enable completion
set ofu=syntaxcomplete#Complete

" make laggy connections work faster
set ttyfast

" let vim open up to 100 tabs at once
set tabpagemax=100

" case-insensitive filename completion
set wildignorecase

"""""""""""""
" Searching "
"""""""""""""

set hlsearch "when there is a previous search pattern, highlight all its matches
set incsearch "while typing a search command, show immediately where the so far typed pattern matches
set ignorecase "ignore case in search patterns
set smartcase "override the 'ignorecase' option if the search pattern contains uppercase characters
set gdefault "imply global for new searches

"""""""""""""
" Indenting "
"""""""""""""

" When auto-indenting, use the indenting format of the previous line
set copyindent
" When on, a <Tab> in front of a line inserts blanks according to 'shiftwidth'.
" 'tabstop' is used in other places. A <BS> will delete a 'shiftwidth' worth of
" space at the start of the line.
set smarttab
" Copy indent from current line when starting a new line (typing <CR> in Insert
" mode or when using the "o" or "O" command)
set autoindent
" Automatically inserts one extra level of indentation in some cases, and works
" for C-like files
set smartindent

set expandtab       " Use spaces instead of actual tab characters
set shiftwidth=4    " Indentation size for auto-indents
set softtabstop=4   " Number of spaces a <Tab> feels like
set tabstop=4       " Number of spaces a tab character represents


"""""""""
" Theme "
"""""""""

syntax enable

