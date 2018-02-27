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
filetype off              " required
"" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
"
" fzf from git install in ~/.fzf 
set rtp+=~/.fzf
"
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
"Plugin 'lyuts/vim-rtags'
Plugin 'mckellyln/vim-rtags'
"
" qf/loclist window in all windows/tabs (**modified++)
"Plugin 'yssl/QFEnter'
Plugin 'mckellyln/QFEnter'
"
" other qf plugin
"Plugin 'romainl/vim-qf'
"
" other bufutils
"Plugin 'smitajit/bufutils.vim'
"
" fswitch to switch between .cpp/.h{pp} (**modified++)
"Plugin 'derekwyatt/vim-fswitch'
Plugin 'mckellyln/vim-fswitch'
"
" FileBeagle for dir/file browsing (**modified++)
"Plugin 'jeetsukumaran/vim-filebeagle'
Plugin 'mckellyln/vim-filebeagle'
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
"Plugin 'tpope/vim-fugitive'
Plugin 'mckellyln/vim-fugitive'
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
"Plugin 'altercation/vim-colors-solarized'
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
"Plugin 'farmergreg/vim-lastplace'
Plugin 'mckellyln/vim-lastplace'
"
" run cmd in background and output to quickfix ...
" :AsyncRun gcc % -c %< for example
"Plugin 'skywind3000/asyncrun.vim'
"
"" All of your Plugins must be added before the following line
call vundle#end()         " required
filetype plugin indent on " required
"
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
  elseif !&buflisted
    return ''
  else
    return lightline#mode()
  endif
endfunction

" no git branch for qf
function! MyLightlineGitbranch()
  if &filetype ==# 'qf'
    return ''
  elseif !&buflisted
    return ''
  else
    "return fugitive#statusline()
    "---
    "let branch = fugitive#head()
    "return branch ==# '' ? '' : 'git:<' . branch . '>'
    "---
    if exists('b:mckgitstatus')
      return b:mckgitstatus
    else
      return "git:<???>"
    endif
  endif
endfunction

" no filename for qf
function! MyLightlineFilename()
  if &filetype ==# 'qf'
    return 'qf'
  elseif !&buflisted
    return 'ac'
  else
    let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
    return filename
  endif
endfunction

" no modified for qf
function! MyLightlineModified()
  if &filetype ==# 'qf'
    return ''
  elseif !&buflisted
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

" modify tab active/inactive colors
let s:palette = g:lightline#colorscheme#wombat#palette
let s:palette.tabline.left   = [ [ '#d0d0d0', '#585858', 252, 240  ] ]
let s:palette.tabline.tabsel = [ [ '#d0d0d0', '#5f8787', 252, 66, 'bold' ] ]
unlet s:palette
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

"let g:solarized_termcolors=256
"colorscheme solarized
colorscheme deus

"set ttyfast

"set iskeyword for word separators ...
"current default is:
"iskeyword=@,48-57,_,192-255,#
"tmux uses " ='`;|[](){},/?\\\""
set iskeyword=@,48-57,_,192-255,@-@,<,>,-,+,*,%,$,!,~,.,:,#,^

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

" use both clipboard (unnamed) and primary (unnamedplus)
"set clipboard^=unnamed
"set clipboard^=unnamedplus
set clipboard^=unnamed,unnamedplus

set timeoutlen=1000 ttimeoutlen=0

" map Ctrl-C to yank selection into paste buffer/clipboard
":vmap <silent> <C-C> "+y

"nnoremap <silent> <C-c> "+y<LeftRelease>
"vnoremap <silent> <C-c> "+y<LeftRelease>
" y`] to goto end of block, or even better
" gv<Esc> leave cursor at last pos
nnoremap <silent> <C-c> "+ygv<Esc>
vnoremap <silent> <C-c> "+ygv<Esc>

nnoremap <silent> <C-x> "+d<LeftRelease>
vnoremap <silent> <C-x> "+d<LeftRelease>

inoremap <silent> <C-v> <C-r>+

" or when you release the mouse button ...
":noremap <silent> <LeftRelease> "+y<LeftRelease>

" if mouse not supported try vim-extended or gvim -v

" run cmd:
" (parcellite -n > dev/null 2>&1) &
" so that clipboard is pushed/pulled to/from all other apps

" TripleClick for next larger entity, not whole line
nnoremap <silent> <2-LeftMouse> lbve
vnoremap <silent> <2-LeftMouse> <Esc>lbve
nnoremap <silent> <3-LeftMouse> lBvE
vnoremap <silent> <3-LeftMouse> <Esc>lBvE
nnoremap <silent> <4-LeftMouse> <Nop>
vnoremap <silent> <4-LeftMouse> <Nop>

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
noremap <silent> Q q
noremap <silent> q <Nop>

" Make p in Visual mode replace the selected text with the "" register.
"vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" for block select beyond shorter line lengths
set virtualedit=block

" ------ scroll ------

set nostartofline
set scrolloff=0

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

" Cursor moves by screen lines
 call NoremapNormalCmd("<Up>",   1, "gk")
 call NoremapNormalCmd("<Down>", 1, "gj")
 call NoremapNormalCmd("<Home>", 0, "g<Home>")
 call NoremapNormalCmd("<End>",  0, "g<End>")

 call NoremapNormalCmd("<C-j>",    0, "1<C-D>")
 call NoremapNormalCmd("<C-Down>", 0, "1<C-D>")

 call NoremapNormalCmd("<C-k>",    0, "1<C-U>")
 call NoremapNormalCmd("<C-Up>",   0, "1<C-U>")

 call NoremapNormalCmd("<ScrollWheelDown>", 0, "5<C-D>")
 call NoremapNormalCmd("<ScrollWheelUp>",   0, "5<C-U>")

 function! MapScrollKeys()
   let half = winheight(0) / 2
   if (half < 1)
     half = 1
   endif
   let full = half + half
   let fullup = full . "<C-U>"
   let fulldn = full . "<C-D>"
   let halfup = half . "<C-U>"
   let halfdn = half . "<C-D>"
   call NoremapNormalCmd("<C-f>",        0, halfdn)
   call NoremapNormalCmd("<C-b>",        0, halfup)
   call NoremapNormalCmd("<PageDown>",   0, fulldn)
   call NoremapNormalCmd("<PageUp>",     0, fullup)
   call NoremapNormalCmd("<C-PageDown>", 0, halfdn)
   call NoremapNormalCmd("<C-PageUp>",   0, halfup)
 endfunction

 call MapScrollKeys()

 autocmd VimResized * call MapScrollKeys()

" ---------

function! s:GoToMID(curr_mode)
  let mid = (winheight(0) + 1) / 2
  let row = winline()
  if (a:curr_mode == 0)
    if (row > mid)
      let delta = row - mid
      execute "keepjumps normal" . delta . "gk"
    elseif (row < mid)
      let delta = mid - row
      execute "keepjumps normal" . delta . "gj"
    endif
  elseif (a:curr_mode == 1)
    if (row > mid)
      let delta = row - mid
      execute "keepjumps normal gv" . delta . "gk"
    elseif (row < mid)
      let delta = mid - row
      execute "keepjumps normal gv" . delta . "gj"
    endif
  endif
endfunction

" C-/ to center line in screen
nnoremap <silent> <C-_> :call <SID>GoToMID(0)<CR>
vnoremap <silent> <C-_> :call <SID>GoToMID(1)<CR>

" ---------

if 0 " disable old scroll functions

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

function! s:RtrnToOrig(before_scr_line, curr_mode)
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

function! s:scrollUP(num, curr_mode)
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
  call <SID>RtrnToOrig(before_scr_line, a:curr_mode)
endfunction
  
function! s:scrollDN(num, curr_mode)
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
  call <SID>RtrnToOrig(before_scr_line, a:curr_mode)
endfunction

"nnoremap <silent> <C-J>            :call <SID>scrollUP(1,0)<CR>
"nnoremap <silent> <C-Down>         :call <SID>scrollUP(1,0)<CR>
"vnoremap <silent> <C-J>      <Esc> :call <SID>scrollUP(1,1)<CR>
"vnoremap <silent> <C-Down>   <Esc> :call <SID>scrollUP(1,1)<CR>

"nnoremap <silent> <C-K>            :call <SID>scrollDN(1,0)<CR>
"nnoremap <silent> <C-Up>           :call <SID>scrollDN(1,0)<CR>
"vnoremap <silent> <C-K>      <Esc> :call <SID>scrollDN(1,1)<CR>
"vnoremap <silent> <C-Up>     <Esc> :call <SID>scrollDN(1,1)<CR>

"nnoremap <silent> <C-F>            :call <SID>scrollUP(-1,0)<CR>
"vnoremap <silent> <C-F>      <Esc> :call <SID>scrollUP(-1,1)<CR>

"nnoremap <silent> <C-B>            :call <SID>scrollDN(-1,0)<CR>
"vnoremap <silent> <C-B>      <Esc> :call <SID>scrollDN(-1,1)<CR>

"nnoremap <silent> <PageDown>       :call <SID>scrollUP(-2,0)<CR>
"vnoremap <silent> <PageDown> <Esc> :call <SID>scrollUP(-2,1)<CR>
"inoremap <silent> <PageDown> <C-\><C-o><PageDown>

" C-PageDown

"nnoremap <silent> <PageUp>         :call <SID>scrollDN(-2,0)<CR>
"vnoremap <silent> <PageUp>   <Esc> :call <SID>scrollDN(-2,1)<CR>
"inoremap <silent> <PageUp>   <C-\><C-o><PageUp>

" C-PageUp

" ---------

" N<C-D> and N<C-U> idiotically change the scroll setting
function! s:Saving_scrollV(cmd)
  let save_scroll = &scroll
  execute "keepjumps normal" a:cmd
  let &scroll = save_scroll
endfunction

" move and scroll
"nnoremap <silent> <C-J>            :call <SID>Saving_scrollV("1<C-V><C-D>")<CR>
"nnoremap <silent> <C-Down>         :call <SID>Saving_scrollV("1<C-V><C-D>")<CR>
"vnoremap <silent> <C-J>      <Esc> :call <SID>Saving_scrollV("gv1<C-V><C-D>")<CR>
"vnoremap <silent> <C-Down>   <Esc> :call <SID>Saving_scrollV("gv1<C-V><C-D>")<CR>

"nnoremap <silent> <C-K>            :call <SID>Saving_scrollV("1<C-V><C-U>")<CR>
"nnoremap <silent> <C-Up>           :call <SID>Saving_scrollV("1<C-V><C-U>")<CR>
"vnoremap <silent> <C-K>      <Esc> :call <SID>Saving_scrollV("gv1<C-V><C-U>")<CR>
"vnoremap <silent> <C-Up>     <Esc> :call <SID>Saving_scrollV("gv1<C-V><C-U>")<CR>

"nnoremap <silent> <C-F>            :call <SID>Saving_scrollV("<C-V><C-D>")<CR>
"vnoremap <silent> <C-F>      <Esc> :call <SID>Saving_scrollV("gv<C-V><C-D>")<CR>

"nnoremap <silent> <C-B>            :call <SID>Saving_scrollV("<C-V><C-U>")<CR>
"vnoremap <silent> <C-B>      <Esc> :call <SID>Saving_scrollV("gv<C-V><C-U>")<CR>

"nnoremap <silent> <PageDown>       :call <SID>Saving_scrollV("<C-V><C-D>")<CR>
"vnoremap <silent> <PageDown> <Esc> :call <SID>Saving_scrollV("gv<C-V><C-D>")<CR>

" C-PageDown

"nnoremap <silent> <PageUp>         :call <SID>Saving_scrollV("<C-V><C-U>")<CR>
"vnoremap <silent> <PageUp>   <Esc> :call <SID>Saving_scrollV("gv<C-V><C-U>")<CR>

" C-PageUp

" ---------

"noremap <C-j> @="1\<lt>C-D>"<CR>:set scroll=0<CR>
"noremap <C-k> @="1\<lt>C-U>"<CR>:set scroll=0<CR>

"noremap <PageUp>   39<C-U>:set scroll=0<CR>
"noremap <PageDown> 39<C-D>:set scroll=0<CR>

" ---------

"" I couldn't find any get_num_of_vis_lines function, so I made my own.
"function GetNumberOfVisibleLines()
"  let cur_line = line(".")
"  let cur_col = virtcol(".")
"  keepjumps normal H
"  let top_line = line(".")
"  keepjumps normal L
"  let bot_line = line(".")
"  execute "keepjumps normal " . cur_line . "G"
"  execute "keepjumps normal " . cur_col  . "|"
"  return bot_line - top_line
"endfunc
"
"function! MyPageUp()
"  let visible_lines = GetNumberOfVisibleLines()
"  execute "keepjumps normal " . visible_lines . "\<C-U>:set scroll=0\r"
"endfunction
"
"function! MyPageDown()
"  let visible_lines = GetNumberOfVisibleLines()
"  execute "keepjumps normal " . visible_lines . "\<C-D>:set scroll=0\r"
"endfunction
"
" BorlandPascal pageup/down behaviour!
" todo: when hitting top/bottom of file, then restore Y to last Y
"noremap <PageUp>   :call MyPageUp()<CR>
"noremap <PageDown> :call MyPageDown()<CR>

" ---------

" mouse scroll not to go past end
" noremap <silent> <ScrollWheelUp>   H5k
" noremap <silent> <ScrollWheelDown> L5j
"nnoremap <silent> <ScrollWheelUp>         :call <SID>scrollDN(5,0)<CR>
"nnoremap <silent> <ScrollWheelDown>       :call <SID>scrollUP(5,0)<CR>
"vnoremap <silent> <ScrollWheelUp>         :call <SID>scrollDN(5,1)<CR>
"vnoremap <silent> <ScrollWheelDown>       :call <SID>scrollUP(5,1)<CR>
"nnoremap <silent> <ScrollWheelUp>         :call <SID>Saving_scrollV("5<C-V><C-U>")<CR>
"nnoremap <silent> <ScrollWheelDown>       :call <SID>Saving_scrollV("5<C-V><C-D>")<CR>
"vnoremap <silent> <ScrollWheelUp>   <Esc> :call <SID>Saving_scrollV("gv5<C-V><C-U>")<CR>
"vnoremap <silent> <ScrollWheelDown> <Esc> :call <SID>Saving_scrollV("gv5<C-V><C-D>")<CR>

endif " disable old scroll functions

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
" close autocomplete window when finished with selection
autocmd CompleteDone * silent! pclose!
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

" gtags-cscope -----------
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
" dont start rdm if from sudo
if $USER != 'root'
  let g:rtagsAutoLaunchRdm=1
else
  let g:rtagsAutoLaunchRdm=0
endif
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

if 0 " quickfix quit/close

" :q in qf to also quit
autocmd BufReadPost quickfix cmap <silent> <buffer> q<CR> qa<CR>

else " quickfix quit/close

" quit Vim if only quickfix or preview/help windows remain
" (this is prob not needed if autocomplete window is closed
"  automatically when autocomplete finishes, see above for
"  autocmd CompleteDone ...)

" s:NextNormalWindow() {{{2
function! s:NextNormalWindow() abort
    for i in range(1, winnr('$'))
        let buf = winbufnr(i)

        " skip unlisted buffers
        if !buflisted(buf)
            continue
        endif

        " skip temporary buffers with buftype set
        if getbufvar(buf, '&buftype') != ''
            continue
        endif

        " skip the preview window
        if getwinvar(i, '&previewwindow')
            continue
        endif

        " skip current window
        if i == winnr()
            continue
        endif

        return i
    endfor

    return -1
endfunction

" s:QuitIfOnlyWindow() {{{2
function! s:QuitIfOnlyWindow() abort
    let l:buftype = getbufvar(winbufnr(winnr()), "&buftype")
    if l:buftype != "quickfix" && l:buftype != "help"
        return
    endif

    " Check if there is more than one window
    if s:NextNormalWindow() == -1
        " Check if there is more than one tab page
        if tabpagenr('$') == 1
            " Before quitting Vim, delete the special buffer so that
            " the '0 mark is correctly set to the previous buffer.
            " Also disable autocmd on this command to avoid unnecessary
            " autocmd nesting.
            if winnr('$') == 1
                if has('autocmd')
                    noautocmd bdelete
                endif
            endif
            quit
        else
            " Note: workaround for the fact that in new tab the buftype is set
            " too late (and sticks during this WinEntry autocmd to the old -
            " potentially quickfix/help buftype - that would automatically
            " close the new tab and open the buffer in copen window instead
            " New tabpage has previous window set to 0
            if tabpagewinnr(tabpagenr(), '#') != 0
                let l:last_window = 0
                if winnr('$') == 1
                    let l:last_window = 1
                endif
                close
                if l:last_window == 1
                    " Note: workaround for the same bug, but w.r.t. Airline
                    " plugin (it needs to refresh buftype and status line after
                    " last special window autocmd close on a tab page
                    if exists(':AirlineRefresh')
                        execute "AirlineRefresh"
                    endif
                endif
            endif
        endif
    endif
endfunction

" autoclose last open location/quickfix/help windows on a tab
if has('autocmd')
    aug AutoCloseAllQF
        au!
        autocmd WinEnter * nested call s:QuitIfOnlyWindow()
    aug END
endif

endif " quickfix quit/close

" -----------------------------

" disable : in visual mode
vmap <silent> : <Nop>

noremap <C-a> 0
" ctrl-e was scroll down one line so we lose that
" (but its been remapped to <C-j>)
noremap <C-e> $

" close all windows and write then quit
inoremap <C-X>w     <Esc>:wqa<cr>
vnoremap <C-X>w     <Esc>:wqa<cr>
nnoremap <C-X>w          :wqa<cr>

inoremap <C-X><C-w> <Esc>:wqa<cr>
vnoremap <C-X><C-w> <Esc>:wqa<cr>
nnoremap <C-X><C-w>      :wqa<cr>

" close all windows and confirm then quit
inoremap <C-X>c     <Esc>:conf qa<cr>
vnoremap <C-X>c     <Esc>:conf qa<cr>
nnoremap <C-X>c          :conf qa<cr>

inoremap <C-X><C-c> <Esc>:conf qa<cr>
vnoremap <C-X><C-c> <Esc>:conf qa<cr>
nnoremap <C-X><C-c>      :conf qa<cr>

" no imap for this
vnoremap <Leader>xc  <Esc>:conf qa<cr>
nnoremap <Leader>xc       :conf qa<cr>

" no imap for this
vnoremap <Leader>ax  <Esc>:conf qa<cr>
nnoremap <Leader>ax       :conf qa<cr>

" for vimdiff make :q quit both
" and some better colors
if &diff
  cmap    <silent> q<CR>  qa<CR>
  cmap    <silent> q!<CR> qa!<CR>
  noremap <C-l>  :diffupdate<CR><C-l>
  map     <silent> <Leader>dn ]c
  map     <silent> <Leader>dp [c
  "hi DiffAdd    ctermfg=233 ctermbg=LightGreen guifg=#003300 guibg=#DDFFDD gui=none cterm=none
  "hi DiffChange ctermbg=white  guibg=#ececec gui=none   cterm=none
  "hi DiffText   ctermfg=233  ctermbg=yellow  guifg=#000033 guibg=#DDDDFF gui=none cterm=none
  " to ignore whitespace diffs
  "set diffopt+=iwhite
  "colorscheme desert
  "colorscheme evening
  "highlight! link DiffText MatchParen
  highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
  highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
  highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
  highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red
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
" 'cc' already used for quickfix close
" **careful** as 'xc' is for quit all ...
noremap <Leader>cx :echo<CR>

" tab open
noremap <Leader>to :tabnew<CR>
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
nnoremap <silent> <M-.>      :tabnext<CR>
vnoremap <silent> <M-.> <Esc>:tabnext<CR>
inoremap <silent> <M-.> <Esc>:tabnext<CR>
nnoremap <silent> <M-'>      :tabnext<CR>
vnoremap <silent> <M-'> <Esc>:tabnext<CR>
inoremap <silent> <M-'> <Esc>:tabnext<CR>
" Alt ,(<)|; prev tab
nnoremap <silent> <M-,>      :tabprevious<CR>
vnoremap <silent> <M-,> <Esc>:tabprevious<CR>
inoremap <silent> <M-,> <Esc>:tabprevious<CR>
nnoremap <silent> <M-;>      :tabprevious<CR>
vnoremap <silent> <M-;> <Esc>:tabprevious<CR>
inoremap <silent> <M-;> <Esc>:tabprevious<CR>

" -----------------------------

function! s:log(message)
  silent execute '!echo "'
        \ . strftime('%T', localtime()) . ' - ' . a:message . '"'
        \ '>> /tmp/vim$$.log'
endfunction

" -----------------------------

" Interval timer job for git status

" info/status script
let g:gitinfo_script = "~/bin/gitinfo"
" interval time (ms)
let g:gitinfo_interval = 5000

" -------

let b:mckgitstatus = "git:<???>"

let g:tablist = {} " { bufnum, timerid }

function! MyGSCloseHandler(ch)
  if ch_canread(a:ch)
    let b:mckgitstatus = ch_read(a:ch)
  else
    let b:mckgitstatus = "git:<err(ch_read)>"
  endif
  "echomsg b:mckgitstatus
  if exists('b:MyGSJob')
    unlet b:MyGSJob
  endif
endfunction

function! MyGSStart(timer)
  let l:jstat = "complete"
  if exists('b:MyGSJob')
    let l:jstat = job_status(b:MyGSJob)
  endif
  "echomsg "l:jstat = " . l:jstat
  if l:jstat == "run"
    "echo "git status cmd running ..."
  else
    if filereadable(expand(g:gitinfo_script))
      let l:command = '/bin/sh -c ' . '"' . g:gitinfo_script . ' ' . expand('%:p:h') . '"'
      "echomsg "starting job " . l:command
      let b:MyGSJob = job_start(l:command, { 'close_cb':'MyGSCloseHandler' })
    endif
  endif
  call lightline#update()
endfunction

function! MyGitStatus()
  if &filetype ==# 'qf'
    return
  elseif !&buflisted
    return
  endif
  let l:bufnm = bufnr("%")
  let l:found = has_key(g:tablist, l:bufnm)
  "let l:msg = "MyGitStatus " . l:bufnm . " " . l:fname . " " . l:found
  "echomsg l:msg
  if l:found ==# 0
    let l:timer = timer_start(g:gitinfo_interval, 'MyGSStart', {'repeat': -1})
    "let g:tablist[l:bufnm] = l:timer
    call extend(g:tablist, {l:bufnm : l:timer})
  endif
endfunction

function! MyGitLeave()
  let l:bufnm = bufnr("%")
  let l:found = has_key(g:tablist, l:bufnm)
  "let l:msg = "MyGitLeave " . l:bufnm . " " . l:found
  "echomsg l:msg
  if l:found ==# 1
    "let l:msg = "MyGitLeave removing " . l:bufnm
    "echomsg l:msg
    let l:timer = get(g:tablist, l:bufnm, "-1")
    if l:timer !=# "-1"
      "let l:msg = "MyGitLeave stopping timer " . l:timer
      "echomsg l:msg
      call timer_stop(l:timer)
    endif
    call remove(g:tablist, l:bufnm)
  endif
endfunction

if &diff
  let b:mckgitstatus = "diff"
else
  autocmd BufReadPost,BufNewFile,FileReadPost * call MyGitStatus()
  autocmd BufUnload * call MyGitLeave()
endif

" -----------------------------

