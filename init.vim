call plug#begin('~/.local/share/nvim/plugged')

  Plug 'Ahmad-Zaklouta/gruvbox'
  Plug 'Ahmad-Zaklouta/vim-vhdl'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'scrooloose/nerdtree'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'christoomey/vim-system-copy'
  Plug 'kana/vim-textobj-user'
  Plug 'kana/vim-textobj-indent'
  Plug 'kana/vim-textobj-entire'
  Plug 'kana/vim-textobj-line'
  Plug 'Yggdroot/indentLine'
"  Plug 'https://github.com/vim-scripts/taglist.vim'
  Plug 'junegunn/vim-easy-align'
  Plug 'majutsushi/tagbar'


call plug#end()

let g:python_host_prog  = '/usr/bin/python'
let g:python3_host_prog  = '/usr/bin/python3'


"  General Setting 
  set nocompatible
  set termguicolors
  map <leader>s :source ~/.config/nvim/init.vim<CR>
  "set spell spelllang=en_us

" appearance
  set colorcolumn=80
  set cursorline
  set number
  set relativenumber

" For search and highlight
  set ignorecase " Ignore case when searching
  set hlsearch " Highlight search results 
  set incsearch  " Makes search act like search in modern browsers
  set lazyredraw " Don't redraw while executing macros (good performance config)
  set magic  " For regular expressions turn magic on
  set showmatch
  hi MatchParen cterm=bold ctermbg=none ctermfg=magenta
  " cancel a search with Escape
  nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>

" Spaces & Tabs & Indentation 
  set tabstop=2       " number of visual spaces per TAB
  set softtabstop=2  " number of spaces in tab when editing
  set shiftwidth=2    " number of spaces to use for autoindent
  set expandtab       " tabs are space
  set autoindent
  set copyindent      " copy indent from the previous line
  set nocin nosi inde=

"================================ PLUGIN OPTION ==============================="


" color scheme options
  colorscheme gruvbox

  " this for NERDTree
  map <F2> :NERDTree<CR>
  let g:NERDTreeWinPos ="right"
  let g:NERDTreeWinSize=60
  let NERDTreeShowHidden=1

" deoplete options
  let g:deoplete#enable_at_startup = 1
  function! TabWrap() "use <tab> for completion 
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
  " Enter to complete&close 
  inoremap <silent><expr> <Cr> pumvisible() ? "<C-y>" : "<Cr>"
  " Escape exit 
  inoremap <silent><expr> <Esc> pumvisible() ? "<C-e><Esc>" : "<Esc>" 

  " for commentary
  function! UnmapCommentary()
    unmap gc
    nunmap gcc
    nunmap gcu
  endfunction

  xmap mm <Plug>Commentary
  nmap mm <Plug>Commentary
  omap mm <Plug>Commentary
  nmap ml <Plug>CommentaryLine

  augroup bepo_clash
    autocmd!
    autocmd VimEnter * call UnmapCommentary()
  augroup END
  
  " for indentline
  let g:indentLine_setColors = 0
  let g:indentLine_char_list = ['|', '¦', '┆', '┊']

  " Start interactive EasyAlign in visual mode (e.g. vipga)
  xmap ga <Plug>(EasyAlign)
  " Start interactive EasyAlign for a motion/text object (e.g. gaip)
  nmap ga <Plug>(EasyAlign)
"=============================== MAPPING OPTION ==============================="

  " remap ESC
  imap jj <Esc>
  
  " move to beginning/end of line with B and E
  nnoremap B ^
  nnoremap E $
  " $/^ doesn't do anything
  nnoremap $ <nop>
  nnoremap ^ <nop>

  " for split
  set splitright
  set splitbelow
  nnoremap <leader>v :vnew<CR>
  "Smart way to move between windows
  map <C-j> <C-W>j
  map <C-k> <C-W>k
  map <C-h> <C-W>h
  map <C-l> <C-W>l

  " Make Y yank till end of line
  nnoremap Y y$


"================================= VHDL OPTION ================================"
  " filetype dependent settings
  autocmd FileType vhdl setlocal commentstring=--\ %s 
  let g:tagbar_type_vhdl = {
      \ 'ctagstype': 'vhdl',
      \ 'kinds' : [
          \'d:prototypes',
          \'b:package bodies',
          \'e:entities',
          \'a:architectures',
          \'t:types',
          \'p:processes',
          \'f:functions',
          \'c:constants',
          \'T:subtypes',
          \'r:records',
          \'C:components',
          \'P:packages',
          \'l:locals'
      \]
  \}
nnoremap <silent> <F1> :TagbarToggle<CR> 
  au Filetype vhdl call FT_vhdl()
    syntax on
    syntax enable

    set nocin inde=

  function FT_vhdl()
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
    nnoremap ;v i: STD_LOGIC_VECTOR( DOWNTO 0);<Esc>4ba
    nnoremap ;t iSUBTYPE IS INTEGER RANGE  DOWNTO ;<Esc>4bi
    nnoremap ;m iTYPE _FSM_TYPE IS (<CR>  ); -- End _FSM_TYPE<Esc>Bklla
    nnoremap ;r iTYPE _RECORD_TYPE IS RECORD<CR>END RECORD; -- End _RECORD_TYPE<Esc>0kela
    nnoremap ;f i IF () THEN<CR><CR>END IF;<Esc>02k2wa
    nnoremap ;p 0i  comb_proc: PROCESS (ALL)<CR><CR>BEGIN -- for comb_proc<CR><CR>END PROCESS comb_proc;<Esc>03ki<tab><tab>
    nnoremap ;sp 0i  seq_proc: PROCESS (clk, reset)<CR>BEGIN -- for seq_proc<CR><tab>IF (reset = '1') THEN<CR><CR>ELSIF rising_edge(clk) THEN<CR><CR>END IF;<CR><backspace>END PROCESS seq_proc;<Esc>05k
    nnoremap ;c i<tab>CASE  IS<CR><tab>WHEN  =><CR><CR>>WHEN OTHER =><CR><backspace>END CASE;<Esc>4khh
    nnoremap  ;- 0i-<Esc>79.0llR 
    nnoremap --- 0i-<Esc>79.0 
  endfunction
