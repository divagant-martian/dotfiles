" Plugs
call plug#begin("~/.local/share/nvim/plugged")
    " Smart comments
	Plug 'scrooloose/nerdcommenter'
    " Directory navigation
    Plug 'justinmk/vim-dirvish'
    " Nobody likes whitespace changes
    Plug 'ntpeters/vim-better-whitespace'
    " The pair sandwich
    Plug 'machakann/vim-sandwich'
    " Highlight pairs
    Plug 'jiangmiao/auto-pairs'
    " Show me tabs
    Plug 'vim-airline/vim-airline'
    " Default profiles for LSP
    Plug 'neovim/nvim-lspconfig'
    " View git changes in vim
    Plug 'airblade/vim-gitgutter'
call plug#end()

" Comments
map <F2> <Plug>NERDCommenterToggle
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
let g:NERDDefaultAlign = "left"

" Smart tabs
set ts=4 " set number of spaces for tab
set shiftwidth=4 " set number of spaces for reindent
set expandtab " use spaces instead of tabs
set smarttab " adjust to the next indentation level

" White space elimination
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0

" Moving arrows wraps lines
set whichwrap+=<,>,[,]

" Cursor line looks differently
set cursorline

" Tabs for buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Spell checking
syntax enable "Needed to check only comments, docs and strings
set spell

nmap o o<Esc>
set termguicolors

" Less files
set nobackup
set noswapfile

" Undo even after close
set undofile
set undodir=~/.undodir

" Clipboard with the outside world
set clipboard+=unnamedplus

