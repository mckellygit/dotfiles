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
call vundle#begin()
"" alternatively, pass a path where Vundle should install plugins
""call vundle#begin('~/some/path/here')
"" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"" Add Plugins here ...
"
" required utils for EnhancedJumps plugin
Plugin 'inkarkat/vim-ingo-library'
" more paste options
Plugin 'inkarkat/vim-UnconditionalPaste'
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
Plugin 'airblade/vim-rooter'
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
"Plugin 'TaDaa/vimade'
"
" ansi esc sequences
"Plugin 'powerman/vim-plugin-AnsiEsc'
Plugin 'chrisbra/Colorizer'
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
" use ag (silver-searcher) instead of ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep --hidden'
  " let g:ackprg = 'ag --nogroup --nocolor --column'
  let g:ack_use_dispatch = 1
endif
" example: (cdo/cfdo ldo/lfdo [!])
" :Ack foo
" :cdo s/foo/bar/g | update
" Also look into Plugin 'dkprice/vim-easygrep'
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
    \             [ 'gitbranch', 'myfilename', 'mymodified', 'mycolonkeyword' ] ]
    \ },
    \ 'inactive': {
    \   'left': [ [ 'mymode', 'paste' ],
    \             [ 'gitbranch', 'myfilename', 'mymodified', 'mycolonkeyword' ] ]
    \ },
    \ 'component_function': {
    \   'mymode': 'MyLightlineMode',
    \   'gitbranch': 'MyLightlineGitbranch',
    \   'myfilename': 'MyLightlineFilename',
    \   'mymodified': 'MyLightlineModified',
    \   'mycolonkeyword': 'MyLightlineColonKeyword',
    \ },
    \ 'tab_component_function': {
    \   'filename': 'MyLightlineTabFilename',
    \   'modified': 'MyLightlineTabModified',
    \ },
    \ 'mode_map': {
        \ 'n'     : 'Nm',
        \ 'i'     : 'In',
        \ 'R'     : 'Re',
        \ 'v'     : 'Vi',
        \ 'V'     : 'Vl',
        \ "\<C-v>": 'Vb',
        \ 'c'     : 'Co',
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
let g:rooter_silent_chdir = 0
" rooter ----------

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
nmap <silent> <Leader>fB <Plug>FileBeagleOpenCurrentWorkingDir
nmap <silent> <Leader>fb <Plug>FileBeagleOpenCurrentBufferDir
"nmap <silent> -          <Plug>FileBeagleOpenCurrentBufferDir
" unmap these in qf
autocmd BufReadPost quickfix nnoremap <buffer> <Leader>fb <Nop>
autocmd BufReadPost quickfix nnoremap <buffer> - -
" FileBeagle ----------

" fugitive -----------
autocmd FileType fugitiveblame nmap <buffer> <Leader><Tab> O
autocmd FileType fugitiveblame nmap <buffer> <C-t> O
autocmd FileType fugitiveblame nmap <buffer> <Space> <C-f>
autocmd FileType fugitiveblame nmap <buffer> u <C-b>
autocmd FileType git           nmap <buffer> <Leader><Tab> O
autocmd FileType git           nmap <buffer> <C-t> O
autocmd FileType git           nmap <buffer> <Space> <C-f>
autocmd FileType git           nmap <buffer> u <C-b>
autocmd FileReadCmd fugitive://**//[0-3]/**          nmap <buffer> <Leader><Tab> O
autocmd FileReadCmd fugitive://**//[0-3]/**          nmap <buffer> <C-t> O
autocmd FileReadCmd fugitive://**//[0-3]/**          nmap <buffer> <Space> <C-f>
autocmd FileReadCmd fugitive://**//[0-3]/**          nmap <buffer> u <C-b>
autocmd BufReadCmd  fugitive://**//[0-3]/**          nmap <buffer> <Leader><Tab> O
autocmd BufReadCmd  fugitive://**//[0-3]/**          nmap <buffer> <C-t> O
autocmd BufReadCmd  fugitive://**//[0-3]/**          nmap <buffer> <Space> <C-f>
autocmd BufReadCmd  fugitive://**//[0-3]/**          nmap <buffer> u <C-b>
autocmd BufWriteCmd fugitive://**//[0-3]/**          nmap <buffer> <Leader><Tab> O
autocmd BufWriteCmd fugitive://**//[0-3]/**          nmap <buffer> <C-t> O
autocmd BufWriteCmd fugitive://**//[0-3]/**          nmap <buffer> <Space> <C-f>
autocmd BufWriteCmd fugitive://**//[0-3]/**          nmap <buffer> u <C-b>
autocmd BufReadCmd  fugitive://**//[0-9a-f][0-9a-f]* nmap <buffer> <Leader><Tab> O
autocmd BufReadCmd  fugitive://**//[0-9a-f][0-9a-f]* nmap <buffer> <C-t> O
autocmd BufReadCmd  fugitive://**//[0-9a-f][0-9a-f]* nmap <buffer> <Space> <C-f>
autocmd BufReadCmd  fugitive://**//[0-9a-f][0-9a-f]* nmap <buffer> u <C-u>
autocmd FileReadCmd fugitive://**//[0-9a-f][0-9a-f]* nmap <buffer> <Leader><Tab> O
autocmd FileReadCmd fugitive://**//[0-9a-f][0-9a-f]* nmap <buffer> <C-t> O
autocmd FileReadCmd fugitive://**//[0-9a-f][0-9a-f]* nmap <buffer> <Space> <C-f>
autocmd FileReadCmd fugitive://**//[0-9a-f][0-9a-f]* nmap <buffer> u <C-b>
autocmd BufReadCmd  index{,.lock}
    \ if FugitiveIsGitDir(expand('<amatch>:p:h')) |
    \     nmap <buffer> <Leader><Tab> O |
    \     nmap <buffer> <C-t> O |
    \     nmap <buffer> <Space> <C-f> |
    \     nmap <buffer> u <C-b> |
    \ endif
" fugitive -----------

" gitgutter -----------
let g:gitgutter_enabled = 1
" always have sign column
if exists('&signcolumn')  " Vim 7.4.2201
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always = 1
endif
nmap <Leader>gn <Plug>(GitGutterNextHunk)
nmap <Leader>gp <Plug>(GitGutterPrevHunk)
nmap <silent> <Leader>gg :call gitgutter#process_buffer(bufnr(''), 0)<CR>
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
"autocmd FileType GV nmap <buffer> o <Nop>
autocmd FileType GV nmap <buffer> o O
"autocmd FileType GV nmap <buffer> <Space> O
autocmd FileType GV nmap <buffer> <Space> <Down>
autocmd FileType GV nmap <buffer> u <Up>
autocmd FileType GV nmap <buffer> d <Down>
autocmd FileType GV xmap <buffer> <Leader><Tab> O
autocmd FileType GV xmap <buffer> <C-t> O
autocmd FileType GV xmap <buffer> <Return> O
"autocmd FileType GV xmap <buffer> o <Nop>
autocmd FileType GV xmap <buffer> o O
"autocmd FileType GV xmap <buffer> <Space> O
autocmd FileType GV xmap <buffer> <Space> <Down>
autocmd FileType GV xmap <buffer> u <Up>
autocmd FileType GV xmap <buffer> d <Down>

autocmd FileType GV setlocal cursorline

" start with folds open
autocmd FileType GV set foldlevelstart=1

autocmd FileType GV nmap <silent> <buffer> qq :qa!<CR>
autocmd FileType GV nmap <silent> <buffer> <Leader>wc :call <SID>QuitIfOnlyNoNameLeft()<CR>
autocmd FileType GV nmap <silent> <buffer> <Leader>wq :call <SID>QuitIfOnlyNoNameLeft()<CR>

"autocmd FileType GV cnoreabbrev <silent> <expr> q! (getcmdtype() == ':' && getcmdline() =~ '\s*q!\s*') ? 'qa!' : 'q!'

function! TabCloseRightQuit(bang)
  let cur=tabpagenr()
  while cur < tabpagenr('$')
    exe 'tabclose' . a:bang . ' ' . (cur + 1)
  endwhile
  execute "qa!"
endfunction
command! -bang Tabcloserightquit silent! call TabCloseRightQuit('<bang>')

function! TabCloseLeft(bang)
  while tabpagenr() > 1
    exe 'tabclose' . a:bang . ' 1'
  endwhile
endfunction
command! -bang Tabcloseleft silent! call TabCloseLeft('<bang>')
" gv -----------

" QFEnter -------------
" add C-t to open in new tab to be consistent with fzf
let g:qfenter_keymap = {}
let g:qfenter_keymap.topen = ['<Leader><Tab>', '<C-t>']
" add \fz mapping also
nnoremap <silent> <Leader>fz :Files<CR>
let g:qf_loclist_window_bottom = 0
" QFEnter -------------

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
" polygot -----------

" vim-cpp-modern -----------
let c_no_curly_error = 1
" vim-cpp-modern -----------

" asyncrun -----------
" open quickfix (10 lines) when cmd ends
let g:asyncrun_open = 10 
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

" vimade -----------
let g:vimade = {}
let g:vimade.fadelevel = 0.6
let g:vimade.checkinterval = 120
" vimade -----------

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
"colorscheme gruvbox

" do not use delete/wipe with qf/ll ...
set nohidden
set bufhidden=hide

set lazyredraw

set confirm

" remove prev visual mark
delmarks v

" do not change terminal window title ...
set notitle
" visual/audio bell (terminator light bulb) off ...
set belloff=error,backspace,esc

" issue with mouse in vim when beyond 220 cols ...
if has("mouse_sgr")
  set ttymouse=sgr
else
  set ttymouse=xterm2
end

" search options
set wrapscan
set ignorecase
set smartcase
set shortmess-=s
" and dont forget <Leader>hl for hlsearch toggle
" and we set WarningMsg highlight color below for wrap warning

" to match vless and tmux
" terminator <C-Home> mapped to <Esc>5
noremap <silent> <Esc>5 gg
" terminator <C-End> mapped to <Esc>6
noremap <silent> <Esc>6 G

" toggle line wrap
nnoremap <silent> <Leader>lw :set nowrap! nowrap?<CR>:redraw!<CR>

" if added changes to search.c to ui_delay() after give_warning()
"set matchtime=3

" if set nowrapscan then get -
" E384: search hit TOP without match for: <search-exp>
" E385: search hit BOTTOM without match for: <search-exp>
" could also get -
" E486: Pattern not found: <search-exp>
" catch /^Vim\%((\a\+)\)\=:E385/

" hack to pause a little on search wraps ...

nnoremap <buffer> <silent> n :call Searchn()<CR>
function Searchn() abort
  let l:stext=@/
  if (len(l:stext) == 0)
    return
  endif
  nunmap <buffer> n
  set nows
  try
    exe "normal n"
    redraw!
  catch /E384:/
"   echohl WarningMsg
"   echo "E384: search hit TOP without match for: " . l:stext
"   echohl None
    set ws
    try
      exe "normal n"
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
      exe "normal n"
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
  nnoremap <buffer> <silent> n :call Searchn()<CR>
  set ws
endfunction

nnoremap <buffer> <silent> N :call SearchN()<CR>
function SearchN() abort
  let l:stext=@/
  if (len(l:stext) == 0)
    return
  endif
  nunmap <buffer> N
  set nows
  try
    exe "normal N"
    redraw!
  catch /E384:/
"   echohl WarningMsg
"   echo "E384: search hit TOP without match for: " . l:stext
"   echohl None
    set ws
    try
      exe "normal N"
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
      exe "normal N"
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
  nnoremap <buffer> <silent> N :call SearchN()<CR>
  set ws
endfunction

" get paste confirmation on < 3 lines ...
set report=0

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

" always show tabs
set showtabline=2

" -----------------------------

set fileformat=unix

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

" -------- mouse / cut - paste - clipboard --------

" to disable mouse in visual mode
"set mouse-=a
" to get mouse support and 
" selection buffer copied automatically to clipboard
"set mouse=nv
" all modes / full support
set mouse=a

" use shift + left click to get back to previous (mouse=~a)

" clipboard '+' (XA_CLIPBOARD:unnamedplus)
" primary   '*' (XA_PRIMARY:unnamed)
" should we use " or + or * reg ?
" NOTE: using both seems to mess things up,
"       parcellite/diodon/clipit/copyq etc. could sync
"set clipboard^=unnamed
"set clipboard^=unnamedplus
set clipboard^=unnamed

" need enough time for mapped / <Leader> key sequences
"set timeoutlen=1000 ttimeoutlen=0
"set notimeout ttimeout timeoutlen=100
set timeout timeoutlen=700
set ttimeout ttimeoutlen=2
"set nottimeout

"set esckeys

" if we remap these we can use <C-\> in tmux ...
"tnoremap <C-^> <C-\>
"inoremap <C-^> <C-\>
"cnoremap <C-^> <C-\>

" s/S is confusing, use cl/cc instead
nnoremap s <Nop>
vnoremap s <Nop>
nnoremap S <Nop>
vnoremap S <Nop>

" dont do this, it messes up viw ...
"vnoremap i <Nop>

" ----------- yank / cut / paste -----------

":vmap <silent> <C-c> "+y
"vnoremap <silent> <C-c> "+y<LeftRelease>
" y`] to goto end of block, or even better
" gv<Esc> leave cursor at last pos
"vnoremap <silent> <C-c> "+ygv<Esc>
" leave normal mode with <C-c>/yank, like tmux
"vnoremap <silent> <expr> <C-c> (&buftype == 'terminal') ? '"+ygv<Esc>i' : '"+ygv<Esc>'
"vnoremap <silent> <expr> y     (&buftype == 'terminal') ? '"+ygv<Esc>i' : '"+ygv<Esc>'
" if X11 Forwarding is not on/allowed then perhaps vim copy to + and * does not work over ssh ?
"vnoremap <silent> <expr> <C-c> (&buftype == 'terminal') ? '""y <Bar> :<C-u>call system("xsel -i -b -t 5000", @")<CR> <Bar> gv<Esc>i' : '""y <Bar> :<C-u>call system("xsel -i -b -t 5000", @")<CR> <Bar> gv<Esc>'
"vnoremap <silent> <expr> y     (&buftype == 'terminal') ? '""y <Bar> :<C-u>call system("xsel -i -b -t 5000", @")<CR> <Bar> gv<Esc>i' : '""y <Bar> :<C-u>call system("xsel -i -b -t 5000", @")<CR> <Bar> gv<Esc>'

" should we use " or + or * reg ? And what with clipboard setting ?

" NOTE: substitute() to remove trailing nl char if present which can happen in visual-line mode (v/V/c/l) ...
" perhaps let @* = substitute(@a, "\\_s\\+$", "", "") (trailing tabs, spaces, nl, etc.) or substitute(@a, "\\n\\+$", "", "") (just trailing nl)
" perhaps also this works :call setreg('*', '', 'c') ?
" NOTE: == may be case-INSENSITIVE, as its not ==#

" ----------------------
" explicit force load */named clipboard ...
function! ForceLoadNammedReg() abort
    call system("xsel -i --rmlastnl --sc 0 -p", @*)
endfunction
nnoremap <silent> <Leader>lr :<C-U>call ForceLoadNammedReg()<CR>
" ----------------------

" ----------------------
" swap reg with prev ...
nnoremap <silent> <Leader>sr :let @y=@* <bar> :let @*=@x <bar> :let @x=@y <bar> echohl DiffText <bar> echo "--- registers swapped ---" <bar> echohl None <bar> sleep 551m <bar> redraw!<CR>
" ----------------------

function! YankIt(cmd) abort
    if "vcl" =~ getregtype("*")
        exe "silent! normal! gv\"" . a:cmd . "\<Esc>"
        let @z = getregtype("*")
        let @* = substitute(@*, "\\n\\+$", "", "")
    else
        exe "silent! normal! gv\"" . a:cmd . "\<Esc>"
        let @z = getregtype("*")
    endif
    let @x=@y " prev in reg x ...
    let @y=@*
    if &buftype == "terminal"
        exe "silent! normal! i"
    endif
    delmarks v
endfunction

function! CutIt(cmd) abort
    if "vcl" =~ getregtype("*")
        exe "silent! normal! gv\"" . a:cmd . "\<Esc>"
        let @z = getregtype("*")
        let @* = substitute(@*, "\\n\\+$", "", "")
    else
        exe "silent! normal! gv\"" . a:cmd . "\<Esc>"
        let @z = getregtype("*")
    endif
    let @x=@y " prev in reg x ...
    let @y=@*
endfunction

"vnoremap <silent> <expr> <C-c> (&buftype == 'terminal') ? '"*ygv<Esc>i' : '"*ygv<Esc>'
"vnoremap <silent> <expr> <C-c> (&buftype == 'terminal') ? '"ay <bar> :<C-U>call system("xsel -i --rmlastnl --sc 0 -p", @a)<CR>:let @*=@a<CR> <bar> gv<Esc>i' : '"ay <bar> :<C-U>call system("xsel -i --rmlastnl --sc 0 -p", @a)<CR>:let @*=@a<CR> <bar> gv<Esc>'
"vnoremap <silent> <expr> <C-c> ("vcl" =~ getregtype("*")) ? '"*ygv<Esc>:let @z=getregtype("*")<CR>:let @* = substitute(@*, "\\n\\+$", "", "")<CR>' : '"*ygv<Esc>:let @z=getregtype("*")<CR>' <bar> (&buftype == 'terminal') ? 'i' : ''
vnoremap <silent> <expr> <C-c> ("vcl" =~ getregtype("*")) ? '"*y<Esc>:let @z=getregtype("*") <bar> :let @* = substitute(@*, "\\n\\+$", "", "")<CR>' : '"*y<Esc>:let @z=getregtype("*")<CR>' <bar> let @x=@y <bar> let @y=@* <bar> (&buftype == 'terminal') ? 'i' : ''
"vnoremap <silent> <C-c> :<C-U>call YankIt("*y")<CR>

"vnoremap <silent> <expr> y     (&buftype == 'terminal') ? '"*ygv<Esc>i' : '"*ygv<Esc>'
"vnoremap <silent> <expr> y     (&buftype == 'terminal') ? '"ay <bar> :<C-U>call system("xsel -i --rmlastnl --sc 0 -p", @a)<CR>:let @*=@a<CR> <bar> gv<Esc>i' : '"ay <bar> :<C-U>call system("xsel -i --rmlastnl --sc 0 -p", @a)<CR>:let @*=@a<CR> <bar> gv<Esc>'
"vnoremap <silent> <expr> y     ("vcl" =~ getregtype("*")) ? '"*ygv<Esc>:let @z=getregtype("*")<CR>:let @* = substitute(@*, "\\n\\+$", "", "")<CR>' : '"*ygv<Esc>:let @z=getregtype("*")<CR>' <bar> (&buftype == 'terminal') ? 'i' : ''
vnoremap <silent> <expr> y     ("vcl" =~ getregtype("*")) ? '"*y<Esc>:let @z=getregtype("*") <bar> :let @* = substitute(@*, "\\n\\+$", "", "")<CR>' : '"*y<Esc>:let @z=getregtype("*")<CR>' <bar> let @x=@y <bar> let @y=@* <bar> (&buftype == 'terminal') ? 'i' : ''
"vnoremap <silent> y     :<C-U>call YankIt("*y")<CR>

" cut selection
"vnoremap <silent> <C-x> "*d<LeftRelease>
"vnoremap <silent> <C-x> "*d
" if X11 Forwarding is not on/allowed then perhaps vim copy to + and * does not work over ssh ?
"vnoremap <silent> <C-x> ""d <Bar> :<C-u>call system("xsel -i -b -t 5000", @")<CR>
" should we use " or + or * reg ? And what with clipboard setting ?

" do the same for x, d, <C-x> cut/del selection ...
"vnoremap <silent> <C-x> "*d
"vnoremap <silent> <expr> x     ("vcl" =~ getregtype("*")) ? '"*x<Esc>:let @z=getregtype("*")<CR>:let @* = substitute(@*, "\\n\\+$", "", "")<CR>' : '"*x<Esc>:let @z=getregtype("*")<CR>'
"vnoremap <silent> <expr> <C-x> ("vcl" =~ getregtype("*")) ? '"*x<Esc>:let @z=getregtype("*")<CR>:let @* = substitute(@*, "\\n\\+$", "", "")<CR>' : '"*x<Esc>:let @z=getregtype("*")<CR>'
"vnoremap <silent> <expr> d     ("vcl" =~ getregtype("*")) ? '"*d<Esc>:let @z=getregtype("*")<CR>:let @* = substitute(@*, "\\n\\+$", "", "")<CR>' : '"*d<Esc>:let @z=getregtype("*")<CR>'
"vnoremap <silent> <expr> <DEL> ("vcl" =~ getregtype("*")) ? '"*d<Esc>:let @z=getregtype("*")<CR>:let @* = substitute(@*, "\\n\\+$", "", "")<CR>' : '"*d<Esc>:let @z=getregtype("*")<CR>'
vnoremap <silent> <expr> x     ("vcl" =~ getregtype("*")) ? '"*x<Esc>:let @z=getregtype("*") <bar> :let @* = substitute(@*, "\\n\\+$", "", "")<CR>' : '"*x<Esc>:let @z=getregtype("*")<CR>' <bar> let @x=@y <bar> let @y=@* <bar> (&buftype == 'terminal') ? 'i' : ''
vnoremap <silent> <expr> <C-x> ("vcl" =~ getregtype("*")) ? '"*x<Esc>:let @z=getregtype("*") <bar> :let @* = substitute(@*, "\\n\\+$", "", "")<CR>' : '"*x<Esc>:let @z=getregtype("*")<CR>' <bar> let @x=@y <bar> let @y=@* <bar> (&buftype == 'terminal') ? 'i' : ''
vnoremap <silent> <expr> d     ("vcl" =~ getregtype("*")) ? '"*x<Esc>:let @z=getregtype("*") <bar> :let @* = substitute(@*, "\\n\\+$", "", "")<CR>' : '"*x<Esc>:let @z=getregtype("*")<CR>' <bar> let @x=@y <bar> let @y=@* <bar> (&buftype == 'terminal') ? 'i' : ''
vnoremap <silent> <expr> <DEL> ("vcl" =~ getregtype("*")) ? '"*x<Esc>:let @z=getregtype("*") <bar> :let @* = substitute(@*, "\\n\\+$", "", "")<CR>' : '"*x<Esc>:let @z=getregtype("*")<CR>' <bar> let @x=@y <bar> let @y=@* <bar> (&buftype == 'terminal') ? 'i' : ''
"vnoremap <silent> x     :<C-U>call CutIt("*x")<CR>
"vnoremap <silent> <C-x> :<C-U>call CutIt("*x")<CR>
"vnoremap <silent> d     :<C-U>call CutIt("*d")<CR>
"vnoremap <silent> <DEL> :<C-U>call CutIt("*d")<CR>

nnoremap <silent> <expr> p (@z ==# 'V') ? 'A<CR><Esc>p_' : (@z ==# 'l') ? 'A<CR><Esc>p_' : 'p'
nnoremap <silent> <expr> P (@z ==# 'V') ? 'kA<CR><Esc>P_' : (@z ==# 'l') ? 'kA<CR><Esc>P_' : 'P'

nnoremap <silent> yy yy:let @z='V' <bar> :let @* = substitute(@*, "\\n\\+$", "", "") <bar> :let @x=@y <bar> :let @y=@*<CR>
nnoremap <silent> dd dd:let @z='V' <bar> :let @* = substitute(@*, "\\n\\+$", "", "") <bar> :let @x=@y <bar> :let @y=@*<CR>

" ----------- yank / cut / paste -----------

" <C-v> to toggle block-mode instead of on or cancel visual-mode
" simple and almost there -
"xnoremap <silent> <expr> <C-v> mode()=="\<C-v>" ? "v" : "\<C-v>"

let w:vc = 'u'
let w:vp = 'u'
nnoremap <silent> <C-v> :<C-u>call MyVisCvN()<CR>
function! MyVisCvN()
    let w:vc = 'x'
    let w:vp = 'u'
    exe "silent! normal! \<C-v>"
endfunction

xnoremap <silent> <C-v> :<C-u>call MyVisCv()<CR>
function! MyVisCv()
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

nnoremap <silent> v :<C-u>call MyVisV1N()<CR>
function! MyVisV1N()
    let w:vc = 'v'
    let w:vp = 'u'
    exe "silent! normal! v"
endfunction

xnoremap <silent> v :<C-u>call MyVisV1()<CR>
function! MyVisV1()
    if w:vc ==# 'v'
        " no-op
        exe "silent! normal! gv"
    else
        let w:vp = w:vc
        let w:vc = 'v'
        exe "silent! normal! gvv"
    endif
endfunction

nnoremap <silent> V :<C-u>call MyVisV2N()<CR>
function! MyVisV2N()
    let w:vc = 'V'
    let w:vp = 'u'
    exe "silent! normal! V"
endfunction

xnoremap <silent> V :<C-u>call MyVisV2()<CR>
function! MyVisV2()
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
"xnoremap <silent> q <Esc>
xnoremap <silent> q :<C-u>call MyVisQ()<CR>
function! MyVisQ()
    let w:vc = 'u'
    let w:vp = 'u'
    exe "silent! normal! gv" . "\<Esc>"
endfunction

" insert/paste
" this removes the <C-v> literal input mode
"inoremap <silent> <C-v> <C-r>+
" use <C-q> instead
"inoremap <silent> <C-q> <C-r>+
" <C-q> does not seem to get through ...
" NOTE: does not work as a map as expected because it is interpreted as <Esc>p ...
"inoremap <silent> <M-p> <C-r>*

" change default to paste before (at) cursor
" instead of after cursor
" good for words but can be strange for lines
" skipping now - see unconditional-paste plugin
"vnoremap <silent> p P
"nnoremap <silent> p P
"vnoremap <silent> P p
"nnoremap <silent> P p

" Make p in Visual mode replace the selected text with the " register.
"vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" to disable scrolljump when pasting at last row ...
" not sure to use nmap or nnoremap ?
" not sure to use " or + or * register ?
"function! MyPasteNoJump() abort
"  nmap <silent> <buffer> p p
"  let &scrolljump=1
"  execute "silent! normal \"*p"
"  "execute "normal p"
"  let &scrolljump=-50
"  nmap <silent> <buffer> p :call MyPasteNoJump()<CR>
"endfunction
" to match UnconditionalPaste, dont modify p
"nmap <silent> <buffer> p :call MyPasteNoJump()<CR>
vmap <silent> <buffer> p <C-\><C-n>p

" set paste mode, paste, set nopaste mode
function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif
  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"
  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

" tmux:
"   set -ga terminal-overrides '*:Ss=\E[%p1%d q:Se=\E[ q'
" vim:
"   let &t_SI = "\e[5 q"
"   let &t_EI = "\e[2 q"

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

" ---------------

" or when you release the mouse button ...
":noremap <silent> <LeftRelease> "+y<LeftRelease>

" if mouse not supported try vim-extended or gvim -v

" DoubleClick for word (lbvhe)
nnoremap <silent> <2-LeftMouse> mvviw
vnoremap <silent> <2-LeftMouse> mviw
" TripleClick for next larger entity, not whole line (lBvhE)
nnoremap <silent> <3-LeftMouse> mvviW
vnoremap <silent> <3-LeftMouse> mviW
" QuadrupleClick too confusing
nnoremap <silent> <4-LeftMouse> <Nop>
vnoremap <silent> <4-LeftMouse> <Nop>

" disable searching tags file for symbol under cursor
" and select words under cursor instead (lBvhE)
" (was viW)
nnoremap <silent> <C-LeftMouse> <LeftMouse>:call GetPath()<CR>
vnoremap <silent> <C-LeftMouse> <LeftMouse><C-\><C-n>:call GetPath()<CR>
" whole line
"nnoremap <silent> <M-LeftMouse> <LeftMouse>V
"vnoremap <silent> <M-LeftMouse> <Esc><LeftMouse>V
" same as C- (was viW)
" TODO: perhaps M- should copy/yank and return to normal mode ?
nnoremap <silent> <M-LeftMouse> <LeftMouse>:call GetPath()<CR>
vnoremap <silent> <M-LeftMouse> <LeftMouse><C-\><C-n>:call GetPath()<CR>
" no-op
"nnoremap <silent> <M-LeftMouse> <Nop>
"vnoremap <silent> <M-LeftMouse> <Nop>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Word commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" highlight word under cursor (lbvhe)
nnoremap <silent> <Leader>ws mvviw
vnoremap <silent> <Leader>ws mviw

" highlight WORD under cursor (lBvhE) (does not use iskeyword)
nnoremap <silent> <Leader>wS mvviW
vnoremap <silent> <Leader>wS mviW

" grab file path (ie w / and w/o :)
nnoremap <silent> <Leader>wp mv:call GetPath()<CR>
vnoremap <silent> <Leader>wp mv<C-\><C-n>:call GetPath()<CR>

" yank/select word under cursor
nnoremap <silent> <Leader>wy mvviwy`]
vnoremap <silent> <Leader>wy mviwy`]
" to match vim yw ...
nnoremap <silent> <Leader>yw mvviwy`]
vnoremap <silent> <Leader>yw mviwy`]

" search for word under cursor (without copying selection)
nnoremap <silent> <Leader>wf :set hlsearch<CR>*
nnoremap <silent> <Leader>wF :set hlsearch<CR>#
" search for word under curor (copying selection)
nnoremap <silent> <Leader>wg viwy`]:set hlsearch<CR>*
nnoremap <silent> <Leader>wG viwy`]:set hlsearch<CR>#

" search for visual selection
" if register is regex with literal metachars then :let @/=escape(@", '.*\\$^')
"vnoremap <silent> <Leader>wf y <Bar> <Esc>:let @/=@"<CR> <Bar> 2n
vnoremap <silent> <Leader>wf y<C-\><C-n>:set hlsearch<CR>/<C-r>"<CR>
vnoremap <silent> <Leader>wF y<C-\><C-n>:set hlsearch<CR>?<C-r>"<CR>
" to match normal mode ...
vnoremap <silent> <Leader>wg y<C-\><C-n>:set hlsearch<CR>/<C-r>"<CR>
vnoremap <silent> <Leader>wG y<C-\><C-n>:set hlsearch<CR>?<C-r>"<CR>

" and the *, # ...
vnoremap <silent> * y<C-\><C-n>:set hlsearch<CR>/<C-r>"<CR>
vnoremap <silent> # y<C-\><C-n>:set hlsearch<CR>?<C-r>"<CR>

" dont replace clipboard selection with deleted char (x,X)
nnoremap x "_x
nnoremap X "_X
" same for delete
nnoremap <DEL> "_x
" but miss the xp swap chars, this works but adds an annoying (timeoutlen) delay to the single typed x
"noremap xp xp
"noremap Xp Xp
" add a new swap char mapping that doesn't start with x ...
noremap sc xp
noremap Sc Xp

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

" exchange whole word (from beg) with clipboard
nnoremap <silent> <Leader>wx :let @0=@*<CR>ciw<C-r>0<Esc>:let @"=@0<CR>:let @*=@0<CR>
" vis-mode of this doesnt really make sense
"vnoremap <silent> <Leader>wx <C-\><C-n>:let @0=@*<CR>ciw<C-r>0<Esc>:let @"=@0<CR>:let @*=@0<CR>

" replace at cursor pos with clipboard (not from beg of word like \we above)
nnoremap <silent> <Leader>wr :let @0=@*<CR>cw<C-r>0<Esc>:let @"=@0<CR>:let @*=@0<CR>
" vis-mode of this doesnt really make sense
"vnoremap <silent> <Leader>wr <C-\><C-n>:let @0=@*<CR>cw<C-r>0<Esc>:let @"=@0<CR>:let @*=@0<CR>

" zap (delete) whole word under cursor but w/o saving deleted word to clipboard
"nnoremap <silent> <Leader>wz lb"_dw
"nnoremap <silent> <Leader>wz lb"_dW
nnoremap <silent> <Leader>wz "_diw
vnoremap <silent> <Leader>wz <C-\><C-n>"_diw

" zap whole word w/ saving deleted word to clipboard
nnoremap <silent> <Leader>wZ diw:let @0=@"<CR>:let @*=@0<CR>
vnoremap <silent> <Leader>wZ <C-\><C-n>diw:let @0=@"<CR>:let @*=@0<CR>

" change word starting at cursor, like vi
nnoremap <silent> <Leader>we ce
vnoremap <silent> <Leader>we <C-\><C-n>ce

" delete word at cursor pos, like vi, but w/o saving deleted word to clipboard
nnoremap <silent> <Leader>wd "_dw
vnoremap <silent> <Leader>wd <C-\><C-n>"_dw

" delete word at cursor pos, but w/ saving deleted word to clipboard
nnoremap <silent> <Leader>wD dw:let @0=@"<CR>:let @*=@0<CR>
vnoremap <silent> <Leader>wD <C-\><C-n>dw:let @0=@"<CR>:let @*=@0<CR>

" new whole word (from beg) [cannot use wc]
nnoremap <silent> <Leader>wn ciw
vnoremap <silent> <Leader>wn <C-\><C-n>ciw

" like D (del from cursor pos to end of line) but w/o saving what was deleted to clipboard
nnoremap <silent> <Leader>D "_D
" like visual-mode D (del whole selection) but w/o saving what was deleted to clipboard (what was selected was already saved)
vnoremap <silent> <Leader>D "_x

" Terminator plugin (and tmux) ctrl-insert maps to <Esc>1 for paste (ie like C-v / C-S-v)
nnoremap <silent> <Esc>1 P
vnoremap <silent> <Esc>1 <Esc>P
inoremap <silent> <Esc>1 <C-r>*
" or <C-o>p ?
cnoremap <Esc>1 <C-r>*
tnoremap <Esc>1 <C-w>"*

" -------------------

" ctrl-del to delete from cursor to beg of word, to match backward-kill-word ...
"nnoremap <silent> <Esc>[3;5~ "_d<C-Left>
nnoremap <silent> <Esc>[3;5~ "_db
vnoremap <silent> <Esc>[3;5~ <Esc>"_dbv
inoremap <silent> <Esc>[3;5~ <Esc>"_dbi
" cannot use ctrl-w as that is for window nav

" shift-del to delete from curor to end of word, to match kill-word ...
nnoremap <silent> <Esc>[3;2~ "_dw
vnoremap <silent> <Esc>[3;2~ "_dwv
inoremap <silent> <Esc>[3;2~ "_dwi
" also skip alt-d

" ctrl-shift-del to delete whole word under cursor
"nnoremap <silent> <Esc>[3;6~ B"_dW
nnoremap <silent> <Esc>[3;6~ "_diw
vnoremap <silent> <Esc>[3;6~ <Esc>"_diwv
inoremap <silent> <Esc>[3;6~ <Esc>"_diwi

" alt-del to delete whole word under cursor
nnoremap <silent> <Esc>[3;3~ "_diw
vnoremap <silent> <Esc>[3;3~ <Esc>"_diwv
inoremap <silent> <Esc>[3;3~ <Esc>"_diwi
nnoremap <silent> <M-DEL> "_diw
vnoremap <silent> <M-DEL> <Esc>"_diwv
inoremap <silent> <M-DEL> <Esc>"_diwi

" TODO: if shift-BS is ever recognized ...
nnoremap <silent> <S-BS> X
vnoremap <silent> <S-BS> <Esc>Xv
inoremap <silent> <S-BS> <Esc>Xi

" -------------------

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
" NOTE: q may be mapped to something else later on ...

" for block select beyond shorter line lengths
set virtualedit=block

" ------ scroll ------

set nostartofline
set scrolloff=0

" ---------

" TODO: not sure what is best
" half window height (was winheight('%')/2, but -50 is 50%)
au BufEnter,WinEnter,WinNew,VimResized * let &scrolljump=-50
" disable when in insert mode ...
au InsertEnter * let &scrolljump=1
au InsertLeave * let &scrolljump=-50

" map H, L to horizontal scroll
" (cannot use <C-Left>, <C-Right> as those are for word movement)
" (NOTE: only applies when wrap is off)
"nnoremap <silent> H zhh
"nnoremap <silent> L lzl
"vnoremap <silent> H zhh
"vnoremap <silent> L lzl
nnoremap <silent> <M-Left>  zhh
nnoremap <silent> <M-Right> lzl
vnoremap <silent> <M-Left>  zhh
vnoremap <silent> <M-Right> lzl

" use w, not W - but should skip ()&,[]{}'"+-/:;
nnoremap <silent> <C-Right> w
" use b, not B - but should skip ()&,[]{}'"+-/:;
nnoremap <silent> <C-Left>  b

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

" ---------

nnoremap <silent> <expr> <C-D> (line('.') == line('w0')) ? 'M' : '<C-D>'
vnoremap <silent> <expr> <C-D> (line('.') == line('w0')) ? 'M' : '<C-D>'
inoremap <silent> <expr> <C-D> pumvisible() ? '<C-D>' : '<C-\><C-o>:call <SID>Saving_scrollV("<C-V><C-D>")<CR>'
nnoremap <silent> <expr> <C-U> (line('.') == line('w$')) ? 'M' : '<C-U>'
vnoremap <silent> <expr> <C-U> (line('.') == line('w$')) ? 'M' : '<C-U>'
inoremap <silent> <expr> <C-U> pumvisible() ? '<C-U>' : '<C-\><C-o>:call <SID>Saving_scrollV("<C-V><C-U>")<CR>'

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

" Cursor moves by screen lines
noremap <silent> <Up>   gk
inoremap <silent> <expr> <Up>   pumvisible() ? '<Up>'   : '<C-\><C-o>gk'

noremap <silent> <Down> gj
inoremap <silent> <expr> <Down> pumvisible() ? '<Down>' : '<C-\><C-o>gj'

noremap <silent> <Home> g<Home>
inoremap <silent> <expr> <Home> pumvisible() ? '<Home>' : '<C-\><C-o>g<Home>'

noremap <silent> <End>  g<End>
inoremap <silent> <expr> <End>  pumvisible() ? '<End>'  : '<C-\><C-o>g<End>'

" ---------

"call NoremapNormalCmd("<C-j>",    0, "1<C-D>")
nnoremap <silent>        <C-j>              :call <SID>Saving_scrollV("1<C-V><C-D>")<CR>
nnoremap <silent>        <C-Down>           :call <SID>Saving_scrollV("1<C-V><C-D>")<CR>
vnoremap <silent>        <C-j>    <C-\><C-n>:call <SID>Saving_scrollV("gv1<C-V><C-D>")<CR>
vnoremap <silent>        <C-Down> <C-\><C-n>:call <SID>Saving_scrollV("gv1<C-V><C-D>")<CR>
inoremap <silent> <expr> <C-j>              pumvisible() ? '<C-j>'    : '<C-\><C-o>:call <SID>Saving_scrollV("1<C-V><C-D>")<CR>'
inoremap <silent> <expr> <C-Down>           pumvisible() ? '<C-Down>' : '<C-\><C-o>:call <SID>Saving_scrollV("1<C-V><C-D>")<CR>'

"call NoremapNormalCmd("<C-k>",    0, "1<C-U>")
nnoremap <silent>        <C-k>              :call <SID>Saving_scrollV("1<C-V><C-U>")<CR>
nnoremap <silent>        <C-Up>             :call <SID>Saving_scrollV("1<C-V><C-U>")<CR>
vnoremap <silent>        <C-k>    <C-\><C-n>:call <SID>Saving_scrollV("gv1<C-V><C-U>")<CR>
vnoremap <silent>        <C-Up>   <C-\><C-n>:call <SID>Saving_scrollV("gv1<C-V><C-U>")<CR>
inoremap <silent> <expr> <C-k>              pumvisible() ? '<C-k>'  : '<C-\><C-o>:call <SID>Saving_scrollV("1<C-V><C-U>")<CR>'
inoremap <silent> <expr> <C-Up>             pumvisible() ? '<C-Up>' : '<C-\><C-o>:call <SID>Saving_scrollV("1<C-V><C-U>")<CR>'

nnoremap <silent>        <ScrollWheelDown>           :call <SID>Saving_scrollV("5<C-V><C-D>")<CR>
vnoremap <silent>        <ScrollWheelDown> <C-\><C-n>:call <SID>Saving_scrollV("gv5<C-V><C-D>")<CR>
inoremap <silent> <expr> <ScrollWheelDown>           pumvisible() ? '<ScrollWhellDown>' : '<C-\><C-o>:call <SID>Saving_scrollV("5<C-V><C-D>")<CR>'

nnoremap <silent>        <ScrollWheelUp>             :call <SID>Saving_scrollV("5<C-V><C-U>")<CR>
vnoremap <silent>        <ScrollWheelUp>   <C-\><C-n>:call <SID>Saving_scrollV("gv5<C-V><C-U>")<CR>
inoremap <silent> <expr> <ScrollWheelUp>             pumvisible() ? '<ScrollWheelUp>' : '<C-\><C-o>:call <SID>Saving_scrollV("5<C-V><C-U>")<CR>'

function! MapScrollKeys()
  let g:half = winheight(0) / 2
  if (g:half < 1)
    g:half = 1
  endif
  let g:full = g:half + g:half

  "nnoremap <silent> <C-f>                  :call <SID>Saving_scrollVDn1("<C-V><C-D>")<CR>
  "vnoremap <silent> <C-f>        <C-\><C-n>:call <SID>Saving_scrollVDn1("gv<C-V><C-D>")<CR>
  noremap  <silent> <expr> <C-f> (line('.') == line('w0')) ? 'M' : '<C-D>'
  inoremap <silent> <expr> <C-f> pumvisible() ? '<C-f>' : '<C-\><C-o>:call <SID>Saving_scrollVDn1("<C-V><C-D>")<CR>'

  "nnoremap <silent> <C-b>                  :call <SID>Saving_scrollVUp1("<C-V><C-U>")<CR>
  "vnoremap <silent> <C-b>        <C-\><C-n>:call <SID>Saving_scrollVUp1("gv<C-V><C-U>")<CR>
  noremap  <silent> <expr> <C-b> (line('.') == line('w$')) ? 'M' : '<C-U>'
  inoremap <silent> <expr> <C-b> pumvisible() ? '<C-b>' : '<C-\><C-o>:call <SID>Saving_scrollVUp1("<C-V><C-U>")<CR>'

  noremap  <silent> <expr> <C-PageDown> (line('.') == line('w0')) ? 'M' : '<C-D>'
  inoremap <silent> <expr> <C-PageDown> pumvisible() ? '<C-PageDown>' : '<C-\><C-o>:call <SID>Saving_scrollVDn1("<C-V><C-D>")<CR>'
  noremap  <silent> <expr> <C-PageUp>   (line('.') == line('w$')) ? 'M' : '<C-U>'
  inoremap <silent> <expr> <C-PageUp>   pumvisible() ? '<C-PageUp>'   : '<C-\><C-o>:call <SID>Saving_scrollVUp1("<C-V><C-U>")<CR>'

  noremap  <silent> <expr> <PageDown>   (line('.') == line('w0')) ? 'M' : '<C-D><C-D>'
  inoremap <silent> <expr> <PageDown>   pumvisible() ? '<PageDown>' : '<C-\><C-o>:call <SID>Saving_scrollVDn2("<C-V><C-D>")<CR>'
  noremap  <silent> <expr> <PageUp>     (line('.') == line('w$')) ? 'M' : '<C-U><C-U>'
  inoremap <silent> <expr> <PageUp>     pumvisible() ? '<PageUp>'   : '<C-\><C-o>:call <SID>Saving_scrollVUp2("<C-V><C-U>")<CR>'
endfunction

call MapScrollKeys()

autocmd VimResized * call MapScrollKeys()

" ---------

" if in Insert mode with no input/movement for 10 sec then revert to Normal mode ...
set updatetime=10000
function! IdleToNormalMode()
    let mymode = mode()
    if mymode ==# 'i' || mymode ==# 'R'
        call feedkeys("\<Esc>", "m")
        echo "returned from insert mode ..."
    endif
endfunction
autocmd CursorHoldI * call IdleToNormalMode()

" ---------

" tmux uses these to navigate panes
noremap <S-Down>  <Nop>
noremap <S-Up>    <Nop>
noremap <S-Left>  <Nop>
noremap <S-Right> <Nop>

" X uses these to scroll
noremap <S-PageDown> <Nop>
noremap <S-PageUp>   <Nop>

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

"nnoremap <silent> <C-J>           :call <SID>scrollUP(1,0)<CR>
"nnoremap <silent> <C-Down>        :call <SID>scrollUP(1,0)<CR>
"vnoremap <silent> <C-J>      <Esc>:call <SID>scrollUP(1,1)<CR>
"vnoremap <silent> <C-Down>   <Esc>:call <SID>scrollUP(1,1)<CR>

"nnoremap <silent> <C-K>           :call <SID>scrollDN(1,0)<CR>
"nnoremap <silent> <C-Up>          :call <SID>scrollDN(1,0)<CR>
"vnoremap <silent> <C-K>      <Esc>:call <SID>scrollDN(1,1)<CR>
"vnoremap <silent> <C-Up>     <Esc>:call <SID>scrollDN(1,1)<CR>

"nnoremap <silent> <C-F>           :call <SID>scrollUP(-1,0)<CR>
"vnoremap <silent> <C-F>      <Esc>:call <SID>scrollUP(-1,1)<CR>

"nnoremap <silent> <C-B>           :call <SID>scrollDN(-1,0)<CR>
"vnoremap <silent> <C-B>      <Esc>:call <SID>scrollDN(-1,1)<CR>

"nnoremap <silent> <PageDown>      :call <SID>scrollUP(-2,0)<CR>
"vnoremap <silent> <PageDown> <Esc>:call <SID>scrollUP(-2,1)<CR>
"inoremap <silent> <PageDown> <C-\><C-o><PageDown>

" C-PageDown

"nnoremap <silent> <PageUp>        :call <SID>scrollDN(-2,0)<CR>
"vnoremap <silent> <PageUp>   <Esc>:call <SID>scrollDN(-2,1)<CR>
"inoremap <silent> <PageUp>   <C-\><C-o><PageUp>

" C-PageUp

" ---------

" move and scroll
"nnoremap <silent> <C-J>           :call <SID>Saving_scrollV("1<C-V><C-D>")<CR>
"nnoremap <silent> <C-Down>        :call <SID>Saving_scrollV("1<C-V><C-D>")<CR>
"vnoremap <silent> <C-J>      <Esc>:call <SID>Saving_scrollV("gv1<C-V><C-D>")<CR>
"vnoremap <silent> <C-Down>   <Esc>:call <SID>Saving_scrollV("gv1<C-V><C-D>")<CR>

"nnoremap <silent> <C-K>           :call <SID>Saving_scrollV("1<C-V><C-U>")<CR>
"nnoremap <silent> <C-Up>          :call <SID>Saving_scrollV("1<C-V><C-U>")<CR>
"vnoremap <silent> <C-K>      <Esc>:call <SID>Saving_scrollV("gv1<C-V><C-U>")<CR>
"vnoremap <silent> <C-Up>     <Esc>:call <SID>Saving_scrollV("gv1<C-V><C-U>")<CR>

"nnoremap <silent> <C-F>           :call <SID>Saving_scrollV("<C-V><C-D>")<CR>
"vnoremap <silent> <C-F>      <Esc>:call <SID>Saving_scrollV("gv<C-V><C-D>")<CR>

"nnoremap <silent> <C-B>           :call <SID>Saving_scrollV("<C-V><C-U>")<CR>
"vnoremap <silent> <C-B>      <Esc>:call <SID>Saving_scrollV("gv<C-V><C-U>")<CR>

"nnoremap <silent> <PageDown>      :call <SID>Saving_scrollV("<C-V><C-D>")<CR>
"vnoremap <silent> <PageDown> <Esc>:call <SID>Saving_scrollV("gv<C-V><C-D>")<CR>

" C-PageDown

"nnoremap <silent> <PageUp>        :call <SID>Saving_scrollV("<C-V><C-U>")<CR>
"vnoremap <silent> <PageUp>   <Esc>:call <SID>Saving_scrollV("gv<C-V><C-U>")<CR>

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
"nnoremap <silent> <ScrollWheelUp>        :call <SID>scrollDN(5,0)<CR>
"nnoremap <silent> <ScrollWheelDown>      :call <SID>scrollUP(5,0)<CR>
"vnoremap <silent> <ScrollWheelUp>        :call <SID>scrollDN(5,1)<CR>
"vnoremap <silent> <ScrollWheelDown>      :call <SID>scrollUP(5,1)<CR>
"nnoremap <silent> <ScrollWheelUp>        :call <SID>Saving_scrollV("5<C-V><C-U>")<CR>
"nnoremap <silent> <ScrollWheelDown>      :call <SID>Saving_scrollV("5<C-V><C-D>")<CR>
"vnoremap <silent> <ScrollWheelUp>   <Esc>:call <SID>Saving_scrollV("gv5<C-V><C-U>")<CR>
"vnoremap <silent> <ScrollWheelDown> <Esc>:call <SID>Saving_scrollV("gv5<C-V><C-D>")<CR>

endif " disable old scroll functions

" ------ scroll ------

" move lines or selected text up/down

" wanted C-S-j,k but that is not different than C-j,k
" <Esc>j,k is Alt-j,k
" <Esc>[1;3A is <M-Up> (Alt-Up)
" NOTE: some of these mappings start with <Esc> and keys pressed
"       quickly enough could be incorrectly interpreted as a mapping
" TODO: look into Terminator plugin for these sequences ...
nnoremap <M-Down> :m .+1<CR>==
nnoremap <M-Up>   :m .-2<CR>==
vnoremap <M-Down> :m '>+1<CR>gv=gv
vnoremap <M-Up>   :m '<-2<CR>gv=gv
inoremap <M-Down> <Esc>:m .+1<CR>==gi
inoremap <M-Up>   <Esc>:m .-2<CR>==gi

"nnoremap <M-j> :m .+1<CR>==
"nnoremap <M-k> :m .-2<CR>==
"inoremap <M-j> <Esc>:m .+1<CR>==gi
"inoremap <M-k> <Esc>:m .-2<CR>==gi
"vnoremap <M-j> :m '>+1<CR>gv=gv
"vnoremap <M-k> :m '<-2<CR>gv=gv

"nnoremap ,<Up>   :<C-u>silent! move-2<CR>==
"nnoremap ,<Down> :<C-u>silent! move+<CR>==
"xnoremap ,<Up>   :<C-u>silent! '<,'>move-2<CR>gv=gv
"xnoremap ,<Down> :<C-u>silent! '<,'>move'>+<CR>gv=gv

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
"inoremap <C-S-Up> <Esc>`^:silent! call MoveLineAndInsert(-1)<CR>
"inoremap <C-S-Down> <Esc>`^:silent! call MoveLineAndInsert(+1)<CR>

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
nmap <C-]> :call rtags#JumpTo(g:SAME_WINDOW)<CR>
" C-o to go back
" C-t to go back (not implemented)
" nmap <C-t> :call rtags#JumpBack()<CR>:echo<CR>
" \cc to close quickfix, listview, preview
nnoremap <silent> <Leader>cc           :ccl\|lcl\|pcl\|:echo<CR>
vnoremap <silent> <Leader>cc <C-\><C-n>:ccl\|lcl\|pcl\|:echo<CR>
"noremap <silent> <Leader>cc :windo lcl\|ccl\|pcl<CR>:echo<CR>
" qq to also close location list
autocmd BufReadPost quickfix nnoremap <silent> <buffer> qq :ccl\|lcl\|pcl\|:echo<CR>
" TODO: should qq from regular window also close these ?
"
" auto-reindex on file save ...
" but shouldn't rdm automatically pick up changes ?
"autocmd BufWritePost,FileWritePost,FileAppendPost *.{c,h,C,cc,cpp,hpp,ipp,tpp} call rtags#ReindexFile()
" this is done in plugin now ...
let g:rtagsAutoReindexOnWrite=1
"
" also had to make changes to python run() command
function RtagsToggleColonKeyword() abort
  if (g:rtagsUseColonKeyword == 0)
    let g:rtagsUseColonKeyword = 1
    let l:rtagskeywordmsg = '[vim-rtags] use symbol colon is enabled'
  else
    let g:rtagsUseColonKeyword = 0
    let l:rtagskeywordmsg = '[vim-rtags] use symbol colon is disabled'
  endif
  echohl DiffChange | echo l:rtagskeywordmsg | echohl None
  sleep 500m
  redraw!
endfunction
nnoremap <silent> <Leader>rx           :call RtagsToggleColonKeyword()<CR>
vnoremap <silent> <Leader>rx <C-\><C-n>:call RtagsToggleColonKeyword()<CR>
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
nmap <Leader>pe $<Plug>UnconditionalPasteCharAfter
" at beg of line
nmap <Leader>pa 0<Plug>UnconditionalPasteCharBefore

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
  set mouse-=a
  call lightline#disable()
  set noshowmode
  set noshowmatch
" set laststatus=1
  set statusline=%f\%=[\ %L\ ][\ %3.3p%%\ ]
  hi StatusLine ctermbg=237 ctermfg=2
endfunction
" less as a pager --

"================================================================

function MySearch(meth) abort
  if (a:meth == 0)
    let promptstr = 'buf:/'
    let cmdstr = 'LAckWindow!'
  elseif (a:meth == 1)
    let promptstr = 'gbl:/'
    let cmdstr = 'LAck!'
  else
    redraw!
    return
  endif
  call inputsave()
  let string = input(promptstr)
  call inputrestore()
  if (len(string) == 0)
    redraw!
    return
  endif
  let saved_shellpipe = &shellpipe
  let &shellpipe = '>'
  try
    execute cmdstr shellescape(string, 1)
  finally
    let &shellpipe = saved_shellpipe
  endtry
endfunction

" use :let @/="" to clear out search pattern
nnoremap <silent> <Leader>sx :let @/=""<CR>:echo ""<CR>
" search normally
nnoremap <Leader>sn :let @/=""<CR>:set hlsearch<CR>/
vnoremap <Leader>sn y<Esc>:let @/=""<CR>:set hlsearch<CR>/<C-r>"
" search buffer with results in loc list
nnoremap <silent> <Leader>sb :call MySearch(0)<CR>
" search globally with results in loc list
nnoremap <silent> <Leader>sg :call MySearch(1)<CR>

let g:ackhighlight = 1

" open :grep output in qf ...
autocmd QuickFixCmdPost *grep* cwindow
set grepprg=ag\ --vimgrep\ --hidden

"================================================================

" to grab a file path (ie /path/to/file.ext:345) ...
function GetPath() abort
  let l:oldiskeyword = &iskeyword
  setlocal iskeyword-=:
  setlocal iskeyword+=/,.,-
  execute 'normal! mvviw'
  let &iskeyword = l:oldiskeyword
endfunction

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
  elseif &filetype !=# 'GV'
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
hi cursorline cterm=None ctermbg=239

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
function WinToTab()
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
nnoremap <silent> <unique> <Leader>tw :call WinToTab()<CR>

" -----------------------------

" disable : in visual mode (can still use <C-w>:)
vnoremap <silent> : <Nop>

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
nnoremap <silent> <C-x><C-w>      :call <SID>SkipTerminalsQuitCmd(":wqa")<CR>

" close all windows and confirm then quit
" no imap for this
" <C-x> used in visual mode already
"vnoremap <silent> <C-x>c     <Esc>:call <SID>SkipTerminalsQuitCmd(":conf qa")<CR>
"nnoremap <silent> <C-x>c          :call <SID>SkipTerminalsQuitCmd(":conf qa")<CR>

" need to remap <C-c> for this to work ...
nnoremap <C-c> <C-c>
" (<C-c> previously remapped in visual mode above)
" no imap for this
" <C-x> used in visual mode already
""vnoremap <silent> <C-x><C-c> <Esc>:call <SID>SkipTerminalsQuitCmd(":conf qa")<CR>
nnoremap <silent> <C-x><C-c>            :call <SID>SkipTerminalsQuitCmd(":conf qa")<CR>

" no imap for this
vnoremap <silent> <Leader>xc  <C-\><C-n>:<C-u>call <SID>SkipTerminalsQuitCmd(":conf qa")<CR>
nnoremap <silent> <Leader>xc            :call <SID>SkipTerminalsQuitCmd(":conf qa")<CR>

" no imap for this
vnoremap <silent> <Leader>ax  <C-\><C-n>:<C-u>call <SID>SkipTerminalsQuitCmd(":conf qa")<CR>
nnoremap <silent> <Leader>ax            :call <SID>SkipTerminalsQuitCmd(":conf qa")<CR>

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
    if(bufexists(currbufnr))
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

" terminal in cur tab
nnoremap <silent> <Leader>zs           :terminal ++close ++norestore ++kill=term ++curwin<CR>
vnoremap <silent> <Leader>zs <C-\><C-n>:terminal ++close ++norestore ++kill=term ++curwin<CR>
" terminal in new tab
noremap <silent> zt <Nop>
nnoremap <silent> <Leader>zt           :$tabnew <Esc>:terminal ++close ++norestore ++kill=term ++curwin<CR>
vnoremap <silent> <Leader>zt <C-\><C-n>:$tabnew <Esc>:terminal ++close ++norestore ++kill=term ++curwin<CR>
" terminal in new tab when already in a terminal
tnoremap <silent> <C-x>t <C-w>:$tabnew <Esc>:terminal ++close ++norestore ++kill=term ++curwin<CR>
" window in new tab when already in a terminal
tnoremap <silent> <C-x>v <C-w>:$tabnew<CR>
" <C-w><N> or <C-\><C-n> to get into normal mode
" a or i get back into terminal mode
" or <C-\><C-n> to toggle
nnoremap <silent> <expr> <C-\><C-n> (&buftype == 'terminal') ? 'i' : '<C-\><C-n>'
" or <Return>, like tmux
nnoremap <silent> <expr> <Return> (&buftype == 'terminal') ? 'i' : '<Return>'
" to enter normal mode, like tmux
" there is no alternate screen so this removes these from less/more/etc.
"tnoremap <silent> <C-Up>   <C-\><C-n>
"tnoremap <silent> <PageUp> <C-\><C-n>
" ctrl-x-] like tmux enter copy-mode-vi (ctrl-s-])
tnoremap <silent> <C-x>]   <C-\><C-n>
nnoremap <silent> <expr> <C-x>] (&buftype == 'terminal') ? 'i' : '<C-x>]'

au TerminalOpen * set signcolumn=no

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
"noremap <Leader>uu :earlier 999999<CR>:u<CR>
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
nnoremap <silent> <Leader>hl :set hlsearch! hlsearch?<bar>:redraw!<CR>
hi Search ctermbg=58

" q to turn off hlsearch ?
nnoremap <silent> q :set nohlsearch<bar>:redraw!<CR>

" does this make sense ? (q to cancel select/visual)
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
" tab close (same as window close)
nnoremap <silent> <Leader>tc           :conf q<CR>
vnoremap <silent> <Leader>tc <C-\><C-n>:conf q<CR>
" tab keep current and close all others
nnoremap <silent> <Leader>tk           :tabonly<CR>
vnoremap <silent> <Leader>tk <C-\><C-n>:tabonly<CR>

" window close (same as tab close)
nnoremap <silent> <Leader>wc           :conf q<CR>
vnoremap <silent> <Leader>wc <C-\><C-n>:conf q<CR>
nnoremap <silent> <Leader>wq           :conf q<CR>
vnoremap <silent> <Leader>wq <C-\><C-n>:conf q<CR>
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

" NOTE: some of these mappings start with <Esc> and keys pressed
"       quickly enough could be incorrectly interpreted as a mapping
" TODO: look into Terminator plugin for these sequences ...

"execute "set <M-.>=\e."
"execute "set <M-'>=\e'"

"execute "set <M-,>=\e,"
"execute "set <M-;>=\e;"

" next tab
"nnoremap <silent> <M-Right>      :tabnext<CR>
"tnoremap <silent> <M-Right> <C-w>:tabnext<CR>
"vnoremap <silent> <M-Right> <Esc>:tabnext<CR>
"inoremap <silent> <M-Right> <Esc>:tabnext<CR>
nnoremap <silent> <C-S-Right>      :tabnext<CR>
tnoremap <silent> <C-S-Right> <C-w>:tabnext<CR>
vnoremap <silent> <C-S-Right> <Esc>:tabnext<CR>
inoremap <silent> <C-S-Right> <Esc>:tabnext<CR>
" Alt-. (>)
"tnoremap <silent> <Esc>. <C-w>:tabnext<CR>
"nnoremap <silent> <M-.>       :tabnext<CR>
"vnoremap <silent> <M-.>  <Esc>:tabnext<CR>
"inoremap <silent> <M-.>  <Esc>:tabnext<CR>

" prev tab
"nnoremap <silent> <M-Left>      :tabprevious<CR>
"tnoremap <silent> <M-Left> <C-w>:tabprevious<CR>
"vnoremap <silent> <M-Left> <Esc>:tabprevious<CR>
"inoremap <silent> <M-Left> <Esc>:tabprevious<CR>
nnoremap <silent> <C-S-Left>      :tabprevious<CR>
tnoremap <silent> <C-S-Left> <C-w>:tabprevious<CR>
vnoremap <silent> <C-S-Left> <Esc>:tabprevious<CR>
inoremap <silent> <C-S-Left> <Esc>:tabprevious<CR>
" Alt-, (<)
"tnoremap <silent> <Esc>, <C-w>:tabprevious<CR>
"nnoremap <silent> <M-,>       :tabprevious<CR>
"vnoremap <silent> <M-,>  <Esc>:tabprevious<CR>
"inoremap <silent> <M-,>  <Esc>:tabprevious<CR>

" moving between windows, somtimes hard to let go of ctrl before arrow ...
" these could map to same cmds: <C-w><C-Left> -> <C-w><Left>
" or to navigate tabs ...
nnoremap <silent> <C-w><C-Left>  :tabprevious<CR>
nnoremap <silent> <C-w><C-Right> :tabnext<CR>
nnoremap <silent> <C-w><C-Up>    <C-w><Up>
nnoremap <silent> <C-w><C-Down>  <C-w><Down>

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
" split into new tab - but same file buffer
nnoremap <silent> <Leader>sT :tab split<CR>

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
  " not needed
  "map  <Esc>[B <Down>
  "map  [1;5A   <C-Up>
  "map  [1;5B   <C-Down>
  "map  [1;2D   <S-Left>
  "map  [1;2C   <S-Right>
  "cmap [1;2D   <S-Left>
  "cmap [1;2C   <S-Right>
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

