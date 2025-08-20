call plug#begin('C:\Users\eahzakm\AppData\Local\nvim\plugged')

  Plug 'Ahmad-Zaklouta/gruvbox'
  Plug 'tpope/vim-surround'
  Plug 'kana/vim-textobj-user'
  Plug 'kana/vim-textobj-indent'
  Plug 'kana/vim-textobj-entire'
  Plug 'kana/vim-textobj-line'
  Plug 'junegunn/vim-easy-align'

call plug#end()


""  General Setting 
  set nocompatible
  set guicursor=i:ver25

"" cancel a search with Escape
  nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>
  
"" for commentary
	xmap gc  <Plug>VSCodeCommentary
	nmap gc  <Plug>VSCodeCommentary
	omap gc  <Plug>VSCodeCommentary
	nmap gcc <Plug>VSCodeCommentaryLine
  
"" move to beginning/end of line with B and E
  nnoremap B ^
  nnoremap E $

"" Make Y yank till end of line
  nnoremap Y y$

  " Make P put space and paste
  nnoremap P a<space><Esc>p

"" Make S substitute the current word with yanked
  nnoremap S "_ciw<C-r>"<Esc>
  "nnoremap S ve"0p