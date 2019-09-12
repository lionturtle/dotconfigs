call plug#begin('~/.vim/plugged')
    "ranger
    Plug 'francoiscabrol/ranger.vim'
    "close buffer
    Plug 'rbgrouleff/bclose.vim'
    "colorscheme
    Plug 'dracula/vim', { 'as': 'dracula' } 
    "surrounds
    Plug 'tpope/vim-surround'
    "autopairs
    Plug 'jiangmiao/auto-pairs'
    "coc-completions and stuff
    Plug 'neoclide/coc.nvim', {'branch':'release'}
    "completions
    "Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
    "lsp
    Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': './install.sh'
    \ }
    "syntastic
    Plug 'vim-syntastic/syntastic'
    "neomake
    Plug 'neomake/neomake'
    "snippets
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    "airline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    "ployglot
    Plug 'sheerun/vim-polyglot'
    "tabular
    Plug 'godlygeek/tabular'
    "emmet - html superpower
    Plug 'mattn/emmet-vim'
    "haskell
    Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }
    Plug 'neovimhaskell/haskell-vim'
    Plug 'parsonsmatt/intero-neovim'
    Plug 'dag/vim2hs'
    Plug 'alx741/vim-stylishask'
    "reasonml
    Plug 'reasonml-editor/vim-reason-plus'
    "elixir-lang
    Plug 'elixir-editors/vim-elixir'
    Plug 'slashmili/alchemist.vim'
    Plug 'mhinz/vim-mix-format'
    "rust
    Plug 'rust-lang/rust.vim'
    "odin
    Plug 'Tetralux/odin.vim'
    call plug#end()

"colors and stuff
set termguicolors
set background=dark
colorscheme dracula
let g:deus_termcolors=256
set tabstop=4
set shiftwidth=4
set expandtab
    "line highlights
    set cursorline
    set cursorcolumn
    set number

"snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='deus'

"deoplete
"let g:LanguageClient_serverCommands = {
" \ 'haskell': ['hie-wrapper'],
"\ }

" enable autocomplete
"let g:deoplete#enable_at_startup = 1
"elixir
let g:mix_format_on_save = 1
let g:mix_format_options = '--check-equivalent'
"rust
let g:rustfmt_autosave = 1

"intero haskell
let g:intero_type_on_hover = 1
"stylish haskell
let g:stylishask_on_save = 1
"haskell-stuff
let g:LanguageClient_serverCommands = {'haskell': ['hie-wrapper']}
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
map <Leader>lh :call LanguageClient#textDocument_hover()<CR>
  au FileType haskell map <silent> <leader>t <Plug>InteroGenericType
  au FileType haskell map <silent> <leader>T <Plug>InteroType
  au FileType haskell nnoremap <silent> <leader>it :InteroTypeInsert<CR>

"floatpreview
let g:float_preview#docked = 1 
"neomake
call neomake#configure#automake('nwri', 1000)

