""""""""""""""""""""""""""""""""""""""""""""""""""
" don't be constrained by backward compatability
""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
"
""""""""""""""""""""""""""""""""""""""""""""""""""
" needed this to make pathogen work on windows, but don't know why
""""""""""""""""""""""""""""""""""""""""""""""""""
if has('win32') || has('win64')
  set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif
"
""""""""""""""""""""""""""""""""""""""""""""""""""
" detect OS
""""""""""""""""""""""""""""""""""""""""""""""""""
if has("win32") || has('win64')
   "echom "detected Windows OS"
   let $MYOS = "Windows"
else
   if has("unix")
      let s:uname = system("uname")
      if s:uname == "Darwin\n"
         "echom "detected Mac OS"
         let $MYOS = "Mac"
      else
         "echom "detected Linux OS"
         let $MYOS = "Linux"
      endif
   endif
endif
"
""""""""""""""""""""""""""""""""""""""""""""""""""
" Fix to make 'gvim -d f1 f2' work.
" Maybe not needed past vim 7.4.
""""""""""""""""""""""""""""""""""""""""""""""""""
if( $MYOS == "Windows" )
   set shell=c:\\tools\\cygwin64\\bin\\bash.exe shellcmdflag=-c shellxquote=\"
endif
"
"
""""""""""""""""""""""""""""""""""""""""""""""""""
" mouse behavior: xterm or mswin
""""""""""""""""""""""""""""""""""""""""""""""""""
behave xterm
"
""""""""""""""""""""""""""""""""""""""""""""""""""
" don't know why I set TMP
""""""""""""""""""""""""""""""""""""""""""""""""""
let $TMP="c:/tmp"
"
""""""""""""""""""""""""""""""""""""""""""""""""""
" plugin and path manager
""""""""""""""""""""""""""""""""""""""""""""""""""
set nocp
execute pathogen#infect()
"
""""""""""""""""""""""""""""""""""""""""""""""""""
" appearance
""""""""""""""""""""""""""""""""""""""""""""""""""
if( $MYOS == "Mac" )
   colorscheme darkblue
elseif( $MYOS == "Windows" )
   colorscheme murphy
   set guifont=Lucida_Console:h10:cANSI
   "set guifont=Lucida_Sans_Typewriter:h10:cANSI
   "set guifont=Courier_New:h10:cANSI
elseif( $MYOS == "Linux" )
   "colorscheme murphy
   "colorscheme darkblue
else
   "
endif
"colorscheme billColorScheme
"
""""""""""""""""""""""""""""""""""""""""""""""""""
" some basic settings I really like
""""""""""""""""""""""""""""""""""""""""""""""""""
set autoread
set history=100
set nohlsearch
set nowrapscan
set number
set ruler
set selectmode=mouse
set showcmd
set wildmenu
"
""""""""""""""""""""""""""""""""""""""""""""""""""
" put swp and ~ files in central location
""""""""""""""""""""""""""""""""""""""""""""""""""
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
"
""""""""""""""""""""""""""""""""""""""""""""""""""
" syntax highlighting
""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
"
""""""""""""""""""""""""""""""""""""""""""""""""""
" tab settings
""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent
set expandtab
set shiftwidth=3
set softtabstop=3
"
""""""""""""""""""""""""""""""""""""""""""""""""""
" Move editor tabs with alt + left|right
""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>
"
"*************************************************
"
" define custom commands
"
"*************************************************
command! -nargs=1 FW echo <q-args>
command! -nargs=1 VSR execute "rightbelow vnew ".expand("%:r").".".<q-args>
command! -nargs=1 VSL execute "leftabove vnew ".expand("%:r").".".<q-args>
"
"*************************************************
"
" key maps
"
"*************************************************
let mapleader=","
"
nmap <leader>v <cr> :tabnew $MYVIMRC
"nmap <leader>vsh <cr> :rightbelow vnew %:r.h<cr>
"nmap <leader>vshh <cr> :rightbelow vnew %:r.hh<cr>
"
""""""""""""""""""""""""""""""""""""""""""""""""""
" navigate split windows
""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>rr <C-W><C-L>
nnoremap <leader>ll <C-W><C-H>
""""""""""""""""""""""""""""""""""""""""""""""""""
" C++ mappings for opening vsplit source/header pairs
""""""""""""""""""""""""""""""""""""""""""""""""""
" open corresponding h,hh file in split window to right
nmap <leader>h <cr> :VSR h<cr>
nmap <leader>hh <cr> :VSR hh<cr>
" open corresponding c,cc,cpp file in split window to the left
nmap <leader>c <cr> :VSL cc<cr>
nmap <leader>cc <cr> :VSL cc<cr>
nmap <leader>cpp <cr> :VSL cpp<cr>
"
""""""""""""""""""""""""""""""""""""""""""""""""""
" mapping to insert filename root
" insert filename root, e.g. class name in a cpp file
" Could be restricted to file with extentions c, cc, cpp, h, hh, .java.
""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap qqn <C-R>=expand("%:t:r")<CR>
"
""""""""""""""""""""""""""""""""""""""""""""""""""
" for gui mode only
""""""""""""""""""""""""""""""""""""""""""""""""""
if has('gui_running')
   """"""""""""""""""""""""""""""""""""""""""""""""""
   " Setup Dotfiles menu
   """"""""""""""""""""""""""""""""""""""""""""""""""
   menu &Dotfiles.\.chsrc <ESC>:edit ~/.chsrc<cr>
   menu &Dotfiles.\.bashrc <ESC>:edit ~/.bashrc<cr>
   menu &Dotfiles.\.bash_alias <ESC>:edit ~/.bash_alias<cr>
   menu &Dotfiles.\.vimrc <ESC>:edit ~/_VIMRC<cr>
   menu &Dotfiles.\_VIMRC <ESC>:edit ~/_VIMRC<cr>
   menu &Dotfiles.\.gitconfig <ESC>:edit ~/.gitconfig<cr>
   "
   """"""""""""""""""""""""""""""""""""""""""""""""""
   " Setup C++ menu
   """"""""""""""""""""""""""""""""""""""""""""""""""
   let $C_HDR="h"
   source ~/.vim/myscripts/OpenVSplitTabPair.vim
   source ~/.vim/myscripts/VSplitPair.vim
   source ~/.vim/myscripts/WrapCHeader.vim
   menu &C++.&Open\ Class\ Tab <ESC>:call OpenVSplitTabPair($C_HDR)<cr>
   menu &C++.&VSplit-right.h <ESC>:call VSplitPair("h")<cr>
   menu &C++.&VSplit-right.hh <ESC>:call VSplitPair("hh")<cr>
   menu &C++.&VSplit-right.cpp <ESC>:call VSplitPair("cpp")<cr>
   menu &C++.&VSplit-right.cc <ESC>:call VSplitPair("cc")<cr>
   menu &C++.&Wrap\ Header <ESC>:call WrapCHeader()<cr>
   "
   """"""""""""""""""""""""""""""""""""""""""""""""""
   " Setup Test menu
   """"""""""""""""""""""""""""""""""""""""""""""""""
   amenu Test.Source\ ~/\.vim/myscripts/test\.vim <ESC>:source ~/.vim/myscripts/test.vim<cr>
   amenu Test.Call\ Test() <ESC>:call Test()<cr>
   amenu Test.Browse\ Home <ESC>:browse ~/
   "
endif
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""
"""function! SayHello()
"""   echo "Hello"
"""endfunction
"""
""""autocmd  FocusGained  *.c   :echom 'c file gained focus'
""""autocmd  FocusGained  *.cpp   :echom 'cpp file gained focus'
""""autocmd  FocusGained  *.h   :echom 'h file gained focus'
""""autocmd  BufWinEnter  *.h   :echom 'h buff win entered'
""""autocmd  BufEnter  *.h   :echom 'h buff win entered'
""""autocmd  BufNew  *   :echom 'buf new'
""""autocmd  BufWinEnter  *   :echom 'buf win enter'
""""autocmd  CursorMovedI  *   :echom 'cursor moved'
""""autocmd  BufEnter  *   :echom 'buf enter: ' . expand("%:t")
"
""""""""""""""""""""""""""""""""""""""""""""""""""
" reread vim config file after edit
""""""""""""""""""""""""""""""""""""""""""""""""""
augroup reload_vimrc
    au!
    au BufWritePost .vimrc,_vimrc,.gvimrc,_gvimrc,gvimrc,_VIMRC so $MYVIMRC
    " au BufWritePost .vimrc,.gvimrc,so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END
