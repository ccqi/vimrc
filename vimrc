" Some basic VIM settings

au BufReadPost *.pl   set keywordprg=perldoc\ -f
colorscheme desert 
filetype plugin indent on
nnoremap j gj
nnoremap k gk
set background=dark
set bs=2
set encoding=utf-8
set fillchars+=stl:\ ,stlnc:\
set foldlevel=99
set foldmethod=indent
set hidden
set history=1000
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set number
set showmatch
set smartcase
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set t_Co=256
set undolevels=1000
syntax enable

set nobackup
set nowritebackup
set noswapfile

" tabs
set softtabstop=2
set shiftwidth=2
set tabstop=2
set smarttab
set expandtab

" indents
set autoindent
set copyindent
set smartindent

" word wrap vimdiff
autocmd FilterWritePre * if &diff | setlocal wrap< | endif

" some Perl settings
"autocmd FileType perl set showmatch
command -range=% -nargs=* Tidy <line1>,<line2>!
  \perltidy -pbp <args>

" key remaps

" Indent using tabs (while in visual mode)
vnoremap < <gv
vnoremap > >gv

" make tab in v mode ident code
vmap <tab> >gv
vmap <s-tab> <gv

" make tab in normal mode ident code
nmap <tab> I<tab><esc>
nmap <s-tab> ^i<bs><esc>

" remap leader key
let mapleader = ","

nmap <silent> ,/ :nohlsearch<CR>

" plugin specific settings

" NERTTree config
map <leader>n :NERDTreeToggle<CR>

" syntastic config
set matchpairs=(:),{:},[:],<:>
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Airline config
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_left_sep = '⮀'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_right_sep = '⮂'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.linenr = '⭡'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.whitespace = 'Ξ'
set backupdir=~/tmp

"Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()
execute pathogen#infect()
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_custom_ignore = 'node_modules\|build\|.git\|.o$\|.d$'
map <C-F> <C-P>
map <C-A> <C-W>
