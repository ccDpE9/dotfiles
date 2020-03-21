set nocompatible

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'vimwiki/vimwiki'
Plugin 'dylanaraps/wal'
Plugin 'vim-vdebug/vdebug'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'dense-analysis/ale'
" All of the plugins must be added before the following line
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
set number
set wrap
set t_Co=256
colorscheme wal
set background=dark
set guifont=Boxxy:h20
set thesaurus+=/home/comm/Documents/thesaurus.txt
set hlsearch
set backupext=.bak
set textwidth=72

" - Clipboard
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

" - SPLITS
" -- settings
set splitbelow
set splitright
" -- commands
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" - IDENTATION
autocmd FileType javascript setlocal ts=2 sw=2 sts=0 expandtab
autocmd FileType php setlocal ts=4 sw=4 sts=0 expandtab
autocmd FileType blade setlocal ts=4 sw=4 sts=0 expandtab

" - FOLDS
nnoremap <space> za
set foldmethod=syntax
set foldlevelstart=1
let php_folding=1
set foldtext=FoldText()

function! FoldText()
  let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
  let lines_count = v:foldend - v:foldstart + 1
  let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
  let foldchar = matchstr(&fillchars, 'fold:\zs.')
  let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
  let foldtextend = lines_count_text . repeat(foldchar, 8)
  let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
  return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction

" - VIMWIKI
" -- configuration
let g:vimwiki_list = [{"path": "~/vimwiki", "syntax": "markdown", "ext": ".md"}]
let g:vimwiki_folding='expr'
let g:vimwiki_global_ext = 0

" - PANDOC
let g:pandoc#syntax#conceal#use = 1

" - VDEBUG
let g:vdebug_options = {'server': '127.0.0.1'}
let g:vdebug_options = {'port': '9001'}

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
