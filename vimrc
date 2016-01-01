nnoremap <F11> :set nonumber!<CR>:GitGutterDisable<CR>
map <C-n> :NERDTreeToggle<CR>

map <Leader>r :VimuxPromptCommand<CR>
map <Leader>a :VimuxRunLastCommand<CR>
let VimuxUseNearest = 0

" no need for shift
nnoremap    ;     :

" s for seek
nmap s <Plug>(easymotion-s2)

" q no more
map q :

" Write as root

set t_Co=256

" Vundle - plugin management
" mkdir -p $HOME/.vim/bundle
" git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
" vim +PluginInstall +qall
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'fatih/vim-go'
Plugin 'rodjek/vim-puppet'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'will133/vim-dirdiff'

call vundle#end()            " required, end vundle

filetype plugin indent on
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

" Per filetype indentation
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype yaml setlocal ts=2 sts=2 sw=2 expandtab

" Favo colors
try
  colorscheme desert
catch
endtry
highlight clear SignColumn

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

" unite plugin
nnoremap <Leader>f :Unite -start-insert file_rec/async<CR>

" fix common typos
" use W to write as root
command WQ wq
command Wq wq
command Q q
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!

syntax enable
syntax on             " Enable syntax highlighting
set autoindent
set background=dark
set backspace=indent,eol,start " Set for maximum backspace smartness"
set cmdheight=1         " Less Hit Return messages
set cursorline
set display+=uhex " Show unprintables as <xx>
set encoding=utf-8
set expandtab
set fileencoding=utf-8
set fileencodings=utf-8
set fileencodings=utf-8,ucs-bom,cp1251
set fileformat=unix
set fileformats=unix,dos,mac
set gdefault
set hlsearch	" Enable highlight search
set ignorecase
set incsearch
set laststatus=2        " Always show status bar
set linespace=1 " add some line space for easy reading
set list
set listchars=tab:»·,trail:·
set nocompatible      " We're running Vim, not Vi!
set noshowmode
set number
set pastetoggle=<F10>
set relativenumber
set scrolloff=3 " don't scroll any closer to top/bottom
set secure
set shortmess=aoOtT     " Abbreviate the status messages
set showcmd             " Show command I'm typing
set showmatch
set sidescrolloff=5 " don't scroll any closer to left/right
set smartcase
set smartindent
set smarttab
set softtabstop=2
set shiftwidth=2
set tabstop=2
set timeoutlen=500
set undodir=~/.vim/undodir
set undofile
set wildchar=<TAB>      " Character to start command line completion
set wildmenu            " Enhanced command line completion mode
set wildmode=longest:full,full

let g:UltiSnipsExpandTrigger       ="<c-tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsJumpForwardTrigger  = "<tab>"

let g:airline#extensions#branch#empty_message = 'no scm'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ctrlp#color_template = 'normal'
let g:airline#extensions#ctrlp#show_adjacent_modes = 1
let g:airline#extensions#eclim#enabled = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#hunks#hunk_symbols = ['+', '~', '-']
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#flags = 'f'
let g:airline#extensions#virtualenv#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='simple'

let g:delimitMate_balance_matchpairs = 1
let g:delimitMate_expand_cr = 2
let g:delimitMate_expand_inside_quotes = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_jump_expansion = 1

let g:rainbow_active = 1

let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"Go
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

" DirDiff settings
" http://www.vim.org/scripts/script.php?script_id=102
let g:DirDiffExcludes = "CVS,*.class,*.exe,.*.swp,.DS_Store"
