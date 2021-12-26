" add to the runtime path to include plugins...
"set runtimepath=$HOME/Projects/shawn/dot-files/vim,$VIMRUNTIME
" ... and use pathogen for plugin loading
"execute pathogen#infect()

set encoding=utf-8
set showcmd

" mo better whitespace inspection
:set listchars=eol:¬,tab:>-,trail:~,extends:>,precedes:<,space:·
hi SpecialKey ctermfg=grey guifg=grey25

" put those pesky swap files in a central place
set dir=~/tmp

syntax on
set number
set showmode

filetype plugin on
autocmd FileType markdown,text set nonumber

" netrw
let g:netrw_liststyle = 3
let g:netrw_banner = 0

" highlight more than 80 chars
set colorcolumn=80

" matching braces
set sm

" more readable tab stop on the command line
set tabstop=4
set backspace=indent,eol,start
set expandtab

" always show 4 lines at the bottom of the screen
set scrolloff=4

" highlight search items
set hlsearch
set incsearch
set ignorecase
set smartcase

" auto-indent code
set autoindent
set smartindent
set cindent

" smoother changes
set ttyfast

" relative line numbers
" set rnu
"au InsertEnter * :set nu
"au InsertLeave * :set rnu
"au FocusLost * :set nu
"au FocusGained * :set rnu

" Racer (syntax completion)
"let g:racer_cmd

" Syntastic
"let g:syntastic_rust_checkers = ['cargo']
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

" statusline moxy
set noruler
set laststatus=2
set statusline=%F\ | 
"set statusline+=%{FugitiveStatusline()}
set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%=[%l,%L]\

" map `w!!` to override the need for sudo
cmap w!! %!sudo tee > /dev/null %
