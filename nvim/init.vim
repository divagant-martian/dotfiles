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
    " Nice popup window
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    " Better syntax highlighting
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    " Color scheme
    Plug 'sjl/badwolf'
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

nnoremap o o<Esc>
let mapleader=","
set termguicolors

" Less files
set nobackup
set noswapfile

" Undo even after close
set undofile
set undodir=~/.undodir

" View git changes
set number
set signcolumn=no
let g:gitgutter_highlight_linenrs = 1
highlight link GitGutterAddLineNr DiffAdd
highlight link GitGutterChangeLineNr DiffChange
highlight link GitGutterDeleteLineNr DiffDelete
highlight link GitGutterChangeDeleteLineNr DiffChange

" Clipboard with the outside world
set clipboard+=unnamedplus

lua require('keys')

" Buffer navigation
set hidden
noremap <A-Left> :bp<CR>
noremap <A-Right> :bn<CR>
noremap <A-Down> <C-W><C-J>
noremap <A-Up> <C-W><C-K>
noremap <A-Del> :bw<CR>

" rust LSP
lua <<EOF
require 'lspconfig'.rls.setup {
  settings = {
    rust = {
      unstable_features = true,
      build_on_save = false,
      all_features = true,
    },
  },
}
EOF

" Treesitter config
lua <<EOF
    require'nvim-treesitter.configs'.setup {
        ensure_installed = {"rust", "comment"},
        highlight = {
    enable = true,              -- false will disable the whole extension
    },
}
EOF

" Colors. This needs to be at the end, in this order.
colorscheme badwolf
hi Normal guibg=NONE ctermbg=NONE
hi DiffAdd      gui=none    guibg=NONE          guifg=#aaf6b1
hi DiffChange   gui=none    guibg=NONE          guifg=#e2b870
hi DiffDelete   gui=none    guibg=NONE          guifg=#ef5350
hi DiffText     gui=none    guibg=NONE          guifg=fg
