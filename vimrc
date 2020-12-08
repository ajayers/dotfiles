" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

let g:plug_url_format = 'https://github.com/%s.git'

"" Colorschemes
Plug '~/.vim-plugins/dracula/vim'
Plug '~/.vim-plugins/kyoz/purify', { 'rtp': 'vim' }
Plug '~/.vim-plugins/sonph/onehalf', { 'rtp': 'vim' }
Plug '~/.vim-plugins/tomasr/molokai'

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

"XAJA|"" Type Script
"XAJA|Plug '~/.vim-plugins/Quramy/tsuquyomi'
"XAJA|"Plug '~/.vim-plugins/vim-syntastic/syntastic'
"XAJA|Plug '~/.vim-plugins/neomake/neomake'
Plug '~/.vim-plugins/pangloss/vim-javascript'    " JavaScript support
Plug '~/.vim-plugins/leafgarland/typescript-vim' " TypeScript syntax
Plug '~/.vim-plugins/maxmellon/vim-jsx-pretty'   " JS and JSX syntax

" Searching
Plug '~/.vim-plugins/mhinz/vim-grepper', {'on': ['Grepper', '<plug>(GrepperOperator)'] }

" vim gui
Plug '~/.vim-plugins/vim-airline/vim-airline'

" Elixir
" vim-elixir
Plug '~/.vim-plugins/elixir-editors/vim-elixir'
" elixir-ls
Plug '~/.vim-plugins/elixir-lsp/elixir-ls', {'do': { -> g:ElixirLS.compile() }}
" coc
Plug '~/.vim-plugins/neoclide/coc.nvim'
Plug '~/.vim-plugins/elixir-lsp/coc-elixir', {'do': 'yarn install && yarn prepack'}

" other
Plug '~/.vim-plugins/ervandew/supertab'
Plug '~/.vim-plugins/tpope/vim-endwise'

" Initialize plugin system
call plug#end()

let g:coc_global_extensions = ['coc-elixir', 'coc-diagnostic', 'coc-tsserver' ]

""" ----------------------------------------------------------------------------------------------------------
""" Plug 'scrooloose/nerdtree'
"""

" open when no command line arguments
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" open when vi directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" disable 'Press ?'
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeWinSize = 50


""" ----------------------------------------------------------------------------------------------------------
""" Plug 'ervandew/supertag'
"""
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = '<c-n>'

""" ----------------------------------------------------------------------------------------------------------
""" Plug 'vim-scripts/dbext.vim'
"""
let g:dbext_default_profile_PG = 'type=PGSQL:host=bogi-sta-dock01.evs.anl.gov:port=5432:dbname=bogi_production:user=bogi'
"let g:dbext_default_PGSQL_bin = 'pgcli'
let g:dbext_default_profile = 'PG'


""" ----------------------------------------------------------------------------------------------------------
""" Plug 'neomake/neomake'
"""
"XAJA|call neomake#configure#automake('w')
"XAJA|let g:neomake_open_list = 2


""" ----------------------------------------------------------------------------------------------------------
""" Plug 'mhinz/grepper'
"""
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

nnoremap <leader>G :Grepper -tool git<cr>
nnoremap <leader>g :Grepper -tool ag<cr>

""" ----------------------------------------------------------------------------------------------------------
""" Other
"""

"XAJA|"let g:tsuquyomi_disable_quickfix = 1
"XAJA|"let g:syntastic_typescript_checkers = ['tsuquyomi']

set nocompatible
set syntax=on

set bg=dark

" search
set incsearch
set hlsearch

"let ayucolor="light"  " for light version of theme
"let ayucolor="mirage" " for mirage version of theme
"let ayucolor="dark"   " for dark version of theme
set termguicolors
colorscheme dracula
"colorscheme purify
"let g:plurify_inverse = 0
"colorscheme onehalfdark
"colorscheme molokai

command! FormatJSON %!python -m json.tool

" defaults
set ts=4 sts=4 sw=4 expandtab
set colorcolumn=110

" CoC
"
" " TextEdit might fail if hidden is not set.
" set hidden
" 
" " Some servers have issues with backup files, see #649.
" set nobackup
" set nowritebackup
" 
" Give more space for displaying messages.
set cmdheight=3

" " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" " delays and poor user experience.
" set updatetime=300
" 
" " Don't pass messages to |ins-completion-menu|.
" set shortmess+=c
" 
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes
" 
" " Use tab for trigger completion with characters ahead and navigate.
" " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" " other plugin before putting this into your config.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" 
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
" 
" " Use <c-space> to trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()
" 
" " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" " position. Coc only does snippet and additional edit on confirm.
" if exists('*complete_info')
"   inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" else
"   imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" endif
" 
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"    execute 'h '.expand('<cword>')
"   else
     call CocAction('doHover')
"   endif
endfunction
" 
" " Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')
" 
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)
" 
" augroup mygroup
"   autocmd!
"   " Setup formatexpr specified filetype(s).
"   autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"   " Update signature help on jump placeholder.
"   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" augroup end
" 
" " Applying codeAction to the selected region.
" " Example: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)
" 
" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" " Introduce function text object
" " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
" xmap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap if <Plug>(coc-funcobj-i)
" omap af <Plug>(coc-funcobj-a)
" 
" XAJA|" Use <TAB> for selections ranges.
" XAJA|" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" XAJA|" coc-tsserver, coc-python are the examples of servers that support it.
" XAJA|nmap <silent> <TAB> <Plug>(coc-range-select)
" XAJA|xmap <silent> <TAB> <Plug>(coc-range-select)
" 
" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" " Add (Neo)Vim's native statusline support.
" " NOTE: Please see `:h coc-status` for integrations with external plugins that
" " provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

