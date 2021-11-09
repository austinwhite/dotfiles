set tabstop=4						" tabs are 4 spaces long
set softtabstop=4					" number of spaces to use for indenting
set shiftwidth=4					" number of spaces to use when inserting tab
set expandtab						" turn tabs into spaces
set smartindent						" indets based on the code syntax youre editing
set autoindent						" copy indent from previous line
set nu								" turn on line numbers
set relativenumber					" use relative line numbers
set nohlsearch						" search highlighting is not persistent
set incsearch						" incremental search
set noerrorbells					" no error bell sounds
set nowrap							" no text wrapping
set ignorecase smartcase			" search case-insensitive unless uppercase character is used
set hidden							" unsaved buffers are hidden
set noswapfile						" dont create swap files
set undofile						" store undo info in a file
set undodir=~/.vim/undodir			" where to store undo file
set scrolloff=8						" keep 8 rows visable when scrolling
set sidescrolloff=8					" keep 8 columns visable when sidescrolling
set colorcolumn=80					" show a bar on the 80th column
set signcolumn=yes					" leave space to the left of the screen for signs
set showtabline=2					" show buffers in tabline
set noshowmode						" hide default vim statusline
set cursorline						" highlight current line

nnoremap <SPACE> <Nop>
let g:mapleader = " "

" set python paths
let g:python3_host_prog = '/usr/bin/python3'
let g:loaded_python_provider = 0

" switch buffers
nnoremap <TAB> :bnext<CR>
nnoremap <S-TAB> :bprevious<CR>

" git mappings
nmap <leader>gb :Gblame<CR>
nmap <leader>gs :Git<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gph :Gpush<CR>
nmap <leader>gpl :Gpull<CR>

call plug#begin('~/.config/nvim/autoload/plugged')
	" better syntax support
	Plug 'sheerun/vim-polyglot'
	" file exlorer
	Plug 'scrooloose/NERDTree'
	" auto closes brackets, perens, quotes
	Plug 'jiangmiao/auto-pairs'
	" super 'cool' theme
	Plug 'arcticicestudio/nord-vim'
	" status line
	Plug 'vim-airline/vim-airline'
	" git integration
	Plug 'tpope/vim-fugitive'
call plug#end()

colorscheme nord

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline_powerline_fonts = 1

