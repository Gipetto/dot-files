" just a few common things that I'm always setting up

" add to the runtime path to include plugins
set runtimepath+=$HOME/.vim/vim-markdown

" highlight syntax
syntax on

" always show line numbers
set number
set ruler
set showmode

" highlight more than 80 chars
set colorcolumn=80

" matching braces
set sm

" more readable tab stop on the command line
set tabstop=4

" always show 4 lines at the bottom of the screen
set scrolloff=4

" highlight search items
set hlsearch
set incsearch

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

" use Ctrl+L to toggle the line number counting method
function! g:ToggleNuMode()
	if(&rnu == 1)
		set nu
		au InsertEnter * :set nu
		au InsertLeave * :set nu
		au FocusLost * :set nu
		au FocusGained * :set nu
	else
	    set rnu
		au InsertEnter * :set nu
		au InsertLeave * :set rnu
		au FocusLost * :set nu
		au FocusGained * :set rnu
	endif
endfunc
nnoremap <C-L> :call g:ToggleNuMode()<cr>

" show KNF violations
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.*/
"let c_space_errors=1