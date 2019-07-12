" ----------------------------------------------------------
" Default vim Config
" ----------------------------------------------------------
set ruler
set number
set relativenumber
set showcmd
set tag=tags;/

syn on se title
set background=dark

set list
set list listchars=tab:»\ ,trail:.,extends:»,precedes:«

set fdm=marker
set modeline

set scrolloff=5
set autochdir

filetype plugin indent on

let g:netrw_liststyle = 3
let g:netrw_browse_split = 2
let g:netrw_altv = 1
let g:netrw_winsize = 25

" augroup ProjectDrawer
"   autocmd!
"   autocmd VimEnter * :Vexplore
" augroup END

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
