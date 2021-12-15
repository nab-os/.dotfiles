" Nabos <nabos at glargh dot fr>
"
" Released under Free Licence - 2018

" PLUGINS
call plug#begin()

Plug 'scrooloose/nerdtree'
Plug 'preservim/tagbar'
Plug 'airblade/vim-gitgutter'
Plug 'simnalamburt/vim-mundo'

" Plug 'airblade/vim-rooter'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'ericcurtin/CurtineIncSw.vim'

Plug 'tpope/vim-markdown'
Plug 'nvie/vim-flake8'
Plug 'psf/black', { 'tag': '19.10b0' }

Plug 'tpope/vim-repeat'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'

Plug 'tmhedberg/SimpylFold'
Plug 'Konfekt/FastFold'
Plug 'zhimsel/vim-stay'

Plug 'terryma/vim-smooth-scroll'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'nab-os/vim-bepo'
" Plug 'https://git.glargh.fr/nabos/vim-bepo'

Plug 'https://bitbucket.org/shor-ty/vimextensionopenfoam.git'

call plug#end()

lua require('plugins')

" ==================== GENERAL ====================
set nocompatible              " be iMproved, required
set showcmd                 " show incomplete commands
set nomodeline              " modeline are for pussies
set guifont=inconsolata\ 11
set title
set titlestring=%F
set number

" Theme
colorscheme solarized
hi! Normal ctermbg=NONE guibg=NONE
hi clear LineNR
filetype plugin indent on   " automatic recognition of filetype
au TextYankPost * lua vim.highlight.on_yank {higroup="IncSearch", timeout=150, on_visual=true}

" Undo
set history=1000
set undodir=~/.config/nvim/undodir
set undofile

" Status line
set statusline=%{get(g:,'coc_git_status','')}
set statusline+=\ \ \|\ \ %t
set laststatus=2

" Spellcheck
set spell spelllang=fr
map <silent> <F8> :set spell!<CR>

" Backup
set nobackup                " no backup : everything is on git/svn
set nowritebackup
set noswapfile              " I said everything was on git !

" Encoding
set encoding=utf-8
set fileencoding=utf-8

" Search and/or Replace
set ignorecase              " caseless search
set smartcase               " except when using capitals
set showmatch               " show matching brackets
set incsearch               " instant search
set hlsearch                " highlight the search
set wrapscan                " wrap search
set gdefault                " assume /g flag on :s/
nnoremap <silent> <F3> :noh<CR>

" Indentation
set autoindent            " Auto-ident
set smartindent           " Smart ident
set smarttab              " Reset autoindent after a blank line
set expandtab             " tabs are spaces
set tabstop=2             " how many spaces on tab
set softtabstop=2         " one tab = 4 spaces
set shiftwidth=2          " reduntant with above
set list
set listchars=tab:>-,trail:~,extends:>,precedes:<
set wrap                    " wrap

" Split preferences
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

" Scroll offset
if !&scrolloff
  set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
  set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif
set nostartofline       " Do not jump to first character with page commands.

" Visual repeat
vnoremap . :normal .<CR>

" Copy to clipboard when possible
if has('clipboard')
  if has('unnamedplus')  " When possible use + register for copy-paste
    set clipboard=unnamed,unnamedplus
  else         " On mac and Windows, use * register for copy-paste
    set clipboard=unnamed
  endif
endif

" Alternate
nnoremap <BS> <C-^>

" Escape
inoremap <C-c> <Esc>
inoremap <Esc> <C-c>

" Auto reload files when gain focus
set autoread
set autowrite
au FocusGained,BufEnter * :Silent !
command! -nargs=+ Silent
\   execute 'silent <args>'
\ | redraw!

au FocusGained,BufEnter * :silent!

set formatoptions+=o
set conceallevel=1
set termguicolors
set nojoinspaces

" Relative numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set number
  else
    set rnu
  endif
endfunc
call NumberToggle()
nnoremap <silent> <F4> :call NumberToggle()<cr>

" Remove trailling spaces
function! Clean()
    execute(":%s/\s\+$//e")
endfunc

" Folding
set foldlevel=99
nnoremap <silent> <Tab> @=(foldlevel('.')?'za':"\<Tab>")<CR>
vnoremap <Tab> zf
function MyFoldText()
  let nucolwidth = &fdc + &number*&numberwidth
  let winwd = winwidth(0) - nucolwidth - 5
  let foldlinecount = foldclosedend(v:foldstart) - foldclosed(v:foldstart) + 1
  let prefix = " _______>>> "
  let fdnfo = prefix . string(v:foldlevel) . "," . string(foldlinecount)
  let line =  strpart(getline(v:foldstart), 0 , winwd - len(fdnfo))
  let fillcharcount = winwd - len(line) - len(fdnfo)
  return line . repeat(" ",fillcharcount) . fdnfo
endfunction
set foldtext=MyFoldText()

" ==================== Modules ====================
" Vim-stay
set viewoptions=cursor,folds,slash,unix

" Smooth scroll
noremap <silent> S :call smooth_scroll#up(&scroll, 7, 1)<CR>
noremap <silent> T :call smooth_scroll#down(&scroll, 7, 1)<CR>

" Tagbar
nmap <F9> :TagbarToggle<CR>
let g:tagbar_map_togglesort = ''
let g:tagbar_map_toggleautoclose = ''
let g:tagbar_map_togglepause = ''
let g:tagbar_map_togglefold = ''
let g:tagbar_map_jump = 'o'
let g:tagbar_map_preview = 'O'

" FZF
set wildmenu
nnoremap <expr> <space><space> (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<CR>"
nnoremap <silent> <space>b :Buffers<CR>
nnoremap <silent> <space>/ :execute 'Ag ' . input('Ag/')<CR>
if executable('ag')
    set grepprg=ag\ --nogroup\ --column
    set grepformat=%f:%l:%c%m
endif

nnoremap <silent> qq :bd<CR>
nmap <silent> T <PageDown>
nmap <silent> S <PageUP>
nmap <silent> C :wincmd h<CR>
nmap <silent> R :wincmd l<CR>

nmap gq :bp <BAR> bd #<CR>

" COC
set hidden
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" VIM-AIRLINE
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme = "hybrid"

" NERDTREE
noremap <silent> <C-E> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$']
let NERDTreeMapOpenInTab="<C-t>"
let NERDTreeMapOpenInTabSilent="<C-T>"
let NERDTreeMapOpenVSplit="<C-s>"
let NERDTreeMapRefresh="<C-r>"
let NERDTreeMapRefreshRoot="<C-R>"

" VIMTEX
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" ULTISNIPS
let g:UltiSnipsSnippetsDir = "~/.config/nvim/snippets"
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
