set nocompatible

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'dense-analysis/ale'

call vundle#end()

if has("autocmd")
  filetype plugin indent on
endif

let python_highlight_all=1

" - Basic
syntax on
set encoding=utf-8
set showmode
set showcmd
set shell=/bin/bash
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent
set fileformat=unix
set wrap
set t_Co=256
set background=dark
set guifont=Boxxy:h20
set thesaurus+=/home/comm/Documents/thesaurus.txt
set hlsearch
set backupext=.bak

" - Clipboard
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

" - IDENTATION
autocmd FileType javascript setlocal ts=2 sw=2 sts=0 expandtab
autocmd FileType php setlocal ts=4 sw=4 sts=0 expandtab
autocmd FileType blade setlocal ts=4 sw=4 sts=0 expandtab

" - PANDOC
let g:pandoc#syntax#conceal#use = 1

" - BUFFER
" -- configuration
" -- commands
nnoremap <silent> bo :badd!<CR>
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" - Linters
" -- ALE
let g:ale_sign_error = '>>'
let g:ale_sign_warrning = '--'
" -- Prettier
" --- configuration
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint', 'prettier'],
\   'typescript': ['eslint', 'prettier']
\}
let g:ale_fix_on_save = 1
" --- commands
nmap <F7> <Plug>(ale_fix)
