""""""""""""""""""""""""""""""""""""
" =>General settings
""""""""""""""""""""""""""""""""""""
"Set help window height
set helpheight=15

"Get out of VI's compatible mode.
set nocompatible

"Fish Shell
if &shell =~# 'fish$'
    set shell=sh
endif

"Enable modeline
set modeline

"Enable filetype plugin
filetype on
if has("eval") && v:version>=600
	filetype plugin on
	filetype indent on
endif

"Set to auto read(read again) when a file is changed from the outside
"(outside from the vim)
if exists("&autoread")
	set autoread
endif

"Set mapleader
let mapleader=","
let g:mapleader=","
let maplocalleader = ","

"Show command in status line
set showcmd

"Allow virtual editing in Visual block mode
set virtualedit=block
""""""""""""""""""""""""""""""""""""
"=> Colors and Font
""""""""""""""""""""""""""""""""""""
"Enable synatx hl, if the terminal supports colors
if &t_Co > 1
	syntax enable
endif

"Internationalizationi
if has("multi_byte")
	"keyboard and display works with this characters encoded in this, if
	"empty it equals 'encoding', now we set it to encoding
	set termencoding=&encoding
	"set encoding to another value, used to be the locale
	set encoding=utf-8
	"set the character encoding for the file of this buffer
	set fileencodings+=ucs-bom,utf-8,gbk,gb2312,big5,latin1,default
endif

"if you use vim in tty, 'uxterm -cjk' or putty with option 'Treat CJK
"ambiguous character as wide' on
if exists("&ambiwidth")
	set ambiwidth=double
endif

"set the gui options
if has("gui_running")
	" 'm' Menu bar is present
	set guioptions-=m
	" 'T' Include toolbar
	"set guioptions-=T
	" 'l''L' Lefthand scrollbar is present
	set guioptions-=l
	set guioptions-=L
	" 'r''R' Righthand scrollbar is present
	set guioptions-=r
	set guioptions-=R
endif

"Highlight current
if has("gui_running")
	if exists("&cursorline")
		set cursorline
	endif
endif
""""""""""""""""""""""""""""""""""""
" => Fileformat
""""""""""""""""""""""""""""""""""""
"Favorite fileformats
set ffs=unix,dos,mac
""""""""""""""""""""""""""""""""""""
" => VIM user interface
""""""""""""""""""""""""""""""""""""
"Set 7 lines to the cursor - when moving vertically
set scrolloff=7

"Turn on wild menu
set wildmenu

"Always show current position
set ruler

"The commandbar is 2 high
set cmdheight=1

"Do not redraw, when executing macros, registers and other commands that
"have not been typed
set lz

"Change buffer - without saving
set hid

"Set backspace
set backspace=eol,start,indent

"Backspace and cursor keys wrap to
"set whichwrap+=<,>,h,l
set whichwrap+=<,>

"Ignore case when searching
"set ignorecase
"have trouble when using ctags and cscope
set noignorecase
"If you have a pattern with at least one uppercase character, the search becomes case sensitive.
set smartcase

"The cursor will return to its original position when no match is found and when pressing <Esc>. You still need to finish the search command with
"<Enter> to move the cursor to the match.
set incsearch

"Set magic on
set magic

"No sound on errors
set noerrorbells
set novisualbell
set t_vb=

"Show matching bracket
set showmatch

"How many tenths of a second to blink
set mat=4

"Highlight search thing
set hlsearch
"""""""""""""""""""""""""""""""""""""
"" => Statusline
"""""""""""""""""""""""""""""""""""""
set laststatus=2
""""""""""""""""""""""""""""""""""""
" => Moving around and tab
""""""""""""""""""""""""""""""""""""
"Actually, the tab does not switch buffers, but my arrow bclose function ca be found in "Buffer related" section

"Tab configuration
map <Leader>tn :tabnew %<CR>
map <Leader>tc :tabclose<CR>

if v:version>=700
	set switchbuf=usetab
endif

if exists("&showtabline")
	set stal=2
endif
""""""""""""""""""""""""""""""""""""
"Parenthesis/bracket expanding
""""""""""""""""""""""""""""""""""""
vnoremap $p <Esc>`>a)<Esc>`<i(<Esc>
vnoremap $b <Esc>`>a]<Esc>`<i[<Esc>
vnoremap $r <Esc>`>a}<Esc>`<i{<Esc>
vnoremap $a <Esc>`>a><Esc>`<i<<Esc>
vnoremap $q <Esc>`>a"<Esc>`<i"<Esc>
vnoremap $$ <Esc>`>a'<Esc>`<i'<Esc>
vnoremap $c <Esc>`>o*/<Esc>`<O/*<Esc>
"""""""""""""""""""""""""""""""""""""
" => General Abbrev
""""""""""""""""""""""""""""""""""""""
"My information
iabbrev xdate <c-r>=strftime("%Y %b %d")<CR>
"iabbrev xauthor John Hsing(douglarek@outlook.com)
iabbrev xauthor John Hsing(douglarek@outlook.com)
"""""""""""""""""""""""""""""""""""""""
" => Editing mappings etc.
"""""""""""""""""""""""""""""""""""""""
"Move a line of text using control
nmap <Leader>j  mz:move+<CR>`z
nmap <Leader>k  mz:move-2<CR>`z
vmap <Leader>j  :move'>+<CR>`<my`>mzgv`yo`z
vmap <Leader>k  :move'<-2<CR>`>my`<mzgv`yo`z
""""""""""""""""""""""""""""""""""""
" " => General Autocommand
""""""""""""""""""""""""""""""""""""
" some general completions
autocmd FileType c,cpp iabbrev #i	#include
" autocmd FileType c,cpp,java,sh,perl inoremap {	{<CR>}<Esc>O
autocmd FileType c,cpp,java,perl inoremap {	{<CR>}<Esc>O
autocmd FileType c,cpp,java inoremap <	<><Left>
autocmd FileType sh,perl inoremap ` ``<Left>
autocmd FileType c,cpp,java,sh inoremap ' ''<Left>
autocmd FileType c,cpp,java,sh,perl inoremap " ""<Left>
autocmd FileType c,cpp,java inoremap ( ()<Left>
" autocmd FileType c,cpp,java,sh,perl inoremap [ []<Left>
autocmd FileType c,cpp,java,perl inoremap [ []<Left>
"""""""""""""""""""""""""""""""""""""
" => Buffer realted
"""""""""""""""""""""""""""""""""""""
"Open a dummy buffer for paste
map <Leader>q :e ~/buffer<CR>

"Restore cursor to file position in previous editing session
set viminfo='10,f1,<500,:20,/20,h,%,n~/.viminfo

function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

" Buffer - reverse everything ... :)
map <F9> ggVGg?

"Use the arrows to something usefull
"map <Right> :bn<CR>
"map <Left> :bp<CR>
"map <Down> :bdelete<CR>
""""""""""""""""""""""""""""""""""""""
" => Files and backup
""""""""""""""""""""""""""""""""""""""
"Turn backup off
set nobackup
set writebackup
"set noswapfile
"""""""""""""""""""""""""""""""""""""""
" => Folding
"""""""""""""""""""""""""""""""""""""""
"Enable folding, I find it very useful
"if exists("&foldenable")
"	set foldenable
"endif
"
"if exists("&foldlevel")
"	set foldlevel=0
"endif
"
"set foldmethod=indent
"set foldexpr=<Tab>
""""""""""""""""""""""""""""""""""""""""
" => Text option
""""""""""""""""""""""""""""""""""""""""
set expandtab
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal tabstop=4
setlocal backspace=2
setlocal smarttab
setlocal lbr
setlocal tw=500
""""""""""""""""""""""""""""""""""""""""
" => Indent
""""""""""""""""""""""""""""""""""""""""
"Auto indent
set autoindent

"Smart indet
set smartindent

"C-style indenting
set cindent

"Wrap line
set wrap
""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
""""""""""""""""""""""""""""""""""""""""""
map <Leader>sn ]
map <Leader>sp [
map <Leader>sa zg
map <Leader>s? z=
""""""""""""""""""""""""""""""""""""""""""""
" => File explorer
""""""""""""""""""""""""""""""""""""""""""""
"Split vertically
let g:explVertical=1

"Window size
let g:explWinSize=35

let g:explSplitLeft=1
let g:explSplitBelow=1

"Hide some file
let g:explHideFiles='.*.class$,.*.swp$,.*.pyc$,.*.swo$,.DS_Store$'

"Hide the help thing..
let g:explDetailedHelp=0
""""""""""""""""""""""""""""""""""""
" " => Minibuffer
""""""""""""""""""""""""""""""""""""
let g:miniBufExplModSelTarget = 1
let g:miniBufExplorerMoreThanOne = 0
let g:miniBufExplModSelTarget = 0
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplVSplit = 25
let g:miniBufExplSplitBelow=1

let g:bufExplorerSortBy = "name"
""""""""""""""""""""""""""""""""""""
" => Mode Changing, Insert, Normal, Commandline, Select, Viusal, Ex
""""""""""""""""""""""""""""""""""""
"It can be selected by Ctrl+G in visual mode to implement the effect of mouse.
set selectmode=mouse

"""""""""""""""""""""""""""""""""""""""""
" => Ctags
"""""""""""""""""""""""""""""""""""""""""
"remap C-] to :tjump
nmap <C-]> :tjump <C-R>=expand("<cword>")<CR><CR>
""""""""""""""""""""""""""""""""""""
" => Cscope
""""""""""""""""""""""""""""""""""""
if has("cscope") && filereadable("cscope.out")
	set csprg=/usr/bin/cscope
	" set cscope quickfix, not very convenient
	"set csqf=s-,c-,d-,i-,t-,e-
	" determine the order in which :cstag performs a search, cscope databases are searched first if csto equals 0
	set csto=1
	" use :cstag instead of :tag behavior ++++BUG: remove some lines and turn to Insert Mode
	set nocst
	" display the entire path
	set cspc=0
	" no indicating success or failure when adding a cscope database
	set nocsverb
	" add any database in current directory
	if filereadable("cscope.out")
		cs add cscope.out
		" else add database pointed to by environment
	elseif $CSCOPE_DB != ""
		cs add $CSCOPE_DB
	endif
	" reinit all connections, because the first add always gives an error
	cs reset
	" reopen the option
	set csverb

	" use suggestions
	nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>
endif
""""""""""""""""""""""""""""""""""""
" => Source completion
""""""""""""""""""""""""""""""""""""
"options for insert mode completion
set completeopt=menu,longest

"mapping for the completion's easy use
inoremap <expr> <CR>    pumvisible()?"\<C-Y>":"\<CR>"
inoremap <expr> <C-J>   pumvisible()?"\<PageDown>\<C-N>\<C-P>":"\<C-X>\<C-O>"
inoremap <expr> <C-K>   pumvisible()?"\<PageUp>\<C-P>\<C-N>":"\<C-K>"
inoremap <expr> <C-U>   pumvisible()?"\<C-E>":"\<C-U>"
""""""""""""""""""""""""""""""""""""
" => Quickfix
""""""""""""""""""""""""""""""""""""
if has("quickfix")
	autocmd FileType c,cpp,tex map <buffer> <Leader><Space> :write<CR>:make all<CR>:cwindow<CR><C-w>k
	nmap <Leader>cn :cnext<CR>
	nmap <Leader>cp :cprevious<CR>
	nmap <Leader>cw :cw 10<CR>
endif
""""""""""""""""""""""""""""""""""""
" => Man pages support
""""""""""""""""""""""""""""""""""""
runtime! ftplugin/man.vim
""""""""""""""""""""""""""""""""""""
" => Latex
""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""
" => Misc
""""""""""""""""""""""""""""""""""""
"Select all
nmap <C-a> ggVG

"Insert mode left/right
imap <C-l>  <Right>
imap <C-h>  <Left>
imap <C-e>  <Esc>A

"vimdiff
nmap <Leader>dt :diffthis<CR>
nmap <Leader>do :diffoff<CR>

"Remove the Windows ^M
noremap <Leader>m :%s/\r//g<CR>

"Paste toggle - when pasting something in, don't indent.
set pastetoggle=<F3>

"Remove indenting on empty line
imap <F2> <Esc>:s/\(\S*\)\s*$/\1/g<CR>:nohl<CR>i

"Super paste
inoremap <C-V> <Esc>:set paste<CR>mui<C-R>+<Esc>mv'uV'v=:set nopaste<CR>

let Tlist_Enable_Fold_Column = 0     "don't show left fold line
let Tlist_WinWidth = 20              "the width of taglist's window
let Tlist_Show_One_File = 1          "allow taglist to show onl tag of current file
let g:Tb_ForceSyntaxEnable = 1
"nmap <silent> <F2>   \di
"nmap <silent> <F3>   \ds
nmap <silent> <F2>   ,di
nmap <silent> <F3>   ,ds
nmap <silent> <F4>   :TlistToggle<CR>
nmap <silent> <F9>  :vert resize +10<CR>

let g:loaded_matchparen = 1
""""""""""""""""""""""""""""""""""""
" => Detect note filetype
""""""""""""""""""""""""""""""""""""
augroup filetypedetect
	"Note filetype
	au! BufRead,BufNewFile *.note	setfiletype note
augroup END
""""""""""""""""""""""""""""""""""""
" => Detect notes filetype
""""""""""""""""""""""""""""""""""""
augroup filetypedetect
	au BufNewFile,BufRead *.notes setf notes
augroup END
""""""""""""""""""""""""""""""""""""
" => Encoding related
""""""""""""""""""""""""""""""""""""
set encoding=UTF-8
set langmenu=zh_CN.UTF-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set fileencoding=utf-8
""""""""""""""""""""""""""""""""""""
" => vim vundle settings
"""""""""""""""""""""""""""""""""""
if isdirectory(expand('~/.vim/bundle/Vundle.vim'))
    filetype off
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
    Plugin 'gmarik/Vundle.vim'

    " Automatically opens popup menu for completions.
    Plugin 'vim-scripts/AutoComplPop'

    " BufExplorer Plugin for Vim.
    Plugin 'jlanzarotta/bufexplorer'

    " A windows style IDE for Vim 6.0.
    Plugin 'vim-scripts/winmanager'
    let g:winManagerWindowLayout = "FileExplorer|BufExplorer"
    nmap wm :WMToggle<cr>

    " Vim support for Rust file detection and syntax highlighting.
    Plugin 'wting/rust.vim'

    " Using the jedi autocompletion library for VIM.
    Plugin 'davidhalter/jedi-vim'
    let g:jedi#popup_select_first = 0
    let g:jedi#use_tabs_not_buffers = 0
    let g:jedi#use_splits_not_buffers = "bottom"
if has('python')
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
endif

    " Flake8 plugin for Vim.
    Plugin 'nvie/vim-flake8'
    let g:flake8_max_line_length=119
    let g:flake8_ignore="W391"
    autocmd FileType python map <buffer> <Leader>fl :call Flake8()<CR>

    " lean & mean status/tabline for vim that's light as air.
    Plugin 'bling/vim-airline'

    " A Git wrapper so awesome
    Plugin 'tpope/vim-fugitive'

    " Official mirror of Slimv versions released on vim.org
    Plugin 'kovisoft/slimv'

    "A Vim plugin which shows a git diff in the gutter (sign column) and stages/reverts hunks.
    Plugin 'airblade/vim-gitgutter'
    let g:gitgutter_sign_column_always = 1
    let g:gitgutter_max_signs = 10000000000
    highlight clear SignColumn
    nmap gt :GitGutterToggle<cr>

    " Monokai colorscheme, originally ported to vim by Damien Gombault
    Plugin 'tomasr/molokai'

    " Go development plugin for Vim
    Plugin 'fatih/vim-go'
    nmap <Leader>gr :GoRun<cr>
    nmap <Leader>gd :GoDef<cr>

    Plugin 'majutsushi/tagbar'
    nmap <leader>= :TagbarToggle<CR>
    let g:tagbar_autofocus = 1

    " vim2hs :: Vim -> Haskell
    Plugin 'dag/vim2hs'

    call vundle#end()
    filetype plugin indent on
endif

""""""""""""""""""""""""""""""""""""
" => vim python settings, from python source
"""""""""""""""""""""""""""""""""""
let g:PythonAutoAddImports = 1
" vimrc file for following the coding standards specified in PEP 7 & 8.
"
" To use this file, source it in your own personal .vimrc file (``source
" <filename>``) or, if you don't have a .vimrc file, you can just symlink to it
" (``ln -s <this file> ~/.vimrc``).  All options are protected by autocmds
" (read below for an explanation of the command) so blind sourcing of this file
" is safe and will not affect your settings for non-Python or non-C files.
"
"
" All setting are protected by 'au' ('autocmd') statements.  Only files ending
" in .py or .pyw will trigger the Python settings while files ending in *.c or
" *.h will trigger the C settings.  This makes the file "safe" in terms of only
" adjusting settings for Python and C files.
"
" Only basic settings needed to enforce the style guidelines are set.
" Some suggested options are listed but commented out at the end of this file.

" Number of spaces that a pre-existing tab is equal to.
" For the amount of space used for a new tab use shiftwidth.
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=8

" What to use for an indent.
" This will affect Ctrl-T and 'autoindent'.
" Python: 4 spaces
" C: tabs (pre-existing files) or 4 spaces (new files)
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
fu Select_c_style()
    if search('^\t', 'n', 150)
        set shiftwidth=8
        set noexpandtab
    el
        set shiftwidth=4
        set expandtab
    en
endf
au BufRead,BufNewFile *.c,*.h call Select_c_style()
au BufRead,BufNewFile Makefile* set noexpandtab

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
" Python: 119
" C: 99
au BufRead,BufNewFile *.py,*.pyw set textwidth=119
au BufRead,BufNewFile *.c,*.h set textwidth=99

" Turn off settings in 'formatoptions' relating to comment formatting.
" - c : do not automatically insert the comment leader when wrapping based on
"    'textwidth'
" - o : do not insert the comment leader when using 'o' or 'O' from command mode
" - r : do not insert the comment leader when hitting <Enter> in insert mode
" Python: not needed
" C: prevents insertion of '*' at the beginning of every line in a comment
au BufRead,BufNewFile *.c,*.h set formatoptions-=c formatoptions-=o formatoptions-=r

" Use UNIX (\n) line endings.
" Only used for new files so as to not force existing files to change their
" line endings.
" Python: yes
" C: yes
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

""""""""""""""""""""""""""""""""""""
" => vim rpm spec settings
"""""""""""""""""""""""""""""""""""
" ----------------------------------------------------------------------------
" The following section contains suggested settings.  While in no way required
" to meet coding standards, they are helpful.

" Set the default file encoding to UTF-8: ``set encoding=utf-8``

" Puts a marker at the beginning of the file to differentiate between UTF and
" UCS encoding (WARNING: can trick shells into thinking a text file is actually
" a binary file when executing the text file): ``set bomb``

" For full syntax highlighting:
"``let python_highlight_all=1``
"``syntax on``

" Automatically indent based on file type: ``filetype indent on``
" Keep indentation level from previous line: ``set autoindent``

" Folding based on indentation: ``set foldmethod=indent``

function! SKEL_spec()
        0r /usr/share/vim/current/skeletons/skeleton.spec
        language time en_US
        if $USER != ''
            let login = $USER
        elseif $LOGNAME != ''
            let login = $LOGNAME
        else
            let login = 'unknown'
        endif
        let newline = stridx(login, "\n")
        if newline != -1
            let login = strpart(login, 0, newline)
        endif
        if $HOSTNAME != ''
            let hostname = $HOSTNAME
        else
            let hostname = system('hostname -f')
            if v:shell_error
                let hostname = 'localhost'
            endif
        endif
        let newline = stridx(hostname, "\n")
        if newline != -1
            let hostname = strpart(hostname, 0, newline)
        endif
        exe "%s/specCURRENT_YEAR/" . strftime("%Y") . "/ge"
        exe "%s/specRPM_CREATION_DATE/" . strftime("%a\ %b\ %d\ %Y") . "/ge"
        exe "%s/specRPM_CREATION_AUTHOR_MAIL/" . login . "@" . hostname . "/ge"
        exe "%s/specRPM_CREATION_NAME/" . expand("%:t:r") . "/ge"
        setf spec
endfunction

" Remove unwanted spaces when save file
"nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
set linebreak
" note trailing space at end of next line
set showbreak=>\ \ \
"autocmd FileType c,python autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd BufWritePre * :%s/\s\+$//e

"""""""""""""""""""""""""
" Tips-and-Tricks "
"""""""""""""""""""""""""
" using C-x C-n (resp. C-x C-p) to insert a new line under (resp. over) the current line.
nmap <C-x><C-n> o<Esc>k
nmap <C-x><C-p> O<Esc>j

" Exit with C-x C-x when nothing to save.
nmap <C-x><C-x> :quit<cr>

try
    colorscheme molokai
catch /^Vim\%((\a\+)\)\=:E185/
    "
endtry
""""""""""""""""""""""""

" vim: set fdm=marker:
