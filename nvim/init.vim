call plug#begin("~/.local/share/nvim/plugged")
Plug 'dracula/vim'
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
call plug#end()

colorscheme dracula
set termguicolors

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
nnoremap <F5> :call LanguageClient#textDocument_formatting_sync()<CR>
nmap <leader>n <Plug>(qf_loc_next)
nmap <leader>p <Plug>(qf_loc_previous)
nmap <F3> <Plug>(qf_loc_toggle)
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
    let g:LanguageClient_serverCommands["rust"] = ["rls"]
endif
let g:LanguageClient_serverCommands["python"] = ["pyls"]

" let g:fzf_layout = { 'window': 'enew' }
let g:LanguageClient_fzfOptions=[ '--height', '40%', '--preview-window', 'wrap:right:50%', '--preview', '''/home/freyja/.local/share/nvim/plugged/fzf.vim/bin/preview.sh'' {}', '--bind', '?:toggle-preview']
set foldmethod=syntax
set foldlevelstart=20
nmap <Space> za
set completeopt-=preview

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)
"
hi Normal guibg=NONE ctermbg=NONE
