syntax on
set mouse-=a
set background=dark
set ruler                     " show the line number on the bar
set more                      " use more prompt
set autoread                  " watch for file changes
set hidden
set noautowrite               " don't automagically write on :next
set lazyredraw                " don't redraw when don't have to
set showmode
"set showcmd
set nocompatible              " vim, not vi
set autoindent smartindent    " auto/smart indent
set smarttab                  " tab and backspace are smart
set tabstop=4               " x spaces
set shiftwidth=4
set expandtab
set scrolloff=5               " keep at least 5 lines above/below
set sidescrolloff=5           " keep at least 5 lines left/right
set history=200
set backspace=indent,eol,start
set linebreak
set cmdheight=1               " command line one lines high
set undolevels=1000           " 1000 undos
set updatecount=100           " switch every 100 chars
set complete=.,w,b,u,U,t,i,d  " do lots of scanning on tab completion
set ttyfast                   " we have a fast terminal
set noerrorbells              " No error bells please
set shell=bash
set fileformats=unix
set ff=unix
filetype on                   " Enable filetype detection
filetype indent on            " Enable filetype-specific indenting
filetype plugin on            " Enable filetype-specific plugins
set wildmode=longest:full
set wildmenu                  " menu has tab completion
let maplocalleader=','        " all my macros start with ,
set laststatus=2

"  searching
set incsearch                 " incremental search
set ignorecase                " search ignoring case
set hlsearch                  " highlight the search
set showmatch                 " show matching bracket
set diffopt=filler,iwhite     " ignore all whitespace and sync

"  backup
set backup
set backupdir=~/.vim_backup
set viminfo='10,\"100,:20,%,n~/.viminfo

" spelling
if v:version >= 700
  " Enable spell check for text files
  autocmd BufNewFile,BufRead *.txt setlocal spell spelllang=en
endif

" mappings
" toggle list mode
nmap <LocalLeader>tl :set list!<cr>
" toggle paste mode
nmap <LocalLeader>pp :set paste!<cr>
" mapping shortcuts for nabs"
:map <C-a> GVgg
:map <C-h> :%s/
:map <F11> :set number!<Enter>


"Clang format
map <C-K> :pyf /usr/bin/clang-format<cr>
map <C-K> <c-o>:pyf /usr/bin/clang-format<cr>



"TAB navigation like firefox
":nmap <C-S-tab> :tabprevious<cr>
":nmap <C-tab> :tabnext<cr>
":imap <C-S-tab> <ESC>:tabprevious<cr>i
":imap <C-tab> <ESC>:tabnext<cr>i
":nmap <C-t> :tabnew<cr>
":imap <C-t> <ESC>:tabnew<cr>i
":map <C-w> :tabclose<cr>


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


" switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

fun! s:setUtf8File()
  set encoding=utf-8
  set fileencodings=utf-8
  set fileencoding=utf-8
  set nobomb
endfun

fun! s:setTabStop()
  set tabstop=4
  set shiftwidth=4
endfun

au BufNewFile,BufRead *.wiki call s:setUtf8File()
au BufNewFile,BufRead *.xml call s:setUtf8File()
au BufNewFile,BufRead *.py call s:setTabStop()
" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")


" Some fixes for common typos have saved me a surprising amount of time:
:command WQ wq
:command Wq wq
:command W w
:command Q q
:command Qa qa
:command Vs vs
