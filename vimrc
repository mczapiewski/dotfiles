set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin('%USERPROFILE%/vimfiles/bundle/')
" alternatively, pass a path where Vundle should install plugins
call vundle#begin('~/.vim')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
Plugin 'https://github.com/scrooloose/nerdtree.git'
Plugin 'vim-airline/vim-airline'
Plugin 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plugin 'https://github.com/majutsushi/tagbar.git'
Plugin 'https://github.com/vimwiki/vimwiki.git'
Plugin 'taglist.vim'
Plugin 'xolox/vim-misc'
Plugin 'easytags.vim'
"experimental plugins:
Plugin 'terryma/vim-smooth-scroll'
Plugin 'matze/vim-move'
Plugin 'tpope/vim-commentary'
Plugin 'xolox/vim-notes'
Plugin 'tyrannicaltoucan/vim-quantum'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

"Plugin 'scroolosse/nerdTree'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


"automatic source .vimrc on write
autocmd! bufwritepost .vimrc source %

"enable mouse (for resize panes and selecting panes/tabs)
set mouse=a

"new Leader:
let mapleader = ","

"easier quitting
noremap <Leader>e :quit<CR>
noremap <Leader>E :q!<CR>
"moving through tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

"indenting lines
vnoremap < <gv
vnoremap > >gv

"moving through windows:
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

"if &term =~ "xterm"
"  256 colors
"  let &t_Co = 256
"  " restore screen after quitting
"  let &t_ti = "\<Esc>7\<Esc>[r\<Esc>[?47h"
"  let &t_te = "\<Esc>[?47l\<Esc>8"
"  if has("terminfo")
"    let &t_Sf = "\<Esc>[3%p1%dm"
"    let &t_Sb = "\<Esc>[4%p1%dm"
"  else
"    let &t_Sf = "\<Esc>[3%dm"
"    let &t_Sb = "\<Esc>[4%dm"
"  endif
"endif

"for Powerlin plugin
set laststatus=2
"set term=xterm-256color
"set termencoding=utf-8
set encoding=utf-8
"set t_Co=256
"set guifont=Source\ Code\ Pro\ for\ Powerline\ for\ Powerline
"set guifont=Ubuntu\ Mono\ derivative\ Powerline:10
"set guifont=inconsolata\ for\ powerline\ 15
"set guifont=ubuntu\ mono\ 10

"set guifont=DejaVu_Sans_Mono:h10:cEASTEUROPE:qDRAFT
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h10:cEASTEUROPE:qDRAFT
"let g:powerline_symbols = 'fancy'

filetype plugin indent on

"set jk as <Esc>
inoremap jk <Esc>

" set colorscheme for gui mode
"colorscheme pablo

if (&term =~ "xterm-256color") || (&term =~ "screen")   
  colorscheme elflord
else
  if (&term =~ "win32")
    colorscheme monrovia
  else
    "colorscheme desert
    colorscheme quantum
  endif
endif



"Toggle NERD
nmap <Leader>t :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"syntax highliting
filetype off
filetype plugin indent on
syntax on
"for OpSy arxml files:
au BufNewFile,BufRead *.arxml set filetype=xml

" XML folding
let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax
au FileType xml normal zR
au FileType py normal zR

"autocompletion highlight colors
highlight Pmenu ctermbg=blue ctermfg=white
highlight PmenuSel ctermbg=white ctermfg=blue
"display line numbers
set number
"set colorcolumn=80
"highlight ColorColumn ctermbg=blue

au BufNewFile,BufRead *.sdh set filetype=c

"incremental search
set incsearch
set ignorecase
set smartcase
"expand tabs to spaces and set tab width to 2
set expandtab
set shiftwidth=2
set softtabstop=2
"system clipboard to unnamed
set clipboard=unnamed
"set clipboard=unnamedplus

"highlight search and toggle mapping
set hlsearch
"noremap <C-;> :nohl<CR>
noremap <Leader>j :nohl<CR>
noremap <Leader>, <c-]>
"vnoremap <C-m> :nohl<CR>
"inoremap <C-m> :nohl<CR>

"set history length
set history=1000
set undolevels=1000

"if has('cscope')
"  set cscopetag cscopeverbose
"
"  if has('quickfix')
"     set cscopequickfix=s-,c-,d-,i-,t-,e-
"  endif
"
"  cnoreabbrev csa cs add
"  cnoreabbrev csf cs find
"  cnoreabbrev csk cs kill
"  cnoreabbrev csr cs reset
"  cnoreabbrev css cs show
"  cnoreabbrev csh cs help
"
"  command -nargs=0 Cscope cs add $VIMSRC/src/cscope.out $VIMSRC/src
"endif
"source ~/.vim/cscope_maps.vim

"ack.vim:
nmap <Leader>a <Esc>:Ack!

"match tags 
let g:mta_use_matchparen_group = 1
highlight MatchTag ctermfg=black ctermbg=lightgreen guifg=black guibg=lightgreen
highlight MatchParen cterm=bold ctermbg=none ctermfg=magenta

"vim indent guides
hi IndentGuidesOdd  ctermbg=white
hi IndentGuidesEven ctermbg=lightgrey

"for Tagbar plugin
nmap <F8> :TagbarToggle<CR>

" Configuration for Vim-Notes
":let g:notes_directories = ['~/Documents/notes', '~/Dropbox/Shared Notes']
:let g:notes_directories = ['~/notes']

" F5 runs python on current file
nnoremap <silent> <F5> :!clear;python %<CR>

" disable python-mode rope
let g:pymode_rope = 0

" color scheme for vimdiff
"if &diff
"  highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
"  highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
"  highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
"  highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red
"endif

" Fix the difficult-to-read default setting for diff text highlighting.  The
" " bang (!) is required since we are overwriting the DiffText setting. The
" highlighting
" " for "Todo" also looks nice (yellow) if you don't like the "MatchParen"
" colors.
highlight! link DiffText MatchParen

let g:airline_powerline_fonts=1

"filetype for asciidoc
autocmd BufRead,BufNewFile *.asciidoc,*.adoc
        \ setlocal autoindent expandtab tabstop=8 softtabstop=2 shiftwidth=2 filetype=asciidoc
        \ textwidth=70 wrap formatoptions=tcqn
        \ formatlistpat=^\\s*\\d\\+\\.\\s\\+\\\\|^\\s*<\\d\\+>\\s\\+\\\\|^\\s*[a-zA-Z.]\\.\\s\\+\\\\|^\\s*[ivxIVX]\\+\\.\\s\\+
        \ comments=s1:/*,ex:*/,://,b:#,:%,:XCOMM,fb:-,fb:*,fb:+,fb:.,fb:>

"swithc off pymode lint
let g:pymode_lint=0

"remove window menu bar and scrols
set go-=m
set go-=T
"set go-=r
set go-=L


let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_symbols = get(g:, 'airline_symbols', {})
let g:airline_symbols.space = "\ua0"

" Move by 'display lines' rather than 'logical lines' if no v:count was
" " provided.  When a v:count is provided, move by logical lines.
 nnoremap <expr> j v:count > 0 ? 'j' : 'gj'
 xnoremap <expr> j v:count > 0 ? 'j' : 'gj'
 nnoremap <expr> k v:count > 0 ? 'k' : 'gk'
 xnoremap <expr> k v:count > 0 ? 'k' : 'gk'
 " Ensure 'logical line' movement remains accessible.
 nnoremap <silent> gj j
 xnoremap <silent> gj j
 nnoremap <silent> gk k
 xnoremap <silent> gk k
