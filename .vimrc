set nocompatible
filetype off
set tabstop=2 softtabstop=2 expandtab shiftwidth=2 smarttab
set number
set laststatus=2
set noerrorbells visualbell t_vb=

let mapleader = "\<Space>"

nnoremap <leader>n :bnext<CR>
nnoremap <leader>p :bprevious<CR>

set background=dark
syntax on
color mango

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mattn/emmet-vim'
Plugin 'posva/vim-vue'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Valloric/YouCompleteMe'
Plugin 'xsbeats/vim-blade'
Plugin 'jiangmiao/auto-pairs'
Plugin 'alvan/vim-closetag'

call vundle#end()
filetype plugin indent on

autocmd BufNewFile,BufRead *.vue set ft=vue
autocmd BufNewFile,BufRead *.blade.* set ft=blade.html.php

"------ HTML AUTOCLOSE
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.blade.*,*.vue"

"------ CtrlP
let g:ctrlp_working_path_mode = 'ra'
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

"------ syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']

"------ NerdTree
map <C-e> :NERDTreeToggle<CR>

"------ Airline
let g:airline_powerline_fonts = 1

" Multi Cursors
let g:multi_cursor_start_key='<C-h>'
let g:multi_cursor_next_key='<C-j>'
let g:multi_cursor_prev_key='<C-k>'
let g:multi_cursor_skip_key='<C-l>'
let g:multi_cursor_quit_key='<Esc>'


nmap <Leader>v :e $MYVIMRC

"---- REMOVE TRAILING WHITESPACE
autocmd BufWritePre * %s/\s\+$//e

augroup reload_vimrc " {
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }
