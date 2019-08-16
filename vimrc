" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

let g:plug_url_format = 'https://github.com/%s.git'
Plug 'morhetz/gruvbox'

"XAJA|Plug 'fenetikm/falcon'
"XAJA|
"XAJA|Plug 'ayu-theme/ayu-vim'
"XAJA|
"XAJA|Plug 'lifepillar/pgsql.vim'
"XAJA|Plug 'vim-scripts/dbext.vim'
"XAJA|Plug 'HerringtonDarkholme/yats.vim'
"XAJA|
"XAJA|Plug 'scrooloose/nerdtree'
"XAJA|Plug 'Xuyuanp/nerdtree-git-plugin'
"XAJA|
"XAJA|Plug 'tpope/vim-fugitive'
"XAJA|Plug 'airblade/vim-gitgutter'
"XAJA|
"XAJA|" Working with quickfix list
"XAJA|Plug 'tpope/vim-unimpaired'
"XAJA|
"XAJA|" grepping
"XAJA|Plug 'mhinz/vim-grepper', {'on': ['Grepper', '<plug>(GrepperOperator)'] }

" Initialize plugin system
call plug#end()

""" ----------------------------------------------------------------------------------------------------------
""" Plug 'scrooloose/nerdtree'

"XAJA|" open when no command line arguments
"XAJA|autocmd StdinReadPre * let s:std_in=1
"XAJA|autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" open when vi directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" disable 'Press ?'
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeWinSize = 50


""" ----------------------------------------------------------------------------------------------------------
""" Plug 'vim-scripts/dbext.vim'
let g:dbext_default_profile_PG = 'type=PGSQL:host=bogi-sta-dock01.evs.anl.gov:port=5432:dbname=bogi_production:user=bogi'
"let g:dbext_default_PGSQL_bin = 'pgcli'
let g:dbext_default_profile = 'PG'

""" ----------------------------------------------------------------------------------------------------------
""" Plug 'scrooloose/nerdtree'

set nocompatible
set syntax=on

set bg=dark

" search
set incsearch
set hlsearch

"let ayucolor="light"  " for light version of theme
"let ayucolor="mirage" " for mirage version of theme
let ayucolor="dark"   " for dark version of theme
colorscheme gruvbox

command! FormatJSON %!python -m json.tool

" defaults
set ts=4 sts=4 sw=4 expandtab
set colorcolumn=110
