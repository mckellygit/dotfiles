" Vim script to work like "less"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last Change:	2017 Mar 31

" ---------

" mck - save this file as vless.vim in ~/.vim/vless.vim
"       vless script then sets rtp^=$HOME/.vim/vless ...

" ---------

" Avoid loading this file twice, allow the user to define his own script.
if exists("loaded_less")
  finish
endif
let loaded_less = 1

" ---------

" If not reading from stdin, skip files that can't be read.
" Exit if there is no file at all.
if argc() > 0
  let s:i = 0
  while 1
    if filereadable(argv(s:i))
      if s:i != 0
	    sleep 3
      endif
      break
    endif
    if isdirectory(argv(s:i))
      echomsg "Skipping directory " . argv(s:i)
    elseif getftime(argv(s:i)) < 0
      echomsg "Skipping non-existing file " . argv(s:i)
    else
      echomsg "Skipping unreadable file " . argv(s:i)
    endif
    echo "\n"
    let s:i = s:i + 1
    if s:i == argc()
      quit
    endif
    next
  endwhile
endif

" ---------

set nocp
syntax on
set so=0
set hlsearch
set incsearch
nohlsearch
" Don't remember file names and positions
set viminfo=
set nows
" Inhibit screen updates while searching
let s:lz = &lz
set lz
" make cursor invisible - but doesnt always reset after quit
"set t_ve=
" dont scroll past end
"set so=10000
set nostartofline
" Can't modify the text
set noma
map K <Nop>

" ---------

" Allow the user to define a function, which can set options specifically for
" this script.
if exists('*LessInitFunc')
  call LessInitFunc()
endif

" ---------

" Give help
noremap <Leader>hh :call <SID>Help()<CR>
"map H h
fun! s:Help()
  echo "<Space>   One page forward          <C-b>     One page backward"
  echo "d         Half a page forward       u         Half a page backward"
  echo "<Enter>   One line forward          <C-k>     One line backward"
  echo "<C-j>     One line forward"
  echo "G         End of file               gg        Start of file"
  echo "N%        percentage in file"
  echo "\n"
  echo "/pattern  Search for pattern        ?pattern  Search backward for pattern"
  echo "n         next pattern match        N         Previous pattern match"
  if &foldmethod != "manual"
    echo "\n"
    echo "zR        open all folds            zm        increase fold level"
  endif
  echo "\n"
  echo ":n<Enter> Next file                 :p<Enter> Previous file"
  echo "\n"
  echo "q         Quit"
  "echo "q         Quit                      v         Edit file"
  let i = input("Hit Enter to continue")
endfun

" ---------

function! NoremapNormalCmd(key, preserve_omni, ...)
  let cmd = ''
  let icmd = ''
  for x in a:000
    let cmd .= x
    let icmd .= "<C-\\><C-O>" . x
  endfor
  execute ":nnoremap <silent> " . a:key . " " . cmd
  execute ":vnoremap <silent> " . a:key . " " . cmd
  if a:preserve_omni
    execute ":inoremap <silent> <expr> " . a:key . " pumvisible() ? \"" . a:key . "\" : \"" . icmd . "\""
  else
    execute ":inoremap <silent> " . a:key . " " . icmd
  endif
endfunction

" ---------

fun! s:NextPage()
  if line(".") == line("$")
    if argidx() + 1 >= argc()
      " Don't quit at the end of the last file
      return
    endif
    next
    1
  else
    set so=9999
    exe "silent normal! \<C-F>M"
    set so=0
  endif
endfun

" ---------

" Used after each command: put cursor at end and display position
" skip :file<CR> to display position - this is already in statusline
" add M to always move cursor back to middle
if &wrap
  "noremap <silent> <SID>L L0:redraw<CR>:file<CR>
  nnoremap <silent> <expr> <SID>L (line('.') == line('$')) ? 'M0:set so=9999<CR>:redraw<CR>:set so=0<CR>M' : '0'
  vnoremap <silent> <expr> <SID>L (line('.') == line('$')) ? 'M:set so=9999<CR>:redraw<CR>:set so=0<CR>M' : ''
  au VimEnter * silent! normal! M0
else
  "noremap <silent> <SID>L Lg0:redraw<CR>:file<CR>
  nnoremap <silent> <expr> <SID>L (line('.') == line('$')) ? 'Mg0:set so=9999<CR>:redraw<CR>:set so=0<CR>M' : 'g0'
  vnoremap <silent> <expr> <SID>L (line('.') == line('$')) ? 'Mg:set so=9999<CR>:redraw<CR>:set so=0<CR>M' : 'g'
  au VimEnter * silent! normal! Mg0
endif

" When reading from stdin don't consider the file modified.
au VimEnter * set nomod

" ---------

" Scroll one page forward
"noremap <silent> <script> <Space> :call <SID>NextPage()<CR><SID>L
"map <C-V> <Space>
"map f <Space>
"map <C-F> <Space>
noremap <silent> <script> <C-F> :call <SID>NextPage()<CR><SID>L
map <PageDown> <C-F>
map <kPageDown> <C-F>
"map <S-Down> <Space>
"map <Esc><Space> <Space>

" ---------

" Scroll half a page forward
"noremap <script> d <C-D><SID>LM
"map <C-D> d
"map d <Space>
call NoremapNormalCmd("<Space>",    0, "15<C-D>M")
call NoremapNormalCmd("d",    0, "15<C-D>M")

" ---------

" Scroll one line forward
"noremap <script> <CR> <C-E><SID>L
" dont scroll past end
call NoremapNormalCmd("<CR>",    0, "1<C-D>")

call NoremapNormalCmd("<C-j>",    0, "1<C-D>")
call NoremapNormalCmd("<C-Down>", 0, "1<C-D>")

map <C-N> <CR>
"map e <CR>
"map <C-E> <CR>
"map j <CR>
"map <C-J> <CR>
"map <Down> <CR>

" ---------
" ---------

" Scroll one page backward
noremap <script> <C-b> <C-B><SID>LM
"map <C-B> b
map <PageUp> <C-b>
map <kPageUp> <C-b>
map <S-Up> <C-b>
"map w b
"map w <Nop>
"map <Esc>v b

" ---------

" Scroll half a page backward
"noremap <script> u <C-B><SID>L
"noremap <script> <C-U> <C-U><SID>LM
"call NoremapNormalCmd("u",    0, "<C-B>M")
call NoremapNormalCmd("u",    0, "15<C-U>M")

" ---------

" Scroll one line backward
"noremap <script> <C-k> <C-Y><SID>Lgk
"nmap <silent> <C-K>           :call <SID>Saving_scrollV("1<C-V><C-U>")<CR>
"nmap <silent> <C-Up>          :call <SID>Saving_scrollV("1<C-V><C-U>")<CR>
"nmap <silent> <C-K>           :call <SID>scrollDN(1,0)<CR>
call NoremapNormalCmd("<C-k>",    0, "1<C-U>")
call NoremapNormalCmd("<C-Up>",   0, "1<C-U>")

"map y k
"map <C-Y> <C-k>
map <C-P> <C-k>
"map <C-K> <C-k>
"map <Up> k
map p <C-k>

" ---------
" ---------

" Re-read file and page forward "tail -f"
map F :e<CR>G<SID>L:sleep 1<CR>F

" ---------

" If 'foldmethod' was changed keep the "z" commands, e.g. "zR" to open all
" folds.
if &foldmethod == "manual"
  map z <Space>
endif

" ---------

" Redraw
noremap <script> r <C-L><SID>L
noremap <script> <C-R> <C-L><SID>L
noremap <script> R <C-L><SID>L

" ---------

" Start of file
"noremap <script> g gg<SID>L
map < gg<SID>L
map <Esc>< gg<SID>L
map <Home> gg<SID>L
map <kHome> gg<SID>L

" End of file
noremap <script> G G<SID>L9999j
map > G
map <Esc>> G
map <End> G
map <kEnd> G

" ---------

" Go to percentage
noremap <script> % %<SID>L
map P %

" ---------

" Search
"noremap <script> / H$:call <SID>Forward()<CR>/
"if &wrap
"  noremap <script> ? H0:call <SID>Backward()<CR>?
"else
"  noremap <script> ? Hg0:call <SID>Backward()<CR>?
"endif

fun! s:Forward()
  " Searching forward
  noremap <script> n H$nzt<SID>L
  if &wrap
    noremap <script> N H0Nzt<SID>L
  else
    noremap <script> N Hg0Nzt<SID>L
  endif
  cnoremap <silent> <script> <CR> <CR>:cunmap <lt>CR><CR>zt<SID>L
endfun

fun! s:Backward()
  " Searching backward
  if &wrap
    noremap <script> n H0nzt<SID>L
  else
    noremap <script> n Hg0nzt<SID>L
  endif
  noremap <script> N H$Nzt<SID>L
  cnoremap <silent> <script> <CR> <CR>:cunmap <lt>CR><CR>zt<SID>L
endfun

"call s:Forward()
"cunmap <CR>

" ---------

" Quitting
nnoremap q :q<CR>

" vim: sw=2
