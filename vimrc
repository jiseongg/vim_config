
set nocompatible
filetype off

if has("syntax")
	syntax on
endif

set nu
set mouse=a
set backspace=indent,eol,start

set tabstop=2
set shiftwidth=2

set laststatus=2
set nocompatible
filetype off

set nu
set mouse=a

set tabstop=2
set shiftwidth=2

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'preservim/nerdtree'
Plugin 'morhetz/gruvbox'
Plugin 'nanotech/jellybeans.vim'
Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'
Plugin 'ronakg/quickr-cscope.vim'
Plugin 'majutsushi/tagbar'
Plugin 'cormacrelf/vim-colors-github'
call vundle#end()

filetype plugin indent on

" - gruvbox:
function! GruvBox()
	set background=dark
	nnoremap <silent> [oh :call gruvbox#hls_show()<CR>
	nnoremap <silent> ]oh :call gruvbox#hls_hide()<CR>
	nnoremap <silent> coh :call gruvbox#hls_toggle()<CR>
	nnoremap * :let %/ = ""<CR>:call gruvbox#hls_show()<CR>*
	nnoremap / :let @/ = ""<CR>:call gruvbox#hls_show()<CR>/
	nnoremap ? :let @/ = ""<CR>:call gruvbox#hls_show()<CR>?
	let g:gruvbox_contrast_dark='hard'
	colorscheme gruvbox
endfunction

" - jellybeans: 
function! JellyBeans()
	let g:jellybeans_use_term_background_color=1
	let g:jellybeans_use_term_italics=1
	colorscheme jellybeans
endfunction

" - vim-colors-github:
function! GithubColor()
	set background=light
	let g:github_colors_soft=1
	colorscheme github
endfunction

" - nerdtree:
nmap nerd :NERDTreeToggle<CR>

" - ctags:
set tags=./tags;
let g:easytags_async=1
let g:easytags_auto_highlight=0
let g:easytags_include_members=1
let g:easytags_dynamic_files=1

" - cscope:
function! LoadCscope()
	let db = findfile("cscope.out", ".;")
	if (!empty(db))
		let path = strpart(db, 0, match(db, "/cscope.out$"))
		set nocscopeverbose " suppress duplicate connection error
		exe "cs add " . db . " " . path
		set cscopeverbose
	" else add the database pointed to by environment variable
	elseif $CSCOPE_DB != ""
		cs add $CSCOPE_DB
	endif
endfunction
au BufEnter /* call LoadCscope()

" - tagbar:
nmap tbr :TagbarToggle<CR>
