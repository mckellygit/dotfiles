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

" skip loading this plugin for now ...
let loaded_bufkill = 1

" to [silently] remap unless a mapping already exits ...
"silent! nnoremap <unique> lhs rhs
"if empty(maparg('lhs', 'old-rhs')) | nnoremap lhs new-rhs | endif

"" vundle ------------------------------
filetype off              " required
"" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
"
" fzf from git install in ~/.fzf 
set rtp+=~/.fzf
"
" this files mappings for help, ~/.vim/doc/mck.txt ...
set rtp+=~/.vim
"
call vundle#begin()
"" alternatively, pass a path where Vundle should install plugins
""call vundle#begin('~/some/path/here')
"" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"" Add Plugins here ...
"
" required utils for EnhancedJumps plugin
" NOTE: use stable branch
Plugin 'inkarkat/vim-ingo-library'
" Awesome paste options
Plugin 'inkarkat/vim-UnconditionalPaste'
" . (dot) repeat in visual-mode
Plugin 'inkarkat/vim-visualrepeat'
"
" many useful vim lib routines
"Plugin 'LucHermitte/lh-vim-lib'
"
" bracketed paste mode ?
"Plugin 'ConradIrwin/vim-bracketed-paste'
"
" mother of auto-completion
"Plugin 'Valloric/YouCompleteMe'
"
" vim-clang auto-completion
Plugin 'justmao945/vim-clang'
"
" rooter for :Files and FileBeagle (<Leader>fb)
"Plugin 'airblade/vim-rooter'
" slightly different method
Plugin 'mattn/vim-findroot'
"
" rtags for code navigation (**modified++)
"Plugin 'lyuts/vim-rtags'
Plugin 'mckellyln/vim-rtags'
"
" echodoc function completion
"Plugin 'Shougo/echodoc.vim'
"
" qf/loclist window in all windows/tabs (**modified++)
"Plugin 'yssl/QFEnter'
Plugin 'mckellyln/QFEnter'
"
" qf preview popup
Plugin 'bfrg/vim-qf-preview'
"Plugin 'ronakg/quickr-preview.vim'
"Plugin 'skywind3000/vim-quickui'
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
" fugitive for more git utils
Plugin 'tpope/vim-fugitive'
"
" dispatch make/etc utils
Plugin 'tpope/vim-dispatch'
"
" git w/NERDtree
"Plugin 'Xuyuanp/nerdtree-git-plugin'
"
" gitgutter
Plugin 'airblade/vim-gitgutter'
"
" gitk like repo viewer
"Plugin 'gregsexton/gitv'
"Plugin 'sodapopcan/vim-twiggy'
Plugin 'junegunn/gv.vim'
"
" fzf for fuzzy listing/searching
"Plugin 'junegunn/fzf' " (not needed because its in ~/.fzf already)
Plugin 'junegunn/fzf.vim'
" ack (with ag (silver-searcher))
Plugin 'mileszs/ack.vim'
"
" search/replace across multiple files
" (also can use :Ack + :cdo ...)
"Plugin 'dkprice/vim-easygrep'
" with regex patterns ...
" Plugin 'othree/eregex.vim'
"
" TODO: also look into ferret
" for quickfix multi-file search/replace
"Plugin 'wincent/ferret'
"
" colorscheme
Plugin 'ajmwagar/vim-deus'
Plugin 'morhetz/gruvbox'
"Plugin 'altercation/vim-colors-solarized'
"Plugin 'rafi/awesome-vim-colorschemes'
" one for all colors
"Plugin 'flazz/vim-colorschemes'
"
" localvimrc
Plugin 'embear/vim-localvimrc'
"
" polygot syntax highlighting for many file types
Plugin 'sheerun/vim-polyglot'
" enhanced c++ syntax
"Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'bfrg/vim-cpp-modern'
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
" conque-gdb plugin
"Plugin 'Conque-GDB'
"
" process utility
"Plugin 'Shougo/vimproc.vim'
"
" run cmd in background and output to quickfix ...
" :AsyncRun gcc % -c %< for example
Plugin 'skywind3000/asyncrun.vim'
"
" cmd alias
"Plugin 'cmdalias.vim'
Plugin 'Konfekt/vim-alias'
"
" grayout #ifdefs
"Plugin 'mphe/grayout.vim'
" older plugin
"Plugin 'vim-scripts/ifdef-highlighting'
"
" tab/buffer
"Plugin 'ap/vim-buftabline'
" bufexplorer
"Plugin 'jlanzarotta/bufexplorer'
" lightline buffer ...
"Plugin 'mengelbrecht/lightline-bufferline'
"
" start screen
Plugin 'mhinz/vim-startify'
"
" search + highlight
Plugin 'PeterRincker/vim-searchlight'
" TODO: also look into: qxxxb/vim-searchhi
"
" fade inactive buffers
" NOTE: disable for now - causes rtags popup to take forever ...
"       recently works ok but many flashing redraws on pum up/down ...
"       may need au! CompleteChanged code to help ...
Plugin 'TaDaa/vimade'
" alternative ...
"Plugin 'blueyed/vim-diminactive'
"
" focus
Plugin 'tmux-plugins/vim-tmux-focus-events'
"
" ansi esc sequences
"Plugin 'powerman/vim-plugin-AnsiEsc'
Plugin 'chrisbra/Colorizer'
"
" man pages
Plugin 'vim-utils/vim-man'
"
" system copy clipboard (**modified++)
"Plugin 'christoomey/vim-system-copy'
"Plugin 'mckellyln/vim-system-copy'
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

" use :Silentrun <cmd> to run <cmd> without prompting:
" Press ENTER or type command to continue
command! -nargs=1 Silentrun execute ':silent !' . <q-args> | execute ':redraw!'

function! s:LogIt(message)
  silent execute '!echo "'
        \ . strftime('%T', localtime()) . ' - ' . a:message . '"'
        \ '>> /tmp/vimdbg.log'
endfunction
" example:
"   let msg = 'buf ' . i
"   call <SID>LogIt(msg)

" ack ------------
"let g:ackprg = 'ack -k --nogroup --nocolor --column --smart-case --follow'
" use ag (silver-searcher) instead of ack, if possible
if executable('ag')
  " NOTE: ag can miss some matches without -U --hidden ...
  let g:ackprg = 'ag --vimgrep -U --hidden -- '
endif
" example: (cdo/cfdo ldo/lfdo [!])
" :Ack foo
" :cdo s/foo/bar/g | update
" Also look into Plugin 'dkprice/vim-easygrep'
let g:ackhighlight = 1
let g:ack_use_dispatch = 1
"set grepprg=ack\ -k
set grepprg=ag\ --vimgrep\ -U\ --hidden\ --\ 
set grepformat=%f:%l:%c:%m
" open :grep output in qf ...
autocmd QuickFixCmdPost *grep* cwindow
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
    \             [ 'gitbranch', 'myfilename', 'mymodified', 'mycolonkeyword', 'myasyncrunstatus' ] ]
    \ },
    \ 'inactive': {
    \   'left': [ [ 'mymode', 'paste' ],
    \             [ 'gitbranch', 'myfilename', 'mymodified', 'mycolonkeyword', 'myasyncrunstatus' ] ]
    \ },
    \ 'component_function': {
    \   'mymode': 'MyLightlineMode',
    \   'gitbranch': 'MyLightlineGitbranch',
    \   'myfilename': 'MyLightlineFilename',
    \   'mymodified': 'MyLightlineModified',
    \   'mycolonkeyword': 'MyLightlineColonKeyword',
    \   'myasyncrunstatus': 'MyLightlineAsyncRunStatus',
    \ },
    \ 'tab_component_function': {
    \   'filename': 'MyLightlineTabFilename',
    \   'modified': 'MyLightlineTabModified',
    \ },
    \ 'mode_map': {
        \ 'n'     : 'Nm',
        \ 'i'     : 'In',
        \ 'R'     : 'Re',
        \ 'v'     : 'Vc',
        \ 'V'     : 'Vl',
        \ "\<C-v>": 'Vb',
        \ 'c'     : 'Nm',
        \ 's'     : 'Se',
        \ 'S'     : 'Sl',
        \ "\<C-s>": 'Sb',
        \ 't'     : 'Te',
        \ },
    \ }

" no mode for qf
function! MyLightlineMode()
  if &filetype ==# 'qf'
    return ''
  "elseif &buftype ==# 'terminal'
  "  return ''
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
  elseif &diff
    return 'diff'
  elseif &buftype ==# 'terminal'
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
      if winwidth(0) < 90
        return b:mckgitstatus[-16:]
      else
        return b:mckgitstatus
      endif
    else
      return "git:<???>"
    endif
  endif
endfunction

" no filename for qf
function! MyLightlineFilename()
  if &filetype ==# 'qf'
    return 'qf'
  elseif &buftype ==# 'terminal'
    return ''
  elseif !&buflisted
    return 'ac'
  else
    let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
    if winwidth(0) < 90
      return filename[-16:]
    else
      return filename
    endif
    "let filename = expand('%:p') !=# '' ? expand('%:p') : '[No Name]'
    "let threshold = winwidth(0) - 100
    "let threshold = 40
    "return len(filename) < threshold ? filename : '<'.filename[len(filename)-threshold:]
  endif
endfunction

" no modified for qf
function! MyLightlineModified()
  if &filetype ==# 'qf'
    return ''
  elseif &buftype ==# 'terminal'
    return ''
  elseif !&buflisted
    return ''
  else
    return &modified ? '+' : '-'
  endif
endfunction

" keep tabname when entering qf
function! MyLightlineTabFilename(n)
  let tab_filename = gettabvar(a:n, 'lightline_tab_filename', '')
  if gettabwinvar(a:n, tabpagewinnr(a:n), '&buftype') ==# 'quickfix'
    \ || tabpagenr() ==# a:n && win_gettype(win_getid()) ==# 'popup'
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
    \ || tabpagenr() ==# a:n && win_gettype(win_getid()) ==# 'popup'
    return tab_modified
  endif
  let raw_modified = lightline#tab#modified(a:n)
  if empty(raw_modified)
    let raw_modified = ' '
  endif
  if tabpagenr() ==# a:n
    " loop over tab windows and skip quickfix and some others ...
    let tab_numwins = 1
    for w in range(1, tabpagewinnr(a:n, '$'))
      if w == winnr()
          continue
      elseif getwinvar(w, '&previewwindow')
          continue
      endif
      let b = winbufnr(w)
      if !buflisted(b)
          continue
      elseif !bufloaded(b)
          continue
      elseif getbufvar(b, '&buftype') ==# 'quickfix'
          continue
      elseif getbufvar(b, '&buftype') ==# 'popup'
          continue
      endif
      let tab_numwins = tab_numwins + 1
    endfor
    let tab_modified = '/' . string(tab_numwins) . raw_modified
    call settabvar(a:n, 'lightline_tab_modified', tab_modified)
  else
    let rab_modified = raw_modified
  endif
  return tab_modified
endfunction

function! MyLightlineColonKeyword()
  if &filetype ==# 'qf'
    return ''
  elseif &buftype ==# 'terminal'
    return ''
  elseif !&buflisted
    return ''
  else
    if exists("g:rtagsUseColonKeyword") && (g:rtagsUseColonKeyword == 1)
      return 'rt:'
    else
      return 'rt-'
    endif
  endif
endfunction

function! MyLightlineAsyncRunStatus()
  if &filetype ==# 'qf'
    return ''
  elseif &buftype ==# 'terminal'
    return ''
  elseif !&buflisted
    return ''
  else
    if g:asyncrun_status == 'running'
      return 'ar:run'
    elseif g:asyncrun_status == 'success'
      return 'ar:ok '
    elseif g:asyncrun_status == 'failure'
      return 'ar:no '
    else
      return 'ar:-- '
  endif
endfunction

" modify tab active/inactive colors
let s:palette = g:lightline#colorscheme#wombat#palette
let s:palette.tabline.left   = [ [ '#d0d0d0', '#585858', 252, 240  ] ]
let s:palette.tabline.tabsel = [ [ '#d0d0d0', '#5f8787', 252, 66, 'bold' ] ]
unlet s:palette

function! SetCursorLineFromLightline() abort
  let palette = lightline#palette()
  let colors = palette.normal.middle[0]
  execute printf(
        \ 'highlight CursorLine guifg=%s guibg=%s ctermfg=%s ctermbg=%s',
        \ colors[0], colors[1], colors[2], colors[3])
endfunction

" vim issue that :badd does not update tabline properly
" https://github.com/vim/vim/issues/3770
au BufAdd * let &tabline = &tabline
" can do this if vim is 8.1.706 or later:
"au BufAdd * redrawtabline
" to check if redrawtabline exists before using:
"if exists(":redtawtabline") == 2
" also saw this-
"set tabline=%!lightline#tabline()
" lightline ----------

" rooter ----------
" echo cwd: status
"let g:rooter_manual_only = 1
" Dont do this, use autocmd and paths to fix FileBeagle and fzf/Files
let g:rooter_silent_chdir = 0
let g:rooter_use_lcd = 1
" rooter ----------

" findroot ------------
let g:findroot_not_for_subdir = 1
" findroot ------------

" fzf -----------------
if 1 " use vim popup ...
    let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.5, 'yoffset': 0.8, 'xoffset': 0.8 } }
else
if &term =~ "^screen" || &term =~ "^tmux"
    " use tmux popup ...
    let g:fzf_layout = { 'tmux': '-p -x R -y S -w 80% -h 80%' }
else
    " use vim split ...
    let g:fzf_layout = { 'down': '~45%' }
endif
endif

" always show preview window ...
let g:fzf_preview_window = 'right:60%'

autocmd VimEnter,BufEnter * silent! lcd %:p:h
" add \fz mapping also
noremap <silent> <Leader>fz <C-\><C-n>:FZFProjectFiles<CR>
noremap <silent> <Leader>f/ <C-\><C-n>:FZFProjectFiles<CR>
function! s:find_git_root()
    " in a submodule dir this returns git root, otherwise returns empty
    let gdir = system('git rev-parse --show-superproject-working-tree 2> /dev/null')[:-2]
    if empty(gdir)
        " not in a submodule, returns git root
        let gdir = system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
    endif
    return gdir
endfunction
command! FZFProjectFiles execute 'Files' s:find_git_root()
noremap <silent> <Leader>f. <C-\><C-n>:Files<CR>
" you can always run
" :Files       - to get list from current dir
" "Files <dir> - to get list from <dir>
"
" "Raw" version of ag; arguments directly passed to ag
" e.g.
"   " Search 'foo bar' in ~/projects
"   :Ag "foo bar" ~/projects
"   " Start in fullscreen mode
"   :Ag! "foo bar"
"command! -bang -nargs=+ -complete=file Ag call fzf#vim#ag_raw(<q-args>, <bang>0)
" Raw version with preview
command! -bang -nargs=+ -complete=file Ags call fzf#vim#ag_raw(<q-args>, fzf#vim#with_preview(), <bang>0)
"
" Agit: Start ag in the git/root directory
" e.g.
"   :Agit foo
function! s:ag_in(bang, ...)
  let gdir = s:find_git_root()
  "if !isdirectory(a:1)
  if !isdirectory(gdir)
    throw 'not a valid directory: ' .. gdir
  endif
  " Press `?' to enable preview window.
  "call fzf#vim#ag(join(a:000[1:], ' '), fzf#vim#with_preview({'dir': a:1}, 'up:50%:hidden', '?'), a:bang)
  call fzf#vim#ag(join(a:000[0:], ' '), fzf#vim#with_preview({'dir': gdir}, 'up:50%:hidden', 'p'), a:bang)
  " If you don't want preview option, use this
  " call fzf#vim#ag(join(a:000[1:], ' '), {'dir': a:1}, a:bang)
endfunction
command! -bang -nargs=+ -complete=dir Agits call s:ag_in(<bang>0, <f-args>)
"
command! -bang -nargs=* Ag
  \ call fzf#vim#grep('ag -U --hidden --nogroup --column --color -- '.shellescape(<q-args>),
  \ 1,
  \ fzf#vim#with_preview(),
  \ <bang>0)
"
command! -bang -nargs=* Agit
  \ call fzf#vim#grep('ag -U --hidden --nogroup --column --color -- '.shellescape(<q-args>).' '.s:find_git_root(),
  \ 1,
  \ fzf#vim#with_preview('up:50%:hidden', 'p'),
  \ <bang>0)
"
" fzf env vars:
"export FZF_PREVIEW_LINES=20
"export FZF_DEFAULT_COMMAND='ag -U --hidden --nocolor -g ""'
"
" fzf preview.sh fix:
"-FIRST=$(($CENTER-$LINES/3))
"+# to account for when preview is set to 'up:50%'
"+# as lines is then less than FZF_PREVIEW_LINES ...
"+#FIRST=$(($CENTER-$LINES/3))
"+FIRST=$(($CENTER-$LINES/7))
"
function! s:buflist(arg)
    if a:arg == 0
        redir => lsout
        silent ls
        redir END
        if !empty(lsout)
            return split(lsout, '\n')
        endif
        " if only unlisted buffers then try again ...
    endif
    redir => lsout
    silent ls!
    redir END
    return split(lsout, '\n')
endfunction

function! s:bufopen(e)
    if empty(a:e)
        return
    endif
    let bufstr = matchstr(a:e, '^[ 0-9]*')
    if empty(bufstr)
        return
    endif
    "execute 'buffer' matchstr(a:e, '^[ 0-9]*')
    "let l:bufid = bufnr(a:name)
    let l:bufid = str2nr(bufstr)
    if l:bufid <= 0 || !bufexists(l:bufid)
        return
    endif
    let l:winids = win_findbuf(l:bufid)
    if empty(l:winids)
        " open hidden buffer in a new tab ...
        " TODO: or hsplit or vsplit or in current window ...
        execute 'tabnew|b'.l:bufid
    else
        call win_gotoid(l:winids[0])
    endif
endfunction

let g:blist = []
function! MylsFilter(id, key)
    if a:key == 'q' || a:key == 'x' || a:key == '\<Esc>' || a:key == '\<C-c>'
        call popup_close(a:id, 0)
        " return > 0 to not pass on to callback ...
        return 1
    endif
    " TODO: add options to open in split, vsplit, tab, hide buffer etc.
    " pass to generic filter
    return popup_filter_menu(a:id, a:key)
endfunction

function! MylsCallback(id, indx) abort
    if a:indx <= 0
        return
    endif
    call <SID>bufopen(g:blist[a:indx-1])
endfunction

function! MylsClear(tid) abort
    call feedkeys("\<Esc>", "m")
endfunction

function! s:MylsPopup(arg) abort
    let g:blist = <SID>buflist(a:arg)
    if empty(g:blist)
        " shouldn't happen now that buflist always returns something ...
        let g:blist = [ '0 - No listed buffers ...' ]
    endif
    call popup_menu(g:blist, #{ title: ' Buffers:', filter: 'MylsFilter', callback: 'MylsCallback', time: 10000 })
endfunction

" fzf#run() example ...
"noremap <silent> <Leader>lb <C-\><C-n>:<C-u>call fzf#run({
"\   'source':  reverse(<sid>buflist()),
"\   'sink':    function('<sid>bufopen'),
"\   'options': '+m',
"\   'window' : { 'width': 0.8, 'height': 0.3, 'yoffset': 0.8, 'xoffset': 0.8 },
"\   'down':    len(<sid>buflist()) + 2
"\ })<CR>

" native vim popup ls ...
noremap <silent> <Leader>ls <C-\><C-n>:<C-u>call <SID>MylsPopup(0)<CR>
noremap <silent> <Leader>lb <C-\><C-n>:<C-u>call <SID>MylsPopup(1)<CR>

" hide buffer
noremap <silent> <Leader>hb <C-\><C-n>:hide<CR>
" fzf -----------------

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
" NOTE: see above fzf BufEnter autocmd to set lcd to %:p:h
" so the getcwd() is correct
let g:filebeagle_suppress_keymaps = 1
"nmap <silent> <Leader>fB <Plug>FileBeagleOpenCurrentWorkingDir
"nmap <silent> <Leader>fb <Plug>FileBeagleOpenCurrentBufferDir
nmap <silent> <Leader>fb :FBCurrentFiles<CR>:redraw!<CR>
nmap <silent> <Leader>fB :FBProjectFiles<CR>:redraw!<CR>
command! FBCurrentFiles execute ':FileBeagle' getcwd()
command! FBProjectFiles execute ':FileBeagle' s:find_git_root()
let g:filebeagle_statusline = ""

"nmap <silent> -          <Plug>FileBeagleOpenCurrentBufferDir
" unmap these in qf
autocmd BufReadPost quickfix nnoremap <buffer> <Leader>fb <Nop>
autocmd BufReadPost quickfix nnoremap <buffer> - -
" FileBeagle ----------

" fugitive -----------
autocmd FileType fugitiveblame nmap <buffer> <Leader>wq gq
autocmd FileType fugitiveblame nmap <buffer> <Leader>qq gq
autocmd FileType fugitiveblame nmap <buffer> <Leader><Tab> O
autocmd FileType fugitiveblame nmap <buffer> <C-t> O
" NOTE: FileType autocmd does not work for this map,
"       plugin probably overwrites it, this seems to work ...
autocmd BufEnter *.fugitiveblame  nmap <buffer> <Return> o
autocmd BufEnter fugitive://**    nmap <buffer> <Return> o

autocmd FileType git              nmap <buffer> <Leader><Tab> O
autocmd FileType git              nmap <buffer> <C-t> O
autocmd FileType git              nmap <silent> <buffer> qq :close<cr>

autocmd FileReadCmd fugitive://** nmap <buffer> <Leader><Tab> O
autocmd FileReadCmd fugitive://** nmap <buffer> <C-t> O
autocmd BufReadCmd  fugitive://** nmap <buffer> <Leader><Tab> O
autocmd BufReadCmd  fugitive://** nmap <buffer> <C-t> O
autocmd BufWriteCmd fugitive://** nmap <buffer> <Leader><Tab> O
autocmd BufWriteCmd fugitive://** nmap <buffer> <C-t> O

autocmd BufReadCmd  index{,.lock}
    \ if FugitiveIsGitDir(expand('<amatch>:p:h')) |
    \     nmap <buffer> <Leader><Tab> O |
    \     nmap <buffer> <C-t> O |
    \ endif

aug fugitive_alias
  au!
  au VimEnter * :Alias GBlame  Gblame
  au VimEnter * :Alias GStatus Gstatus
aug END
" fugitive -----------

" gitgutter -----------
let g:gitgutter_enabled = 1
let g:gitgutter_sign_column_always = 1
" always have sign column
if exists('&signcolumn')  " Vim 7.4.2201
  set signcolumn=yes
endif
nmap <Leader>gn <Plug>(GitGutterNextHunk)
nmap <Leader>gp <Plug>(GitGutterPrevHunk)
nmap <silent> <Leader>gg <C-\><C-n>:<C-u>call gitgutter#process_buffer(bufnr(''), 0)<CR>
" gitgutter -----------

" gitv -----------
let g:Gitv_OpenHorizontal = 1
let g:Gitv_WrapLines = 0
let g:Gitv_WipeAllOnClose = 0
" gitv -----------

" gv -----------
autocmd FileType GV nmap <buffer> <Leader><Tab> O
autocmd FileType GV nmap <buffer> <C-t> O
autocmd FileType GV nmap <buffer> <Return> O
autocmd FileType GV nmap <buffer> o O
autocmd FileType GV nmap <buffer> <Space> <Down>
autocmd FileType GV nmap <buffer> u <Up>
autocmd FileType GV nmap <buffer> d <Down>
autocmd FileType GV xmap <buffer> <Leader><Tab> O
autocmd FileType GV xmap <buffer> <C-t> O
autocmd FileType GV xmap <buffer> <Return> O
autocmd FileType GV xmap <buffer> o O
autocmd FileType GV xmap <buffer> <Space> <Down>
autocmd FileType GV xmap <buffer> u <Up>
autocmd FileType GV xmap <buffer> d <Down>

autocmd FileType GV setlocal cursorline

" TODO: it seems when ft==git <ScrollWheel> acts different than the map defined in this file

" M/A-DoubleClick to open (o) commit ...
autocmd FileType GV nmap <buffer> <A-LeftRelease> <Nop>
autocmd FileType GV nmap <buffer> <A-2-LeftRelease> <Nop>
autocmd FileType GV nmap <buffer> <A-2-LeftMouse> <C-\><C-n>:<C-u>call feedkeys("O")<CR>
" M/A-q to quit like q, but M/A-q is used by Unity/Gnome

" start with folds open
autocmd FileType GV set foldlevelstart=1

" make it more like a real vim session and not have qq exit ...
"autocmd FileType GV nmap <silent> <buffer> qq :qa!<CR>
autocmd FileType GV nmap <silent> <buffer> <Leader>wq <C-\><C-n>:<C-u>call <SID>QuitIfOnlyNoNameLeft()<CR>
autocmd FileType GV nmap <silent> <buffer> <Leader>qq <C-\><C-n>:<C-u>call <SID>QuitIfOnlyNoNameLeft()<CR>

"autocmd FileType GV cnoreabbrev <silent> <expr> q! (getcmdtype() == ':' && getcmdline() =~ '\s*q!\s*') ? 'qa!' : 'q!'

function! TabCloseRightQuit(bang)
  let cur=tabpagenr()
  while cur < tabpagenr('$')
    exe 'tabclose' . a:bang . ' ' . (cur + 1)
  endwhile
  execute "qa!"
  execute 'normal! \<CR>'
endfunction
command! -bang Tabcloserightquit silent! call TabCloseRightQuit('<bang>')

function! TabCloseLeft(bang)
  while tabpagenr() > 1
    exe 'tabclose' . a:bang . ' 1'
  endwhile
endfunction
command! -bang Tabcloseleft silent! call TabCloseLeft('<bang>')

function! s:warn(message)
  echohl WarningMsg | echom a:message | echohl None
endfunction

function! s:shrug()
  call s:warn('¯\_(ツ)_/¯')
endfunction

function! s:browse(url)
  call netrw#BrowseX(b:git_origin.a:url, 0)
endfunction

function! s:tabnew()
  execute (tabpagenr()-1).'tabnew'
endfunction

function! s:type(visual)
  if a:visual
    let shas = filter(map(getline("'<", "'>"), 'gv#sha(v:val)'), '!empty(v:val)')
    if len(shas) < 2
      return [0, 0]
    endif
    return ['diff', fugitive#repo().git_command('diff', shas[-1], shas[0])]
  endif

  if exists('b:git_origin')
    let syn = synIDattr(synID(line('.'), col('.'), 0), 'name')
    if syn == 'gvGitHub'
      return ['link', '/issues/'.expand('<cword>')[1:]]
    elseif syn == 'gvTag'
      let tag = matchstr(getline('.'), '(tag: \zs[^ ,)]\+')
      return ['link', '/releases/'.tag]
    endif
  endif

  let sha = gv#sha()
  if !empty(sha)
    return ['commit', FugitiveFind(sha, b:git_dir)]
  endif
  return [0, 0]
endfunction

function! s:split(tab)
  echom "split, tab: " a:tab
  if a:tab && a:tab != 2
    call s:tabnew()
  elseif getwinvar(winnr('$'), 'gv')
    $wincmd w
    enew
  elseif a:tab != 2
    vertical botright new
  else
    bot split new
  endif
  let w:gv = 1
endfunction

function! s:open(visual, ...)
  let [type, target] = s:type(a:visual)

  if empty(type)
    return s:shrug()
  elseif type == 'link'
    return s:browse(target)
  endif

  call s:split(a:0)
  call s:scratch()
  if type == 'commit'
    execute 'e' escape(target, ' ')
    nnoremap <silent> <buffer> gb :Gbrowse<cr>
  elseif type == 'diff'
    call s:fill(target)
    setf diff
  endif
  nnoremap <silent> <buffer> qq :close<cr>
  let bang = a:0 ? '!' : ''
  if exists('#User#GV'.bang)
    execute 'doautocmd <nomodeline> User GV'.bang
  endif
  "wincmd p
  echo
endfunction

function! s:scratch()
  setlocal buftype=nofile bufhidden=wipe noswapfile
endfunction

function! s:fill(cmd)
  setlocal modifiable
  silent execute 'read' escape('!'.a:cmd, '%')
  normal! gg"_dd
  setlocal nomodifiable
endfunction

" tab split
autocmd FileType GV nnoremap <silent> <buffer> O    :call <sid>open(0, 1)<cr>
autocmd FileType GV nnoremap <silent> <buffer> <cr> :call <sid>open(0, 1)<cr>
" <C-t> and <Leader><Tab> already mapped ...
" vertical split
autocmd FileType GV nnoremap <silent> <buffer> o    :call <sid>open(0)<cr>
autocmd FileType GV nnoremap <silent> <buffer> <C-v> :call <sid>open(0)<cr>
" horizontal split
autocmd FileType GV nnoremap <silent> <buffer> <C-x> :call <sid>open(0, 1, 9)<cr>

" to make vigv wrapper error more nicely in a non-git dir ..
function! s:MyGV() abort
    let errmsg = ''
    enew
    setlocal buftype=nofile hidden bufhidden=wipe noswapfile
    if !exists('g:loaded_fugitive')
        let errmsg = 'fugitive not found'
        call s:warn(errmsg)
        sleep 651m
        cquit
        return
    endif
    let git_dir = FugitiveGitDir()
    if empty(git_dir)
        let errmsg = 'not in git repo'
        call s:warn(errmsg)
        sleep 651m
        cquit
        return
    endif
    execute 'GV'
endfunction
command! GV2 call s:MyGV()

" vigv alias ...
" vigv='vim -R -c GV2 -c ":nnoremap <silent> <buffer> q <Nop>" -c ":cnoreabbrev <silent> <buffer> q Tabcloserightquit" -c ":cnoreabbrev <silent> <buffer> q! Tabcloserightquit" -c ":nnoremap <silent> <buffer> x <Nop>" -c ":cnoreabbrev <silent> <buffer> x Tabcloserightquit" -c ":se bt=nowrite|:tabn|:hide|:redraw!"'
" gv -----------

" QFEnter -------------
" add C-t, C-v, C-x to open consistently with fzf ...
let g:qfenter_keymap = {}
let g:qfenter_keymap.topen = ['<Leader><Tab>',   '<C-t>']
let g:qfenter_keymap.vopen = ['<Leader><CR>',    '<C-v>']
let g:qfenter_keymap.hopen = ['<Leader><Space>', '<C-x>']
let g:qf_loclist_window_bottom = 0
function! <SID>OpenQuickfix(new_split_cmd)
  " 1. the current line is the result idx as we are in the quickfix
  let l:qf_idx = line('.')
  " 2. jump to the previous window
  wincmd p
  " 3. switch to a new split (the new_split_cmd will be 'vnew' or 'split')
  execute a:new_split_cmd
  " 4. open the 'current' item of the quickfix list in the newly created buffer
  "    (the current means, the one focused before switching to the new buffer)
  execute l:qf_idx . 'cc'
endfunction
"autocmd FileType qf noremap <buffer> <C-v> :call <SID>OpenQuickfix("vnew")<CR>
"autocmd FileType qf noremap <buffer> <C-x> :call <SID>OpenQuickfix("split")<CR>
" QFEnter -------------

" vim-qf-preview ------
augroup qfpreview
    autocmd!
    autocmd FileType qf nmap <buffer> <Space> <plug>(qf-preview-open)
    autocmd FileType qf nmap <buffer> p       <plug>(qf-preview-open)
augroup END
let g:qfpreview = {
    \ 'close': 'q',
    \ 'number': '1',
    \ 'height': '15',
    \ 'offset': '7',
    \ 'sign': {'linehl': 'CursorLine'},
    \ }
" vim-qf-preview ------

" lastplace -----------
" mods to skip for vimdiff
if &diff
  let b:loaded_lastplace_plugin = 1
endif
" lastplace -----------

" polygot -----------
" needed to get around error in polygot/tmux.vim
" and that is deprecated anyway (defaults in vim 8.0+)
" .cap files are for me usually from tcpdump and not ruby ...
let g:polyglot_disabled = ['tmux', 'c/c++', 'ruby']
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
" seems to mess up some #ifdef's
"let g:cpp_experimental_simple_template_highlight = 1
" set syntax highlighting for tpp/ipp files also
autocmd BufNewFile,BufRead *.{ipp,tpp,esp,ecm} set filetype=cpp
" TODO: ecl syntax
autocmd BufNewFile,BufRead *.{ecl} set filetype=ecl
" polygot -----------

" vim-cpp-modern -----------
let c_no_curly_error = 1
" vim-cpp-modern -----------

" asyncrun -----------
" open quickfix (10 lines) when cmd ends
" skip as we now copen at end ...
"let g:asyncrun_open = 10
" se we can see echoes at end ...
let g:asyncrun_silent = 0
autocmd User AsyncRunPre echohl DiffAdd | echo 'AsyncRun started ...' | echohl None
autocmd User AsyncRunStop if g:asyncrun_code != 0 | echohl DiffText | echo 'AsyncRun complete: [FAIL]' | echohl None |
            \ else | echohl DiffAdd | echo 'AsyncRun complete: [OK]' | echohl None | copen | set nowrap | clearjumps | call lightline#update() | wincmd p | endif
" asyncrun -----------

" startify -----------
let g:startify_lists = [
    \ { 'type': 'files',     'header': ['   MRU']            },
    \ { 'type': 'sessions',  'header': ['   Sessions']       },
    \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
    \ { 'type': 'commands',  'header': ['   Commands']       },
    \ ]
" startify -----------

" searchlight --------
" off by default <Leader>hl to enable
set nohlsearch
"let g:searchlight_disable_on_startup = 1
":Searchlight!
" change color of current word
highlight link Searchlight Incsearch
nnoremap <silent> * *:1Searchlight<CR>
nnoremap <silent> # #:1Searchlight<CR>
" searchlight --------

" searchhi -----------
" qxxxb/vim-searchhi options here
" searchhi -----------

" gruvbox -----------
let g:gruvbox_contrast_dark = 'medium'
" gruvbox -----------

" echodoc -----------
let g:echodoc#enable_at_startup = 1
" echodoc -----------

" lightline-bufferline ---
"let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
"let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
"let g:lightline.component_type   = {'buffers': 'tabsel'}
" lightline-bufferline ---

" vimade -----------
let g:vimade = {}
let g:vimade.fadelevel = 0.6
" to keep search highlighting in dimmed windows ...
let g:vimade.fadepriority = 0
let g:vimade.checkinterval = 300
let g:vimade.enablefocusfading = 1

" to mitigate pum redraw/flash/lag with vimade -
" (change in autoload/vimade.vim)
"
"  function! vimade#CheckWindows()
"    call vimade#UpdateState()
"    "prevent if inside popup window
" -  if winnr() == 0
" +  if winnr() == 0 || pumvisible()
"      return
"    endif
"    if g:vimade_running && g:vimade_paused == 0 && getcmdwintype() == ''
"
" local alternative is to disable vimade in window -

function! s:MyVimadeWinDisable()
    if exists('g:vimade_init') && exists('g:vimade_running')
        if g:vimade_running == 1
            if !exists('g:vimade_disabled')
                call vimade#WinDisable()
            elseif w:vimade_disabled == 0
                call vimade#WinDisable()
            endif
        endif
    endif
endfunction
function! s:MyVimadeWinEnable()
    if exists('g:vimade_init') && exists('g:vimade_running')
        if g:vimade_running == 1
            if !exists('g:vimade_disabled')
                return
            elseif w:vimade_disabled != 0
                call vimade#WinEnable()
            endif
        endif
    endif
endfunction
au! CompleteChanged * call <SID>MyVimadeWinDisable()
au! CompleteDone    * call <SID>MyVimadeWinEnable()
" vimade -----------

" vim-man ----------
" use vim-man instead of default vim K at root level ...
nnoremap <silent> <buffer> K :call man#get_page_from_cword('horizontal', v:count)<CR>
vnoremap <silent> <buffer> K <C-\><C-n>:call man#get_page_from_cword('horizontal', v:count)<CR>
" vim-man ----------

" vim-system-copy --- CLIPBOARD ---
if 0
    let g:use_system_copy = 1
    let g:system_copy#copy_command='myclip'
    let g:system_copy#paste_command='myclip -o'
    let g:system_copy_silent = 1
    vmap     ty    <Plug>SystemCopy
    vmap     tx    <Plug>SystemCut
    vmap     x     tx
    vmap     d     tx
    vmap     <Del> tx
    nnoremap ty    <Nop>
    nnoremap tx    <Nop>
else
    vnoremap ty    y
    vnoremap tx    x
    vmap     x     tx
    vmap     d     tx
    vmap     <Del> tx
    nnoremap ty    <Nop>
    nnoremap tx    <Nop>
endif

" copy (yank) selection, stay at end unless rectangular region ...
vmap <silent> <expr> <C-c> (mode() =~ '\<C-v>') ? 'ty' : 'mvty`v'
vmap <silent> <expr> y     (mode() =~ '\<C-v>') ? 'ty' : 'mvty`v'
" vim-system-copy --- CLIPBOARD ---

" ====================================================
" ====================================================
" ====================================================

" improves color highlighing with dark terminals
set background=dark
" tmux default term set to screen-256color
set t_Co=256

" bg color fill-in for kitty term
"if &term=~"kitty"
" if we set term for kitty from xterm-kitty to xterm-256color
" then we need to also set this ...
if &term=~"xterm"
  let &t_ut=''
endif

" set some unused terminfo var ...
"set t_f9=123

" ------------------------------
" NOTE: seems we need to force xterm* if alacritty ?
"if &term=="alacritty"
"  set term=xterm-256color
"endif
" NOTE: seems we need to force xterm* if alacritty ?
" NOTE: we can set TERM in alacritty to xterm-256color
" ------------------------------

if &term=="xterm"
  set t_Co=8
  set t_Sb=^[[4%dm
  set t_Sf=^[[3%dm
  "highlight Comment ctermfg=blue
endif

" can prevent some strange chars in terminator ...
set t_TI=
set t_TE=

"let g:solarized_termcolors=256
"colorscheme solarized
colorscheme deus
"colorscheme gruvbox

" do not use delete/wipe with qf/ll ...
set nohidden
set bufhidden=hide

set lazyredraw

set confirm

" remove prev visual mark
delmarks v

" do not change terminal window title ...
"set notitle
" NOTE: set title to inform tmux this is vim ...
" See https://sunaku.github.io/tmux-select-pane.html for documentation.
"let progname = substitute($VIM, '.*[/\\]', '', '')
"set title titlestring=%{progname}\ %f\ +%l\ #%{tabpagenr()}.%{winnr()}
set titleold=
set title titlestring=@v:%.12t
if (&term =~ "^screen" || &term =~ "^tmux") && !has('nvim')
  exec "set t_ts=\e]2; t_fs=\7"
endif

" visual/audio bell (terminator light bulb) off ...
set belloff=error,backspace,esc

" issue with mouse in vim when beyond 220 cols ...
if has("mouse_sgr")
  set ttymouse=sgr
else
  set ttymouse=xterm2
endif

" search options
set wrapscan
set ignorecase
set smartcase
set shortmess-=s
" and dont forget <Leader>hl for hlsearch toggle
" and we set WarningMsg highlight color below for wrap warning

" toggle line wrap
nnoremap <silent> <Leader>lw :silent set nowrap! nowrap?<CR>

" show registers (x is next on stack)
nnoremap <silent> <Leader>rg :reg *,x<CR>

" if added changes to search.c to ui_delay() after give_warning()
"set matchtime=3

" if set nowrapscan then get -
" E384: search hit TOP without match for: <search-exp>
" E385: search hit BOTTOM without match for: <search-exp>
" could also get -
" E486: Pattern not found: <search-exp>
" catch /^Vim\%((\a\+)\)\=:E385/

" hack to pause a little on search wraps ...
" causes too many redraws

"nnoremap <buffer> <silent> n :call <SID>Searchn()<CR>
"nnoremap <buffer> <silent> N :call <SID>SearchN()<CR>
function s:Searchn() abort
  let l:stext=@/
  if (len(l:stext) == 0)
    return
  endif
  nunmap <buffer> n
  set nows
  try
    "exe "normal n"
    exe "normal /\<CR>"
    "redraw!
  catch /E384:/
"   echohl WarningMsg
"   echo "E384: search hit TOP without match for: " . l:stext
"   echohl None
    set ws
    try
      "exe "normal n"
      exe "normal /\<CR>"
      sleep 200m
      redraw!
    catch /E486:/
      echo ' '
      redraw
      echohl WarningMsg
      echo "E486: Pattern not found: " . l:stext
      echohl None
      sleep 200m
    endtry
  catch /E385:/
"   echohl WarningMsg
"   echo "E385: search hit BOTTOM without match for: " . l:stext
"   echohl None
    set ws
    try
      "exe "normal n"
      exe "normal /\<CR>"
      sleep 200m
      " eat typeahead ...
      while getchar(0)
      endwhile
      redraw!
    catch /E486:/
      echo ' '
      redraw
      echohl WarningMsg
      echo "E486: Pattern not found: " . l:stext
      echohl None
      sleep 200m
    endtry
  endtry
  nnoremap <buffer> <silent> n :call <SID>Searchn()<CR>
  set ws
endfunction

function s:SearchN() abort
  let l:stext=@/
  if (len(l:stext) == 0)
    return
  endif
  nunmap <buffer> N
  set nows
  try
    "exe "normal N"
    exe "normal ?\<CR>"
    "redraw!
  catch /E384:/
"   echohl WarningMsg
"   echo "E384: search hit TOP without match for: " . l:stext
"   echohl None
    set ws
    try
      "exe "normal N"
      exe "normal ?\<CR>"
      sleep 200m
      " eat typeahead ...
      while getchar(0)
      endwhile
      redraw!
    catch /E486:/
      echo ' '
      redraw
      echohl WarningMsg
      echo "E486: Pattern not found: " . l:stext
      echohl None
      sleep 200m
    endtry
  catch /E385:/
"   echohl WarningMsg
"   echo "E385: search hit BOTTOM without match for: " . l:stext
"   echohl None
    set ws
    try
      "exe "normal N"
      exe "normal ?\<CR>"
      sleep 200m
      redraw!
    catch /E486:/
      echo ' '
      redraw
      echohl WarningMsg
      echo "E486: Pattern not found: " . l:stext
      echohl None
      sleep 200m
    endtry
  endtry
  nnoremap <buffer> <silent> N :call <SID>SearchN()<CR>
  set ws
endfunction

" turn off all nnn lines yanked ... messages
set report=99999999

"set keymodel=startsel

"set ttyfast

"set iskeyword for word separators ...
"current default is:
"iskeyword=@,48-57,_,192-255,#
"tmux uses " ='`;|[](){},/?\\\""
"(different than tmux due to vim c/c++ devel)
"set iskeyword=@,48-57,_,192-255,@-@,<,>,-,+,*,%,$,!,~,.,:,#,^
"drop ! to help with searching word under cursor ...
set iskeyword=@,48-57,_,192-255,@-@,$,#

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

" NOTE: if want terminal default background (opacity etc.) ...
let g:opaqbg=0
"hi Normal cterm=none ctermbg=none
nnoremap <silent> <expr> <Leader>bg (g:opaqbg == 1) ? ':hi Normal cterm=none ctermbg=235<bar>let g:opaqbg=0<CR>' : ':hi Normal cterm=none ctermbg=none<bar>let g:opaqbg=1<CR>'

" always show tabs
set showtabline=2

" change popup menu colors (after enabling syntax) ...
" 136, 144 reasonable (there also Pmenu)
highlight PmenuSel ctermbg=136

" -----------------------------

" if yaml syntax too slow ...
"autocmd FileType yaml setlocal syntax=OFF

" -----------------------------

set fileformat=unix

set ch=1        " set cmdheight to 1
set bs=2		" allow backspacing over everything in ins mode
set noai		" always set autoindenting off
set nobackup    " do not keep a backup file
" read/write .viminfo file, don't store more than 20 reg
set viminfo='20,\"20,f20 
" keep 20 lines of command line history
set history=20	
" :help 'viminfo' (with quotes) for more info
" show the cursor position all the time
set ruler		

set selection=inclusive

" -------- mouse / cut - paste - clipboard --------

" to disable mouse in visual mode
"set mouse-=a
" to get mouse support and 
" selection buffer copied automatically to clipboard
"set mouse=nv
" all modes / full support
set mouse=a

" use shift + left click to get terminal selection (mouse=~a)

" --- CLIPBOARD ---
" selection '*' (XA_PRIMARY/unnamed) (ie mouse 'middle-click')
" clipboard '+' (XA_CLIPBOARD/unnamedplus) (ie ctrl-shift-c/v, cut/paste)
" Should we use none or * or + or both * and + ?
" NOTE: With a clipboard mgr, using both _may_ cause problems.
"       Use * and have clipboard mgr sync to + and then vim will
"       clear * (selection) at exit; we can optionally restore *
"       Use + and have clipboard mgr sync to * and then vim will
"       clear + (clipboard) at exit; we can optionally restore +
set clipboard-=unnamed
set clipboard^=unnamedplus

" if want clipboard preserved after exit ...
function! s:PreserveClipboard() abort
    if executable("copyq") && !exists('$VIM_SKIP_PRESERVE_CLIPBOARD')
        let cliplst = split(&clipboard, ",")
        if index(cliplst, 'unnamed') != -1
            silent call system("setsid -w copyq copySelection -", getreg('*'))
        endif
        if index(cliplst, 'unnamedplus') != -1
            silent call system("setsid -w copyq copy -", getreg('+'))
        endif
        " or could have just -
        "silent call system("setsid -w xsel -i -b", getreg('+'))
        " since copyq would have then synced + to * ...
    endif
endfunction
autocmd VimLeave * silent call <SID>PreserveClipboard()
" --- CLIPBOARD ---

" ------------------------------
" NOTE: removing autoselect means visual selection is not automatically copied to unnamed clipboard (*)
"       also removing autoselectml makes things fail weirdly
"       this also affects getregtype("*") se we need to use visualmode() instead
set clipboard-=autoselect
" add this to get decent mouse selection and copy to clipboard when in command-mode ...
set clipboard^=autoselectml guioptions+=A

" ------------------------------

" NOTE: use MapFastKeycode(<Fxx>, ...) to remove explicit leading <Esc> from mappings ...
" then with no mappings starting with <Esc> we can increase ttimeoutlen for mapped and
" <Leader> key sequences without having a delay on <Esc> ...
"set timeoutlen=1000 ttimeoutlen=0
"set notimeout ttimeout timeoutlen=100
set timeout timeoutlen=1500
set ttimeout ttimeoutlen=7
"set nottimeout

"set esckeys

" if we remap these we can use <C-\> in tmux ...
"tnoremap <C-^> <C-\>
"inoremap <C-^> <C-\>
"cnoremap <C-^> <C-\>

" s/S is confusing, use cl/cc instead
"nnoremap s <Nop>
"vnoremap s <Nop>
"nnoremap S <Nop>
"vnoremap S <Nop>

" use S as a left-handed . (dot) ...
nnoremap S .
vnoremap S .
nnoremap s <Nop>
vnoremap s <Nop>

" dont exit this way ...
noremap ZZ <Nop>

" dont do this, it messes up viw ...
"vnoremap i <Nop>

" to get all of top/bottom lines ...
noremap 1G 1G0
noremap G G$

" ------------------------------

" MapFastKeycode: helper for fast keycode mappings
" makes use of unused vim keycodes <[S-]F15> to <[S-]F37>
" reserve S-F32 - S-F37 below, 41 remain available ...
let s:fast_i = 0
function! s:MapFastKeycode(key, keycode)
    if s:fast_i == 40
        echohl WarningMsg
        echomsg "Unable to map ".a:key.": out of spare keycodes"
        echohl None
        return
    endif
    " NOTE: tmux focus plugin uses F24, F25 which is index 9, 10
    if s:fast_i == 9
        let s:fast_i += 2
    endif
    let vkeycode = '<'.(s:fast_i/23==0 ? '' : 'S-').'F'.(15+s:fast_i%23).'>'
    " skip over existing mappings ...
    if !hasmapto('vkeycode', 'nvoict') && (maparg('vkeycode', 'nvoict') ==# '' || maparg('vkeycode', 'nvoict') ==# '<Nop>')
        exec 'set '.vkeycode.'='.a:keycode
        exec 'map '.vkeycode.' '.a:key
        exec 'imap '.vkeycode.' '.a:key
        exec 'cmap '.vkeycode.' '.a:key
        exec 'tmap '.vkeycode.' '.a:key
    endif
    let s:fast_i += 1
endfunction

" NOTE: only for term =~ ^screen || ^tmux || ^xterm || ^alacritty || ^rxvt || ^urxvt ?

call <SID>MapFastKeycode('<C-Up>',         "\e[1;5A")
call <SID>MapFastKeycode('<C-Down>',       "\e[1;5B")
call <SID>MapFastKeycode('<C-Left>',       "\e[1;5D")
call <SID>MapFastKeycode('<C-Right>',      "\e[1;5C")

call <SID>MapFastKeycode('<S-Up>',         "\e[1;2A")
call <SID>MapFastKeycode('<S-Down>',       "\e[1;2B")
call <SID>MapFastKeycode('<S-Left>',       "\e[1;2D")
call <SID>MapFastKeycode('<S-Right>',      "\e[1;2C")

call <SID>MapFastKeycode('<C-S-Up>',       "\e[1;6A")
call <SID>MapFastKeycode('<C-S-Down>',     "\e[1;6B")
call <SID>MapFastKeycode('<C-S-Left>',     "\e[1;6D")
call <SID>MapFastKeycode('<C-S-Right>',    "\e[1;6C")

call <SID>MapFastKeycode('<A-Up>',         "\e[1;3A")
call <SID>MapFastKeycode('<A-Down>',       "\e[1;3B")
call <SID>MapFastKeycode('<A-Left>',       "\e[1;3D")
call <SID>MapFastKeycode('<A-Right>',      "\e[1;3C")

"call <SID>MapFastKeycode('<A-S-Up>',       "\e[1;4A")
"call <SID>MapFastKeycode('<A-S-Down>',     "\e[1;4B")
"call <SID>MapFastKeycode('<A-S-Left>',     "\e[1;4D")
"call <SID>MapFastKeycode('<A-S-Right>',    "\e[1;4C")

call <SID>MapFastKeycode('<C-Insert>',     "\e[2;5~")
call <SID>MapFastKeycode('<S-Insert>',     "\e[2;2~")
call <SID>MapFastKeycode('<C-S-Insert>',   "\e[2;6~")
call <SID>MapFastKeycode('<A-Insert>',     "\e[2;3~")
"call <SID>MapFastKeycode('<A-S-Insert>',   "\e[2;4~")

call <SID>MapFastKeycode('<C-Del>',        "\e[3;5~")
call <SID>MapFastKeycode('<S-Del>',        "\e[3;2~")
call <SID>MapFastKeycode('<C-S-Del>',      "\e[3;6~")
call <SID>MapFastKeycode('<A-Del>',        "\e[3;3~")
"call <SID>MapFastKeycode('<A-S-Del>',      "\e[3;4~")

" NOTE: <Home> (khome) can be: ^[[H or ^[[1~ or ^[[7~
" NOTE: <End>  (kend)  can be: ^[[F or ^[[4~ or ^[[8~

call <SID>MapFastKeycode('<C-Home>',       "\e[1;5H")
call <SID>MapFastKeycode('<C-End>',        "\e[1;5F")
call <SID>MapFastKeycode('<A-Home>',       "\e[1;3H")
call <SID>MapFastKeycode('<A-End>',        "\e[1;3F")

call <SID>MapFastKeycode('<C-PageUp>',     "\e[5;5~")
"call <SID>MapFastKeycode('<C-S-PageUp>',   "\e[5;6~")
call <SID>MapFastKeycode('<A-PageUp>',     "\e[5;3~")

call <SID>MapFastKeycode('<C-PageDown>',   "\e[6;5~")
"call <SID>MapFastKeycode('<C-S-PageDown>', "\e[6;6~")
call <SID>MapFastKeycode('<A-PageDown>',   "\e[6;3~")

" ------------------------------

" resize windows
" NOTE: do not use w<Up> mapping, as then all
" 'w' cmds (including dw) take timeoutlen ...

map <Leader>w<Up>     <C-w>5+
map <Leader>w<Down>   <C-w>5-
map <Leader>w<Right>  <C-w>5<
map <Leader>w<Left>   <C-w>5>

" ------------------------------

" zoom current window to new full size tab ...

function! ZoomToTab()
  if tabpagewinnr(tabpagenr(), '$') > 1
    " Zoom in when this tab has more than one window
    tab split
  elseif tabpagenr('$') > 1
    " Zoom out when this tab is not the last tab
    if tabpagenr() < tabpagenr('$')
      tabclose
      tabprevious
    else
      tabclose
    endif
  endif
endfunction

" use ++ to have a 2 char <Leader> mapping
map <Leader>++ :call ZoomToTab()<CR>

map <C-w>z     :call ZoomToTab()<CR>

" ------------------------------

" to match vless and tmux
" terminator <C-Home> mapped to <Esc>5 (M-5)
"noremap <silent> <Esc>5 gg
noremap <silent> <C-Home> gg
" terminator <C-End> mapped to <Esc>6 (M-6)
"noremap <silent> <Esc>6 G
noremap <silent> <C-End> G

" NOTE: dont really need/use S-Ins or A-H/E
" NOTE: <S-Insert> vmap is used below
map  <silent> <S-Insert> <Nop>
imap <silent> <S-Insert> <Esc>l
cmap <silent> <S-Insert> <Nop>
tmap <silent> <S-Insert> <Nop>

map  <silent> <A-Insert> <Nop>
imap <silent> <A-Insert> <Nop>
cmap <silent> <A-Insert> <Nop>
tmap <silent> <A-Insert> <Nop>

map  <silent> <A-Home> 0
imap <silent> <A-Home> <C-o>0
cmap <silent> <A-Home> <Nop>
tmap <silent> <A-Home> <Nop>

map  <silent> <A-End> $
imap <silent> <A-End> <C-o>$
cmap <silent> <A-End> <Nop>
tmap <silent> <A-End> <Nop>

" ----------- yank / cut / paste -----------

" explicit force load @+ to clipboard ...
function! ForceLoadNammedReg() abort
    "silent call system("setsid -w xsel -i -b --rmlastnl --sc 0", getreg('+'))
    silent call system("setsid -w myclip", getreg('+'))
    echohl DiffText | echo "@+ -> clipboard ; register copied" | echohl None
    sleep 551m
    redraw!
endfunction
nnoremap <silent> <Leader>lr :call ForceLoadNammedReg()<CR>
vnoremap <silent> <Leader>lr :<C-u>call ForceLoadNammedReg()<CR>

" ----------------------

function! s:CopyReg(arg)
    call setreg('x', getreg('+'), getregtype('+'))
    if a:arg == 1
        echohl DiffText | echo "@+ -> @x ; register copied" | echohl None
        sleep 551m
        redraw!
    endif
endfunction

" copy @+ to @x ...
nnoremap <silent> <Leader>zc :call <SID>CopyReg(1)<CR>
vnoremap <silent> <Leader>zc <Esc>:<C-u>call <SID>CopyReg(1)<CR>gv

" ----------------------

function! s:SwapReg(arg)
    call setreg('y', getreg('+'), getregtype('+'))
    call setreg('+', getreg('x'), getregtype('x'))
    call setreg('x', getreg('y'), getregtype('y'))
    if a:arg == 1
        echohl DiffText | echo "@+ <-> @x ; registers swapped" | echohl None
        sleep 551m
        redraw!
    endif
endfunction

" swap @+ with @x ...
nnoremap <silent> <Leader>zx :call <SID>SwapReg(1)<CR>
vnoremap <silent> <Leader>zx <Esc>:<C-u>call <SID>SwapReg(1)<CR>gv

" replace highlighted selection with x reg (usually after swapping + with x (<Leader>zx))
" NOTE: see all visual mode 'p' mapping for similar method ...
vnoremap <silent> <Leader>zp "_x"xP<Esc>

" ----------- yank / cut / paste -----------

function! s:YankIt(cmd, arg) abort
    if a:arg >= 1
        let offset = line(".") - line ("w0")
        exe "silent! normal! mtgv\"" . a:cmd . "\<Esc>"
    else
        exe "silent! normal! gv\"" . a:cmd . "\<Esc>"
    endif
    let oldz = 0
    let @z = visualmode()
    if "" !=# @z
        let @m = substitute(@+, "\\n\\+$", "", "")
        if @m!=#@+ " if not identical then had trailing nl ...
            let @z="V"
            let @+=@m
        endif
    else
        let oldz = 1
    endif
    let @x=@y " prev in reg x ...
    let @y=@+
    " dont del v mark, as some cmds use this to return to orig pos
    "delmarks v
    if &buftype == "terminal" && a:arg >= 1
        if a:arg == 1
            echo "copied to clipboard"
            sleep 651m
            redraw!
        endif
        " NOTE: should we go back to live terminal mode ?
        exe "silent! normal! i"
    else
        if a:arg >= 1
            if oldz == 0
                exe "silent! normal! `t"
                let offset2 = line(".") - line ("w0")
                let offdiff = offset - offset2
                if offdiff < 0
                    exe "silent! normal! " . -offdiff . "\<C-e>"
                elseif offdiff > 0
                    exe "silent! normal! " . +offdiff . "\<C-y>"
                endif
                delmarks t
            endif
        endif
    endif
endfunction

function! s:CutIt(cmd) abort
    if &buftype == "terminal"
        " cannot cut from readonly buffer ...
        exe "silent! normal! gv\""
        echo "readonly buffer ..."
        sleep 651m
        redraw!
        return
    endif
    "let @z = getregtype("*")
    exe "silent! normal! gv\"" . a:cmd . "\<Esc>"
    let @z = visualmode()
    if "V" ==# @z
        let @+ = substitute(@+, "\\n\\+$", "", "")
    endif
    let @x=@y " prev in reg x ...
    let @y=@+
endfunction

" example of nested conditionals from :h expr1
"     lnum == 1 ? "top" : lnum == 1000 ? "last" : lnum

" ---------------

" C-S-v / C-Insert / M-1 / C-S-Insert / M-8 paste ...

" cannot differentiate between C-S-v and C-v ...
"nnoremap <expr> <C-S-v> (&buftype == 'terminal') ? '<Nop>' : 'p'
"vnoremap <expr> <C-S-v> (&buftype == 'terminal') ? '<Nop>' : '<Esc>p'
"inoremap <C-S-v> <C-r>+
"cnoremap <C-S-v> <C-r>+
"tnoremap <C-S-v> <C-w>"+

" <C-Insert> paste after
nnoremap <expr> <C-Insert> (&buftype == 'terminal') ? '<Nop>' : 'p'
" NOTE: <C-Insert> vmapped below ...
"vnoremap <expr> <C-Insert> (&buftype == 'terminal') ? '<Nop>' : '<Esc>p'
inoremap <C-Insert> <C-r>+
cnoremap <C-Insert> <C-r>+
tnoremap <C-Insert> <C-w>"+

" <M-1> paste after [menu?]
call <SID>MapFastKeycode('<S-F34>',  "\e1")
nnoremap <expr> <S-F34> (&buftype == 'terminal') ? '<Nop>' : 'p'
vnoremap <expr> <S-F34> (&buftype == 'terminal') ? '<Nop>' : '<Esc>p'
inoremap <S-F34> <C-r>+
cnoremap <S-F34> <C-r>+
tnoremap <S-F34> <C-w>"+

" <C-S-Insert> paste before
nnoremap <expr> <C-S-Insert> (&buftype == 'terminal') ? '<Nop>' : 'P`['
" NOTE: <C-S-Insert> vmapped below ...
"vnoremap <expr> <C-S-Insert> (&buftype == 'terminal') ? '<Nop>' : '<Esc>P`['
inoremap <C-S-Insert> <C-o>mp<C-r>+<C-o>`p
cnoremap <C-S-Insert> <C-r>+
tnoremap <C-S-Insert> <C-w>"+

" <M-8> paste before [menu?]
call <SID>MapFastKeycode('<S-F35>',  "\e8")
nnoremap <expr> <S-F35> (&buftype == 'terminal') ? '<Nop>' : 'P`]'
vnoremap <expr> <S-F35> (&buftype == 'terminal') ? '<Nop>' : '<Esc>P`]'
inoremap <S-F35> <C-r>+
cnoremap <S-F35> <C-r>+
tnoremap <S-F35> <C-w>"+

" C-S-c / M-7 copy ...

" cannot differentiate between C-S-c and C-c ...
"nnoremap <C-S-c> <Nop>
"vnoremap <C-S-c> "*y
"inoremap <C-S-c> <Nop>

" some terminal configs (urxvt) map C-S-c => M-7
call <SID>MapFastKeycode('<S-F36>',  "\e7")
nnoremap <S-F36> <Nop>
vmap <expr> <S-F36> (mode() =~ '\<C-v>') ? 'ty' : 'mvty`v'
inoremap <S-F36> <Nop>

" C-S-x / M-9 cut ...

" cannot differentiate between C-S-x and C-x ...
"nnoremap <C-S-x> <Nop>
"vnoremap <expr> <C-S-x> (&buftype == 'terminal') ? '<Nop>' : '"*d'
"inoremap <C-S-x> <Nop>

call <SID>MapFastKeycode('<S-F37>',  "\e9")
nnoremap <S-F37> <Nop>
vmap <expr> <S-F37> (&buftype == 'terminal') ? '<Nop>' : 'tx'
inoremap <S-F37> <Nop>

" cut selection
"vnoremap <silent> <C-x> "*d<LeftRelease>
nnoremap <C-x> <Nop>
vmap <expr> <C-x> (&buftype == 'terminal') ? '<Nop>' : 'tx'

" ---------------

" <C-v> to toggle block-mode instead of on or cancel visual-mode
" simple and almost there -
"xnoremap <silent> <expr> <C-v> mode()=="\<C-v>" ? "v" : "\<C-v>"

let w:vc = 'u'
let w:vp = 'u'
nnoremap <silent> <C-v> :<C-u>call <SID>MyVisCvN()<CR>
function! s:MyVisCvN()
    let w:vc = 'x'
    let w:vp = 'u'
    exe "silent! normal! \<C-v>"
endfunction

xnoremap <silent> <C-v> <C-\><C-n>:<C-u>call <SID>MyVisCv()<CR>
function! s:MyVisCv()
    if w:vc ==# 'v'
        let w:vp = w:vc
        let w:vc = 'x'
        exe "silent! normal! gv" . "\<C-v>"
    elseif w:vc ==# 'V'
        let w:vp = w:vc
        let w:vc = 'x'
        exe "silent! normal! gv" . "\<C-v>"
    elseif w:vc ==# 'x'
        if w:vp ==# 'v'
            let w:vp = w:vc
            let w:vc = 'v'
            exe "silent! normal! gvv"
        elseif w:vp ==# 'V'
            let w:vp = w:vc
            let w:vc = 'V'
            exe "silent! normal! gvV"
        else
            " no-op
            "exe "silent! normal! gv"
            let w:vc = 'v'
            exe "silent! normal! gvv"
        endif
    else
        let w:vc = 'x'
        exe "silent! normal! gv" . "\<C-v>"
    endif
endfunction

nnoremap <silent> v :<C-u>call <SID>MyVisV1N()<CR>
function! s:MyVisV1N()
    let w:vc = 'v'
    let w:vp = 'u'
    exe "silent! normal! v"
endfunction

xnoremap <silent> v <C-\><C-n>:<C-u>call <SID>MyVisV1()<CR>
function! s:MyVisV1()
    if w:vc ==# 'v'
        " no-op
        exe "silent! normal! gv"
    else
        let w:vp = w:vc
        let w:vc = 'v'
        exe "silent! normal! gvv"
    endif
endfunction

nnoremap <silent> V :<C-u>call <SID>MyVisV2N()<CR>
function! s:MyVisV2N()
    let w:vc = 'V'
    let w:vp = 'u'
    exe "silent! normal! V"
endfunction

xnoremap <silent> V <C-\><C-n>:<C-u>call <SID>MyVisV2()<CR>
function! s:MyVisV2()
    if w:vc ==# 'V'
        " no-op
        exe "silent! normal! gv"
    else
        let w:vp = w:vc
        let w:vc = 'V'
        exe "silent! normal! gvV"
    endif
endfunction

" q to exit visual-mode and clear previous w:v* states
xnoremap <silent> q <C-\><C-n>:<C-u>call <SID>MyVisQ()<CR>
function! s:MyVisQ()
    let w:vc = 'u'
    let w:vp = 'u'
    exe "silent! normal! gv" . "\<Esc>"
endfunction

" ---------------

" if leaving cmd-mode and we return to vis-mode then clear any modeless-selection
" TODO: can we also clear cmd-line ? how ?
" skip for now - could cause flashing or extra work ...
"autocmd CmdlineLeave * call MyCmdLeave()
function! MyCmdLeave()
    if !empty(getcmdline())
        redraw!
    endif
endfunction

" ---------------

" insert/paste

" this removes the <C-v> literal input mode
"inoremap <silent> <C-v> <C-r>+
" use <C-q> instead
"inoremap <silent> <C-q> <C-r>+
" <C-q> does not seem to get through as its stty start ...
" NOTE: does not work as a map as expected because it is interpreted as <Esc>p ...
"inoremap <silent> <M-p> <C-r>+
" NOTE: use <C-Insert> or <C-S-v> instead ...

" should we change default to paste before (at) cursor
" instead of after cursor ?
" good for words but can be strange for lines
" skip for now - see unconditional-paste plugin
" TODO: could use an <expr> and getregtype('+') to know what is being pasted ...
"nnoremap <silent> p P
"nnoremap <silent> P p

" to disable scrolljump when pasting at last row ...
function! s:MyPasteNoJump(cmd) abort
  let prevsj=&scrolljump
  let &scrolljump=1
  execute "normal! " . a:cmd
  let &scrolljump=prevsj
endfunction
"nnoremap <silent> <buffer> <expr> p (&buftype == 'terminal') ? '<Nop>' : ':call <SID>MyPasteNoJump('p')<CR>'
"nnoremap <silent> <buffer> <expr> P (&buftype == 'terminal') ? '<Nop>' : ':call <SID>MyPasteNoJump('P`[')<CR>'

nnoremap <silent> <buffer> <expr> P (&buftype == 'terminal') ? '<Nop>' : 'P`['

" Make p in Visual mode replace the selected text with the previous + register.
" NOTE: see also <Leader>zx / <Leader>zp above ...
vnoremap <silent> <buffer> <expr> p (&buftype == 'terminal') ? '<Nop>' : ':<C-u>call <SID>SwapReg(0)<CR>gv"_x"xP'
vnoremap <silent> <buffer> <expr> P (&buftype == 'terminal') ? '<Nop>' : ':<C-u>call <SID>SwapReg(0)<CR>gv"_x"xP'

" <S-Insert> as a vis-mode 'replace' ...
vnoremap <silent> <buffer> <expr> <S-Insert>   (&buftype == 'terminal') ? '<Nop>' : 's'
" NOTE: these are used instead of <C-Insert>, <C-S-Insert> vmappings above ...
vnoremap <silent> <buffer> <expr> <C-Insert>   (&buftype == 'terminal') ? '<Nop>' : ':<C-u>call <SID>SwapReg(0)<CR>gv"_x"xP'
vnoremap <silent> <buffer> <expr> <C-S-Insert> (&buftype == 'terminal') ? '<Nop>' : ':<C-u>call <SID>SwapReg(0)<CR>gv"_x"xP'

" ---------------

" ---------------------------------------------------------------------------------
" TODO: TMUX <C-Insert> in terminal does not use bracketed-paste, but <C-S-v> is ok
" ---------------------------------------------------------------------------------

" set paste mode, paste, set nopaste mode
function! WrapForTmux(as)
  if !exists('$TMUX')
    return a:as
  endif
  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"
  return tmux_start . substitute(a:as, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

" active cursor ...

" change cursor to beam in Insert mode ...
let &t_SI = "\e[5 q"
let &t_EI = "\e[2 q"
" ---------------

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

" tmux:
"   set -ga terminal-overrides '*:Ss=\E[%p1%d q:Se=\E[ q'

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

" TODO: use this outside of tmux ?
"inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

" ------------------------------

" mouse paste

nnoremap <MiddleMouse> <Nop>
vnoremap <MiddleMouse> <Nop>
inoremap <MiddleMouse> <Nop>

nnoremap <2-MiddleMouse> <Nop>
vnoremap <2-MiddleMouse> <Nop>
inoremap <2-MiddleMouse> <Nop>

nnoremap <3-MiddleMouse> <Nop>
vnoremap <3-MiddleMouse> <Nop>
inoremap <3-MiddleMouse> <Nop>

nnoremap <4-MiddleMouse> <Nop>
vnoremap <4-MiddleMouse> <Nop>
inoremap <4-MiddleMouse> <Nop>

nnoremap <C-MiddleMouse> <Nop>
vnoremap <C-MiddleMouse> <Nop>
inoremap <C-MiddleMouse> <Nop>

nnoremap <C-2-MiddleMouse> <Nop>
vnoremap <C-2-MiddleMouse> <Nop>
inoremap <C-2-MiddleMouse> <Nop>

nnoremap <C-3-MiddleMouse> <Nop>
vnoremap <C-3-MiddleMouse> <Nop>
inoremap <C-3-MiddleMouse> <Nop>

nnoremap <C-4-MiddleMouse> <Nop>
vnoremap <C-4-MiddleMouse> <Nop>
inoremap <C-4-MiddleMouse> <Nop>

nnoremap <A-MiddleMouse> <Nop>
vnoremap <A-MiddleMouse> <Nop>
inoremap <A-MiddleMouse> <Nop>

nnoremap <A-2-MiddleMouse> <Nop>
vnoremap <A-2-MiddleMouse> <Nop>
inoremap <A-2-MiddleMouse> <Nop>

nnoremap <A-3-MiddleMouse> <Nop>
vnoremap <A-3-MiddleMouse> <Nop>
inoremap <A-3-MiddleMouse> <Nop>

nnoremap <A-4-MiddleMouse> <Nop>
vnoremap <A-4-MiddleMouse> <Nop>
inoremap <A-4-MiddleMouse> <Nop>

" could add `[ to go back to orig col ...

" ---- if want vim menu ----

let g:list3b = ['Copy', 'Paste', 'Quit']
function! My3BFilter(id, key)
    if a:key == 'q' || a:key == 'x' || a:key == '\<Esc>' || a:key == '\<C-c>'
        call popup_close(a:id, 0)
        " return > 0 to not pass on to callback ...
        return 1
    elseif a:key == "\<LeftMouse>"
        call popup_close(a:id, 0)
        " return > 0 to not pass on to callback ...
        return 1
    endif
    "echo "key = " . a:key
    return popup_filter_menu(a:id, a:key)
endfunction

function! My3BCallback(id, indx) abort
    if a:indx <= 0
        return
    endif
    "echo "indx = " . a:indx
endfunction

function! My3BClear(tid) abort
    call feedkeys("\<Esc>", "m")
endfunction

function! s:My3BPopup(arg) abort
    if a:arg == 1
        exe 'normal gv'
    endif
    call popup_menu(g:list3b, #{ filter: 'My3BFilter', callback: 'My3BCallback', mapping: 0, close: 'none', time: 10000 })
endfunction

"nnoremap <RightMouse> :call <SID>My3BPopup(0)<CR>
"vnoremap <RightMouse> <C-\><C-n>:call <SID>My3BPopup(1)<CR>gv
"inoremap <RightMouse> <C-\><C-o>:echo "Mouse 3 button"<CR>

nnoremap <RightMouse> <Nop>
vnoremap <RightMouse> <Nop>
inoremap <RightMouse> <Nop>

nnoremap <2-RightMouse> <Nop>
vnoremap <2-RightMouse> <Nop>
inoremap <3-RightMouse> <Nop>

nnoremap <3-RightMouse> <Nop>
vnoremap <3-RightMouse> <Nop>
inoremap <3-RightMouse> <Nop>

nnoremap <4-RightMouse> <Nop>
vnoremap <4-RightMouse> <Nop>
inoremap <4-RightMouse> <Nop>

" ---------------

" terminal might use Btn3
nnoremap <C-RightMouse> <Nop>
vnoremap <C-RightMouse> <Nop>
inoremap <C-RightMouse> <Nop>

nnoremap <C-2-RightMouse> <Nop>
vnoremap <C-2-RightMouse> <Nop>
inoremap <C-2-RightMouse> <Nop>

nnoremap <C-3-RightMouse> <Nop>
vnoremap <C-3-RightMouse> <Nop>
inoremap <C-3-RightMouse> <Nop>

nnoremap <C-4-RightMouse> <Nop>
vnoremap <C-4-RightMouse> <Nop>
inoremap <C-4-RightMouse> <Nop>

" ---------------

nnoremap <A-RightMouse> p
vnoremap <A-RightMouse> p
inoremap <A-RightMouse> <C-o>p

nnoremap <A-2-RightMouse> p
vnoremap <A-2-RightMouse> p
inoremap <A-2-RightMouse> <C-o>p

nnoremap <A-3-RightMouse> p
vnoremap <A-3-RightMouse> p
inoremap <A-3-RightMouse> <C-o>p

nnoremap <A-4-RightMouse> p
vnoremap <A-4-RightMouse> p
inoremap <A-4-RightMouse> <C-o>p

" --------------------------

" or when you release the mouse button ...
":noremap <silent> <LeftRelease> "+y<LeftRelease>

" if mouse not supported try vim-extended or gvim -v

" NOTE: disable mouse drag in normal and insert mode ...
"nnoremap <LeftMouse><LeftDrag> <Nop>
"inoremap <LeftMouse><LeftDrag> <Nop>
" NOTE: Meta/Alt left mouse enters visual mode to drag/select ...
"nnoremap <silent> <A-LeftMouse> <LeftMouse>
"vnoremap <silent> <A-LeftMouse> <LeftMouse>
nnoremap <A-LeftDrag> v<LeftDrag>
vnoremap <A-LeftDrag> <LeftDrag>
inoremap <A-LeftDrag> <LeftDrag>

" might as well make C- do the same as normal mode
nnoremap <C-LeftDrag> v<LeftDrag>
vnoremap <C-LeftDrag> <LeftDrag>
inoremap <C-LeftDrag> <LeftDrag>

" see mousetime for double-click delay

" DoubleClick for word (lbvhe)
nmap <2-LeftMouse> mvviwtygv
vmap <2-LeftMouse> <Esc>mvviwtygv
imap <silent> <2-LeftMouse> <C-\><C-o>:let @i="2"<CR><C-\><C-o>:call <SID>GetWord(1)<CR>

" TripleClick for next larger entity, not whole line (lBvhE)
"nnoremap <silent> <3-LeftMouse> mvviWygv
"vnoremap <silent> <3-LeftMouse> mviWygv

" NOTE: Use GetPath instead of lBvhE ...
"nnoremap <3-LeftMouse> <LeftMouse>:call GetPath(1,1)<CR>
"vnoremap <3-LeftMouse> <LeftMouse><C-\><C-n>:call GetPath(1,1)<CR>
nmap <3-LeftMouse> mvviWtygv
vmap <3-LeftMouse> <Esc>mvviWtygv
imap <silent> <expr> <3-LeftMouse> (@j=="0") ? '<LeftMouse><C-\><C-o>:let @j="1"<bar>:call <SID>GetWord(1)<CR>' : '<LeftMouse><C-\><C-o>:call <SID>GetPath(1,1)<CR>'

" QuadrupleClick for whole line
nmap <4-LeftMouse> mvVtygv
vmap <4-LeftMouse> <Esc>mvVtygv
inoremap <4-LeftMouse> <Nop>

" change C-LeftMouse searching tags file for symbol under cursor
" and select words under cursor instead (lBvhE)
" (was viW), use GetPath() instead ...
"nnoremap <silent> <C-LeftMouse> <Nop>
"vnoremap <silent> <C-LeftMouse> <Nop>
"inoremap <silent> <C-LeftMouse> <Nop>
nmap <C-LeftMouse> <LeftMouse>
vmap <C-LeftMouse> <LeftMouse>
"imap <C-LeftMouse> <LeftMouse>

" TODO: previous Ctrl mappings ...
" --------------------------------
"nmap <C-2-LeftMouse> mvviwtygv
"vmap <C-2-LeftMouse> <Esc>mvviwtygv
"inoremap <silent> <C-2-LeftMouse> <C-\><C-o>:let @i="2"<CR><C-\><C-o>:call <SID>GetWord(1)<CR>

" if visual selection is only one line then auto yank it ...
function s:YankIfOnlyOneLine()
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    if line_end == line_start
        call <SID>YankIt("*y", 1)
    endif
    if @k=="1"
        let @k="0"
        startinsert
    endif
    execute 'normal! gv'
endfunction
"vnoremap <LeftRelease> <LeftRelease><C-\><C-n>:call <SID>YankIfOnlyOneLine()<CR>
"inoremap <LeftMouse> <C-\><C-o>:let @k="1"<CR><LeftMouse>

" TripleClick for next larger entity, not whole line (lBvhE)
"nmap <C-3-LeftMouse> mvviWtygv
"vmap <C-3-LeftMouse> <Esc>mvviWtygv
"inoremap <silent> <expr> <C-3-LeftMouse> (@j=="0") ? '<LeftMouse><C-\><C-o>:let @j="1"<bar>:call <SID>GetWord(1)<CR>' : '<LeftMouse><C-\><C-o>:call <SID>GetPath(1,1)<CR>'

" QuadrupleClick for whole line
"nmap <C-4-LeftMouse> mvVtygv
"vmap <C-4-LeftMouse> <Esc>mvVtygv
"inoremap <C-4-LeftMouse> <Nop>
" --------------------------------

" TODO: use Alt mapping where we leave vis-mode upon release ...
nmap <silent> <C-2-LeftMouse> mvviwty:call <SID>Delay(1)<CR><Esc>
nmap <silent> <C-3-LeftMouse> mvviWty:call <SID>Delay(1)<CR><Esc>
nmap <silent> <C-4-LeftMouse> mvVty:call <SID>Delay(1)<CR><Esc>

" NOTE: tmux maps C-Triple to M-c to be able to know its a triple-click ...
call <SID>MapFastKeycode('<S-F32>',  "\ec")
nmap <silent> <S-F32> mvviWty:call <SID>Delay(1)<CR><Esc>
vmap <silent> <S-F32> <Esc>mvviWty:call <SID>Delay(1)<CR><Esc>
imap <silent> <expr> <S-F32> (@j=="0") ? '<LeftMouse><C-\><C-o>:let @j="1"<bar>:call <SID>GetWord(2)<CR>' : '<LeftMouse><C-\><C-o>:call <SID>GetPath(2,1)<CR>'

vmap <silent> <C-2-LeftMouse> <Esc>mvviwty:call <SID>Delay(1)<CR><Esc>
vmap <silent> <C-3-LeftMouse> <Esc>mvviWty:call <SID>Delay(1)<CR><Esc>
vmap <silent> <C-4-LeftMouse> <Esc>mvVty:call <SID>Delay(1)<CR><Esc>

imap <silent> <C-2-LeftMouse> <LeftMouse><C-\><C-o>:let @j="1"<bar>:call <SID>GetWord(2)<CR>
imap <silent> <C-3-LeftMouse> <LeftMouse><C-\><C-o>:call <SID>GetPath(2,1)<CR>
imap <silent> <C-4-LeftMouse> <Nop>

vmap <silent> <C-LeftRelease> tygv:<C-u>call <SID>Delay(0)<CR><Esc>
imap <silent> <C-LeftMouse> <C-\><C-o>:let @i="1"<CR><LeftMouse>

" ------------------------------
" TODO: inside A-2-LeftMouse functions, check for 3rd click ...
"    let c = getchar()
"    if c == '\<LeftMouse>' && v:mouse_win > 0
" ------------------------------

function! s:Delay(arg) abort
    if a:arg == 1
        silent exe "normal! gv"
        redraw
    endif
    if (exists("g:use_system_copy") && g:use_system_copy > 0) || (!exists("g:use_system_copy"))
        let clipcmd = ''
        let clipstr = &clipboard
        let cliplst = split(clipstr, ",")
        if index(cliplst, 'unnamed') != -1
            let clipcmd .= 'unamed'
        endif
        if index(cliplst, 'unnamedplus') != -1
            if !empty(clipcmd)
                let clipcmd .= ','
            endif
            let clipcmd .= 'unamedplus'
        endif
    endif
    if exists("g:use_system_copy") && g:use_system_copy > 0
        let c2 = g:system_copy#copy_command
        if !empty(clipcmd)
            let c2 .= ' (' . clipcmd . ')'
        endif
        let clipcmd = c2
        echohl String | echon 'Copied to clipboard using: ' . clipcmd | echohl None
    else
        let c2 = 'internal'
        if !empty(clipcmd)
            let c2 .= ' (' . clipcmd . ')'
        endif
        let clipcmd = c2
        echohl String | echon 'Copied to clipboard using: ' . clipcmd | echohl None
    endif
    sleep 551m
    echo ""
endfunction

" M- same as C- (was viW)
" NOTE: copy/yank and returns to normal mode
" NOTE: these were <A-2-LeftRelease>

" NOTE: single click after double ...

nmap <silent> <A-2-LeftMouse> mvviwty:call <SID>Delay(1)<CR><Esc>
nmap <silent> <A-3-LeftMouse> mvviWty:call <SID>Delay(1)<CR><Esc>
nmap <silent> <A-4-LeftMouse> mvVty:call <SID>Delay(1)<CR><Esc>

" NOTE: tmux maps A-Triple to M-b to be able to know its a triple-click ...
call <SID>MapFastKeycode('<S-F33>',  "\eb")
nmap <silent> <S-F33> mvviWty:call <SID>Delay(1)<CR><Esc>
vmap <silent> <S-F33> <Esc>mvviWty:call <SID>Delay(1)<CR><Esc>
imap <silent> <expr> <S-F33> (@j=="0") ? '<LeftMouse><C-\><C-o>:let @j="1"<bar>:call <SID>GetWord(2)<CR>' : '<LeftMouse><C-\><C-o>:call <SID>GetPath(2,1)<CR>'

vmap <silent> <A-2-LeftMouse> <Esc>mvviwty:call <SID>Delay(1)<CR><Esc>
vmap <silent> <A-3-LeftMouse> <Esc>mvviWty:call <SID>Delay(1)<CR><Esc>
vmap <silent> <A-4-LeftMouse> <Esc>mvVty:call <SID>Delay(1)<CR><Esc>

"vnoremap <silent> <A-2-LeftMouse> mv<Esc>viwygv<C-\><C-n>:sleep 651m<CR>`v<Esc>
"vnoremap <silent> <A-3-LeftMouse> mv<Esc>viWygv<C-\><C-n>:sleep 651m<CR>`v<Esc>

"nnoremap <silent> <A-2-LeftMouse> <LeftMouse>:call GetWord(2)<CR>
"imap <expr> <A-LeftMouse> (@j=="0") ? '<A-LeftMouse>' : '<LeftMouse><C-\><C-o>:call <SID>GetPath(2,1)<CR>'

"vnoremap <silent> <A-2-LeftMouse> <LeftMouse><C-\><C-n>:call GetWord(2)<CR>
"inoremap <silent> <A-2-LeftMouse> <LeftMouse><C-\><C-o>:call GetWord(2)<CR>

"nnoremap <silent> <expr> <A-2-LeftMouse> (@j=="0") ? '<LeftMouse>:let @j="1"<bar>:call GetWord(2)<CR>' : '<LeftMouse>:call GetPath(2,1)<CR>'
"nnoremap <expr> <A-2-LeftMouse> (@j=="0") ? '<LeftMouse>:let @j="1"<bar>:call GetWord(2)<CR>' : '<LeftMouse>'
"nnoremap <expr> <A-3-LeftMouse> (@j=="0") ? '<LeftMouse>:let @j="1"<bar>:call GetWord(2)<CR>' : '<LeftMouse>'
"nnoremap <expr> <A-4-LeftMouse> (@j=="0") ? '<LeftMouse>:let @j="1"<bar>:call GetWord(2)<CR>' : '<LeftMouse>'

"vnoremap <expr> <A-2-LeftMouse> (@j=="0") ? '<LeftMouse><C-\><C-n>:let @j="1"<bar>:call GetWord(2)<CR>' : '<LeftMouse><C-\><C-n>:call GetPath(2,1)<CR>'
"vnoremap <expr> <A-3-LeftMouse> (@j=="0") ? '<LeftMouse><C-\><C-n>:let @j="1"<bar>:call GetWord(2)<CR>' : '<LeftMouse><C-\><C-n>:call GetPath(2,1)<CR>'
"vnoremap <expr> <A-4-LeftMouse> (@j=="0") ? '<LeftMouse><C-\><C-n>:let @j="1"<bar>:call GetWord(2)<CR>' : '<LeftMouse><C-\><C-n>:call GetPath(2,1)<CR>'

"imap <silent> <expr> <A-2-LeftMouse> (@j=="0") ? '<LeftMouse><C-\><C-o>:let @j="1"<bar>:call <SID>GetWord(2)<CR>' : '<LeftMouse><C-\><C-o>:call <SID>GetPath(2,1)<CR>'
imap <silent> <A-2-LeftMouse> <LeftMouse><C-\><C-o>:let @j="1"<bar>:call <SID>GetWord(2)<CR>
imap <silent> <A-3-LeftMouse> <LeftMouse><C-\><C-o>:call <SID>GetPath(2,1)<CR>
imap <silent> <A-4-LeftMouse> <Nop>

"imap <silent> <expr> <A-3-LeftMouse> (@j=="0") ? '<LeftMouse><C-\><C-o>:let @j="1"<bar>:call <SID>GetWord(2)<CR>' : '<LeftMouse><C-\><C-o>:call <SID>GetPath(2,1)<CR>'
"inoremap <silent> <expr> <A-4-LeftMouse> (@j=="0") ? '<LeftMouse><C-\><C-o>:let @j="1"<bar>:call <SID>GetWord(2)<CR>' : '<LeftMouse><C-\><C-o>:call <SID>GetPath(2,1)<CR>'

" TODO: or could select and copy whole line ?
" NOTE: need to set z reg to 'c' also ... (this y is not YankIt)
"nnoremap <silent> <expr> <A-LeftRelease> (&filetype == 'GV') ? '' : '<LeftRelease>Vy:let @z="c"<CR>gv'
" or call YankIt() ...
"nnoremap <silent> <expr> <A-LeftRelease> (&filetype == 'GV') ? '' : '<LeftRelease>V<C-\><C-n>:echo "copied to clipboard"<bar>:sleep 551m<bar>:call YankIt("*y")<bar>:redraw!<CR>
" NOTE: M- Drag end now copies selection to clipboard and returns to normal mode
"vnoremap <silent> <A-LeftRelease> <C-\><C-n>mv<LeftRelease><C-\><C-n>:echo "copied to clipboard"<bar>:sleep 551m<bar>:call YankIt("*y", 2)<bar>:redraw!<CR>`v
"vnoremap <silent> <expr> <A-LeftRelease> (@i=="1") ? '<C-\><C-n>mv<LeftRelease><C-\><C-n>:let @i="0"<bar>:echo "copied to clipboard"<bar>:sleep 551m<bar>:call YankIt("*y", 2)<bar>:redraw!<CR>`v<Esc>i' : '<C-\><C-n>mv<LeftRelease><C-\><C-n>:echo "copied to clipboard"<bar>:sleep 551m<bar>:call YankIt("*y", 2)<bar>:redraw!<CR>`v'

" YankIt() now leaves cursor at end position ...
"vnoremap <expr> <A-LeftRelease> (@i=="1") ? '<LeftRelease><C-\><C-n>:let @i="0"<bar>:echo "copied to clipboard"<bar>:sleep 551m<bar>:call YankIt("*y", 2)<bar>:redraw!<CR><Esc>i' : '<LeftRelease><C-\><C-n>:echo "copied to clipboard"<bar>:sleep 551m<bar>:call YankIt("*y", 2)<bar>:redraw!<CR>'
"vnoremap <expr> <A-LeftRelease> (@i=="1") ? '<LeftRelease><C-\><C-n>:let @i="0"<bar>:echo "copied to clipboard"<bar>:sleep 551m<bar>:call YankIt("*y", 2)<CR><Esc>i' : '<LeftRelease><C-\><C-n>:echo "copied to clipboard"<bar>:sleep 551m<bar>:call YankIt("*y", 2)<CR>'
"vmap <expr> <A-LeftRelease> (@i=="1") ? '<LeftRelease><C-\><C-n>:<C-u>sleep 551m<bar>:let @i="0"<bar>:call YankIt("*y", 2)<CR><Esc>i' : '<LeftRelease><C-\><C-n>:<C-u>sleep 551m<bar>:call YankIt("*y", 2)<CR>'

"vmap <A-LeftRelease> "*ygv
vmap <silent> <A-LeftRelease> tygv:<C-u>call <SID>Delay(0)<CR><Esc>

"vnoremap <A-2-LeftRelease>  <Nop>
"vnoremap <A-3-LeftRelease>  <Nop>
"vnoremap <A-4-LeftRelease>  <Nop>

imap <silent> <A-LeftMouse> <C-\><C-o>:let @i="1"<CR><LeftMouse>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Word commands NOTE: selection is USUALLY copied to clipboard
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" highlight word under cursor (lbvhe)
" NOTE: also copy to clipboard (since its not a mouse click event) ?
nmap <silent> <Leader>ws mvviwtygv
vmap <silent> <Leader>ws <C-\><C-n>mvviwtygv

" highlight WORD under cursor (lBvhE) (does not use iskeyword)
" NOTE: also copy to clipboard (since its not a mouse click event) ?
nmap <silent> <Leader>wS mvviWtygv
vmap <silent> <Leader>wS <C-\><C-n>mvviWtygv

" grab file path (ie w / and w/o :)
" NOTE: also copy to clipboard (since its not a mouse click event) ?
nmap <silent> <Leader>wp mv:call <SID>GetPath(0,0)<CR>tygv
vmap <silent> <Leader>wp mv<C-\><C-n>:call <SID>GetPath(0,0)<CR>tygv

" grab url path (ie w / and w :) but really about the same as \wS
nmap <silent> <Leader>wP mv:call <SID>GetPath(0,1)<CR>tygv
vmap <silent> <Leader>wP mv<C-\><C-n>:call <SID>GetPath(0,1)<CR>tygv

" yank/copy word under cursor
" `] to go to end of word/block, but `v to go back to orig pos
nmap <silent> <Leader>wy mvviwty`v
vmap <silent> <Leader>wy <C-\><C-n>mvviwtygv
" to match vim yw ...
nmap <silent> <Leader>yw mvviwty`v
vmap <silent> <Leader>yw <C-\><C-n>mvviwtygv

" -----------------------------------------------------
" search for word under cursor (without copying selection to clipboard)
" NOTE: *, # search for whole \<word\> which may not always be desired
nnoremap <silent> <Leader>* :set hlsearch<CR>*
nnoremap <silent> <Leader># :set hlsearch<CR>#

nnoremap <silent> <Leader>wf viw"sybb:set hlsearch<CR>/<C-r>s<CR>
nnoremap <silent> <Leader>wF viw"syw:set hlsearch<CR>?<C-r>s<CR>

" search for word under cursor (copying selection to clipboard)
" NOTE: *, # search for whole \<word\> which may not always be desired
"nnoremap <silent> <Leader>wg viwy:set hlsearch<CR>*
"nnoremap <silent> <Leader>wG viwy:set hlsearch<CR>#
nmap <silent> <Leader>wg viwtybb:set hlsearch<CR>/<C-r>+<CR>
nmap <silent> <Leader>wG viwtyw:set hlsearch<CR>?<C-r>+<CR>
" -----------------------------------------------------

" search for visual selection
" if register is regex with literal metachars then :let @/=escape(@", '.*\\$^')
"vnoremap <silent> <Leader>wf y <Bar> <Esc>:let @/=@"<CR> <Bar> 2n
" (without copying selection to clipboard)
vnoremap <silent> <Leader>wf "sybb<C-\><C-n>:set hlsearch<CR>/<C-r>s<CR>
vnoremap <silent> <Leader>wF "syw<C-\><C-n>:set hlsearch<CR>?<C-r>s<CR>

" to match normal mode (copying selection to clipboard)
vmap <silent> <Leader>wg tybb<C-\><C-n>:set hlsearch<CR>/<C-r>+<CR>
vmap <silent> <Leader>wG tyw<C-\><C-n>:set hlsearch<CR>?<C-r>+<CR>

" and the *, # (without copying selection to clipboard)
" NOTE: *, # search for whole \<word\> which may not always be desired
vnoremap <silent> * "sy<C-\><C-n>:set hlsearch<CR>/<C-r>s<CR>
vnoremap <silent> # "sy<C-\><C-n>:set hlsearch<CR>?<C-r>s<CR>

" dont replace clipboard selection with deleted char (x,X)
nnoremap x "_x
nnoremap X "_X
" same for delete
nnoremap <Del> "_x
" but miss the xp swap chars, this works but adds an annoying (timeoutlen) delay to the single typed x
"nnoremap xp "fx"fph
"nnoremap Xp "fX"fph
" so use Leader ...
nnoremap <silent> <Leader>xp "fx"fph
nnoremap <silent> <Leader>xP "fX"fph
" could perhaps nnoremap x <Nop> and nnoremap xx "_x to use xx to delete char instead ...
" c(har)s(wap) - swap char mapping that doesn't start with x ...
nnoremap cs "fx"fph
nnoremap cS "fX"fp
" since s is mapped to <Nop> above we can also use s(wap)c(char) ...
nnoremap sc "fx"fph
nnoremap sC "fX"fp

" do we want the same for delete-word ?  Probably not ...
"noremap dw "_dw
"noremap db "_db
"noremap dW "_dW
"noremap dB "_dB

" change word with yanked/selected word
" "_dw deletes word without putting it into reg
" nnoremap <silent> <Leader>cw lb"_dwP
" but this can trim trailing space(s) ...
" restore " and + registers back to orig selected word
" (parcellite etc. may copy + to *)
" or diodon/clipit/copyq if configured to sync ...
" optional - add lb to get back to beginning of word ?
" wc is already window close, use wx (word exchange)

" exchange silent word (from beg) with clipboard
" (need silent <CR> instead of <bar> here)
nnoremap <silent> <Leader>wx "_ciw<C-r>+<Esc>
" vis-mode of this doesnt really make sense

" replace at cursor pos with clipboard (not from beg of word like \we above)
nnoremap <silent> <Leader>wr "_cw<C-r>+<Esc>
" vis-mode of this doesnt really make sense

" zap (delete) whole word under cursor but w/o saving deleted word to clipboard
"nnoremap <silent> <Leader>wz lb"_dw
"nnoremap <silent> <Leader>wz lb"_dW
nnoremap <silent> <Leader>wz "_diw
vnoremap <silent> <Leader>wz <C-\><C-n>"_diw

" zap whole word w/ saving deleted word to clipboard
nnoremap <silent> <Leader>wZ "_diw
vnoremap <silent> <Leader>wZ <C-\><C-n>"_diw

" change word starting at cursor, like vi
nnoremap <silent> <Leader>we ce
vnoremap <silent> <Leader>we <C-\><C-n>ce

" delete word at cursor pos, like vi, but w/o saving deleted word to clipboard
nnoremap <silent> <Leader>wd "_dw
vnoremap <silent> <Leader>wd <C-\><C-n>"_dw

" delete word at cursor pos, but w/ saving deleted word to clipboard
nnoremap <silent> <Leader>wD "_dw
vnoremap <silent> <Leader>wD <C-\><C-n>"_dw

" new whole word (from beg) [cannot use wc]
nnoremap <silent> <Leader>wn ciw
vnoremap <silent> <Leader>wn <C-\><C-n>ciw

" like D (del from cursor pos to end of line) but w/o saving what was deleted to clipboard
nnoremap <silent> <Leader>D "_D
" like visual-mode D (del whole selection) but w/o saving what was deleted to clipboard (what was selected was already saved)
vnoremap <silent> <Leader>D "_x

" yank from cursor to end of line (similar to D deleting from cursor to end of line)
nnoremap <silent> Y y$

" -------------------

function s:SDel()
    if col('.') == 1
        execute 'normal! "_dW'
    elseif col('.') != col('$')-1
        execute 'normal! "_db'
    else
        "let lastchar = matchstr(getline('.'), '\%' . col('.') . 'c.')
        let lastchar = nr2char(strgetchar(getline('.')[col('.') - 1:], 0))
        if lastchar == ' '
            execute 'normal! "_dvb'
        else
            execute 'normal! "_diw'
        endif
    endif
endfunction

function s:CDel()
    if col('.') == 1 && col('$') == 1
        execute 'normal! "_dW'
    elseif col('.') != col('$')-1
        execute 'normal! "_de'
    else
        "let lastchar = matchstr(getline('.'), '\%' . col('.') . 'c.')
        let lastchar = nr2char(strgetchar(getline('.')[col('.') - 1:], 0))
        if lastchar == ' '
            execute 'normal! "_dvb'
        else
            execute 'normal! "_diw'
        endif
    endif
endfunction

function s:CSDel()
    if col('.') == 1 && col('$') == 1
        execute 'normal! "_dW'
    elseif col('.') != col('$')-1
        execute 'normal! lb"_dW'
    else
        "let lastchar = matchstr(getline('.'), '\%' . col('.') . 'c.')
        let lastchar = nr2char(strgetchar(getline('.')[col('.') - 1:], 0))
        if lastchar == ' '
            execute 'normal! "_dvb'
        else
            execute 'normal! "_diw'
        endif
    endif
endfunction

" shift-del to delete from cursor to beg of word, like backward-kill-word ...
"nnoremap <silent> <expr> <S-Del> (col('.') == 1) ? '"_dW' : (col('.') != col('$')-1) ? '"_db' : ':call <SID>SDel()<CR>'
nnoremap <silent> <expr> <S-Del> (col('.') == 1) ? '"_dW' : (col('.') != col('$')-1) ? '"_db' : (nr2char(strgetchar(getline('.')[col('.') - 1:], 0)) == ' ') ? '"_dvb' : '"_diw'
" NOTE: *-Del in v-mode does not make much sense, Del deletes entire selection etc ...
vnoremap <silent>        <S-Del> <Del>
inoremap <silent> <expr> <S-Del> (col('.') == 1) ? '<C-o>"_dW' : (col('.') != col('$')) ? '<C-o>"_db' : (nr2char(strgetchar(getline('.')[col('.') - 1:], 0)) == ' ') ? '<C-o>"_dvb' : '<C-o>"_diw'

" ctrl-del to delete from cursor to end of word, to match kill-word ...
" also skip alt-d
"nnoremap <silent> <expr> <C-Del> (col('.') == 1 && col('$') == 1) ? '"_dW' : (col('.') != col('$')-1) ? '"_de' : ':call <SID>CDel()<CR>'
nnoremap <silent> <expr> <C-Del> (col('.') == 1 && col('$') == 1) ? '"_dW' : (col('.') != col('$')-1) ? '"_de' : (nr2char(strgetchar(getline('.')[col('.') - 1:], 0)) == ' ') ? '"_dvb' : '"_diw'
" NOTE: *-Del in v-mode does not make much sense, Del deletes entire selection etc ...
vnoremap <silent>        <C-Del> <Del>
inoremap <silent> <expr> <C-Del> (col('.') == 1 && col('$') == 1) ? '<C-o>"_dW' : (col('.') != col('$')) ? '<C-o>"_de' : (nr2char(strgetchar(getline('.')[col('.') - 1:], 0)) == ' ') ? '<C-o>"_dvb' : '<C-o>"_diw'

" ctrl-shift-del to delete whole word under cursor
"nnoremap <silent> <expr> <C-S-Del> (col('.') == 1 && col('$') == 1) ? '"_dW' : (col('.') != col('$')-1) ? 'lb"_dW' : ':call <SID>CSDel()<CR>'
nnoremap <silent> <expr> <C-S-Del> (col('.') == 1 && col('$') == 1) ? '"_dW' : (col('.') != col('$')-1) ? 'lb"_dW' : (nr2char(strgetchar(getline('.')[col('.') - 1:], 0)) == ' ') ? '"_dvb' : '"_diw'
" NOTE: *-Del in v-mode does not make much sense, Del deletes entire selection etc ...
vnoremap <silent>        <C-S-Del> <Del>
inoremap <silent> <expr> <C-S-Del> (col('.') == 1 && col('$') == 1) ? '<C-o>"_dW' : (col('.') != col('$')) ? '<Esc>llb"_dWi' : (nr2char(strgetchar(getline('.')[col('.') - 1:], 0)) == ' ') ? '<C-o>"_dvb' : '<C-o>"_diw'

" NOTE: dont really need/use A-Del
" alt-del to delete whole word under cursor
nnoremap <silent> <expr> <A-Del> (col('.') == 1 && col('$') == 1) ? '"_dW' : (col('.') != col('$')-1) ? 'lb"_dW' : (nr2char(strgetchar(getline('.')[col('.') - 1:], 0)) == ' ') ? '"_dvb' : '"_diw'
" NOTE: *-Del in v-mode does not make much sense, Del deletes entire selection etc ...
vnoremap <silent>        <A-Del> <Del>
inoremap <silent> <expr> <A-Del> (col('.') == 1 && col('$') == 1) ? '<C-o>"_dW' : (col('.') != col('$')) ? '<Esc>llb"_dWi' : (nr2char(strgetchar(getline('.')[col('.') - 1:], 0)) == ' ') ? '<C-o>"_dvb' : '<C-o>"_diw'

" A-S-Del ?

"nnoremap <Char-0x07F> <BS>
" NOTE: S-BS in terminals often mapped to BS/Del ...
noremap  <silent> <S-BS> <BS>
inoremap <silent> <S-BS> <BS>
" TODO: if shift-BS is ever reliably recognized have it delete curr/prev word ...

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
" No, use Q (instead of q) for recording (@ for playback)
" Qx to record to register x
" enter keys/cmds ...
" Q to end recording
" @x to playback
nnoremap <silent> Q q
nmap <silent> q <Nop>
" NOTE: q will be re-mapped later on ...

" for block select beyond shorter line lengths
set virtualedit=block

" ------ scroll ------

set nostartofline
set scrolloff=0

" ---------

" TODO: not sure what is best
" half window height (was winheight('%')/2, but -50 is 50%)
au BufEnter,WinEnter,WinNew,VimResized * call <SID>MySetScrollJump(-50)
" disable when in insert mode ...
au InsertEnter * call <SID>MySetScrollJump(1)
au InsertLeave * let &scrolljump=-50

function! s:MySetScrollJump(sjval)
    if mode() =~# 'i'
        let &scrolljump = 1
    else
        let &scrolljump = a:sjval
    endif
    "echo 'scrolljump = ' . &scrolljump
endfunction

" map H, L to horizontal scroll
" (cannot use <C-Left>, <C-Right> as those are for word movement)
" (NOTE: only applies when wrap is off)
"nnoremap <silent> H zhh
"nnoremap <silent> L lzl
"vnoremap <silent> H zhh
"vnoremap <silent> L lzl
nnoremap <silent> z<Left>  10zh10h
nnoremap <silent> z<Right> 10zl10l
vnoremap <silent> z<Left>  10zh10h
vnoremap <silent> z<Right> 10zl10l

" ---------

" could skip ()&,[]{}'"+-/:;
"
nnoremap <C-Right> w
nnoremap <C-Left> b
"
" NOTE: this is good for when sel is adding to the right
"       and erasing to the left from what was added
"vnoremap <silent> <C-Right> e
"vnoremap <silent> <C-Left> ge
" if we were adding to the left it would be:
"vnoremap <silent> <C-Left> b
" if we were erasing to the right it would be:
"vnoremap <silent> <C-Right> w

" NOTE: get ws, we without moving cursor ...
"   exe 'normal mplb'
"   let ws = col('.')
"   exe 'normal e'
"   let we = col('.')
"   exe 'normal `p'
" from Itchyny -
"   let line = getline('.')
"   let col = col('.')
"   let ws = col - len(matchstr(line[:col], '\k*$'))
"   let we = col + len(matchstr(line[col:], '^\k*'))
" but col() is 1-based, and index [:col], is 0-based ...
" from Ingo -
"   let start = searchpos('\k*\%#\k*', 'bcnW') " Backward
"   let end = searchpos('\%#\k*', 'cenW') " Forward to end

function! s:MyCRight()
    exe 'normal gv'
    " in vis mode getpos("v") returns start of selection ...
    let [line_start, col_start] = getpos("v")[1:2]
    let [line_end, col_end] = getpos(".")[1:2]
    if line_end == line_start
        if col_end <= col_start
            " special when on orginal word
            " get ws, we without normal cmds, thanks Ingo ...
            let [ls, ws] = searchpos('\k*\%#\k*', 'bcnW')
            let [le, we] = searchpos('\%#\k*', 'cenW')
            if ws <= col_start && we > col_start
                exe 'normal e'
            elseif we == col_start
                exe 'normal wh'
            else
                exe 'normal w'
            endif
        else
            exe 'normal e'
        endif
    elseif line_end > line_start
        exe 'normal e'
    else
        exe 'normal w'
    endif
endfunction

function! s:MyCLeft()
    exe 'normal gv'
    " in vis mode getpos("v") returns start of selection ...
    let [line_start, col_start] = getpos("v")[1:2]
    let [line_end, col_end] = getpos(".")[1:2]
    if line_end == line_start
        if col_end >= col_start
            " special when on orginal word
            " get ws, we without normal cmds, thanks Ingo ...
            let [ls, ws] = searchpos('\k*\%#\k*', 'bcnW')
            let [le, we] = searchpos('\%#\k*', 'cenW')
            if ws < col_start && we >= col_start
                exe 'normal b'
            elseif ws == col_start
                exe 'normal gel'
            else
                exe 'normal ge'
            endif
        else
            exe 'normal b'
        endif
    elseif line_end < line_start
        exe 'normal b'
    else
        exe 'normal ge'
    endif
endfunction

"vnoremap <silent> <C-Right> <C-\><C-n>:call <SID>MyCRight()<CR>
"vnoremap <silent> <C-Left> <C-\><C-n>:call <SID>MyCLeft()<CR>

" ---------

" From Andy Wokula -
"
" VisAtStart({strict})
"
"   return true if the cursor is in the upper left corner of the Visual
"   area, otherwise false.  If Visual mode is off: returns true always.
"   For {strict}, see VisAtEnd().
"
" VisAtEnd({strict})
"
"   return true if the cursor is in the lower right corner of the Visual
"   area, otherwise false.  If Visual mode is off: returns true always.
"
"   {strict}        (boolean)
"       true        more exact check when in Visual block mode (4 corners)
"       false       always do the charwise/linewise check (2 corners)
"
"   When {strict} is true, then in Visual block mode both VisAtStart() and
"   VisAtEnd() can be false.  See :h v_O .

func! VisAtStart(strict) "{{{
     if mode() ==? 'v' || !a:strict
        return line("v") > line(".") || line("v") == line(".") && col("v") >= col(".")
     else
        " assume Visual block mode
        return line("v") >= line(".") && col("v") >= col(".")
     endif
endfunc "}}}

func! VisAtEnd(strict) "{{{
     if mode() ==? 'v' || !a:strict
        return line("v") < line(".") || line("v") == line(".") && col("v") <= col(".")
     else
        " assume Visual block mode
        return line("v") <= line(".") && col("v") <= col(".")
     endif
endfunc "}}}

vnoremap <expr> <C-Right> VisAtEnd(0) ? 'e' : 'w'
vnoremap <expr> <C-Left>  VisAtStart(0) ? 'b' : 'ge'

" ---------

" N<C-D> and N<C-U> idiotically change the scroll setting
function! s:Saving_scrollV(cmd)
  let save_scroll = &scroll
  " want normal! here
  execute "keepjumps normal!" a:cmd
  let &scroll = save_scroll
endfunction

function! s:Saving_scrollVDn1(cmd)
  if (line('.') == line("w0"))
    execute "keepjumps normal! M"
    return
  endif
  let save_scroll = &scroll
  " want normal! here
  execute "keepjumps normal!" . g:half . a:cmd
  let &scroll = save_scroll
endfunction

function! s:Saving_scrollVUp1(cmd)
  if (line('.') == line("w$"))
    execute "keepjumps normal! M"
    return
  endif
  let save_scroll = &scroll
  " want normal! here
  execute "keepjumps normal!" . g:half . a:cmd
  let &scroll = save_scroll
endfunction

function! s:Saving_scrollVDn2(cmd)
  if (line('.') == line("w0"))
    execute "keepjumps normal! M"
    return
  endif
  let save_scroll = &scroll
  " want normal! here
  execute "keepjumps normal!" . g:full . a:cmd
  let &scroll = save_scroll
endfunction

function! s:Saving_scrollVUp2(cmd)
  if (line('.') == line("w$"))
    execute "keepjumps normal! M"
    return
  endif
  let save_scroll = &scroll
  " want normal! here
  execute "keepjumps normal!" . g:full . a:cmd
  let &scroll = save_scroll
endfunction

function! s:Saving_scrollVDn4(cmd)
  if (line('.') == line("w0"))
    execute "keepjumps normal! M"
    return
  endif
  let save_scroll = &scroll
  " want normal! here
  execute "keepjumps normal!" . g:full2x . a:cmd
  let &scroll = save_scroll
endfunction

function! s:Saving_scrollVUp4(cmd)
  if (line('.') == line("w$"))
    execute "keepjumps normal! M"
    return
  endif
  let save_scroll = &scroll
  " want normal! here
  execute "keepjumps normal!" . g:full2x . a:cmd
  let &scroll = save_scroll
endfunction
" ---------

nnoremap <silent> <expr> <C-D> (line('.') == line('w0')) ? 'M' : '<C-D>'
vnoremap <silent> <expr> <C-D> (line('.') == line('w0')) ? 'M' : '<C-D>'
nnoremap <silent> <expr> <C-U> (line('.') == line('w$')) ? 'M' : '<C-U>'
vnoremap <silent> <expr> <C-U> (line('.') == line('w$')) ? 'M' : '<C-U>'

" ---------

function! s:NoremapNormalCmd(key, preserve_omni, ...)
  let cmd = ''
  let icmd = ''
  for x in a:000
    let cmd .= x
    let icmd .= "<C-\\><C-O>" . x
  endfor
  execute ":nnoremap " . a:key . " " . cmd
  execute ":vnoremap " . a:key . " " . cmd
  if a:preserve_omni
    execute ":inoremap <expr> " . a:key . " pumvisible() ? \"" . a:key . "\" : \"" . icmd . "\""
  else
    execute ":inoremap " . a:key . " " . icmd
  endif
endfunction

" ---------

" Cursor moves by screen lines
noremap         <Up>   gk
inoremap <expr> <Up>   pumvisible() ? '<Up>'   : '<C-\><C-o>gk'

noremap         <Down> gj
inoremap <expr> <Down> pumvisible() ? '<Down>' : '<C-\><C-o>gj'

noremap         <Home> g<Home>
inoremap <expr> <Home> pumvisible() ? '<Home>' : '<C-\><C-o>g<Home>'

noremap         <End>  g<End>
inoremap <expr> <End>  pumvisible() ? '<End>'  : '<C-\><C-o>g<End>'

" ---------

"call <SID>NoremapNormalCmd("<C-j>",    0, "1<C-D>")
nnoremap <expr> <C-Down> ((line('$') - line('w$')) < 1) ? 'j' : '<C-e>j'
nnoremap <expr> <C-j>    ((line('$') - line('w$')) < 1) ? 'j' : '<C-e>j'

vnoremap <expr> <C-Down> ((line('$') - line('w$')) < 1) ? 'j' : '<C-e>j'
vnoremap <expr> <C-j>    ((line('$') - line('w$')) < 1) ? 'j' : '<C-e>j'

inoremap <silent> <expr> <C-j>     pumvisible() ? '<C-j>'    : '<C-\><C-o>:call <SID>Saving_scrollV("1<C-V><C-D>")<CR>'
inoremap <silent> <expr> <C-Down>  pumvisible() ? '<C-Down>' : '<C-\><C-o>:call <SID>Saving_scrollV("1<C-V><C-D>")<CR>'

"call <SID>NoremapNormalCmd("<C-k>",    0, "1<C-U>")
nnoremap <C-Up> <C-y>k
nnoremap <C-k>  <C-y>k

vnoremap <C-Up> <C-y>k
vnoremap <C-k>  <C-y>k

inoremap <silent> <expr> <C-k>     pumvisible() ? '<C-k>'  : '<C-\><C-o>:call <SID>Saving_scrollV("1<C-V><C-U>")<CR>'
inoremap <silent> <expr> <C-Up>    pumvisible() ? '<C-Up>' : '<C-\><C-o>:call <SID>Saving_scrollV("1<C-V><C-U>")<CR>'

" ---------

" use wheel to scroll, extending selection ...
" C- already used to adjust font size ...
" A- to speed up scrolling ...

nnoremap <silent> <expr> <ScrollWheelDown>   (line('.') == line('w0')) ? '10j' : ((line('$') - line('w$')) < 10) ? 'mfG`f10j' : '10<C-e>10j'
" C-Wheel is often font scaling but ...
nnoremap <silent> <expr> <C-ScrollWheelDown> (line('.') == line('w0')) ? '24j' : ((line('$') - line('w$')) < 24) ? 'mfG`f24j' : '24<C-e>24j'
nnoremap <silent> <expr> <A-ScrollWheelDown> (line('.') == line('w0')) ? '48j' : ((line('$') - line('w$')) < 48) ? 'mfG`f48j' : '48<C-e>48j'

" see below
"vnoremap <silent>        <ScrollWheelDown> <C-\><C-n>:call <SID>Saving_scrollV("gv10<C-V><C-D>")<CR>

inoremap <silent> <expr> <ScrollWheelDown>   pumvisible() ? '<ScrollWhellDown>' : '<C-\><C-o>:call <SID>Saving_scrollV("10<C-V><C-D>")<CR>'

nnoremap <silent> <expr> <ScrollWheelUp>     (line('.') == line('w$')) ? '10k' : '10<C-y>10k'
" C-Wheel is often font scaling but ...
nnoremap <silent> <expr> <C-ScrollWheelUp>   (line('.') == line('w$')) ? '24k' : '24<C-y>24k'
nnoremap <silent> <expr> <A-ScrollWheelUp>   (line('.') == line('w$')) ? '48k' : '48<C-y>48k'

" see below
"vnoremap <silent>        <ScrollWheelUp>   <C-\><C-n>:call <SID>Saving_scrollV("gv10<C-V><C-U>")<CR>

inoremap <silent> <expr> <ScrollWheelUp>     pumvisible() ? '<ScrollWheelUp>' : '<C-\><C-o>:call <SID>Saving_scrollV("10<C-V><C-U>")<CR>'

" ---------

" TODO: could add same if at top then M logic to imap <ScrollWheel> ...
" dont imap <A-ScrollWheel> as thats an auto copy and exit so large scroll does not make much sense

"nnoremap <silent> <ScrollWheelUp>     5k
"nnoremap <silent> <ScrollWheelDown>   5j
"nnoremap <silent> <A-ScrollWheelUp>   40k
"nnoremap <silent> <A-ScrollWheelDown> 40j

" NOTE: add selection to beg/end of next line ...
" do we bother to look at reg to see if its V for this ?
vnoremap <ScrollWheelUp>     5k0
vnoremap <ScrollWheelDown>   5j$
" C-Wheel is often font scaling but ...
vnoremap <C-ScrollWheelUp>   24k0
vnoremap <C-ScrollWheelDown> 24j$
vnoremap <A-ScrollWheelUp>   48k0
vnoremap <A-ScrollWheelDown> 48j$

"inoremap <silent> <ScrollWheelUp>     <C-\><C-o>5k
"inoremap <silent> <ScrollWheelDown>   <C-\><C-o>5j
"inoremap <silent> <A-ScrollWheelUp>   <C-\><C-o>40k
"inoremap <silent> <A-ScrollWheelDown> <C-\><C-o>40j

" ---------

" move by 5/10 ...
" NOTE: probably already mapped in tmux ...

noremap  <C-S-Up>    5k
noremap  <C-S-Down>  5j
noremap  <C-S-Left>  10h
noremap  <C-S-Right> 10l
inoremap <C-S-Up>    <C-\><C-o>5k
inoremap <C-S-Down>  <C-\><C-o>5j
inoremap <C-S-Left>  <C-\><C-o>10h
inoremap <C-S-Right> <C-\><C-o>10l

" ---------

function! s:MapScrollKeys()
  let g:half = winheight(0) / 2
  if (g:half < 1)
    g:half = 1
  endif
  let g:full = g:half + g:half
  let g:full2x = g:full + g:full

  " TODO: could add same if at top then M logic to imap <C-f> ...

  noremap            <expr> <C-f> (line('.') == line('w0')) ? 'M' : '<C-D>'
  inoremap  <silent> <expr> <C-f> pumvisible() ? '<C-f>' : '<C-\><C-o>:call <SID>Saving_scrollVDn1("<C-V><C-D>")<CR>'

  noremap            <expr> <C-b> (line('.') == line('w$')) ? 'M' : '<C-U>'
  inoremap  <silent> <expr> <C-b> pumvisible() ? '<C-b>' : '<C-\><C-o>:call <SID>Saving_scrollVUp1("<C-V><C-U>")<CR>'

  noremap            <expr> <PageDown>   (line('.') == line('w0')) ? 'M' : '<C-D><C-D>'
  inoremap  <silent> <expr> <PageDown>   pumvisible() ? '<PageDown>' : '<C-\><C-o>:call <SID>Saving_scrollVDn2("<C-V><C-D>")<CR>'
  noremap            <expr> <PageUp>     (line('.') == line('w$')) ? 'M' : '<C-U><C-U>'
  inoremap  <silent> <expr> <PageUp>     pumvisible() ? '<PageUp>'   : '<C-\><C-o>:call <SID>Saving_scrollVUp2("<C-V><C-U>")<CR>'

  noremap            <expr> <C-PageDown> (line('.') == line('w0')) ? 'M' : '<C-D>'
  inoremap  <silent> <expr> <C-PageDown> pumvisible() ? '<C-PageDown>' : '<C-\><C-o>:call <SID>Saving_scrollVDn1("<C-V><C-D>")<CR>'
  noremap            <expr> <C-PageUp>   (line('.') == line('w$')) ? 'M' : '<C-U>'
  inoremap  <silent> <expr> <C-PageUp>   pumvisible() ? '<C-PageUp>'   : '<C-\><C-o>:call <SID>Saving_scrollVUp1("<C-V><C-U>")<CR>'

  noremap            <expr> <A-PageDown> (line('.') == line('w0')) ? 'M' : '<C-D><C-D><C-D><C-D>'
  inoremap  <silent> <expr> <A-PageDown> pumvisible() ? '<C-PageDown>' : '<C-\><C-o>:call <SID>Saving_scrollVDn4("<C-V><C-D>")<CR>'
  noremap            <expr> <A-PageUp>   (line('.') == line('w$')) ? 'M' : '<C-U><C-U><C-U><C-U>'
  inoremap  <silent> <expr> <A-PageUp>   pumvisible() ? '<C-PageUp>'   : '<C-\><C-o>:call <SID>Saving_scrollVUp4("<C-V><C-U>")<CR>'
endfunction

let g:half = 24
let g:full = 48
let g:full2x = 96
call <SID>MapScrollKeys()

autocmd VimResized * call <SID>MapScrollKeys()

" ---------

" if in Insert mode with no input/movement for 10 sec then revert to Normal mode ...
set updatetime=10000
function! s:IdleToNormalMode()
    let mymode = mode()
    if mymode ==# 'i' || mymode ==# 'R'
        call feedkeys("\<Esc>", "m")
        echo "Exiting Insert mode after idle timeout ..."
    endif
endfunction
autocmd CursorHoldI * call <SID>IdleToNormalMode()

function! s:ClearCmdWindow()
    "exe 'normal :'
    "redraw!
    echo "\r\r"
    echo ''
endfunction
" nice but can clear asyncrun status in cmdline ...
autocmd CursorHold * call <SID>ClearCmdWindow()

" ---------

" tmux uses these to navigate panes
noremap <S-Up>    <Nop>
noremap <S-Down>  <Nop>
noremap <S-Left>  <Nop>
noremap <S-Right> <Nop>

" X might use these to scroll ...
noremap <S-PageUp>   <Nop>
noremap <S-PageDown> <Nop>

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

" go to center line of screen (like M but screen lines)
"noremap <silent> <Leader>ct M
nnoremap <silent> <Leader>ct           :call <SID>GoToMID(0)<CR>
vnoremap <silent> <Leader>ct <C-\><C-n>:call <SID>GoToMID(1)<CR>

" <C-/> (sends C-_) move current line to center of screen (not ideal with wrap and long lines)
noremap <silent> <C-_> zz
noremap <silent> <Leader>cz zz

" ------ scroll ------

" move lines or selected text up/down

" NOTE: these mappings start with <Esc> and keys pressed quickly
"       enough could be incorrectly interpreted as a mapping
" TODO: look into alternate esc-seq for these sequences ...
"nnoremap <M-j> :m .+1<CR>==
"nnoremap <M-k> :m .-2<CR>==
"vnoremap <M-j> :m '>+1<CR>gv=gv
"vnoremap <M-k> :m '<-2<CR>gv=gv
"inoremap <M-j> <Esc>:m .+1<CR>==gi
"inoremap <M-k> <Esc>:m .-2<CR>==gi

"function! MoveLineAndInsert(n)       " -x=up x lines; +x=down x lines
"    let n_move = (a:n < 0 ? a:n-1 : '+'.a:n)
"    let pos = getcurpos()
"    try         " maybe out of range
"        exe ':move'.n_move
"        call setpos('.', [0,pos[1]+a:n,pos[2],0])
"    finally
"        startinsert
"    endtry
"endfunction
"inoremap ,<Up>   <Esc>`^:silent! call MoveLineAndInsert(-1)<CR>
"inoremap ,<Down> <Esc>`^:silent! call MoveLineAndInsert(+1)<CR>

"nnoremap ,<Up>   :<C-u>silent! move-2<CR>==
"nnoremap ,<Down> :<C-u>silent! move+<CR>==
"xnoremap ,<Up>   :<C-u>silent! '<,'>move-2<CR>gv=gv
"xnoremap ,<Down> :<C-u>silent! '<,'>move'>+<CR>gv=gv

nnoremap  z<Down>  :m .+1<CR>==
nnoremap  z<Up>    :m .-2<CR>==
vnoremap  z<Down>  :m '>+1<CR>gv=gv
vnoremap  z<Up>    :m '<-2<CR>gv=gv
inoremap  z<Down>  <Esc>:m .+1<CR>==gi
inoremap  z<Up>    <Esc>:m .-2<CR>==gi

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
  autocmd BufReadPre,FileReadPre   *.gz,*.bz2 set bin
  autocmd BufReadPost,FileReadPost *.gz call GZIP_read("gunzip")
  autocmd BufReadPost,FileReadPost *.bz2 call GZIP_read("bunzip2")
  autocmd BufWritePost,FileWritePost *.gz call GZIP_write("gzip")
  autocmd BufWritePost,FileWritePost *.bz2 call GZIP_write("bzip2")
  autocmd FileAppendPre  *.gz call GZIP_appre("gunzip")
  autocmd FileAppendPre  *.bz2 call GZIP_appre("bunzip2")
  autocmd FileAppendPost *.gz call GZIP_write("gzip")
  autocmd FileAppendPost *.bz2 call GZIP_write("bzip2")

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
" put preview window at bottom
set splitbelow
set splitright
"let g:clang_verbose_pmenu = 1
let g:clang_exec = 'clang++-9'
let g:clang_cpp_options = '-std=c++11 -DNDEBUG -Wno-inconsistent-missing-override'
" put this in the local .lvimrc now ...
"let g:clang_compilation_database = '~/lnrs/wip/buildln/compile_commands.json'
"let g:clang_compilation_database = '~/lnrs/wip/buildln'
let g:clang_c_completeopt = 'longest,menuone,preview,popup'
let g:clang_cpp_completeopt = 'longest,menuone,preview,popup'
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
"noremap <silent> <Leader>cc :ccl<bar>lcl<bar>:echo<CR>
"noremap <silent> <Leader>cc :windo lcl<bar>ccl<bar>:echo<CR>
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
"noremap <silent> <Leader>cc :ccl<bar>lcl<bar>:echo<CR>
"noremap <silent> <Leader>cc :windo lcl<bar>ccl<bar>:echo<CR>
" cscope -----------

" rtags -----------------
" download/build/install rtags
" start rdm daemon
" run rc -J /path/to/compile_commands.json
"
" -------------------------------------
"\ri	Symbol info
"\rj	Follow location (jump to)
"\rJ	Follow declaration location
"\rH	Follow location (open in horizontal split)
"\rV	Follow location (open in vertical split)
"\rT	Follow location (open in new tab)
"\rt	Follow location (if not in same file then open in new tab)
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
"\rb	Jump to prev location
"\r,	Jump to prev location (<)
"\r.	Jump to next location (>)
" -------------------------------------
"
let g:rtagsUseLocationList=1
" dont start rdm if from sudo
if $USER != 'root'
  let g:rtagsAutoLaunchRdm=1
else
  let g:rtagsAutoLaunchRdm=0
endif
noremap <C-]> <C-\><C-n>:<C-u>call rtags#JumpTo(g:SAME_WINDOW)<CR>
" C-o to go back
" C-t to go back (not implemented)
" nmap <C-t> :call rtags#JumpBack()<bar>:echo<CR>
" \cc to close quickfix, listview, preview
nnoremap <silent> <Leader>cc           :ccl<bar>lcl<bar>pcl<bar>:echo<CR>
vnoremap <silent> <Leader>cc <C-\><C-n>:ccl<bar>lcl<bar>pcl<bar>:echo<CR>
"noremap <silent> <Leader>cc :windo lcl<bar>ccl<bar>pcl<bar>:echo<CR>
" qq to also close location list
autocmd BufReadPost quickfix nnoremap <silent> <buffer> qq :ccl<bar>lcl<bar>pcl<bar>:echo<CR>
" TODO: should qq from regular window also close these ?
"
" auto-reindex on file save ...
" but shouldn't rdm automatically pick up changes ?
"autocmd BufWritePost,FileWritePost,FileAppendPost *.{c,h,C,cc,cpp,hpp,ipp,tpp} call rtags#ReindexFile()
" this is done in plugin now ...
let g:rtagsAutoReindexOnWrite=1
" rtags -----------------

" fswitch ---------------
" Switch to the other .c*/.h* file in the current window >
nnoremap <silent> <Leader>of           :FSHere<CR>
vnoremap <silent> <Leader>of <C-\><C-n>:FSHere<CR>
" do not create new files
let fsnonewfiles=1
" fswitch ---------------

" unconditional-paste ---
nmap <Leader>Pc <Plug>UnconditionalPasteCharBefore
nmap <Leader>pc <Plug>UnconditionalPasteCharAfter

nmap <Leader>Pj <Plug>UnconditionalPasteJustJoinedBefore
nmap <Leader>pj <Plug>UnconditionalPasteJustJoinedAfter
"
" should we use <C-y> for paste ?
"nmap <C-y> <Plug>UnconditionalPasteCharBefore
nnoremap <C-y> <Nop>
vnoremap <C-y> <Nop>

" also Pc
nmap <Leader>pp <Plug>UnconditionalPasteCharBefore
nmap <Leader>p0 <Plug>UnconditionalPasteCharBefore
" also pc
nmap <Leader>p1 <Plug>UnconditionalPasteCharAfter

" at end of line
nmap <Leader>pe $<Plug>UnconditionalPasteCharAfter`]
nmap <Leader>pE $A<Space><Esc><Plug>UnconditionalPasteCharAfter`]
" at beg of first word (^ not 0)
nmap <Leader>pa ^<Plug>UnconditionalPasteCharBefore`]
nmap <Leader>pA ^<Plug>UnconditionalPasteCharBefore`]li<Space><Esc>b

" change l to i to match current indentation ...
"nmap <Leader>Pl <Plug>UnconditionalPasteIndentedBefore
"nmap <Leader>pl <Plug>UnconditionalPasteIndentedAfter
nmap <Leader>pl <Plug>UnconditionalPasteLineAfter
nmap <Leader>pL <Plug>UnconditionalPasteLineBefore
"
nmap <Leader>pb <Plug>UnconditionalPasteBlockAfter
nmap <Leader>pB <Plug>UnconditionalPasteBlockBefore

nmap <Leader>pi <Plug>UnconditionalPasteIndentedAfter
nmap <Leader>pI <Plug>UnconditionalPasteIndentedBefore

" use . for more (>) and , for less (<)
nmap <Leader>p. <Plug>UnconditionalPasteMoreIndentAfter
nmap <Leader>p> <Plug>UnconditionalPasteMoreIndentBefore

nmap <Leader>p, <Plug>UnconditionalPasteLessIndentAfter
nmap <Leader>p< <Plug>UnconditionalPasteLessIndentBefore

" slightly confusing and has some delay ...
"nmap <Leader>P> <Plug>UnconditionalPasteShiftedBefore
"nmap <Leader>p> <Plug>UnconditionalPasteShiftedAfter
" unconditional-paste ---

" ansiesc ----------
"let g:no_ansiesc_menu = 1
"let g:no_cecutil_maps = 1
"let g:ansiNone="hi gui=NONE cterm=NONE fg=red bg=black ctermfg=7"
"autocmd BufNewFile,BufRead * AnsiEsc
" ansiesc ----------

" colorizer --------
"let g:colorizer_auto_color = 1
"let g:colorizer_syntax = 1
let g:colorizer_vimcolors_disable = 1
let g:colorizer_vimhighlight_disable = 1
let g:colorizer_colornames_disable = 1
let g:colorizer_taskwarrior_disable = 1
let g:colorizer_hsla_disable = 1
let g:colorizer_hex_disable = 1
let g:colorizer_rgb_disable = 1
let g:colorizer_rgba_disable = 1
let g:colorizer_vimhighl_dump_disable = 1
"autocmd BufNewFile,BufRead * ColorHighlight!
nnoremap <silent> <Leader>cC :ColorToggle!<CR>
" colorizer --------

" less as a pager --
function LessInitFunc() abort
" set mouse-=a
  call lightline#disable()
  " makes for a nice transparent selection ...
  hi Visual cterm=None ctermbg=243 gui=None guibg=#767676
  set noshowmode
  set noshowmatch
" set laststatus=1
  set statusline=%f\%=[\ %L\ ][\ %3.3p%%\ ]
  hi StatusLine ctermbg=237 ctermfg=2
  " NOTE: if want terminal default background (opacity etc.) ...
  let g:opaqbg=1
  hi Normal cterm=none ctermbg=none
  nnoremap <silent> <expr> <Leader>bg (g:opaqbg == 1) ? ':hi Normal cterm=none ctermbg=235<bar>let g:opaqbg=0<CR>' : ':hi Normal cterm=none ctermbg=none<bar>let g:opaqbg=1<CR>'

endfunction
" less as a pager --

"================================================================

function s:MySearch(meth) abort
  if (a:meth == 0)
    let promptstr = 's-buf:/'
  elseif (a:meth == 1)
    let promptstr = 's-gbl:/'
  elseif (a:meth == 2)
    let promptstr = 's-dir:/'
  elseif (a:meth == 3)
    let promptstr = 'a-gbl:/'
  elseif (a:meth == 4)
    let promptstr = 'a-dir:/'
  else
    redraw!
    return
  endif
  call inputsave()
  let string = input(promptstr)
  call inputrestore()
  if (len(string) == 0)
    " should we reset @/ ?
    redraw!
    return
  endif
  if g:asyncrun_status == 'running'
    echohl WarningMsg | echo "AsyncRun currently running" | echohl None
    return
  endif
  if (a:meth == 0)
    " NOTE: list of files code below is from ack.vim for :LAckWindow ...
    let files = tabpagebuflist()
    " remove duplicated filenames (files appearing in more than one window)
    let files = filter(copy(sort(files)), 'index(files,v:val,v:key+1)==-1')
    call map(files, "bufname(v:val)")
    " remove unnamed buffers as quickfix (empty strings before shellescape)
    call filter(files, 'v:val != ""')
    " expand to full path (avoid problems with cd/lcd in au QuickFixCmdPre)
    let files = map(files, "shellescape(fnamemodify(v:val, ':p'))")
    "execute 'AsyncRun! -strip ack -s -H --nopager --nocolor --nogroup --column --smart-case --follow' shellescape(string, 1) join(files) ' 2>/dev/null'
    execute 'AsyncRun! -strip ag --vimgrep -- ' shellescape(string, 1) join(files) ' 2>/dev/null'
  elseif (a:meth == 1)
    "execute 'AsyncRun! -strip ack -s -H --nopager --nocolor --nogroup --column --smart-case --follow' shellescape(string, 1) s:find_git_root() ' 2>/dev/null'
    execute 'AsyncRun! -strip ag --vimgrep -U --hidden -- ' shellescape(string, 1) s:find_git_root() ' 2>/dev/null'
  elseif (a:meth == 2)
    "execute 'AsyncRun! -strip -cwd ack -s -H --nopager --nocolor --nogroup --column --smart-case --follow' shellescape(string, 1) ' 2>/dev/null'
    execute 'AsyncRun! -strip ag --vimgrep -U --hidden -- ' shellescape(string, 1) ' 2>/dev/null'
  elseif (a:meth == 3)
    call fzf#vim#grep('ag -U --hidden --nogroup --column --color -- '.shellescape(string, 1).' '.s:find_git_root(), 1, fzf#vim#with_preview('up:50%:hidden', 'p'), 0)
  elseif (a:meth == 4)
    call fzf#vim#grep('ag -U --hidden --nogroup --column --color -- '.shellescape(string, 1), 1, fzf#vim#with_preview(), 0)
  endif
  let @/=string
  set hlsearch
endfunction

function s:MyVisSearch(meth) abort
  let string=@s
  if (len(string) == 0)
    " should we reset @/ ?
    return
  endif
  if g:asyncrun_status == 'running'
    echohl WarningMsg | echo "AsyncRun currently running" | echohl None
    return
  endif
  if (a:meth == 0)
    " NOTE: list of files code below is from ack.vim for :LAckWindow ...
    let files = tabpagebuflist()
    " remove duplicated filenames (files appearing in more than one window)
    let files = filter(copy(sort(files)), 'index(files,v:val,v:key+1)==-1')
    call map(files, "bufname(v:val)")
    " remove unnamed buffers as quickfix (empty strings before shellescape)
    call filter(files, 'v:val != ""')
    " expand to full path (avoid problems with cd/lcd in au QuickFixCmdPre)
    let files = map(files, "shellescape(fnamemodify(v:val, ':p'))")
    "execute 'AsyncRun! -strip ack -s -H --nopager --nocolor --nogroup --column --smart-case --follow' shellescape(string, 1) join(files) ' 2>/dev/null'
    execute 'AsyncRun! -strip ag --vimgrep -- ' shellescape(string, 1) join(files) ' 2>/dev/null'
  elseif (a:meth == 1)
    "execute 'AsyncRun! -strip ack -s -H --nopager --nocolor --nogroup --column --smart-case --follow' shellescape(string, 1) s:find_git_root() ' 2>/dev/null'
    execute 'AsyncRun! -strip ag --vimgrep -U --hidden -- ' shellescape(string, 1) s:find_git_root() ' 2>/dev/null'
  elseif (a:meth == 2)
    "execute 'AsyncRun! -strip -cwd ack -s -H --nopager --nocolor --nogroup --column --smart-case --follow' shellescape(string, 1) ' 2>/dev/null'
    execute 'AsyncRun! -strip ag --vimgrep -U --hidden -- ' shellescape(string, 1) ' 2>/dev/null'
  elseif (a:meth == 3)
    call fzf#vim#grep('ag -U --hidden --nogroup --column --color -- '.shellescape(string, 1).' '.s:find_git_root(), 1, fzf#vim#with_preview('up:50%:hidden', 'p'), 0)
  elseif (a:meth == 4)
    call fzf#vim#grep('ag -U --hidden --nogroup --column --color -- '.shellescape(string, 1), 1, fzf#vim#with_preview(), 0)
  endif
  let @/=string
  set hlsearch
endfunction

" use :let @/="" to clear out search pattern and stop any running search
nnoremap <silent> <Leader>sx :let @/=""<bar>:echo ""<bar>:AsyncStop!<CR>
vnoremap <silent> <Leader>sx <C-\><C-n>:let @/=""<bar>:echo ""<bar>:AsyncStop!<CR>
" stop running search
nnoremap <silent> <Leader>sq :AsyncStop!<CR>
vnoremap <silent> <Leader>sq <C-\><C-n>:AsyncStop!<CR>
" search normally
nnoremap <Leader>sn :let @/=""<bar>:set hlsearch<CR>/
vnoremap <Leader>sn "sy<Esc>:let @/=""<bar>:set hlsearch<CR>/<C-r>"
" search normally
nnoremap <Leader>sN :let @/=""<bar>:set hlsearch<CR>?
vnoremap <Leader>sN "sy<Esc>:let @/=""<bar>:set hlsearch<CR>?<C-r>"

" search buffer with results in qf list
nnoremap <silent> <Leader>sb :call <SID>MySearch(0)<CR>
vnoremap <silent> <Leader>sb "sy<Esc>:call <SID>MyVisSearch(0)<CR>
" search dir with results in qf list
nnoremap <silent> <Leader>sd :call <SID>MySearch(2)<CR>
vnoremap <silent> <Leader>sd "sy<Esc>:call <SID>MyVisSearch(2)<CR>
" search globally (root/project/git dir) with results in qf list
nnoremap <silent> <Leader>sg :call <SID>MySearch(1)<CR>
vnoremap <silent> <Leader>sg "sy<Esc>:call <SID>MyVisSearch(1)<CR>

" search dir (root/project/git dir) with results in fzf/Ag list
" same as :Ag ...
nnoremap <silent> <Leader>s. :call <SID>MySearch(4)<CR>
vnoremap <silent> <Leader>s. "sy<Esc>:call <SID>MyVisSearch(4)<CR>
" search globally (root/project/git dir) with results in fzf/Ag list
" same as :Agit ...
nnoremap <silent> <Leader>s/ :call <SID>MySearch(3)<CR>
vnoremap <silent> <Leader>s/ "sy<Esc>:call <SID>MyVisSearch(3)<CR>

"================================================================

let g:orig_pos = getcurpos()
let g:click_start = reltime()

" to grab a word - like file path below
function s:GetWord(arg) abort
  " 0 selects in visual mode - (0)ygv is like (1)
  " 1 selects in visual mode and yanks
  " 2 selects, yanks and returns to previous mode
  if @j!="0"
    let g:click_start = reltime()
    let g:orig_pos = getcurpos()
  endif
  if a:arg == 1
    execute 'normal mvviwtygv'
  else
    execute 'normal mvviw'
  endif
  if a:arg > 1
    redraw
    "echo "copied to clipboard"
    sleep 551m
    execute 'normal ty`v'
    "redraw!
    if &buftype == "terminal"
      " NOTE: should we go back to live terminal mode ?
      exe "silent! normal! i"
    endif
    " TODO - get we use getchar() here to get A-3-LeftMouse ?
  endif
endfunction

" to grab a file path (ie /path/to/file.ext:345) ...
function s:GetPath(arg,ws) abort
  " 0 selects in visual mode - (0)ygv is like (1)
  " 1 selects in visual mode and yanks
  " 2 selects, yanks and returns to previous mode
  " if ws then dont remove : from iskeyword to get https:// etc. urls ...
  " basically all mouse clicks paths thru here set ws ...
  if @i=="2"
    let @i="0"
    startinsert
  endif
  if @j!="0"
    let @j="0"
    let elapsed_time = reltimefloat(reltime(g:click_start))
    if elapsed_time >= 2000.1
      call <SID>GetWord(a:arg)
      return
    endif
    let curr_pos = getcurpos()
    if curr_pos != g:orig_pos
      call <SID>GetWord(a:arg)
      return
    endif
  endif
  let l:oldiskeyword = &iskeyword
  if a:ws == 1
    setlocal iskeyword+=:
  else
    setlocal iskeyword-=:
  endif
  setlocal iskeyword+=/,.,-
  if a:arg == 1
    execute 'normal mvviwtygv'
  else
    execute 'normal mvviw'
  endif
  let &iskeyword = l:oldiskeyword
  if a:arg > 1
    redraw
    "echo "copied to clipboard"
    sleep 551m
    execute 'normal ty`v'
    redraw
    if &buftype == "terminal"
      " NOTE: should we go back to live terminal mode ?
      exe "silent! normal! i"
    endif
  endif
endfunction

" to grab a WORD
function s:GetWord2(arg) abort
  " 0 selects in visual mode - (0)ygv is like (1)
  " 1 selects in visual mode and yanks
  " 2 selects, yanks and returns to previous mode
  if @i=="2"
    let @i="0"
    startinsert
  endif
  if @j!="0"
    let @j="0"
    let elapsed_time = reltimefloat(reltime(g:click_start))
    if elapsed_time >= 2000.1
      call <SID>GetWord(a:arg)
      return
    endif
    let curr_pos = getcurpos()
    if curr_pos != g:orig_pos
      call <SID>GetWord(a:arg)
      return
    endif
  endif
  let l:oldiskeyword = &iskeyword
  setlocal iskeyword-=:
  setlocal iskeyword+=/,.,-
  if a:arg == 1
    execute 'normal mvviWtygv'
  else
    execute 'normal mvviW'
  endif
  let &iskeyword = l:oldiskeyword
  if a:arg > 1
    redraw
    "echo "copied to clipboard"
    sleep 551m
    execute 'normal ty`v'
    redraw
    if &buftype == "terminal"
      " NOTE: should we go back to live terminal mode ?
      exe "silent! normal! i"
    endif
  endif
endfunction

" to grab a line
function s:GetLine(arg) abort
  " 0 selects in visual mode - (0)ygv is like (1)
  " 1 selects in visual mode and yanks
  " 2 selects, yanks and returns to previous mode
  if @i=="2"
    let @i="0"
    startinsert
  endif
  if @j!="0"
    let @j="0"
    let elapsed_time = reltimefloat(reltime(g:click_start))
    if elapsed_time >= 2000.1
      call <SID>GetWord(a:arg)
      return
    endif
    let curr_pos = getcurpos()
    if curr_pos != g:orig_pos
      call <SID>GetWord(a:arg)
      return
    endif
  endif
  if a:arg == 1
    execute 'normal mvVtygv'
  else
    execute 'normal mvV'
  endif
  if a:arg > 1
    redraw
    "echo "copied to clipboard"
    sleep 551m
    execute 'normal ty`v'
    redraw
    if &buftype == "terminal"
      " NOTE: should we go back to live terminal mode ?
      exe "silent! normal! i"
    endif
  endif
endfunction

"================================================================

" limit quickfix height ...
au FileType qf call <SID>AdjustWindowHeight(5, 10)
function! s:AdjustWindowHeight(minheight, maxheight)
  let l = 1
  let n_lines = 0
  let w_width = winwidth(0)
  while l <= line('$')
    " number to float for division
    let l_len = strlen(getline(l)) + 0.0
    let line_width = l_len/w_width
    let n_lines += float2nr(ceil(line_width))
    let l += 1
  endw
  exe max([min([n_lines, a:maxheight]), a:minheight]) . "wincmd _"
endfunction
" https://gist.github.com/juanpabloaj/5845848

" automatically quit Vim if quickfix window is the last ...
au BufEnter * call <SID>MyWindow()
function! s:MyWindow()
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
  elseif &filetype !=# 'GV'
    " qf highlight off
    "hi QuickFixLine cterm=None ctermbg=239
    setlocal nocursorline
  endif
endfunction

au BufWinEnter * call <SID>MyWindow2()
function! s:MyWindow2()
  if &buftype=="quickfix"
    " qf highlight on
    "hi QuickFixLine cterm=None ctermbg=60
    setlocal cursorline
  elseif &filetype !=# 'GV'
    " qf highlight off
    "hi QuickFixLine cterm=None ctermbg=239
    setlocal nocursorline
  endif
endfunction

" change quickfix highlight
"hi QuickFixLine cterm=None ctermbg=256 guibg=#ffff00
"hi QuickFixLine cterm=None ctermbg=60
hi QuickFixLine cterm=None
hi cursorline cterm=None ctermbg=241

" makes for a nice transparent selection ...
hi Visual cterm=None ctermbg=243 gui=None guibg=#767676

" make these easier to notice
hi ErrorMsg cterm=none ctermfg=White ctermbg=Red gui=none guifg=White guibg=Red
" mostly for search wrap
hi WarningMsg cterm=none ctermfg=White ctermbg=Red gui=none guifg=White guibg=Red

" let vim use terminal background ...
" good if want to use tmux and have active window 
" different background color than others
"if !has("gui_running")
"  hi Normal ctermbg=none
"endif

" -----------------------------

if 1 " quickfix quit/close

" quit Vim if only quickfix or preview/help windows remain
" (this is prob not needed if autocomplete window is closed
"  automatically when autocomplete finishes, see above for
"  autocmd CompleteDone ...)

" s:NextNormalWindow() {{{2
function! s:NextNormalWindow() abort
    for w in range(1, winnr('$'))
        let b = winbufnr(w)

        " skip unlisted buffers
        if !buflisted(b)
            continue
        endif

        " skip temporary buffers with buftype set
        if getbufvar(b, '&buftype') != ''
            continue
        endif

        " skip the preview window
        if getwinvar(w, '&previewwindow')
            continue
        endif

        " skip current window
        if w == winnr()
            continue
        endif

        return w
    endfor

    return -1
endfunction

" s:QuitIfOnlyWindow() {{{2
function! s:QuitIfOnlyWindow() abort
    let l:buftype = getbufvar(winbufnr(winnr()), "&buftype")
    if l:buftype != "quickfix" && l:buftype != "help" && l:buftype != "nofile"
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
        autocmd WinEnter * nested silent! call s:QuitIfOnlyWindow()
    aug END
endif

endif " quickfix quit/close

" -----------------------------

" move current window into a tab
function s:WinToTab()
    "there is only one window
    if tabpagenr('$') == 1 && winnr('$') == 1
        return
    endif
    let l:tabswap = 0
    let l:nw = s:NextNormalWindow()
    if winnr() < l:nw
        let l:tabswap = 1
    endif
    lcl
    execute "normal \<C-w>T"
    " try to put it before/after to match prev window loc
    if l:tabswap == 1
        tabm -
    endif
endfunc
nnoremap <silent> <unique> <Leader>tw :call <SID>WinToTab()<CR>

function! s:MergeTab()
    let bufnums = tabpagebuflist()
    hide tabclose
    "topleft vsplit
    botright split
    for n in bufnums
        execute 'sbuffer ' . n
        wincmd _
    endfor
    wincmd t
    quit
    wincmd j
endfunction
"command! MergeTab call <SID>MergeTab()

" NOTE: also :Tabmerge and <Leader>tm, <Leader>tM

" <C-w>t<C-w>K to split 2 vertical windows into horiz windows
" <C-w>t<C-w>H to split 2 horiz windows into vertical windows
" <C-w>t makes topleft window current
" <C-w>K moves curr window to topmost
" <C-w>H moves curr window to leftmost

" -----------------------------

" : in visual mode (can still use <C-w>:)
vnoremap : <C-\><C-n>:<C-u>call <SID>MyVisQ()<CR>:
"vnoremap : <C-w>:

noremap <C-a> 0
" ctrl-e was scroll down one line so we lose that
" (but its been remapped to <C-j>)
noremap <C-e> $

" cmdline movement
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

function! s:SkipTerminalsQuitCmd(cmd) abort
    let l:bmod = 0
    let l:doquit = 1
    for b in getbufinfo()
        if b.listed
            if getbufvar(b.bufnr, '&buftype') !=# 'terminal'
                if !b.changed
                    execute "silent! bd " . b.bufnr
                else
                    if l:bmod == 0
                        echo "buffer: " . b.bufnr . " modified"
                        let l:bmod = 1
                    endif
                    let l:doquit = 0
                endif
            else
                let l:doquit = 0
            endif
        endif
    endfor
    if l:doquit == 1
        "quit!
        execute "qa!"
        execute 'normal! \<CR>'
    else
        execute a:cmd
    endif
endfunction

function! s:SkipTerminalsConfQA() abort
    let l:bmod = 0
    let l:doquit = 1
    for b in getbufinfo()
        if b.listed
            if getbufvar(b.bufnr, '&buftype') !=# 'terminal'
                if !b.changed
                    execute "silent! bd " . b.bufnr
                else
                    if l:bmod == 0
                        echo "buffer: " . b.bufnr . " modified"
                        let l:bmod = 1
                    endif
                    let l:doquit = 0
                endif
            else
                let l:doquit = 0
            endif
        endif
    endfor
    if l:doquit == 1
        "quit!
        execute "qa!"
        execute 'normal! \<CR>'
    else
        execute "conf qa"
    endif
endfunction

function! s:QuitIfOnlyNoNameLeft() abort
    let l:doquit = 1
    for b in getbufinfo()
        if b.listed
            if b.bufnr != bufnr('%')
                let bname = bufname(b.bufnr)
                " echomsg 'bname = ' . bname
                " a [No Name] buffer ...
                if bname !=# ''
                    let l:doquit = 0
                    break
                endif
            endif
        endif
    endfor
    if l:doquit == 1
        execute "qa!"
        execute 'normal! \<CR>'
    else
        execute "tabclose!"
    endif
endfunction

" close all windows and write then quit
" no imap for this
" <C-x> used in visual mode already
"vnoremap <silent> <C-x>w     <Esc>:call <SID>SkipTerminalsQuitCmd(":wqa")<CR>
"nnoremap <silent> <C-x>w          :call <SID>SkipTerminalsQuitCmd(":wqa")<CR>

" no imap for this
" <C-x> used in visual mode already
"vnoremap <silent> <C-x><C-w> <Esc>:call <SID>SkipTerminalsQuitCmd(":wqa")<CR>
" skip for now
"nnoremap <silent> <C-x><C-w>      :call <SID>SkipTerminalsQuitCmd(":wqa")<CR>

" close all windows and confirm then quit
" no imap for this
" <C-x> used in visual mode already
"vnoremap <silent> <C-x>c     <Esc>:call <SID>SkipTerminalsQuitCmd(":conf qa")<CR>
"nnoremap <silent> <C-x>c          :call <SID>SkipTerminalsQuitCmd(":conf qa")<CR>

" another way to exit insert mode ...
inoremap <C-c> <Esc>

" NOTE: need to remap <C-c> for <C-x><C-c> below to work ...
"nnoremap <C-c> <C-c>
" (<C-c> previously remapped in visual mode above)
" no imap for this
" <C-x> used in visual mode already
""vnoremap <silent> <C-x><C-c> <Esc>:call <SID>SkipTerminalsQuitCmd(":conf qa")<CR>
" skip for now
"nnoremap <silent> <C-x><C-c>            :call <SID>SkipTerminalsQuitCmd(":conf qa")<CR>

" no imap for this
vnoremap <silent> <Leader>xc  <C-\><C-n>:<C-u>call <SID>SkipTerminalsQuitCmd(":conf qa")<CR>
nnoremap <silent> <Leader>xc            :call <SID>SkipTerminalsQuitCmd(":conf qa")<CR>

" no imap for this
" skip for now
"vnoremap <silent> <Leader>ax  <C-\><C-n>:<C-u>call <SID>SkipTerminalsQuitCmd(":conf qa")<CR>
"nnoremap <silent> <Leader>ax            :call <SID>SkipTerminalsQuitCmd(":conf qa")<CR>

function! s:EndTerminalsConfQA() abort
    for b in range(1, bufnr('$'))
        if bufexists(b) && buflisted(b)
            if getbufvar(b, '&buftype') ==# 'terminal'
                execute "silent! bwipe! " . b
            endif
        endif
    endfor
    execute "conf qa"
endfunction

" :exit to quit all windows
cnoreabbrev <silent> <expr> exi (getcmdtype() == ':' && getcmdline() =~ '\s*exi\s*')  ? 'call <SID>EndTerminalsConfQA()' : 'exi'
cnoreabbrev <silent> <expr> exit (getcmdtype() == ':' && getcmdline() =~ '\s*exit\s*') ? 'call <SID>EndTerminalsConfQA()' : 'exit'

cnoreabbrev <silent> <expr> qa (getcmdtype() == ':' && getcmdline() =~ '\s*qa\s*')  ? 'call <SID>SkipTerminalsConfQA()' : 'qa'
cnoreabbrev <silent> <expr> qal (getcmdtype() == ':' && getcmdline() =~ '\s*qal\s*')  ? 'call <SID>SkipTerminalsConfQA()' : 'qal '
cnoreabbrev <silent> <expr> qall (getcmdtype() == ':' && getcmdline() =~ '\s*qall\s*')  ? 'call <SID>SkipTerminalsConfQA()' : 'qall'
cnoreabbrev <silent> <expr> quita (getcmdtype() == ':' && getcmdline() =~ '\s*quita\s*')  ? 'call <SID>SkipTerminalsConfQA()' : 'quita'
cnoreabbrev <silent> <expr> quital (getcmdtype() == ':' && getcmdline() =~ '\s*quital\s*')  ? 'call <SID>SkipTerminalsConfQA()' : 'quital'
cnoreabbrev <silent> <expr> quitall (getcmdtype() == ':' && getcmdline() =~ '\s*quitall\s*')  ? 'call <SID>SkipTerminalsConfQA()' : 'quitall'

function! MyQuit(arg) abort
    if &buftype != 'terminal'
        exe "conf " . a:arg
        redraw!
    else
        redraw!
    endif
endfunction

" vimdiff (also as a git difftool)
"  git config --global diff.tool vimdiff
"  git config --global difftool.trustExitCode true
"  git config --global mergetool.trustExitCode true
" cycle to next file compare:
"  \df
"  n[ext]
" quit tool:
"  \xc
"  exit
" and some better colors

function Xdiff()
  let anymod = 0
  let bufcount = bufnr("$")
  let currbufnr = 1
  while currbufnr <= bufcount
    if bufexists(currbufnr)
      let bufmod = getbufvar(currbufnr, "&mod")
      "let dbgmsg = "diffx: bufnr = " . currbufnr . " &bufmod = " . bufmod
      "echomsg dbgmsg
      let anymod += bufmod
    endif
    let currbufnr += 1
  endwhile
  if anymod == 0
    execute "silent! qa"
  else
    "let dbgmsg = "diffx: &mod = " . &mod
    "echomsg dbgmsg
    if &mod == 0
      execute "silent! conf q"
    else
      execute "silent! wq"
    endif
    redraw!
    "let dbgmsg = "diffx: &diff = " . &diff
    "echomsg dbgmsg
  endif
  return
endfunction

if &diff
  "if using cmdalias/vim-alias plugin:
  "aug diff_alias
  "  au!
  "  au VimEnter * :Alias q!   qa!
  "  au VimEnter * :Alias q    qa
  "  au VimEnter * :Alias n    qa
  "  au VimEnter * :Alias next qa
  "  au VimEnter * :Alias exit cquit
  "aug END
  " ---
  cnoreabbrev <silent> <expr> q! (getcmdtype() == ':' && getcmdline() =~ '\s*q!\s*') ? 'qa!' : 'q!'
  cnoreabbrev <silent> <expr> q  (getcmdtype() == ':' && getcmdline() =~ '\s*q\s*')  ? 'qa' : 'q'
  cnoreabbrev <silent> <expr> n  (getcmdtype() == ':' && getcmdline() =~ '\s*n\s*')  ? 'qa' : 'n'
  cnoreabbrev <silent> <expr> next (getcmdtype() == ':' && getcmdline() =~ '\s*next\s*') ? 'qa' : 'next'
  cuna exi
  cnoreabbrev <silent> <expr> exi (getcmdtype() == ':' && getcmdline() =~ '\s*exi\s*') ? 'cquit' : 'exi'
  cuna exit
  cnoreabbrev <silent> <expr> exit (getcmdtype() == ':' && getcmdline() =~ '\s*exit\s*') ? 'cquit' : 'exit'
  nmap  <silent> <Leader>qq           :qa<CR>
  vmap  <silent> <Leader>qq <C-\><C-n>:qa<CR>
  aug diff_alias
      au!
      au VimEnter * :Alias qa  cquit
      au VimEnter * :Alias qa! cquit
  aug END
  " -----------
  " if no mods, then :x is like :q ...
  cnoreabbrev <silent> <expr> x (getcmdtype() == ':' && getcmdline() =~ '\s*x\s*') ? 'call Xdiff()' : 'x'

  nnoremap  <silent> <Leader>df           :qa<CR>
  vnoremap  <silent> <Leader>df <C-\><C-n>:qa<CR>
  nnoremap  <silent> <Leader>xc           :cquit<CR>
  vnoremap  <silent> <Leader>xc <C-\><C-n>:cquit<CR>
  nnoremap           <C-l>                :diffupdate<CR><C-l>
  vnoremap           <C-l>      <C-\><C-n>:diffupdate<CR><C-l>
  noremap  <silent> <Leader>dn ]c
  noremap  <silent> <Leader>dp [c
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

  " vimdiff default has wrap off (as screen width is cut in half)
  " set sidescroll=1 to help navigate smoothly when wrap is off
  set sidescroll=1
  " use zhh/H and lzl/L to scroll horizontal without moving cursor
  " or force wrap on in all windows ...
  "au VimEnter * if &diff | execute 'windo set wrap' | endif
  " but this can mess up alignment of long lines
  " and Bram said a fix is not planned ...

  " TODO: seems weird these dont work in diff ...
  unmap <C-d>
  unmap <C-u>
  unmap <C-f>
  unmap <C-b>
  inoremap <C-f> <C-\><C-o><C-f>
  inoremap <C-b> <C-\><C-o><C-b>
else 
  aug not_diff_alias
  "!&diff
    au!
    au VimEnter * :Alias q call\ MyQuit("q")
    au VimEnter * :Alias q! call\ MyQuit("q!")
  aug END
endif

" patience diff algo ...
if has("patch-8.1.0360")
  set diffopt+=internal,algorithm:patience
endif

" if want vimdiff to exit when files are equal
"autocmd VimEnter * call Diffstart()

" if start vimdiff file1 -c 'vert diffsplit file2'
" then dont get '2 files to edit' msg at exit ...
" but shell alias for arguments ($1 $2) doesnt like
" when $2 is a dir ...

function! Diffstart()
  if !&diff
    return
  endif
  execute "normal 1G"
  try
     execute ":foldc!"
  catch
     return
  endtry
  execute "normal zj"
  let l0=line('.')
  if (l0 != 1)
    return
  endif
  execute "normal j"
  let l1=line('.')
  if (l1 == 1)
    call Xdiff()
  endif
endfunction

set noshowmode

" persistent undo between sessions ...
"set undodir=~/.vim/undodir

" dont save to ~/.vim/.netrwhist
let g:netrw_dirhistmax = 0

" -----------

" :x to save (if modified) and go to next (w/o prompting) or exit
function s:NextOrQuit() abort
  update
  " TODO: is it possible to check if buf has changed and prompt to save now instead of after all files ?
  try
    next
  catch /E163:/
    exit
  catch /E165:/
    exit
  endtry
endfunction
if !&diff
  cnoreabbrev <silent> <expr> x (getcmdtype() == ':' && getcmdline() =~ '\s*x\s*')  ? 'call <SID>NextOrQuit()' : 'x'
  noremap <silent> <Leader>nf :call <SID>NextOrQuit()<CR>
endif

" could also look into autowrite for :n to write (if modified) ...

" -----------

" terminal in cur tab NOTE: added <C-w>:se scl=no<CR> at end to turn off signcolumn in terminal only ...
nnoremap <silent> <Leader>zs           :terminal ++close ++norestore ++kill=term ++curwin<CR><C-w>:se scl=no<CR>
vnoremap <silent> <Leader>zs <C-\><C-n>:terminal ++close ++norestore ++kill=term ++curwin<CR><C-w>:se scl=no<CR>
" terminal in new tab NOTE: added <C-w>:se scl=no<CR> at end to turn off signcolumn in terminal only ...
noremap <silent> zt <Nop>
nnoremap <silent> <Leader>zt           :$tabnew <Esc>:terminal ++close ++norestore ++kill=term ++curwin<CR><C-w>:se scl=no<CR>
vnoremap <silent> <Leader>zt <C-\><C-n>:$tabnew <Esc>:terminal ++close ++norestore ++kill=term ++curwin<CR><C-w>:se scl=no<CR>
" terminal in new tab when already in a terminal
tnoremap <silent> <C-x>t <C-w>:$tabnew <Esc>:terminal ++close ++norestore ++kill=term ++curwin<CR>
" window in new tab when already in a terminal
tnoremap <silent> <C-x>v <C-w>:$tabnew<CR>
" <C-w><N> or <C-\><C-n> to get into normal mode
" a or i get back into terminal mode
" or <C-\><C-n> to toggle
nnoremap <silent> <expr> <C-\><C-n> (&buftype == 'terminal') ? 'i' : '<C-\><C-n>'
" or <Return>, like tmux
nmap <silent> <expr> <Return> (&buftype == 'terminal') ? 'i' : '<Return>'
" to enter normal mode, like tmux
" there is no alternate screen so this removes these from less/more/etc.
"tnoremap <silent> <C-Up>   <C-\><C-n>
"tnoremap <silent> <PageUp> <C-\><C-n>
" ctrl-x-] like tmux enter copy-mode-vi (ctrl-s-])
tnoremap <silent> <C-x>]   <C-\><C-n>
nnoremap <silent> <expr> <C-x>] (&buftype == 'terminal') ? 'i' : '<Nop>'

" this causes sign column to disappear on popups that are terminal windows ...
"au TerminalOpen * setlocal signcolumn=no
" fixed by adding <C-w>:se scl=no<CR> on end of :terminal cmd mappings above

" -----------

" fugitive Gblame + deus 'not commited' default (Ignore) too dark
"hi! link Ignore deusPurple
" use green to match other vundle update comments
hi! link Ignore deusGreen

" seems a little more visible than white against reverse red bg ...
hi! ErrorMsg ctermfg=black
hi! WarningMsg ctermfg=black

" -----------

" undo all changes - instead of just :e! ...
"noremap <Leader>uu :earlier 999999<bar>:u<CR>
function! UndoAll()
  if &mod !=# 0
    echo 'Undo all changes? (y/n): '
    let ans=nr2char(getchar())
    if ans ==# 'y' || ans ==# 'Y'
      execute 'silent! earlier 999999'
    endif
  else
    echo 'No changes to undo'
    sleep 500m
  endif
  redraw!
endfunction
nnoremap <Leader>uu           :call UndoAll()<CR>
vnoremap <Leader>uu <C-\><C-n>:call UndoAll()<CR>

" TODO: u is close to i so remap t to uu and/or U ?
nnoremap <silent> uu u
nnoremap <silent> U  u
nmap <silent> u <Nop>
vnoremap <silent> uu u
vnoremap <silent> U  u
vmap <silent> u <Nop>

" toggle search highlight
nnoremap <silent> <Leader>hl :silent set hlsearch! hlsearch?<CR>
hi Search ctermbg=58

" TODO: remap q to turn off hlsearch ? - but as is for gv etc.

nnoremap <silent> <expr> q (&filetype == 'GV') ? 'q' : (&hlsearch) ? ':silent set nohlsearch<CR>' : ':silent redraw<CR>'

" does this make sense ? (q to cancel select/visual)
" NOTE: this is done above now in MyVisQ()
"vnoremap <unique> <silent> q <C-\><C-n>

" to match normal mode
vnoremap <silent> <C-o> <C-\><C-n><C-o>
vnoremap <silent> <C-i> <C-\><C-n><C-i>

" clear cmd window (or just <C-l> to redraw)
" 'cc' already used for quickfix close
" **careful** as 'xc' is for quit all ...
nnoremap <Leader>cx           :echo<CR>
vnoremap <Leader>cx <C-\><C-n>:echo<CR>
" maybe also execute "keepjumps normal" ""
" or :redraw!

" tab open
nnoremap <silent> <Leader>to           :$tabnew<CR>
vnoremap <silent> <Leader>to <C-\><C-n>:$tabnew<CR>
" tab quit/close (same as window quit/close)
"nnoremap <silent> <Leader>tc           :conf q<CR>
"vnoremap <silent> <Leader>tc <C-\><C-n>:conf q<CR>
nnoremap <silent> <Leader>tq           :conf q<CR>
vnoremap <silent> <Leader>tq <C-\><C-n>:conf q<CR>
" tab keep current and close all others
nnoremap <silent> <Leader>tk           :tabonly<CR>
vnoremap <silent> <Leader>tk <C-\><C-n>:tabonly<CR>

" window quit/close (same as tab close)
"nnoremap <silent> <Leader>wc           :conf q<CR>
"vnoremap <silent> <Leader>wc <C-\><C-n>:conf q<CR>
nnoremap <silent> <Leader>wq           :conf q<CR>
vnoremap <silent> <Leader>wq <C-\><C-n>:conf q<CR>
nmap <silent> <Leader>qq           :conf q<CR>:<CR>
vmap <silent> <Leader>qq <C-\><C-n>:conf q<CR>:<CR>
" window keep current and close all others
nnoremap <silent> <Leader>wk           :only<CR>
vnoremap <silent> <Leader>wk <C-\><C-n>:only<CR>

" next tab
nnoremap <Leader>tn           :tabnext<CR>
vnoremap <Leader>tn <C-\><C-n>:tabnext<CR>
" prev tab
nnoremap <Leader>tp           :tabprevious<CR>
vnoremap <Leader>tp <C-\><C-n>:tabprevious<CR>

" toggle fold
noremap <Leader>ff za
" open fold
noremap <Leader>fo zo
" close fold
noremap <Leader>fc zc
" next fold
noremap <Leader>fn zj
" prev fold
noremap <Leader>fp zk
" open all folds
noremap <Leader>fO zR
" close all folds
noremap <Leader>fC zM

function! s:TermQuit()
    let skipquit = 0
    for b in getbufinfo()
        if b.listed
            if bufnr('%') !=# b.bufnr
                " not curr buffer
                if getbufvar(b.bufnr, '&buftype') ==# 'terminal'
                    " another terminal
                    let skipquit = 1
                else
                    if !b.hidden || b.changed
                        " another buffer not hidden or modified
                        let skipquit = 1
                    endif
                endif
            endif
        endif
    endfor
    if skipquit == 0
        quit!
    endif
    "if tabpagenr('$') == 1
    "    if winnr('$') == 1
    "        quit!
    "        return
    "    endif
    "endif
    bwipe!
endfunction

tnoremap <silent> <C-d> <C-w>:call <SID>TermQuit()<CR>

" NOTE: M-L,R,U,D used for tab nav ...

" NOTE: C-S-Left/Right/Up/Down move by 5 ...
" NOTE: S-L,R,U,D was used by tmux for window nav ...
" NOTE: some terminals work with A/M-L/R but some need esc seq ...

" prev tab
nnoremap <silent> <A-Left>      :tabprevious<CR>
vnoremap <silent> <A-Left> <Esc>:tabprevious<CR>
inoremap <silent> <A-Left> <Esc>:tabprevious<CR>
tnoremap <silent> <A-Left> <C-w>:tabprevious<CR>

" next tab
nnoremap <silent> <A-Right>      :tabnext<CR>
vnoremap <silent> <A-Right> <Esc>:tabnext<CR>
inoremap <silent> <A-Right> <Esc>:tabnext<CR>
tnoremap <silent> <A-Right> <C-w>:tabnext<CR>

nnoremap <silent> <C-t> :tabnext<CR>
vnoremap <silent> <C-t> <C-\><C-n>:tabnext<CR>

" moving between windows, somtimes hard to let go of ctrl before arrow ...
" these could map to same cmds: <C-w><C-Left> -> <C-w><Left>
" NOTE: for some reason <C-w><C-arrow> does not work, use esc codes ...
nnoremap <silent> <C-w><C-[>[1;5D <C-w>h
nnoremap <silent> <C-w><C-[>[1;5C <C-w>l
nnoremap <silent> <C-w><C-[>[1;5A <C-w>k
nnoremap <silent> <C-w><C-[>[1;5B <C-w>j
" but leave these anyway
nnoremap <silent> <C-w><C-Left>   <C-w>h
nnoremap <silent> <C-w><C-Right>  <C-w>l
nnoremap <silent> <C-w><C-Up>     <C-w>k
nnoremap <silent> <C-w><C-Down>   <C-w>j

" -----------------------------

" try to open file under cursor
nnoremap <silent> <Leader>gf gf
vnoremap <silent> <Leader>gf <Esc>gf
" try to open file under cursor in new tab
nnoremap <silent> <Leader>gt <C-w>gf
vnoremap <silent> <Leader>gt <Esc><C-w>gf

" convenience, so there is [v,h]split, [v,h]new
cnoreabbrev <silent> <expr> hsplit (getcmdtype() == ':' && getcmdline() =~ '\s*hsplit\s*')  ? 'split' : 'hsplit'
cnoreabbrev <silent> <expr> hnew   (getcmdtype() == ':' && getcmdline() =~ '\s*hnew\s*')    ? 'new'   : 'hnew'
" TODO: look into vim-alias ...

" split line vertical
nnoremap <silent> <Leader>sV :vsplit<CR>
" split line horizontal
nnoremap <silent> <Leader>sH :split<CR>
" to match tmux
nnoremap <silent> <Leader>s\| :vnew<CR>
nnoremap <silent> <Leader>s_  :new<CR>
" split into new tab - but same file buffer
nnoremap <silent> <Leader>sT :tab split<CR>
" use <Leader>to to open a new tab ...

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
    " skip if buffer starts with fugitive:// ...
    let l:fname = expand('%:p:h')
    if l:fname[0:10] ==# 'fugitive://'
      "echomsg "MyGSStart: match to fugitive://"
      call timer_stop(a:timer)
      let b:mckgitstatus = "git:<fugitive>"
      call lightline#update()
      return
    endif
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
  elseif &diff
    let b:mckgitstatus = "diff"
    return
  elseif !&buflisted
    return
  endif
  let l:bufnm = bufnr("%")
  let l:found = has_key(g:tablist, l:bufnm)
  "let l:msg = "MyGitStatus " . l:bufnm . " " . l:found . " dir: " . expand('%:p:h')
  "echomsg l:msg
  if l:found == 0
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
  if l:found == 1
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

" sh syntax highlights parens oddly
let g:sh_no_error = 1

if &diff
  let b:mckgitstatus = "diff"
elseif exists("g:vless")
  let b:mckgitstatus = "less"
else
 "autocmd BufReadPost,BufNewFile,FileReadPost,TabEnter * call MyGitStatus()
  autocmd BufWinEnter * silent! call MyGitStatus()
  autocmd BufUnload   * silent! call MyGitLeave()
endif

" -----------------------------

" enable bracketed paste in terminal mode
if &term =~ "^screen" || &term =~ "^tmux"
  let &t_BE="\<Esc>[?2004h"
  let &t_BD="\<Esc>[?2004l"
  let &t_PS="\<Esc>[200~"
  let &t_PE="\<Esc>[201~"
  " tmux will send xterm-style keys when its xterm-keys option is on
  exec "set <xUp>=\e[1;*A"
  exec "set <xDown>=\e[1;*B"
  exec "set <xRight>=\e[1;*C"
  exec "set <xLeft>=\e[1;*D"
endif

" -----------------------------

" fugitive Gstatus used to not work from an empty tabnew ...
function! s:GitStatusXX()
  execute "pedit .git/index"
  redraw!
  wincmd P
endfunction
cnoreabbrev <silent> <expr> GstatusXX (getcmdtype() == ':' && getcmdline() =~ '\s*GstatusXX\s*')  ? 'call <SID>GitStatusXX()' : 'GstatusXX'

" -----------------------------

" vim+gdb debugging, requires gdb v7.12+
" :help terminal-debug
packadd termdebug
":Termdebug a.out

" -----------------------------

" To filter a quickfix/location list:
" :Cfilter[!] /{pat}/
" :Lfilter[!] /{pat}/

packadd cfilter

" -----------------------------

" when editing a file that is already edited with
" another Vim instance, go to that Vim instance
packadd! editexisting

" -----------------------------

