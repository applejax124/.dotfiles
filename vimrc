" VIM config file (.vimrc)
" by: Cami Carballo
" LAST EDIT : 20 November 2018

" use VIM instead of VI
set nocompatible

" required (?)
filetype off
filetype plugin on

syntax on

""""""""""""""""""""
" EDITING BEHAVIOR "
""""""""""""""""""""
set showmode        "always show the mode we're currently editing in
"set nowrap          "don't wrap lines
set tabstop=4       "a tab is 4 spaces
set softtabstop=4   "backspace pretends like a tab is removed (even if expanded to spaces)
set expandtab       "expand tabs to spaces
set shiftwidth=4    "autoindent with 4 spaces
set number          "show line numbers
set showmatch       "show matching parentheses

"Remap JK to be ESC
inoremap jk <ESC>

""""""""""""""""
" VIM BEHAVIOR "
""""""""""""""""
set noswapfile      "don't create swap files
