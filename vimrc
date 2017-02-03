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

augroup resCur
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END



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

set shiftwidth=4
set softtabstop=4
set tabstop=4


" Linebreak on 80 characters
set lbr
set tw=80

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


set hlsearch
set incsearch

set backspace=indent,eol,start

autocmd FileType gnuplot set formatoptions=l

autocmd Filetype html,xml,xsl let g:closetag_html_style=1
autocmd Filetype html,xml,xsl source ~/.vim/scripts/closetag.vim

au FileType python setlocal formatprg=autopep8\ -

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Over command plugin: visual search and replace
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Latex plugin: configureation
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_CompileRule_pdf='pdflatex -interaction=nonstopmode $*'
let g:Tex_ViewRule_pdf = 'open'


let Tex_FoldedSections=""
let Tex_FoldedEnvironments=""
let Tex_FoldedMisc=""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => clang-format plugin: configureation
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11"}

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" if you install vim-operator-user
autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>
autocmd FileType c,cpp,ojbc setlocal formatprg=clang-format\ -

"
"
"let g:cpp_class_scope_highlight = 1
""let g:cpp_experimental_simple_template_highlight = 1
""let g:cpp_experimental_template_highlight = 1
"
""let g:cpp_concepts_highlight = 1

