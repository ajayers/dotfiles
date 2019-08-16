" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

let g:plug_url_format = 'https://github.com/%s.git'

"" Colorschemes
Plug '~/.vim-plugins/morhetz/gruvbox'

"" Postgres
Plug '~/.vim-plugins/lifepillar/pgsql.vim'
Plug '~/.vim-plugins/vim-scripts/dbext.vim'

"" Navigation
Plug '~/.vim-plugins/scrooloose/nerdtree'

"" Git-related
Plug '~/.vim-plugins/Xuyuanp/nerdtree-git-plugin'
Plug '~/.vim-plugins/tpope/vim-fugitive'
Plug '~/.vim-plugins/airblade/vim-gitgutter'

" Working with quickfix list
Plug '~/.vim-plugins/tpope/vim-unimpaired'

"" Type Script
Plug '~/.vim-plugins/HerringtonDarkholme/yats.vim'

" Searching
Plug '~/.vim-plugins/mhinz/vim-grepper', {'on': ['Grepper', '<plug>(GrepperOperator)'] }

Plug '~/.vim-plugins/vim-airline/vim-airline'

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
