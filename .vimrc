  set nocompatible

  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()

  Plugin 'gmarik/Vundle.vim'
  Plugin 'nvie/vim-flake8'
  Plugin 'vimwiki/vimwiki'
  Plugin 'dylanaraps/wal'
  Plugin 'alvan/vim-closetag'
  Plugin 'pangloss/vim-javascript'
  Plugin '2072/php-indenting-for-vim'
Plugin 'vim-vdebug/vdebug'
Plugin 'jparise/vim-graphql'
Plugin 'MaxMEllon/vim-jsx-pretty'
" All of the plugins must be added before the following line
call vundle#end()

if has("autocmd")
  filetype plugin indent on
endif

let python_highlight_all=1

" basic
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
" edit fold style
let s:middot='.'
function! MyFoldText() " {{{
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}
set foldtext=MyFoldText()
let g:phpfold_text_right_lines=1


" - VIMWIKI
" -- configuration
let g:vimwiki_list = [{"path": "~/vimwiki", "syntax": "markdown", "ext": ".md"}]
let g:vimwiki_folding='expr'
let g:vimwiki_global_ext = 0


" - VDEBUG
let g:vdebug_options = {'server': '127.0.0.1'}
let g:vdebug_options = {'port': '9001'}


" - BUFFER "
" -- configuration
" -- commands
nnoremap <silent> bo :badd!<CR>
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>


" - MAPPINGS
" -- Find file in current directory and edit it.
function! Find(name)
  let l:list=system("find . -name '".a:name."' | perl -ne 'print \"$.\\t$_\"'")
" replace above line with below one for gvim on windows
" let l:list=system("find . -name ".a:name." | perl -ne \"print qq{$.\\t$_}\"")
  let l:num=strlen(substitute(l:list, "[^\n]", "", "g"))
  if l:num < 1
    echo "'".a:name."' not found"
    return
  endif
  if l:num != 1
    echo l:list
    let l:input=input("Which ? (CR=nothing)\n")
    if strlen(l:input)==0
      return
    endif
    if strlen(substitute(l:input, "[0-9]", "", "g"))>0
      echo "Not a number"
      return
    endif
    if l:input<1 || l:input>l:num
      echo "Out of range"
      return
    endif
    let l:line=matchstr("\n".l:list, "\n".l:input."\t[^\n]*")
  else
    let l:line=l:list
  endif
  let l:line=substitute(l:line, "^[^\t]*\t./", "", "")
  execute ":e ".l:line
endfunction
command! -nargs=1 Find :call Find("<args>")
