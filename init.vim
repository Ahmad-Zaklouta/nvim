call plug#begin('~/.local/share/nvim/plugged')

  Plug 'Ahmad-Zaklouta/gruvbox'
"  Plug 'vim-airline/vim-airline'
"  Plug 'vim-airline/vim-airline-themes'
  Plug 'tpope/vim-surround'
"  Plug 'christoomey/vim-system-copy'
  Plug 'kana/vim-textobj-user'
  Plug 'kana/vim-textobj-indent'
  Plug 'kana/vim-textobj-entire'
  Plug 'kana/vim-textobj-line'
"  Plug 'Yggdroot/indentLine'
"  Plug 'https://github.com/vim-scripts/taglist.vim'
  Plug 'junegunn/vim-easy-align'
"  Plug 'majutsushi/tagbar'

call plug#end()

let g:python_host_prog = 'C:\Python27\python2.exe'
let g:python3_host_prog = 'C:\Python310\python3.exe'


"  General Setting 
  set nocompatible
  map <leader>s :source 'C:\Users\ahmad.zaklouta\AppData\Local\nvim\init.vim'<CR>

" appearance
  set colorcolumn=80

" wrapping 
  set nolist 
  set linebreak

" For search and highlight
"  set ignorecase " Ignore case when searching
"  set hlsearch " Highlight search results 
"  set incsearch  " Makes search act like search in modern browsers
"  set lazyredraw " Don't redraw while executing macros (good performance config)
"  set magic  " For regular expressions turn magic on
"  set showmatch
"  hi MatchParen cterm=bold ctermbg=none ctermfg=magenta
  " cancel a search with Escape
  nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>

" Spaces & Tabs & Indentation 
"  set tabstop=2       " number of visual spaces per TAB
"  set softtabstop=2  " number of spaces in tab when editing
"  set shiftwidth=2    " number of spaces to use for autoindent
"  set expandtab       " tabs are space
"  set autoindent
"  set copyindent      " copy indent from the previous line
"  set nocin nosi inde=
"  set breakindent

"================================ PLUGIN OPTION ==============================="

  " power tab 
"  imap <silent><expr><tab> TabWrap() 
  " Enter to complete&close 
"  inoremap <silent><expr> <Cr> pumvisible() ? "<C-y>" : "<Cr>"
  " Escape exit 
"  inoremap <silent><expr> <Esc> pumvisible() ? "<C-e><Esc>" : "<Esc>" 

  " for commentary
	xmap gc  <Plug>VSCodeCommentary
	nmap gc  <Plug>VSCodeCommentary
	omap gc  <Plug>VSCodeCommentary
	nmap gcc <Plug>VSCodeCommentaryLine

  " Start interactive EasyAlign in visual mode (e.g. vipga)
  xmap ga <Plug>(EasyAlign)
  " Start interactive EasyAlign for a motion/text object (e.g. gaip)
  nmap ga <Plug>(EasyAlign)

"=============================== MAPPING OPTION ==============================="
  "nnoremap <C-w>gd <Cmd>call VSCodeNotify('editor.action.revealDefinitionAside')<CR>

  " wrap line movement
  map j gj
  map k gk

  " ESC to exit Insert mode in terminal mode
  tnoremap <Esc> <C-\><C-n>
  
  " move to beginning/end of line with B and E
  nnoremap B ^
  nnoremap E $
  " $/^ doesn't do anything
  nnoremap $ <nop>
  nnoremap ^ <nop>

  " provide movement in Insert Mode and Command Mode via <alt> 
  noremap! <A-h> <left>
  noremap! <A-j> <down>
  noremap! <A-k> <up>
  noremap! <A-l> <right>
  inoremap <A-w> <C-o>w
  inoremap <A-b> <C-o>b
  inoremap <A-o> <C-o>o
  cnoremap <expr> <A-b> &cedit. 'b' .'<C-c>'
  cnoremap <expr> <A-w> &cedit. 'w' .'<C-c>'

  " paste yanked in Command mode
  cnoremap <A-p> <C-r>"

  " for split
  set splitright
  set splitbelow

  "Smart way to move between windows
  map <C-j> <C-W>j
  map <C-k> <C-W>k
  map <C-h> <C-W>h
  map <C-l> <C-W>l

  " relocate tabs
  noremap <A-h> :-tabmove<CR>
  noremap <A-l> :+tabmove<CR>

  " Make Y yank till end of line
  nnoremap Y y$

  " Make P put space and paste
  nnoremap P a<space><Esc>p

  " Make S substitute the current word with yanked
   nnoremap S "_ciw<C-r>"<Esc>