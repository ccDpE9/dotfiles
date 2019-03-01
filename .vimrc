set nocompatible

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'nvie/vim-flake8'

Plugin 'scrooloose/nerdtree'

Plugin 'vimwiki/vimwiki'

Plugin 'dylanaraps/wal'

Plugin 'alvan/vim-closetag'

Plugin 'mattn/emmet-vim'

Plugin 'jwalton512/vim-blade'

Plugin 'ctrlpvim/ctrlp.vim'

" jsx syntax
Plugin 'pangloss/vim-javascript'
Plugin 'maxmellon/vim-jsx-pretty'


Plugin '2072/php-indenting-for-vim'

Plugin 'phpactor/phpactor'

" Plugin 'swekaj/php-foldexpr.vim'

Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

Plugin 'vim-php/phpctags'

Plugin 'vim-vdebug/vdebug'

Plugin 'mustache/vim-mustache-handlebars'

Plugin 'jparise/vim-graphql'

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

" splits
" moving between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" split opennig
set splitbelow
set splitright

" NERDTree size
:let g:NERDTreeWinSize=20

" Open new split panes to the right and bottom
set splitright

" Auto resize Vim splits to active split
set winwidth=104
set winheight=5
set winminheight=5
set winheight=999

" Changes default mapping and the default command to invoke CtlP
let g:ctrlp_map = '<c-p>'
let g:ctllp_cmd = 'CtrlP'
set runtimepath^=~/.vim/bundle/ctrlp.vim
" If set to 1, searches by filename, as oposed to full path
" Can be toggled on/off by pressing <c-d> inside the prompt
let g:ctrlp_by_filename = 1

" cursor
highlight Cursor guifg=white guibg=black


" --- IDENTATION --- "
autocmd FileType javascript setlocal ts=2 sw=2 sts=0 expandtab
autocmd FileType php setlocal ts=4 sw=4 sts=0 expandtab
autocmd FileType blade setlocal ts=4 sw=4 sts=0 expandtab



" --- FOLDS --- "
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


" --- FUZZY FINDER --- "
map ; :Files<C-P>


" --- PHPACTOR --- "

let mapleader=","

" Include use statement
nmap <Leader>u :call phpactor#UseAdd()<CR>

" Invoke the context menu
nmap <Leader>mm :call phpactor#ContextMenu()<CR>

" Invoke the navigation menu
nmap <Leader>nn :call phpactor#Navigate()<CR>

" Goto definition of class or class member under the cursor
nmap <Leader>o :call phpactor#GotoDefinition()<CR>

" Transform the classes in the current file
nmap <Leader>tt :call phpactor#Transform()<CR>

" Generate a new class (replacing the current file)
nmap <Leader>cc :call phpactor#ClassNew()<CR>

" Extract expression (normal mode)
nmap <silent><Leader>ee :call phpactor#ExtractExpression(v:false)<CR>

" Extract expression from selection
vmap <silent><Leader>ee :<C-U>call phpactor#ExtractExpression(v:true)<CR>

" Extract method from selection
vmap <silent><Leader>em :<C-U>call phpactor#ExtractMethod()<CR>

" --- VIMWIKI --- "
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

" --- MARKDOWN --- "
set foldenable
"let g:markdown_folding=1
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_enable_folding=1
let g:vimwiki_folding='expr'
let g:vim_markdown_set_header_folding_level=3
