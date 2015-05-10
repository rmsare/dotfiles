" rmsare

set nocp
set nocompatible
set shell=bash
set fileformats=unix

" window settings
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
" execute pathogen#infect()

" vundle for github plugins
" set the runtime path to include Vundle and initialize
filetype plugin indent off 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            
filetype plugin indent off 

" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal

filetype plugin indent on
syntax on
