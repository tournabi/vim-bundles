" --- .vimrc ---


" --- Global settings independent of plugins or OS.

" Pathogen load

set fileformats=dos,unix " Some bundles are saved with windows line endings.

" Setup autoload/pathogen.vim
if has("mac") || has("macunix")
	set runtimepath=~/.vim,$VIMRUNTIME
endif
if has("win32")
	set runtimepath=w:/.vim,$VIMRUNTIME
endif

call pathogen#infect()


" Color Scheme

if has('gui_running')
	set background=light
else
	let g:solarized_termcolors=16
	set background=dark
endif

colorscheme solarized


" --- Abbreviations (imaps plugin)

iab wuh (I don't know what this means. -cjh)
imap <A--> �


" --- Dvorak keys

map t l
map T L
map <C-W>t <C-W>l
map! <C-W>t <C-W>l
map <C-W>T <C-W>L
map! <C-W>T <C-W>L


" --- General keys

let maplocalleader=','

noremap <ESC> :nohl<CR> <ESC>

fun! Trimy()
	exe '%s!\s\+$!!e'
	exe '%s!\n\n*\%$!!e'
	exe "nohl"
endfun
map <LocalLeader>trim :call Trimy()<CR>

map + zo
map = zc
map ; :
map <MiddleMouse> <Nop>
imap <MiddleMouse> <Nop>
map gs ]s
map gS [s
noremap <F7> <ESC>:set spell!<CR>
noremap! <F7> <ESC>:set spell!<CR>
vmap  d
nmap S :%s!
vmap S :%s!


" --- File browsing

noremap <C-S> <ESC>:w<CR>
inoremap <C-S> <ESC>:w<CR>


" --- File types

filetype on
filetype plugin on
syntax enable
syntax on


	" Ruby

	let ruby_fold=2
	au BufRead,BufNewFile *.rb set tags=.tags

	map <LocalLeader>r" :s!"!'!g<CR>
	map <LocalLeader>r' :s!'!"!g<CR>
	map <LocalLeader>r) :s!)\\|(! !g<CR>

	" Wrap current word in #{}
	map <LocalLeader>," ebi#{<ESC>ea}

	function! LogFix()
		silent! %s!\([Ll]og\.\w*\)(\(.*\))!\1 \2
		silent! %s/\([Ll]og\.\w* .*\)\$!\.to_s/\1 #{$!}
	endfunction


	" Others

	au BufNewFile,BufRead *.ahk setf ahk
	au BufNewFile,BufRead *.log setf log
	au BufNewFile,BufRead *.vb setf vb
	au BufRead,BufNewFile *.vm  setf velocity

	map <LocalLeader>fh :set ft=html<CR>
	map <LocalLeader>fj :set ft=javascript<CR>
	map <LocalLeader>fr :set ft=ruby<CR>
	map <LocalLeader>fs :set ft=sql<CR>
	map <LocalLeader>fv :set ft=vb.net<CR>


set autochdir
set autoindent
set autoread
set backspace=2
set cryptmethod=blowfish
set cmdheight=2
set confirm
set cpoptions+=J
set cursorline
"set encoding=utf-8
set equalalways
set foldnestmax=2
set hidden
set hlsearch
set ignorecase
set incsearch
set iskeyword+=;
set laststatus=2
set linebreak
set nocompatible
set nowrapscan
set sessionoptions=buffers,curdir,folds,tabpages,winsize
set shiftwidth=4
set shiftround
set showbreak=�
set hl=@:Text
set showcmd
set showmatch
set showmode
set smartindent
set smarttab
set softtabstop=4
set statusline=%<%f%h%m%r%=\ \ \ \ \ \ \ \ \ \ %y\ \ \ (%{&ff})\ \ \ %l:%c\ "there's a space before this comment.
set tabstop=4
set timeoutlen=1500
set wildchar=<Tab>
set wildmenu
set whichwrap=b,h,l,<,>,[,]
set viminfo+=!


" Change the status bar color based on the mode.
set laststatus=2
if version >= 700
	au InsertEnter * hi StatusLine term=reverse guibg=lightgreen
	au InsertEnter * hi Cursor guibg=green
	au InsertLeave * hi StatusLine term=reverse guibg=orange
	au InsertLeave * hi Cursor guibg=orange
endif


" GUI Specific

if has("gui_running")
	set guioptions+=c
	set guioptions-=L
	set guioptions-=T

	set guitablabel=%t

	set splitright
endif


" --- Plugin specific

	let g:DrChipTopLvlMenu= "Plugin."


	" --- Align
	map <Leader>ah :Align "=>"<CR>


	" --- acp AutoComplPop
	let g:acp_enableAtStartup = 0
	let g:acp_behaviorSnipmateLength = 1


	" --- IndentConsistencyCop
	noremap <F3> <ESC>:IndentConsistencyCop<CR>
	noremap! <F3> <ESC>:IndentConsistencyCop<CR>


	" --- Lusty File Explorer
	map <silent> <LocalLeader>lf :LustyFilesystemExplorer<CR>
	map <silent> <LocalLeader>lr :LustyFilesystemExplorerFromHere<CR>
	noremap <LocalLeader>tt <ESC>:tabedit<CR>:LustyFilesystemExplorer<CR>
	noremap <LocalLeader>nn <ESC>:tabnew<CR>
	set wildignore=*_svn,*.dll,*.exe,*.msi,*.zip,*.com,*.gif,*.ico,*.jpg,*.png,*.xpm


	" --- Lusty Juggler
	map <LocalLeader>lg :LustyJuggler<CR>


	" --- Nerd Commenter
	let g:NERDShutUp = 1


	" --- Nerd Tree
	let g:NERDTreeShowBookmarks = 1
	let g:NERDTreeMapOpenInTab = 0
	map <LocalLeader>ntc :NERDTreeClose<CR>
	map <LocalLeader>nto :NERDTree<CR>
	map <LocalLeader>ntw :NERDTree c:/Users/chart/Work<CR>


    " --- Session
    let g:session_autoload = 'yes'
    let g:session_autosave = 'no'

	" --- Session Manager
	map <LocalLeader>ls :SessionList<CR>


    " --- snipMate
	let g:snips_author = 'Colby Hart'
		function! Unfold()
			set foldlevel=100
			return ''
		endfunction


	" --- SqlFormatter
	let g:sqlutil_align_comma = 1
	let g:sqlutil_keyword_case = '\L'
	map <LocalLeader>sf :SQLUFormatter<CR>
	let g:xml_syntax_folding = 1


	" --- Syntastic
	let g:syntastic_check_on_open=1
    let g:syntastic_auto_loc_list=1
    let g:syntastic_loc_list_height=3


	" --- Tagbar
	nmap <F8> :TagbarToggle<CR>


	" --- vim-rails
	let g:rails_ctags_arguments='--languages=-javascript --exclude=vendor'


	" --- vim-rake
	let g:rake_ctags_arguments='--languages=-javascript --exclude=vendor'


" --- Operation System Specific


	" --- Mac Mappings and Settings.
	if has("mac") || has("macunix")

		map <D-n> <C-n>
		map! <D-n> <C-n>
		map <D-o> <C-O>
		map! <D-o> <C-O>
		map <D-s> <C-s>
		map! <D-s> <C-s>
		map <D-t> <C-t>
		map! <D-t> <C-t>

		set dir=/tmp
		"set shell=bash

		map <LocalLeader>HT :%!tidy -f /tmp/tidy.txt -config ~/.tidy<CR>:vsplit /tmp/tidy.txt<CR>:q


		if has("gui_running")
			set antialias

			set columns=100
			set lines=65
		endif
	endif


	" --- Windows Mappings and Settings.
	if has("win32")

		" Backspace in Visual mode deletes selection
		vnoremap <BS> d

		" CTRL-X are Cut
		vnoremap <C-X> "+x

		" CTRL-C are Copy
		vnoremap <C-C> "+y

		" CTRL-V are Paste
		map <C-V>        "+gP
		noremap! <C-V>    <ESC>"+gPa
		cmap <C-V>        <C-R>+

		" CTRL-A is Select All
		noremap <C-A> gggH<C-O>G
		inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
		cnoremap <C-A> <C-C>gggH<C-O>G

		" CTRL-Tab is Next window
		noremap <C-Tab> <C-W>w
		inoremap <C-Tab> <C-O><C-W>w
		cnoremap <C-Tab> <C-C><C-W>w

		set dir=$TMP

		au BufRead,BufNewFile *.rb set tags=tags,c:/Users/chart/Work/Code/ruby/tags

		fun! Tidy()
			exe "silent %!tidy -f " . $TMP . "\\tidy.txt -config h:/.tidy"
			exe "silent vsplit $TMP/tidy.txt"
		endfun
		map <LocalLeader>HT :call Tidy()<CR>
		map <LocalLeader>HX :%!tidy -i -q -xml -w 80<CR>:%s/^  <\(\w\)/\r  <\1/e<CR>:%s/^  <!/\r  <!/e<CR>:nohl<CR>
		map <LocalLeader>HC :%!csstidy - --sort_properties=true<CR>

		if has("gui_running")
			set columns=109
			set lines=66

			set guifont=Consolas:h9
		endif

	endif
