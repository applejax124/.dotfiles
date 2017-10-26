" VIM config file (.vimrc)
" by: Cami Carballo
" LAST EDIT : 30 August 2017

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
set nowrap          "don't wrap lines
set tabstop=2       "a tab is 2 spaces
set softtabstop=2   "backspace pretends like a tab is removed (even if expanded to spaces)
set expandtab       "expand tabs to spaces
set shiftwidth=2    "autoindent with 2 spaces
set number  "show relative line numbers
set showmatch       "show matching parentheses

"Remap JK to be ESC
"map <J-K> <Esc>

"Map arrow keys to first line, last line, front, and back


"Force me to use HJKL
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

""""""""""""""""
" VIM BEHAVIOR "
""""""""""""""""
set noswapfile      "don't create swap files
set cursorline!
hi CursorLine cterm=NONE ctermbg=8 "underline the current line (for quick orientation)

