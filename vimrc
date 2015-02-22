" Standard settings
set nocompatible      " We're running Vim, not Vi!
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

" Favo colors
colorscheme desert

" Enable highlight search
set hlsearch

" Show command information 
set showcmd

" Per filetype indentation
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype yaml setlocal ts=2 sts=2 sw=2 expandtab

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
