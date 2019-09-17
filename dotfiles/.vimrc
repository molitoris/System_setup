set nocompatible              "required
filetype off                  "required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

Plugin 'vim-latex/vim-latex'
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat = 'pdf'
"let g:Tex_CompileRule_pdf = 'mkdir -p build && pdflatex -interaction=batchmode -output-directory=build $* && biber build/$*.bcf && pdflatex -interaction=nonstopmode  -output-directory=build --include-directory=build $*'
" Opens the outputfile from the subdirectory build.
 let g:Tex_CompileRule_pdf = 'mkdir -p build && pdflatex -interaction=nonstopmode -output-directory=build $*'
let g:Tex_ViewRuleComplete_pdf = 'xdg-open build/$*.pdf'
let g:Tex_BibtexFlavor = 'biber'
let g:Tex_AdvancedMath = 1
let g:Tex_MultipleCompileFormats='pdf,bib,pdf'

" python syntax highlighting
" Plugin 'vim-syntastic/syntastic'

" python autocomplete
" Plugin 'davidhalter/jedi-vim'

" All Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" General configurations

syntax enable   "Enable syntax highlighting


set autoindent      "Indent when moving to next line
set copyindent      "Copy the previous indentation on autoindenting
set cursorline      "Visual line under cursor's current line
set expandtab       "Expand tabs into spaces
set history=1000    "Remember more commands and search history
set noerrorbells    "Do not beep
set shiftwidth=4    "When indenting uses 4 spaces
set showcmd         "Show cmd in last column of screen
set showmatch       "Show matching part of [] {} ()
set tabstop=4       "Set tabs to have 4 spaces
set undolevels=1000 "Use more levels for undo
set visualbell      "Do not beep
set wrap lbr    "Wrap long lines between words
"set nowrap     "Do not wrap lines

" Line numbers
" Combining absolute and relative line numbers results in hybrid line numbers
set number          "Show absolute line numbers
set relativenumber  "Show relative line numbers

" Search settings
set hlsearch    "Highlight search terms
set incsearch   "Show search matches as you type
set smartcase   "Ignore case if all lowercase

"File type plugins
filetype plugin on  "Load settings in the context of specific file types
filetype indent on  "Indenting intelligence based on syntax rules


" Jump up and down within a line which is wrapped on multiple lines
nnoremap j gj
nnoremap k gk

"Prevent navigation with arrows
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Quickly edit/reload the vimrc file with ev and sv
nmap <silent>  <leader>ev :e $MYVIMRC<CR>
nmap <silent>  <leader>sv :so $MYVIMRC<CR>



execute "silent! source .vim.local"
