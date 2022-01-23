set tabstop=4                    " tabs are 4 spaces long
set softtabstop=4                " number of spaces to use for indenting
set shiftwidth=4                 " number of spaces to use when inserting tab
set expandtab                    " turn tabs into spaces
set smartindent                  " indets based on the code syntax youre editing
set autoindent                   " copy indent from previous line
set nu                           " turn on line numbers
set relativenumber               " use relative line numbers
set nohlsearch                   " search highlighting is not persistent
set incsearch                    " incremental search
set noerrorbells                 " no error bell sounds
set nowrap                       " no text wrapping
set ignorecase smartcase         " search case-insensitive unless uppercase character is used
set hidden                       " unsaved buffers are hidden
set noswapfile                   " dont create swap files
set undofile                     " store undo info in a file
set undodir=~/.vim/undodir       " where to store undo file
set scrolloff=8                  " keep 8 rows visable when scrolling
set sidescrolloff=8              " keep 8 columns visable when sidescrolling
set colorcolumn=80               " show a bar on the 80th column
set signcolumn=yes               " leave space to the left of the screen for signs
set showtabline=2                " show buffers in tabline
set cursorline                   " highlight current line

let g:mapleader = " "

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif


call plug#begin()

        Plug 'projekt0n/github-nvim-theme'

call plug#end()

colorscheme github_dark
