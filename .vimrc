" rmsare

set nocompatible
set shell=bash
set fileformats=unix

" window settings
filetype plugin indent on
syntax on
set hls
set number
set laststatus=2
set mouse=a

" whitespace
set autoindent
set expandtab
set tabstop=8
set softtabstop=0
set shiftwidth=4
set smarttab

" menu options
set wildmenu
set wildmode=longest:full,full

" set colorscheme
colorscheme evening

" plugins!
 execute pathogen#infect()
