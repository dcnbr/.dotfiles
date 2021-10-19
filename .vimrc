" -- vundle --
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" -- plugins --

" -- jellybeans --
Plugin 'nanotech/jellybeans.vim'
let g:jellybeans_overrides = {
\ 'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
\ 'colorcolumn': { 'ctermbg': 'black', 'guibg': '303030'},
\}
if has('termguicolors') && &termguicolors
  let g:jellybeans_overrides['background']['guibg'] = 'none'
endif
" -- \jellybeans --

" -- goyo --
Plugin 'junegunn/goyo.vim'
let g:goyo_width = 84
let g:goyo_height = '100%'
function! s:goyo_enter()
  set number
  set relativenumber
endfunction

function! s:goyo_leave()
  set number
  set relativenumber
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

:command WQ :wq <bar> :q
:command QQ :q! <bar> :q!
" -- \goyo --

" -- \plugins --
call vundle#end()
filetype plugin indent on
" -- \vundle --

" -- user --
set tabstop=4
set shiftwidth=4
set softtabstop=4

set number
set relativenumber
set colorcolumn=80

colorscheme jellybeans

" credit Martin Tournoij - https://vi.stackexchange.com/a/456
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
command! TrimTails call TrimWhitespace()


" credit Eduardo Hernández and Dustin Howett
" https://github.com/microsoft/terminal/issues/4335#issuecomment-577365966
" cursor style config
if &term =~ '^xterm'
  " 1 or 0 -> blinking block
  " 2 -> solid block
  " 3 -> blinking underscore
  " 4 -> solid underscore
  " 5 -> blinking vertical bar
  " 6 -> solid vertical bar

  " enter vim
  autocmd VimEnter * silent !echo -ne "\e[3 q"
    " oherwise
    let &t_EI .= "\<Esc>[3 q"
    " insert mode
    let &t_SI .= "\<Esc>[5 q"
    " leave vim
  autocmd VimLeave * silent !echo -ne "\e[5 q"
endif
" -- \user --


