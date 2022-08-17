" Plugs
call plug#begin("~/.local/share/nvim/plugged")
    " Smart comments
    Plug 'scrooloose/nerdcommenter'
    " Directory navigation
    Plug 'justinmk/vim-dirvish'
    " Nobody likes whitespace changes
    " The pair sandwich
    Plug 'machakann/vim-sandwich'
    " Autoclose pairs
    Plug 'cohama/lexima.vim'
    " Show me tabs
    Plug 'vim-airline/vim-airline'
    " Default profiles for LSP
    Plug 'neovim/nvim-lspconfig'
    " View git changes in vim
    Plug 'lewis6991/gitsigns.nvim'
    " Plug 'airblade/vim-gitgutter'
    " Nice popup window
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-ui-select.nvim'
    " Better syntax highlighting
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    " spelling with Treesitter
    Plug 'lewis6991/spellsitter.nvim'
    " Color scheme
    Plug 'sjl/badwolf'
    " Autocomplete
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-vsnip'
    Plug 'hrsh7th/vim-vsnip'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'voldikss/vim-floaterm'
    " open file at line and column
    Plug 'wsdjeg/vim-fetch'
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

" Spell checking. Treesitter messes around with this
" syntax enable "Needed to check only comments, docs and strings
" set spell

nnoremap o o<Esc>
let mapleader=","
set termguicolors

" Less files
set nobackup
set noswapfile

" Undo even after close
set undofile
set undodir=~/.undodir

" Clipboard with the outside world
set clipboard+=unnamedplus

lua require('lsp')
lua require('autocomplete')
lua require('telescope_configed')
lua require('keys')
lua require('spellsitter').setup()
lua require('gitsigns_config')

" Buffer navigation
set hidden
noremap <A-Left> :bp<CR>
noremap <A-Right> :bn<CR>
noremap <A-Down> <C-W><C-J>
noremap <A-Up> <C-W><C-K>
noremap <A-Del> :bw<CR>

nnoremap <A-t> A<CR>// TODO:
inoremap <A-t> <Esc>A<CR>// TODO:

" Treesitter config
lua <<EOF
    require'nvim-treesitter.configs'.setup {
        ensure_installed = {"rust", "comment"},
        highlight = {
    enable = true,              -- false will disable the whole extension
    },
}
EOF

" Folding with Treesitter
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevelstart=20
nmap <Space> za

" Colors. This needs to be at the end, in this order.
colorscheme badwolf
hi Normal guibg=NONE ctermbg=NONE
hi DiffAdd      gui=none    guibg=NONE          guifg=#aaf6b1
hi DiffChange   gui=none    guibg=NONE          guifg=#e2b870
hi DiffDelete   gui=none    guibg=NONE          guifg=#ef5350
hi DiffText     gui=none    guibg=NONE          guifg=fg

autocmd User TelescopePreviewerLoaded setlocal wrap
autocmd BufNewFile,BufRead *.jrnl set syntax=markdown
autocmd BufNewFile,BufRead *.jrnl set tabstop=2
autocmd BufNewFile,BufRead *.jrnl set shiftwidth=2

autocmd BufRead,BufNewFile *.htm,*.html,*.js,*.css setlocal tabstop=2 shiftwidth=2 softtabstop=2
