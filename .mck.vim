" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2000 Mar 29
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

"" vundle ------------------------------
filetype off                  " required
"" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
" fzf from git install in ~/.fzf 
set rtp+=~/.fzf
call vundle#begin()
"" alternatively, pass a path where Vundle should install plugins
""call vundle#begin('~/some/path/here')
"" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"" Add Plugins here ...
"
" required utils for EnhancedJumps plugin
Plugin 'inkarkat/vim-ingo-library'
"
" mother of auto-completion
"Plugin 'Valloric/YouCompleteMe'
"
" vim-clang auto-completion
Plugin 'justmao945/vim-clang'
"
" rooter for :Files and FileBeagle (<Leader>fb)
Plugin 'airblade/vim-rooter'
"
" rtags for code navigation (**modified++)
Plugin 'lyuts/vim-rtags'
"
" qf/loclist window in all windows/tabs (**modified++)
Plugin 'yssl/QFEnter'
"
" fswitch to switch between .cpp/.h{pp} (**modified++)
Plugin 'derekwyatt/vim-fswitch'
"
" FileBeagle for dir/file browsing (**modified++)
Plugin 'jeetsukumaran/vim-filebeagle'
"
"Plugin 'tpope/vim-vinegar'
"Plugin 'scrooloose/nerdtree'
"Plugin 'jistr/vim-nerdtree-tabs'
"
" git w/NERDtree
"Plugin 'Xuyuanp/nerdtree-git-plugin'
" gitgutter
Plugin 'airblade/vim-gitgutter'
" fugitive for more git utils (**modified++)
Plugin 'tpope/vim-fugitive'
"
" fzf for fuzzy listing/searching
"Plugin 'junegunn/fzf' " (not needed because its in ~/.fzf already)
Plugin 'junegunn/fzf.vim'
" ack (with ag (silver-searcher))
Plugin 'mileszs/ack.vim'
"
" colorscheme
Plugin 'ajmwagar/vim-deus'
"Plugin 'beigebrucewayne/Turtles'
" one for all colors
"Plugin 'flazz/vim-colorschemes'
"
" localvimrc
Plugin 'embear/vim-localvimrc'
"
" polygot syntax highlighting for many file types
Plugin 'sheerun/vim-polyglot'
" enhanced c++ syntax
Plugin 'octol/vim-cpp-enhanced-highlight'
"
" statusline
Plugin 'itchyny/lightline.vim'
"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
"
" start at prev cursor position, except for git etc.
" (make sure to disable code below that also does this)
" lastplace to start at prev cursor pos (**modified++)
" see note below about doing this after uncompress
Plugin 'farmergreg/vim-lastplace'
"
" run cmd in background and output to quickfix ...
" :AsyncRun gcc % -c %< for example
"Plugin 'skywind3000/asyncrun.vim'
"
"" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"" To ignore plugin indent changes, instead use:
"""filetype plugin on
""
"" Brief help
"" :PluginList       - lists configured plugins
"" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
"" :PluginSearch foo - searches for foo; append `!` to refresh local cache
"" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
""
"" see :h vundle for more details or wiki for FAQ
"" Put your non-Plugin stuff after this line
"" vundle ------------------------------

" ack ------------
" use ag (silver-searcher) instead of ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
  " let g:ackprg = 'ag --nogroup --nocolor --column'
endif
" ack ------------

" airline ---------
"let g:airline#extensions#tabline#enabled = 1
"let g:airline_theme='luna'
"let g:airline_solarized_bg='dark'
" airline ---------

" lightline ----------
" colorscheme and some tab mods
let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'active': {
    \   'left': [ [ 'mymode', 'paste' ], 
    \             [ 'gitbranch', 'myfilename', 'mymodified' ] ]
    \ },
    \ 'inactive': {
    \   'left': [ [ 'gitbranch', 'myfilename', 'mymodified' ] ]
    \ },
    \ 'component_function': {
    \   'mymode': 'MyLightlineMode',
    \   'gitbranch': 'MyLightlineGitbranch',
    \   'myfilename': 'MyLightlineFilename',
    \   'mymodified': 'MyLightlineModified',
    \ },
    \ 'tab_component_function': {
    \   'filename': 'MyLightlineTabFilename',
    \   'modified': 'MyLightlineTabModified',
    \ },
    \ }

" no mode for qf
function! MyLightlineMode()
  if &filetype ==# 'qf'
    return ''
  else
    return lightline#mode()
  endif
endfunction

" no git branch for qf
function! MyLightlineGitbranch()
  if &filetype ==# 'qf'
    return ''
  else
    "return fugitive#statusline()
    "---
    "let branch = fugitive#head()
    "return branch ==# '' ? '' : 'git:<' . branch . '>'
    "---
    if exists('t:mckgitstatus')
      return t:mckgitstatus
    else
      return "git:<???>"
    endif
  endif
endfunction

" no filename for qf
function! MyLightlineFilename()
  if &filetype ==# 'qf'
    return 'qf'
  else
    let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
    return filename
  endif
endfunction

" no modified for qf
function! MyLightlineModified()
  if &filetype ==# 'qf'
    return ''
  else
    return &modified ? '+' : ''
  endif
endfunction

" keep tabname when entering qf
function! MyLightlineTabFilename(n)
  let tab_filename = gettabvar(a:n, 'lightline_tab_filename', '')
  if gettabwinvar(a:n, tabpagewinnr(a:n), '&buftype') ==# 'quickfix'
    return tab_filename
  endif
  let tab_filename = lightline#tab#filename(a:n)
  call settabvar(a:n, 'lightline_tab_filename', tab_filename)
  return tab_filename
endfunction

" keep modified when entering qf
function! MyLightlineTabModified(n)
  let tab_modified = gettabvar(a:n, 'lightline_tab_modified', '')
  if gettabwinvar(a:n, tabpagewinnr(a:n), '&buftype') ==# 'quickfix'
    return tab_modified
  endif
  let tab_modified = lightline#tab#modified(a:n)
  call settabvar(a:n, 'lightline_tab_modified', tab_modified)
  return tab_modified
endfunction
" lightline ----------

" vinegar ------------
" vinegar open/close
"nmap <Leader>vo -
"nmap <Leader>vc <C-^>
" also added <Esc><Esc> for close to the plugin
  "nmap <buffer> - <Plug>VinegarUp
  "" double Esc to exit ...
  "nmap <buffer> <Esc><Esc> <C-^>
" nesting style
"let g:netrw_liststyle=3
" vinegar ------------

" NERDtree -----------
" NERDtree toggle
" noremap <Leader>nt :NERDTreeToggle<CR>
" noremap <Leader>nt :NERDTreeTabsToggle<CR>
" NERDtree -----------

" NERDtree-like -------
" NERDtree-like browsing with netrw ...
" also see vim-vinegar
"let g:netrw_banner = 0
"let g:netrw_liststyle = 3
"let g:netrw_browse_split = 4
"let g:netrw_altv = 1
"let g:netrw_winsize = 7
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END
" NERDtree-like -------

" FileBeagle ----------
let g:filebeagle_suppress_keymaps = 1
nmap <silent> <Leader>fb <Plug>FileBeagleOpenCurrentWorkingDir
nmap <silent> -          <Plug>FileBeagleOpenCurrentBufferDir
" unmap these in qf
autocmd BufReadPost quickfix nnoremap <buffer> <Leader>fb <Nop>
autocmd BufReadPost quickfix nnoremap <buffer> - -
" :q in qf to also quit
autocmd BufReadPost quickfix cmap     <buffer> q<CR> qa<CR>
" FileBeagle ----------

" gitgutter -----------
let g:gitgutter_enabled = 1
" always have sign column
if exists('&signcolumn')  " Vim 7.4.2201
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always = 1
endif
nmap <Leader>gn <Plug>GitGutterNextHunk
nmap <Leader>gp <Plug>GitGutterPrevHunk
nmap <silent> <Leader>gg :call gitgutter#process_buffer(bufnr(''), 0)<CR>
" gitgutter -----------

" QFEnter -------------
" add C-t to open in new tab to be consistent with fzf
let g:qfenter_keymap = {}
let g:qfenter_keymap.topen = ['<Leader><Tab>', '<C-t>']
" QFEnter -------------

" lastplace -----------
" mods to skip for vimdiff
if &diff
  let b:loaded_lastplace_plugin = 1
endif
" lastplace -----------

" improves color highlighing with dark terminals
set background=dark
" tmux default term set to screen-256color
set t_Co=256

if &term=="xterm"
  set t_Co=8
  set t_Sb=^[[4%dm
  set t_Sf=^[[3%dm
  "highlight Comment ctermfg=blue
endif

colorscheme deus

"set ttyfast

" -----------------------------

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
set laststatus=2

" if not using airline / lightline
"" Format the status line
"if has("statusline")
"  set statusline=%<%F\ [%{&ff}]\ %h%m%r%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P
"" set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L] 
"" set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
"  "              | | | | |  |   |      |  |     |    |
"  "              | | | | |  |   |      |  |     |    + current column
"  "              | | | | |  |   |      |  |     +-- current line
"  "              | | | | |  |   |      |  +-- current % into file
"  "              | | | | |  |   |      +-- current syntax in square brackets
"  "              | | | | |  |   +-- current fileformat
"  "              | | | | |  +-- number of lines
"  "              | | | | +-- preview flag in square brackets
"  "              | | | +-- help flag in square brackets
"  "              | | +-- readonly flag in square brackets
"  "              | +-- rodified flag in square brackets
"  "              +-- full path to file in the buffer
"endif

if &t_Co > 2 || has("gui_running")
  syntax on
" set nohlsearch
" hi StatusLine   term=reverse ctermfg=LightGray
" hi StatusLineNC term=reverse ctermfg=LightGray
" hi Comment      term=NONE    ctermfg=LightGray
endif

" always show tabs
set showtabline=2

" -----------------------------

set fileformat=unix

set bs=2		" allow backspacing over everything in ins mode
set noai		" always set autoindenting off
set nobackup    " do not keep a backup file
" read/write a .viminfo file, don't store more than 20 reg
set viminfo='20,\"20,f20 
" keep 20 lines of command line history
set history=20	
" show the cursor position all the time
set ruler		

" -------- mouse / cut - paste - clipboard --------

"set mouse-=a
" to get mouse support and 
" selection buffer copied automatically to clipboard
"set mouse=nv
set mouse=a

" use shift + left click to get back to previous (mouse=~a)

"set clipboard=unnamed
"set clipboard=unnamedplus
set clipboard=unnamed,unnamedplus

" map Ctrl-C to yank selection into paste buffer/clipboard
":vmap <C-C> "+y 

"nnoremap <C-c> "+y<LeftRelease>
"vnoremap <C-c> "+y<LeftRelease>
" y`] to goto end of block, or even better
" gv<Esc> leave cursor at last pos
nnoremap <C-c> "+ygv<Esc>
vnoremap <C-c> "+ygv<Esc>

nnoremap <C-x> "+d<LeftRelease>
vnoremap <C-x> "+d<LeftRelease>

inoremap <C-v> <C-r>+

set timeoutlen=1000 ttimeoutlen=0

" or when you release the mouse button ...
":noremap <LeftRelease> "+y<LeftRelease>

" if mouse not supported try vim-extended or gvim -v

" run cmd:
" (parcellite -n > dev/null 2>&1) &
" so that clipboard is pushed/pulled to/from all other apps

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab
"set noexpandtab
"   
" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

"set guioptions=

" Don't use Ex mode, use Q for formatting
" map Q gq
" No, use Q for recording (@ for playback)
noremap Q q
noremap q <Nop>

" Make p in Visual mode replace the selected text with the "" register.
"vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" for block select beyond shorter line lengths
set virtualedit=block

" ------ scroll ------

set nostartofline
set scrolloff=0

function! NoremapNormalCmd(key, preserve_omni, ...)
  let cmd = ''

  let icmd = ''
  for x in a:000
    let cmd .= x
    let icmd .= "<C-\\><C-O>" . x
  endfor
  execute ":keepjumps :nnoremap <silent> " . a:key . " " . cmd
  execute ":keepjumps :vnoremap <silent> " . a:key . " " . cmd
  if a:preserve_omni
    execute ":keepjumps :inoremap <silent> <expr> " . a:key . " pumvisible() ? \"" . a:key . "\" : \"" . icmd . "\""
  else
    execute ":keepjumps :inoremap <silent> " . a:key . " " . icmd
  endif
endfunction

" Cursor moves by screen lines
"call NoremapNormalCmd("<Up>", 1, "gk")
"call NoremapNormalCmd("<Down>", 1, "gj")

"call NoremapNormalCmd("<Home>", 0, "g<Home>")
"call NoremapNormalCmd("<End>", 0, "g<End>")

" PageUp/PageDown preserve relative cursor position
 call NoremapNormalCmd("<PageUp>", 0, "<C-U>", "<C-U>")
 call NoremapNormalCmd("<PageDown>", 0, "<C-D>", "<C-D>")

function! s:GoToMID()
  let mid = (winheight(0) + 1) / 2
  let row = winline()
  if (row > mid)
    let delta = row - mid
    execute "keepjumps normal" . delta . "gk"
  elseif (row < mid)
    let delta = mid - row
    execute "keepjumps normal" . delta . "gj"
  endif
endfunction

" C-/ to center line in screen
noremap <silent> <C-_> :call <SID>GoToMID()<CR>

function! s:GetNumScroll(num)
  let num_rows = winheight(0)
  let num_scroll = a:num
  if (a:num == -1)
    let num_scroll = (num_rows + 1) / 2
  elseif (a:num == -2)
    let num_scroll = num_rows
  endif
  if (num_scroll < 1)
    let num_scroll = 1
  endif
  return num_scroll
endfunction

function! s:RtrnToOrig(before_scr_line)
  keepjumps normal H
  let delta = a:before_scr_line - winline()
  while (delta != 0)
    if (delta < 0)
      let delta = winline() - a:before_scr_line
      let iter = 1
      while (iter <= delta)
        execute "keepjumps normal" "gk"
        let iter +=1
      endwhile
    elseif (delta > 0)
      let iter = 1
      while (iter <= delta)
        execute "keepjumps normal" "gj"
        let iter +=1
      endwhile
    endif
    let delta = a:before_scr_line - winline()
  endwhile
endfunction

function! s:scrollUP(num)
  let num_scroll = <SID>GetNumScroll(a:num)
  let num_rows = winheight(0)
  " -------------
  let before_scr_line = winline()
  keepjumps normal L
  let after_scr_line = winline()
  let extra = num_rows - after_scr_line
  let extra += num_scroll
  " move by 1 to prevent over scrolling
  let iter = 1
  while (iter <= extra)
    execute "keepjumps normal" "gj"
    let iter +=1
  endwhile
  " -------------
  call <SID>RtrnToOrig(before_scr_line)
endfunction
  
function! s:scrollDN(num)
  let num_scroll = <SID>GetNumScroll(a:num)
  " -------------
  let before_scr_line = winline()
  keepjumps normal H
  let after_scr_line = line(".")
  execute "keepjumps normal" "gk"
  let after_scr2_line = line(".")
  " special case where gk doesnt move up one as expected
  if ( (after_scr_line == after_scr2_line) && (after_scr_line > 1) )
    execute "keepjumps normal" "gk"
  endif
  let extra = (num_scroll - 1)
  let extra += (winline() - 1)
  " move by 1 to prevent over scrolling
  let iter = 1
  while (iter <= extra)
    execute "keepjumps normal" "gk"
    let iter +=1
  endwhile
  " -------------
  call <SID>RtrnToOrig(before_scr_line)
endfunction

 noremap <silent> <C-J>     :call <SID>scrollUP(1)<CR>
 noremap <silent> <C-K>     :call <SID>scrollDN(1)<CR>
 noremap <silent> <C-F>     :call <SID>scrollUP(-1)<CR>
 noremap <silent> <C-B>     :call <SID>scrollDN(-1)<CR>
"noremap <silent> <PageDown>:call <SID>scrollUP(-2)<CR>
"noremap <silent> <PageUp>  :call <SID>scrollDN(-2)<CR>

" N<C-D> and N<C-U> idiotically change the scroll setting
function! s:Saving_scrollV(cmd)
  let save_scroll = &scroll
  execute "keepjumps normal" a:cmd
  let &scroll = save_scroll
endfunction

" move and scroll
"nmap <silent> <C-J>           :call <SID>Saving_scrollV("1<C-V><C-D>")<CR>
 vmap <silent> <C-J> <Esc>     :call <SID>Saving_scrollV("gv1<C-V><C-D>")<CR>
"nmap <silent> <C-K>           :call <SID>Saving_scrollV("1<C-V><C-U>")<CR>
 vmap <silent> <C-K> <Esc>     :call <SID>Saving_scrollV("gv1<C-V><C-U>")<CR>

"nmap <silent> <C-F>           :call <SID>Saving_scrollV("<C-V><C-D>")<CR>
 vmap <silent> <C-F> <Esc>     :call <SID>Saving_scrollV("gv<C-V><C-D>")<CR>
"nmap <silent> <PageDown>      :call <SID>Saving_scrollV("<C-V><C-D>")<CR>
"vmap <silent> <PageDown> <Esc>:call <SID>Saving_scrollV("gv<C-V><C-D>")<CR>

"nmap <silent> <C-B>           :call <SID>Saving_scrollV("<C-V><C-U>")<CR>
 vmap <silent> <C-B> <Esc>     :call <SID>Saving_scrollV("gv<C-V><C-U>")<CR>
"nmap <silent> <PageUp>        :call <SID>Saving_scrollV("<C-V><C-U>")<CR>
"vmap <silent> <PageUp> <Esc>  :call <SID>Saving_scrollV("gv<C-V><C-U>")<CR>

"noremap <C-j> @="1\<lt>C-D>"<CR>:set scroll=0<CR>
"noremap <C-k> @="1\<lt>C-U>"<CR>:set scroll=0<CR>

" I couldn't find any get_number_of_visible_lines function, so I made my own.
function GetNumberOfVisibleLines()
  let cur_line = line(".")
  let cur_col = virtcol(".")
  keepjumps normal H
  let top_line = line(".")
  keepjumps normal L
  let bot_line = line(".")
  execute "keepjumps normal " . cur_line . "G"
  execute "keepjumps normal " . cur_col . "|"
  return bot_line - top_line
endfunc

" noremap <PageUp> 39<C-U>:set scroll=0<CR>
function! MyPageUp()
  let visible_lines = GetNumberOfVisibleLines()
  execute "keepjumps normal " . visible_lines . "\<C-U>:set scroll=0\r"
endfunction

" noremap <PageDown> 39<C-D>:set scroll=0<CR>
function! MyPageDown()
  let visible_lines = GetNumberOfVisibleLines()
  execute "keepjumps normal " . visible_lines . "\<C-D>:set scroll=0\r"
endfunction

" BorlandPascal pageup/down behaviour!
" todo: when hitting top/bottom of file, then restore Y to last Y
"noremap <PageUp> :call MyPageUp()<CR>
"noremap <PageDown> :call MyPageDown()<CR>

" ------ scroll ------

" -----------------------------

" Only do this part when compiled with support for autocommands.
if has("autocmd")

 " In text files, always limit the width of text to 78 characters
 " autocmd BufRead *.txt set tw=78

 " When editing a file, always jump to the last cursor position
 " (seems to ignore column)
 "autocmd BufReadPost *
 "\ if line("'\"") > 0 && line ("'\"") <= line("$") |
 "\   exe "normal! g'\"" |
 "\ endif

 augroup cprog
  " Remove all cprog autocommands
  au!

  " When starting to edit a file:
  "   For C and C++ files set formatting of comments and set C-indenting on.
  "   For other files switch it off.
  "   Don't change the order, it's important that the line with * comes first.
  "   turn off t for text wrap (or set tw=0)
  autocmd FileType *      set formatoptions=cql nocindent comments&
  autocmd FileType c,cpp  set formatoptions=croql nocindent comments=sr:/*,mb:*,el:*/,://
  " to get rid of <cr> adding more comment lines for cut-and-paste mostly ...
  " au FileType c,cpp setlocal comments-=:// comments+=f://
  au FileType c,cpp setlocal comments-=://
 augroup END

 augroup gzip
  " Remove all gzip autocommands
  au!

  " Enable editing of gzipped files
  " set binary mode before reading the file
  autocmd BufReadPre,FileReadPre	*.gz,*.bz2 set bin
  autocmd BufReadPost,FileReadPost	*.gz call GZIP_read("gunzip")
  autocmd BufReadPost,FileReadPost	*.bz2 call GZIP_read("bunzip2")
  autocmd BufWritePost,FileWritePost	*.gz call GZIP_write("gzip")
  autocmd BufWritePost,FileWritePost	*.bz2 call GZIP_write("bzip2")
  autocmd FileAppendPre			*.gz call GZIP_appre("gunzip")
  autocmd FileAppendPre			*.bz2 call GZIP_appre("bunzip2")
  autocmd FileAppendPost		*.gz call GZIP_write("gzip")
  autocmd FileAppendPost		*.bz2 call GZIP_write("bzip2")

  " After reading compressed file: Uncompress text in buffer with "cmd"
  fun! GZIP_read(cmd)
    " set 'cmdheight' to two, to avoid the hit-return prompt
    let ch_save = &ch
    set ch=3
    " when filtering the whole buffer, it will become empty
    let empty = line("'[") == 1 && line("']") == line("$")
    let tmp = tempname()
    let tmpe = tmp . "." . expand("<afile>:e")
    " write the just read lines to a temp file "'[,']w tmp.gz"
    execute "'[,']w " . tmpe
    " uncompress the temp file "!gunzip tmp.gz"
    execute "!" . a:cmd . " " . tmpe
    " delete the compressed lines
    '[,']d
    " read in the uncompressed lines "'[-1r tmp"
    set nobin
    execute "'[-1r " . tmp
    " if buffer became empty, delete trailing blank line
    if empty
      normal Gdd''
    endif
    " delete the temp file
    call delete(tmp)
    let &ch = ch_save
    " When uncompressed the whole buffer, do autocommands
    if empty
      execute ":doautocmd BufReadPost " . expand("%:r")
    endif
  endfun

  " After writing compressed file: Compress written file with "cmd"
  fun! GZIP_write(cmd)
    if rename(expand("<afile>"), expand("<afile>:r")) == 0
      execute "!" . a:cmd . " <afile>:r"
    endif
  endfun

  " Before appending to compressed file: Uncompress file with "cmd"
  fun! GZIP_appre(cmd)
    execute "!" . a:cmd . " <afile>"
    call rename(expand("<afile>:r"), expand("<afile>"))
  endfun

 augroup END

 " This was disabled, because it changes the jumplist.  Can't use CTRL-O to go
 " back to positions in previous files more than once.
 " skip this for vimdiff (ie always start at beginning)
 "if !&diff
 " " When editing a file, always jump to the last cursor position.
 " " This must be after the uncompress commands.
 " " see also vim-lastplace plugin above that is similar
 " " (dont want this for .../.git/COMMIT_EDITMSG for example)
 "  autocmd BufReadPost * if line("'\"") && line("'\"") <= line("$") | exe "keepjumps normal `\"" | endif
 "endif

 " clear all jumps when starting new edit
 aug VimStartup
   au!
   autocmd VimEnter * :clearjumps
 aug END

endif " has("autocmd")

"================================================================
"================================================================
"================================================================

" NOTE: vim needs -python/3 support for YouCompleteMe and rtags
" +python/dyn +python3/dyn 
" ./configure --enable-pythoninterp=yes --enable-python3interp=yes

"" YouCompleteMe --------
"let g:ycm_global_ycm_extra_conf="~/.vim/bundle/YouCompleteMe/ycm_extra_conf.py"
"let g:ycm_key_list_select_completion=[]
"let g:ycm_key_list_previous_completion=[]
"nmap <C-]> :YcmCompleter GoToDefinitionElseDeclaration<CR>
"" YouCompleteMe --------

" vim-clang ----------
let g:clang_cpp_options = '-std=c++11 -DNDEBUG -Wno-inconsistent-missing-override'
" put this in the local .lvimrc now ...
"let g:clang_compilation_database = '~/lnrs/wip/buildln/compile_commands.json'
"let g:clang_compilation_database = '~/lnrs/wip/buildln'
let g:clang_complete_copen = 1
let g:clang_auto = 1
let g:clang_load_if_clang_dotfile = 1
let g:clang_dotfile = '.clang_complete'
" vim-clang ----------

" localvimrc ---------
let g:localvimrc_persistent = 1
" localvimrc ---------

"================================================================

" gtags -----------------
" manual plugin in ~/.vim/plugin
" https://www.gnu.org/software/global/
"
" download/build/install gtags
" run gtags
"
" Gtags_VerticalWindow    open windows vertically
" Gtags_Auto_Map          use a suggested key-mapping
" Gtags_Auto_Update       keep tag files up-to-date automatically
" Gtags_No_Auto_Jump      don't jump to the first tag at the time of search
" Gtags_Close_When_Single close quickfix windows in case of single tag
"let Gtags_Auto_Map = 1
"let Gtags_Auto_Update = 1
"let Gtags_No_Auto_Jump = 1
""let Gtags_Close_When_Single = 1
"nmap <C-]> :GtagsCursor<CR>
" C-o to go back
" \cc to close quickfix
"noremap <silent> <Leader>cc :ccl\|lcl<CR>:echo<CR>
"noremap <silent> <Leader>cc :windo lcl\|ccl<CR>:echo<CR>
" gtags -----------------

" gtags-scope -----------
" manual plugin in ~/.vim/plugin
" https://www.gnu.org/software/global/
"
" download/build/install gtags
" run gtags-cscope
"
" :cs find s - Find symbol
" :cs find g - Find definition
" :cs find d - Find functions called by this function (not implemented)
" :cs find c - Find reference
" :cs find t - Find text string
" :cs find e - Find egrep pattern
" :cs find f - Find path
" :cs find i - Find include file
" C-\ C-\ C-] jump to definition
" C-t to go back
"
"let GtagsCscope_Auto_Load = 1
"let GtagsCscope_Auto_Map = 1
"let GtagsCscope_No_Auto_Jump = 1
"let GtagsCscope_Quiet = 1
" gtags-scope -----------

" cscope -----------
" manual plugin in ~/.vim/plugin
" https://github.com/vim-scripts/cscope-quickfix.git
"
" with gtags-cscope -
" https://www.gnu.org/software/global/
"
" download/build/install gtags
" run gtags-cscope
"
" or try universal-ctags
" some optional things ...
"" if you like to give the reference lookup without quickfix a try, 
"" remove the c- option in cscopequickfix below.
"set cscopeprg=gtags-cscope
"if has('cscope')
"  set cscopetag cscopeverbose
"  if has('quickfix')
"    set cscopequickfix=s-,c-,d-,i-,t-,e-
"  endif
" map <C-\> :cs find c <C-R>=expand("<cword>")<CR><CR>
" C-t to go back
"" probably also need - cs add ./GTAGS
"endif
" \cc to close quickfix
"noremap <silent> <Leader>cc :ccl\|lcl<CR>:echo<CR>
"noremap <silent> <Leader>cc :windo lcl\|ccl<CR>:echo<CR>
" cscope -----------

" rtags -----------------
" download/build/install rtags
" start rdm daemon
" run rc -J /path/to/compile_commands.json
"
"\ri	Symbol info
"\rj	Follow location
"\rJ	Follow declaration location
"\rS	Follow location (open in horizontal split)
"\rV	Follow location (open in vertical split)
"\rT	Follow location open in a new tab
"\rp	Jump to parent
"\rc	Find subclasses
"\rC	Find superclasses
"\rf	Find references
"\rF	Call tree (o - open node, Enter - jump)
"\rn	Find references by name
"\rs	Find symbols by name
"\rr	Reindex current file
"\rl	List all available projects
"\rw	Rename symbol under cursor
"\rv	Find virtuals
"\rd	Diagnose file for warnings and errors
"\rb	Jump to previous location
"
let g:rtagsUseLocationList=1
let g:rtagsAutoLaunchRdm=1
nmap <C-]> :call rtags#JumpTo(g:SAME_WINDOW)<CR>
" C-o to go back
" C-t to go back (not implemented)
" nmap <C-t> :call rtags#JumpBack()<CR>:echo<CR>
" \cc to close quickfix
noremap <silent> <Leader>cc :ccl\|lcl<CR>:echo<CR>
"noremap <silent> <Leader>cc :windo lcl\|ccl<CR>:echo<CR>
"
" also had to make changes to python run() command
" rtags -----------------

" fswitch ---------------
" Switch to the other .c*/.h* file in the current window >
noremap <silent> <Leader>of :FSHere<cr>
" do not create new files
let fsnonewfiles=1
" fswitch ---------------

"================================================================

" limit quickfix height ...
au FileType qf call AdjustWindowHeight(5, 10)
function! AdjustWindowHeight(minheight, maxheight)
  let l = 1
  let n_lines = 0
  let w_width = winwidth(0)
  while l <= line('$')
    " number to float for division
    let l_len = strlen(getline(l)) + 0.0
    let line_width = l_len/w_width
    let n_lines += float2nr(ceil(line_width))
    let l += 2
  endw
  exe max([min([n_lines, a:maxheight]), a:minheight]) . "wincmd _"
endfunction
" https://gist.github.com/juanpabloaj/5845848

" automatically quit Vim if quickfix window is the last ...
au BufEnter * call MyWindow()
function! MyWindow()
  " if the window is quickfix go on
  if &buftype=="quickfix"
    " if this window is last on screen quit without warning
    if winnr('$') < 2
      quit
    else
      " qf highlight on
      "hi QuickFixLine cterm=None ctermbg=60
      setlocal cursorline
    endif
  else
    " qf highlight off
    "hi QuickFixLine cterm=None ctermbg=239
    setlocal nocursorline
  endif
endfunction

au BufWinEnter * call MyWindow2()
function! MyWindow2()
  if &buftype=="quickfix"
    " qf highlight on
    "hi QuickFixLine cterm=None ctermbg=60
    setlocal cursorline
  else
    " qf highlight off
    "hi QuickFixLine cterm=None ctermbg=239
    setlocal nocursorline
  endif
endfunction

" change quickfix highlight
"hi QuickFixLine cterm=None ctermbg=256 guibg=#ffff00
"hi QuickFixLine cterm=None ctermbg=60
hi QuickFixLine cterm=None
hi cursorline cterm=None ctermbg=239

" -----------------------------

noremap <C-a> 0
" ctrl-e was scroll down one line so we lose that
noremap <C-e> $

" close all windows and quit
inoremap <C-X>w     <Esc>:wqa<cr>
nnoremap <C-X>w     :wqa<cr>
inoremap <C-X><C-w> <Esc>:wqa<cr>
nnoremap <C-X><C-w> :wqa<cr>

inoremap <C-X>c     <Esc>:conf qa<cr>
nnoremap <C-X>c     :conf qa<cr>
inoremap <C-X><C-c> <Esc>:conf qa<cr>
nnoremap <C-X><C-c> :conf qa<cr>

noremap <Leader>xc  :conf qa<cr>
noremap <Leader>ax  :conf qa<cr>

" for vimdiff make :q quit both ...
if &diff
  cmap    q<CR>  qa<CR>
  cmap    q!<CR> qa!<CR>
  noremap <C-l>  :diffupdate<CR><C-l>
  map <Leader>dn ]c
  map <Leader>dp [c
  "hi DiffAdd    ctermfg=233 ctermbg=LightGreen guifg=#003300 guibg=#DDFFDD gui=none cterm=none
  "hi DiffChange ctermbg=white  guibg=#ececec gui=none   cterm=none
  "hi DiffText   ctermfg=233  ctermbg=yellow  guifg=#000033 guibg=#DDDDFF gui=none cterm=none
  " to ignore whitespace diffs
  "set diffopt+=iwhite
endif

set noshowmode

" persistent undo between sessions ...
"set undodir=~/.vim/undodir

" dont save to ~/.vim/.netrwhist
:let g:netrw_dirhistmax = 0

" spawn new shell
noremap <silent> <Leader>zs :terminal ++close ++curwin<CR>

" undo all changes
noremap <Leader>uu :earlier 999999<CR>:u<CR>

" toggle search highlight
noremap <Leader>hl :set hlsearch! hlsearch?<CR>
hi Search ctermbg=58

" clear cmd window (or just <C-l> to redraw)
noremap <Leader>cx :echo<CR>

" tab open
noremap <Leader>to :tabnew<CR>
" use 'x' for exit here, could also use 'k' to kill 
" but since a save could happen 'x' seems more appropriate
" tab close (same as window close)
noremap <Leader>tc :conf q<cr>

" window close (same as tab close)
noremap <Leader>wc :conf q<cr>

" next tab
noremap <Leader>tn :tabnext<CR>
" prev tab
noremap <Leader>tp :tabprevious<CR>

execute "set <M-.>=\e."
execute "set <M-'>=\e'"

execute "set <M-,>=\e,"
execute "set <M-;>=\e;"

" Alt .(>)|' next tab
inoremap <M-.> <Esc>:tabnext<CR>
nnoremap <M-.>      :tabnext<CR>
inoremap <M-'> <Esc>:tabnext<CR>
nnoremap <M-'>      :tabnext<CR>
" Alt ,(<)|; prev tab
inoremap <M-,> <Esc>:tabprevious<CR>
nnoremap <M-,>      :tabprevious<CR>
inoremap <M-;> <Esc>:tabprevious<CR>
nnoremap <M-;>      :tabprevious<CR>

" -----------------------------

" Interval timer job for git status

" info/status script
let g:gitinfo_script = "~/bin/gitinfo"
" interval time (ms)
let g:gitinfo_interval = 5000

" -------

let t:mckgitstatus = "git:<???>"

function! MyGSCloseHandler(ch)
  if ch_canread(a:ch)
    let t:mckgitstatus = ch_read(a:ch)
  else
    let t:mckgitstatus = "git:<err(ch_read)>"
  endif
  "echomsg t:mckgitstatus
  if exists('t:MyGSJob')
    unlet t:MyGSJob
  endif
endfunction

function! MyGSStart()
  let l:jstat = "complete"
  if exists('t:MyGSJob')
    let l:jstat = job_status(t:MyGSJob)
  endif
  "echomsg "l:jstat = " . l:jstat
  if l:jstat == "run"
    echo "git status cmd still running ..."
  else
    if filereadable(expand(g:gitinfo_script))
      let l:command = '/bin/sh -c ' . '"' . g:gitinfo_script . ' ' . expand('%:p:h') . '"'
      "echomsg "starting job " . l:command
      let t:MyGSJob = job_start(l:command, { 'close_cb':'MyGSCloseHandler' })
    endif
  endif
  call lightline#update()
endfunction

function! MyGitStatus(timer)
  if &filetype !=# 'qf'
    call MyGSStart()
  endif
endfunction

if &diff
  let t:mckgitstatus = "diff"
else
  autocmd BufReadPost,BufNewFile,FileReadPost * call timer_start(g:gitinfo_interval, 'MyGitStatus', {'repeat': -1})
endif

" -----------------------------

