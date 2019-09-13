" rmsare

set nocp
set nocompatible
set shell=bash
set fileformats=unix

" linewidth
" set textwidth=80
set colorcolumn=80

" window settings
set hls
set number
set laststatus=2
set mouse=a

" easy split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" split opening
set splitright
set splitbelow

" whitespace
set autoindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab

" menu options
set wildmenu
set wildmode=longest:full,full

" set colorscheme
set background=dark
colorscheme solarized

" new commands
nmap <S-Enter> O<Esc>j
nmap <CR> o<Esc>k

" Map completion to tab
" from tip 102: https://vim.fandom.com/wiki/Smart_mapping_for_tab_completion
function! Smart_TabComplete()
  let line = getline('.')                         " current line

  let substr = strpart(line, -1, col('.')+1)      " from the start of the current
                                                  " line to one character right
                                                  " of the cursor
  let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
  if (strlen(substr)==0)                          " nothing to match on empty string
    return "\<tab>"
  endif
  let has_period = match(substr, '\.') != -1      " position of period, if any
  let has_slash = match(substr, '\/') != -1       " position of slash, if any
  if (!has_period && !has_slash)
    return "\<C-X>\<C-P>"                         " existing text matching
  elseif ( has_slash )
    return "\<C-X>\<C-F>"                         " file matching
  else
    return "\<C-X>\<C-O>"                         " plugin matching
  endif
endfunction

inoremap <Tab> <c-r>=Smart_TabComplete()<CR>

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
Plugin 'dense-analysis/ale'
Plugin 'luochen1990/rainbow'

" All of your Plugins must be added before the following line
call vundle#end()            

" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal

filetype plugin indent on
syntax on
