call plug#begin("~/.local/share/nvim/plugged")
Plug 'dracula/vim'
Plug 'sickill/vim-monokai'
Plug 'vim-airline/vim-airline'
Plug 'machakann/vim-sandwich'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ervandew/supertab'
Plug 'ntpeters/vim-better-whitespace'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'justinmk/vim-dirvish'
Plug 'airblade/vim-gitgutter'
Plug 'romainl/vim-qf'
Plug 'rust-lang/rust.vim'
Plug 'junegunn/fzf.vim'
Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}
Plug 'lervag/vimtex'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'yous/vim-open-color'
Plug 'kamykn/dark-theme.vim'
Plug 'alaviss/nim.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Telescope stuff
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
call plug#end()

colorscheme open-color
set termguicolors

" TreeSitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
}
EOF


nnoremap o o<Esc>
let mapleader=","
" set number of spaces for tab
set ts=4
" set number of spaces for reindent
set shiftwidth=4
" use spaces instead of tabs
set expandtab
" adjust to the next indentation level
set smarttab

set hidden
noremap <A-Left> :bp<CR>
noremap <A-Right> :bn<CR>
noremap <A-Down> <C-W><C-J>
noremap <A-Up> <C-W><C-K>
noremap <A-Del> :bw<CR>

let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
let g:NERDDefaultAlign = "left"

map <F2> <Plug>NERDCommenterToggle
set incsearch
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case

let g:LanguageClient_serverCommands = {}
nmap <leader>d :call LanguageClient#textDocument_definition()<CR>
nmap <leader>t :call LanguageClient#textDocument_typeDefinition()<CR>
nmap <leader>r :call LanguageClient_textDocument_references()<CR>
nmap <leader>m :call LanguageClient_textDocument_hover()<CR>
nmap <leader>n :call LanguageClient_textDocument_rename()<CR>
nnoremap <F5> :call LanguageClient#textDocument_formatting_sync()<CR>


nmap <leader>n <Plug>(qf_qf_next)
nmap <leader>p <Plug>(qf_qf_previous)
nmap <F4> <Plug>(qf_qf_toggle)

let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0

let g:tex_flavor = "latex"
autocmd FileType tex setlocal shiftwidth=2
" Completion for latex
call deoplete#custom#var('omni', 'input_patterns', {'tex': g:vimtex#re#deoplete})


set undofile
set undodir=~/.undodir
set nobackup
set noswapfile
set clipboard+=unnamedplus
set whichwrap+=<,>,[,]
set nostartofline
let g:gitgutter_highlight_linenrs = 1
syntax on
set showmatch
let g:airline_powerline_fonts = 1
let g:deoplete#enable_at_startup = 1
let g:airline#extensions#tabline#enabled = 1
set number
set cursorline
set signcolumn=no
highlight link GitGutterAddLineNr DiffAdd
highlight link GitGutterChangeLineNr DiffChange
highlight link GitGutterDeleteLineNr DiffDelete
highlight link GitGutterChangeDeleteLineNr DiffChange
if executable("rls")
    let g:LanguageClient_serverCommands["rust"] = ["rustup", "run", "stable", "rls"]
endif
let g:LanguageClient_serverCommands["python"] = ["pyls"]

" let g:fzf_layout = { 'window': 'enew' }
let g:LanguageClient_fzfOptions=[ '--height', '40%', '--preview-window', 'wrap:right:50%', '--preview', '''/home/freyja/.local/share/nvim/plugged/fzf.vim/bin/preview.sh'' {}', '--bind', '?:toggle-preview']
set foldmethod=syntax
set foldlevelstart=20
nmap <Space> za
set completeopt-=preview
augroup quickfix
    autocmd!
    autocmd FileType qf setlocal wrap
augroup END

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)
"
hi Normal guibg=NONE ctermbg=NONE

let g:omni_sql_no_default_maps = 1
set spell
