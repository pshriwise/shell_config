"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700
set noswapfile
" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

syntax on


colorscheme darkmate
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

set autoindent 
set smartindent

set number
set ruler

" 1 tab == 4 spaces
set shiftwidth=2
set tabstop=2

" Linebreak on 500 characters
set lbr
set tw=80

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


set hlsearch
set incsearch

nnoremap <leader>v :OverCommandLine<CR> %s/<C-r><C-w>/

function! VisualFindAndReplace()
  :OverCommandLine %s/
  :noh
endfunction
nnoremap <Leader>s :call VisualFindAndReplace()<CR> 

function! VisualFindAndReplaceWithSelection() range
  :'<,'>OverCommandLine s/
  :noh
endfunction
xnoremap <Leader>s :call VisualFindAndReplaceWithSelection()<CR>


let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_CompileRule_pdf='pdflatex -interaction=nonstopmode $*'
let g:Tex_ViewRule_pdf = 'open'


let Tex_FoldedSections=""
let Tex_FoldedEnvironments=""
let Tex_FoldedMisc=""


set backspace=indent,eol,start


