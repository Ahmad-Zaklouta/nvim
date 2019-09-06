call plug#begin('~/.local/share/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/vim-color-forest-night'
Plug 'scrooloose/nerdtree'
Plug 'https://github.com/lifepillar/vim-solarized8.git'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
call plug#end()


set nocompatible
filetype on
set termguicolors
syntax on
syntax enable
noremap ;# I#<space><esc>A<space>#<esc>yyPVr#yyjpj

let g:deoplete#enable_at_startup = 1
"use <tab> for completion 
function! TabWrap() 
  if pumvisible() 
    return "\<C-N>"
  elseif strpart( getline('.'), 0, col('.') - 1 ) =~ '^\s*$' 
    return "\<tab>"
  elseif &omnifunc !~ '' 
    return "\<C-X>\<C-O>" 
  else 
    return "\<C-N>" 
  endif
endfunction 
" power tab 
imap <silent><expr><tab> TabWrap() 
" Ctrl-Space: summon FULL (synced) autocompletion 
" Enter: complete&close popup if visible ; else: space 
inoremap <silent><expr> <Cr> pumvisible() ? "<C-y>" : "<Cr>"
" Escape: exit autocompletion, go to Normal mode 
inoremap <silent><expr> <Esc> pumvisible() ? "<C-e><Esc>" : "<Esc>"

" Highlight line current line
":set cursorline 
"hi cursorline cterm=bold ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
"autocmd WinEnter * setlocal cursorline
"autocmd WinLeave * setlocal nocursorline

" Highlight all instances of word under cursor, when idle.
" " Useful when studying strange source code.
" " Type z/ to toggle highlighting on/off.
nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
  let @/ = ''
  if exists('#auto_highlight')
    au! auto_highlight
    augroup! auto_highlight
    setl updatetime=4000
    echo 'Highlight current word: off'
    return 0
  else
    augroup auto_highlight
      au!
      au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
    augroup end
    setl updatetime=500
    echo 'Highlight current word: ON'
    return 1
  endif
endfunction

" remap ESC
:imap jj <Esc>

set ignorecase " Ignore case when searching
set smartcase " When searching try to be smart about cases 
set hlsearch " Highlight search results 
set incsearch  " Makes search act like search in modern browsers 
set lazyredraw " Don't redraw while executing macros (good performance config)
set magic  " For regular expressions turn magic on
set showmatch  " Show matching brackets when text indicator is over them 
" cancel a search with Escape
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>

" spell checking for English words
"set spell spelllang=en_us

" this for number
set number
set relativenumber
"set colorcolumn=81

" this is for tab
set expandtab tabstop=2 shiftwidth=2 smarttab softtabstop=1
set autoindent nocindent nosmartindent copyindent
" this for NERDTree
map <F2> :NERDTree<CR>
let g:NERDTreeWinPos ="right"
let g:NERDTreeWinSize=60
let NERDTreeShowHidden=1

" for split
set splitright
set splitbelow
nnoremap <leader>v :vnew<CR>
"Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
" move to beginning/end of line
nnoremap B ^
nnoremap E $
" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

" Make Y yank till end of line
nnoremap Y y$

let g:airline_theme='base16'

" For Solarized
"set background=dark
"colorscheme solarized8_low
"colorscheme gruvbox
colorscheme forest-night 
"let g:gruvbox_contrast = 'soft'
"  For VHDL
" filetype dependent settings
au Filetype vhdl call FT_vhdl()
function FT_vhdl()
syntax on
syntax enable
setl autoindent copyindent nocin nosi inde=
" Abbreviations
iabbr ;s SIGNAL
iabbr ;c CONSTANT C_
iabbr ;i : INTEGER;
iabbr ;l : STD_LOGIC;
iabbr ;u : UNSIGNED( DOWNTO 0);
iabbr ;b : BOOLEAN;
iabbr toi TO_INTEGER
iabbr tos TO_SIGNED
iabbr tou TO_UNSIGNED
iabbr dt DOWNTO
iabbr ;w WHEN =><Left><Left><Left>
iabbr ;o := (OTHERS => '0');

nnoremap ;e i ELSIF () THEN<Esc>bba
nnoremap <buffer> ;v i: STD_LOGIC_VECTOR( DOWNTO 0);<Esc>4ba
nnoremap <buffer> ;t iSUBTYPE IS INTEGER RANGE  DOWNTO ;<Esc>4bi
nnoremap <buffer> ;m iTYPE _FSM_TYPE IS (<CR>  ); -- End _FSM_TYPE<Esc>Bklla
nnoremap <buffer> ;r iTYPE _RECORD_TYPE IS RECORD<CR>END RECORD; -- End _RECORD_TYPE<Esc>0kela
nnoremap <buffer> ;f i IF () THEN<CR><CR>END IF;<Esc>02k2wa
nnoremap <buffer> ;p 0i  comb_proc: PROCESS (ALL)<CR><CR>BEGIN -- for comb_proc<CR><CR>END PROCESS comb_proc;<Esc>03ki<tab><tab>
nnoremap <buffer> ;sp 0i  seq_proc: PROCESS (clk, reset)<CR>BEGIN -- for seq_proc<CR><tab>IF (reset = '1') THEN<CR><CR>ELSIF rising_edge(clk) THEN<CR><CR>END IF;<CR><backspace>END PROCESS seq_proc;<Esc>05k
nnoremap <buffer> ;c i<tab>CASE  IS<CR><tab>WHEN  =><CR><CR>>WHEN OTHER =><CR><backspace>END CASE;<Esc>4khh
nnoremap <buffer> ;- 0i-<Esc>79.0llR 
nnoremap <buffer> --- 0i-<Esc>79.0 
endfunction
