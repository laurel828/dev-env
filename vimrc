set nocompatible
 
set ts=4
set sw=4
 
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
 
set nobackup
set ai
set si
set encoding=euc-kr
set fileencoding=euc-kr
set fileencodings=euc-kr,utf-8
set termencoding=euc-kr
 
 
set bs=2
set ruler
set incsearch
set nohlsearch
set paste
 
set tags=./tags,tags,../tags,/home1/irteam/project/tags,../../tags,../../../tags
set path=../include,./include
 
" set nu
 
"======= key mapping =======
map <F2> v]}zf      " folding
map <F3> zo         " unfolding
 
"======= man page    =======
func! Man()
    let sm = expand("<cword>")
    exe "!man -S 2:3:4:5:6:7:8:9:tcl:n:l:p:o ".sm
endfunc
nmap ,ma :call Man()<cr><cr>
 
 
if &t_Co > 2 || has("gui_running")
  syntax on
  " highlight Comment ctermfg=Green
  highlight Comment term=bold cterm=bold ctermfg=darkcyan
  highlight Search  term=reverse ctermbg=yellow ctermfg=blue
endif
 
" Only do this part when compiled with support for autocommands.
if has("autocmd")
 
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on
 
  " For all text files set 'textwidth' to 78 characters.
  au FileType text setlocal tw=78
 
  " When editing a file, always jump to the last known cursor position.
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
 
  " au BufNewFile *.cpp 0r ~/okjo/vim/Template.cpp
  " au BufNewFile *.h 0r ~/okjo/vim/Template.h
 
  " ESQL-C for postgresql 7.x
  au BufNewFile,BufRead *.pgc           setf c
 
endif " has("autocmd")
 
syntax on
set fileformat=unix
 
" 왼쪽의 폴드 컬럼사이즈
"set foldcolumn=2
 
" Doxygen용 주석을 꾸며준다
let g:load_doxygen_syntax=1
let g:doxygen_enhanced_color=1
 
" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>
 
nnoremap <silent> <F1> :tp<CR>            " Go to the previous tag
nnoremap <silent> <F4> :tn<cr>            " Go to the next tag
 
"imap <F5> else^M{^M/* do nothing */^M}
map <F9> :w<cr> :make<cr> :ccl<cr> :cw<cr>
 
nnoremap <silent> <F7> :cn<cr>            " 다음 에러 발생 라인으로
nnoremap <silent> <F8> :cp<cr>            " 이전 에러 발생 라인으로
 
nnoremap <silent> <F5> :Rgrep<CR>
 
" f10 을 누른 후 탭키를 누르면 현재 디렉토리까지 해서 경로가 튀어나온다.
noremap           <F10> ^[:e `pwd`
 
" Trailing white space 삭제
nnoremap <silent> <F12> :%s/\s\+$//g<CR>
 
" 한줄 주석처리하고 아랫줄로
nnoremap <silent> <S-F12> <esc>I/* <esc>A */<esc>j
 
" 80 컬럼 창 두개로 분리
map <F11> <esc>:set columns=161<CR>:vs<CR>^W=
 
" Recursive Grep 만 Skip_Dirs 를 받더라... -_-;; 나중에 수정하자.
" Grep plugin 을 위한 세팅.
" let Grep_Default_Filelist = '*.c *.cpp *.h *.i'
let Grep_Skip_Files = 'tags'
let Grep_OpenQuickfixWindow = 1
let Grep_Default_Options = '-rn'
let Grep_Find_Use_Xargs = 0
let Grep_Skip_Dirs = '.svn CVS'
 
" system dependent 한 세팅
let Grep_Path = $GNUGREP
 
" trailing whitespace 와 tab 을 표시하기 위한 라인. 오직 c, cpp 파일에만 적용됨.
" 줄 맨 끝의 trailing white space 를 벌겋게 표시한다.
autocmd FileType c,cpp,xml  highlight WhitespaceEOL ctermbg=red guibg=red
autocmd FileType c,cpp,xml  match WhitespaceEOL /\s\+$/
 
" 탭은 밝은 녹색으로 표시한다.
"autocmd FileType c,cpp,xml highlight WhitespaceTAB ctermbg=lightgreen guibg=lightgreen
"autocmd FileType c,cpp,xml match WhitespaceTAB /\t\+/
