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
"
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" ====================================================

" skip loading this plugin for now ...
let loaded_bufkill = 1

" disable the many cscope <C-@>* mappings ...
let Cscope_Keymap = 0

" to [silently] remap unless a mapping already exits ...
"silent! nnoremap <unique> lhs rhs
"if empty(maparg('lhs', 'old-rhs')) | nnoremap lhs new-rhs | endif

let g:in_gv2 = 0

" ====================================================
" --- vundle -----------------------------------------
" ====================================================
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
"Plugin 'justmao945/vim-clang'
Plugin 'mckellygit/vim-clang'
"
" rooter for :Files and FileBeagle (<Leader>fb)
"Plugin 'airblade/vim-rooter'
" slightly different method
Plugin 'mattn/vim-findroot'
"
" rtags for code navigation (**modified++)
"Plugin 'lyuts/vim-rtags'
Plugin 'mckellygit/vim-rtags'
"
" echodoc function completion
"Plugin 'Shougo/echodoc.vim'
"
" qf/loclist window in all windows/tabs
Plugin 'yssl/QFEnter'
" only diff is if new tab from qf then orig tab focus
" restores to before entering qf
"Plugin 'mckellygit/QFEnter'
"
" for managing and moving windows/tabs
"Plugin 'yssl/TWcmd.vim'
" Alias q TWcmd wcm q
" nmap <Leader>qq :TWcmd wcm q<CR>
"
" qf grep / filter
Plugin 'sk1418/QFGrep'
"Plugin 'tommcdo/vim-lister'
" NOTE: built-in C/LFilter can also do this
"
" qf edit
"Plugin 'itchyny/vim-qfedit'
"
" qf preview popup
" NOTE: not compatible with nvim
Plugin 'mckellygit/vim-qf-preview'
"Plugin 'bfrg/vim-qf-preview'
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
Plugin 'mckellygit/vim-fswitch'
"
" FileBeagle for dir/file browsing (**modified++)
"Plugin 'jeetsukumaran/vim-filebeagle'
Plugin 'mckellygit/vim-filebeagle'
"
"Plugin 'tpope/vim-vinegar'
"Plugin 'scrooloose/nerdtree'
"Plugin 'jistr/vim-nerdtree-tabs'
"
" fugitive for more git utils
Plugin 'tpope/vim-fugitive'
" for :Gbrowse to open GitHub urls
"Plugin 'tpope/vim-rhubarb'
" vimagit ...
"Plugin 'jreybert/vimagit.git'
Plugin 'mckellygit/vimagit.git'
" twiggy ...
Plugin 'sodapopcan/vim-twiggy'
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
"Plugin 'junegunn/gv.vim'
Plugin 'mckellygit/gv.vim'
"
" vim-flog - newer git viewer
"Plugin 'rbong/vim-flog'
"
" fzf for fuzzy listing/searching
"Plugin 'junegunn/fzf' " (not needed because its in ~/.fzf already)
Plugin 'junegunn/fzf.vim'
" Plugin 'mattn/vim-fz'
" Plugin 'liuchengxu/vim-clap'
" Plugin 'Yggdroot/LeaderF'
"
" ack (with ag (silver-searcher))
"Plugin 'mileszs/ack.vim'
" search/replace across multiple files
" (also can use :Ack + :cdo ...)
"Plugin 'dkprice/vim-easygrep'
" together with regex patterns ...
" Plugin 'othree/eregex.vim'
" Quickfix multi-file search/replace (**modified++)
"Plugin 'wincent/ferret'
Plugin 'mckellygit/ferret'
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
" NOTE: add disabled items BEFORE loading plugin
" needed tmux to get around error in polygot/tmux.vim
" and that is deprecated anyway (defaults in vim 8.0+)
" .cap files are for me usually from tcpdump and not ruby
" and c/c++ is covered in vim-cpp-modern ...
let g:polyglot_disabled = ['tmux', 'c/c++', 'ruby']
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
" calendar
Plugin 'itchyny/calendar.vim'
"
" start at prev cursor position, except for git etc.
" (make sure to disable code below that also does this)
" lastplace to start at prev cursor pos (**modified++)
" see note below about doing this after uncompress
"Plugin 'farmergreg/vim-lastplace'
Plugin 'mckellygit/vim-lastplace'
"
" any-jump (with rg/ag)
"Plugin 'pechorin/any-jump.vim'
Plugin 'mckellygit/any-jump.vim'
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
"Plugin 'skywind3000/asynctasks.vim'
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
" buffergator
"Plugin 'jeetsukumaran/vim-buffergator'
" lightline buffer ...
"Plugin 'mengelbrecht/lightline-bufferline'
"
" start screen
Plugin 'mhinz/vim-startify'
"
" search + highlight
Plugin 'PeterRincker/vim-searchlight'
" also look into: qxxxb/vim-searchhi
" also look into: wincent/loupe
" TODO: also look into:
"Plugin 'inkarkat/vim-SearchHighlighting'
"
" fade inactive buffers
" NOTE: recently works ok but many flashing redraws on pum up/down ...
"       may need au! CompleteChanged code to help ...
Plugin 'TaDaa/vimade'
" alternative ...
"Plugin 'blueyed/vim-diminactive'
"
" tmux focus
" plugin says its obsolete with neovim and vim 8.2.2345+ but its still useful
if has("nvim")
    " not needed in nvim ...
    let g:loaded_tmux_focus_events = 1
elseif exists('$VIM_TERMINAL')
    let g:loaded_tmux_focus_events = 1
endif
Plugin 'mckellygit/vim-tmux-focus-events'
"
" ansi esc sequences
"Plugin 'powerman/vim-plugin-AnsiEsc'
Plugin 'chrisbra/Colorizer'
"
" man pages
if has("nvim")
    " to not load nvim man plugin which overwrites Man command
    " from vim-man plugin (Vman vim-man command is untouched ...)
    let g:loaded_man = 1
endif
Plugin 'vim-utils/vim-man'
"
" system copy clipboard (**modified++)
"Plugin 'christoomey/vim-system-copy'
"
" choosewin
"Plugin 't9md/vim-choosewin'
Plugin 'mckellygit/vim-choosewin'
"
" floaterm
Plugin 'voldikss/vim-floaterm'
" :Floaterms fzf list of floaterms
Plugin 'voldikss/fzf-floaterm'
" :Leaderf floaterm
"Plugin 'voldikss/leaderf-floaterm'
" and asynctasks support ...
"
" vifm plugin
"Plugin 'vifm/vifm.vim'
"
" lf plugin
" neovim dependency -
"Plugin 'rbgrouleff/bclose.vim'
"Plugin 'ptzz/lf.vim'
"
" nvim completeopt does not have popup ...
" this plugin provides the same behavior, but it does not stop preview split
" but we may be able to add an autocmd to pclose preview ...
if !has("nvim")
  let g:float_preview#loaded = 1
endif
Plugin 'ncm2/float-preview.nvim'
"
" CMake utils
"Plugin 'vhdirk/vim-cmake'
"
" diffchar
"Plugin 'rickhowe/diffchar.vim'
"
" nvim plugin for supporting block paste (C-v) with unnamed[plus]
if !has("nvimSKIP_MINIYANK")
  let g:loaded_miniyank = 1
endif
"Plugin 'bfredl/nvim-miniyank'
" ----------
" NOTE: not needed anymore since nvim v0.5.0+
"Plugin 'mckellygit/nvim-miniyank'
" ----------
" there is also -
"Plugin 'Rasukarusan/nvim-block-paste'
"
" vim-better-whitespace
"Plugin 'ntpeters/vim-better-whitespace'
"
" fix nvim CursorHold issues ...
" (adds a timer after each CursorMoved event)
"if !has("nvim")
"  let g:loaded_fix_cursorhold_nvim = 1
"endif
"Plugin 'antoinemadec/FixCursorHold.nvim'
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
"
" ====================================================
" --- vundle -----------------------------------------
" ====================================================

" use :Silentrun <cmd> to run <cmd> without prompting:
" Press ENTER or type command to continue
command! -nargs=1 Silentrun execute ':silent !' . <q-args> | execute ':redraw!'

" ----------------

function! s:LogIt(message)
  silent execute '!echo "'
        \ . strftime('%T', localtime()) . ' - ' . a:message . '"'
        \ '>> /tmp/vimdbg.log'
endfunction
" example:
"   let msg = 'buf ' . i
"   call <SID>LogIt(msg)

" ----------------

" work-around syntax highlighting, if putting <filetype>.vim
" into .vim/syntax and .vimn/plugin dirs does not work ...
"function! s:checkitty()
"    let f = expand('%:t')
"    if f ==# 'kitty.conf'
"        set syntax=kitty
"        set ft=kitty
"    endif
"endfunction
"autocmd BufWinEnter *.conf call s:checkitty()

" ----------------

" to have system('git') and !git be ~/bin/git ...
" not needed if bash/zsh non-interactive alias is configured (BASH_ENV / .zshenv)
"let opath = $PATH
"let hpath = $HOME
"let npath = hpath . '/bin:' . opath
"let $PATH = npath

" ====================================================
" --- plugin configurations --------------------------
" ====================================================

" ack ------------
"let g:ackprg = 'ack -k --nogroup --nocolor --column --smart-case --follow'
" use ag (silver-searcher) instead of ack, if possible
if executable('ag')
  " NOTE: ag can miss some matches without -U --hidden ...
  let g:ackprg = '\ag --vimgrep -U --hidden -- '
endif
" example: (cdo/cfdo ldo/lfdo [!])
" :Ack foo
" :cdo s/foo/bar/g | update
" There is also Plugin 'dkprice/vim-easygrep'
" together with Plugin 'othree/eregex.vim'
let g:ackhighlight = 1
let g:ack_use_dispatch = 1
"set grepprg=ack\ -k
set grepprg=ag\ --vimgrep\ -U\ --hidden\ --\ 
set grepformat=%f:%l:%c:%m
" open :grep output in qf ...
autocmd QuickFixCmdPost ++nested *grep* cwindow
" ack ------------

" ferret ---------
let g:FerretMap=0
let g:FerretQFCommands=0
let g:FerretQFOptions=0
let g:FerretQFMap=1
let g:FerretHlsearch=0
let g:FerretExecutable='ag,ack'
let g:FerretExecutableArguments = {
  \   'ag': '--vimgrep -U --hidden -- ',
  \   'ack': '-s -H --nopager --nocolor --nogroup --column --smart-case --follow '
  \ }
"nmap <leader>Fa <Plug>(FerretAck)
"nmap <leader>Fl <Plug>(FerretLack)
"nmap <leader>Fs <Plug>(FerretAckWord)
"nmap <leader>Fr <Plug>(FerretAcks)
" :Ack <string> - or use other cmds <Leader>s[b|d|g] to fill qf/ll ...
" manipulate qf/ll to remove any entries not wanting to be used for substitution ...
" :Acks /<old>/<new>/
" ferret ---------

" airline ---------
"let g:airline#extensions#tabline#enabled = 1
"let g:airline_theme='luna'
"let g:airline_solarized_bg='dark'
" airline ---------

" lightline ----------
" colorscheme and some tab mods
let g:lightline = {
    \ 'component': {
    \   'lineinfo': '%7l:%-4v%<',
    \ },
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
  " dont wrapscan if in visual mode ...
  let m = mode()
  if m ==# "v" || m ==# "V" || m == "\<C-v>"
    set nowrapscan
    "let &sj=0
    "let &so=10
  else
    set wrapscan
    if m ==# 'n'
      "let &sj=-50
      "let &so=0
    endif
  endif
  if (mode(1) ==# 'n')
    let w:vc = 'u'
    let w:vp = 'u'
  endif
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

let g:asyncrun_prev = 'none'
let g:asyncrun_last = localtime()

function! MyLightlineAsyncRunStatus()
    if &filetype ==# 'qf'
        return ''
    elseif &buftype ==# 'terminal'
        return ''
    elseif !&buflisted
        return ''
    else
        if g:asyncrun_status == 'running'
            let g:asyncrun_prev = 'none'
            return 'ar:run'
        elseif g:asyncrun_status == 'success'
            if g:asyncrun_prev != 'success'
                let g:asyncrun_prev = 'success'
                let g:asyncrun_last = localtime()
                return 'ar:ok '
            else
                let difftime = localtime() - g:asyncrun_last
                if difftime >= 15
                    return 'ar:n/a'
                else
                    return 'ar:ok '
                endif
            endif
        elseif g:asyncrun_status == 'failure'
            if g:asyncrun_prev != 'failure'
                let g:asyncrun_prev = 'failure'
                let g:asyncrun_last = localtime()
                return 'ar:err'
            else
                let difftime = localtime() - g:asyncrun_last
                if difftime >= 15
                    return 'ar:n/a'
                else
                    return 'ar:err'
                endif
            endif
        else
            return 'ar:n/a'
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

" calendar -----------
map tt <Plug>(calendar_today)
" calendar -----------

" rooter ----------
" echo cwd: status
"let g:rooter_manual_only = 1
" Dont do this, use autocmd and paths to fix FileBeagle and fzf/Files
let g:rooter_silent_chdir = 0
let g:rooter_cd_cmd="cd"
" rooter ----------

" findroot ------------
let g:findroot_not_for_subdir = 1
" findroot ------------

" fzf -----------------
if 1 " use vim popup ...
    " NOTE: cannot use ctrl-\ key as vim terminal uses <C-\><C-n> to go into normal mode
    "       (after <C-\> vim terminal always expects another key) ...
    let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.65, 'yoffset': 0.5, 'xoffset': 0.5 } }
else
if &term =~ "^screen" || &term =~ "^tmux"
    " use tmux popup ...
    let g:fzf_layout = { 'tmux': '-p -x C -y 38% -w 80% -h 65%' }
else
    " use vim split ...
    let g:fzf_layout = { 'down': '~45%' }
endif
endif

let g:fzf_preview_window = ['right:60%:hidden', 'ctrl-alt-p']

" ------------

" TODO: do we need to lcd to base dir of file ?
"       it works well for going into sub-dirs, but
"       it may NOT work well when file is ../ or ~/
"autocmd VimEnter,BufEnter * silent! lcd %:p:h

" Switch to the directory of the current file unless it breaks something.
set noautochdir
function! s:autochdir()
    let can_autochdir = !exists("vim_starting") " Don't mess with vim on startup.
    let can_autochdir = can_autochdir && (!exists("v:vim_did_enter") || v:vim_did_enter) " Don't mess with vim on startup.
    let can_autochdir = can_autochdir && !(&filetype ==# 'qf') " Not for some fts.
    let can_autochdir = can_autochdir && filereadable(expand("%")) " Only change to real files.
    if can_autochdir
        silent! lcd %:p:h
    endif
endfunction
augroup myautochdir
    autocmd!
    autocmd BufWinEnter * call s:autochdir()
augroup END

" ------------

" add \fz mapping also ?
noremap <silent> <Leader>fz <C-\><C-n>:FZFProjectFiles<CR>
noremap <silent> <Leader>fg <C-\><C-n>:FZFProjectFiles<CR>
noremap <silent> <Leader>f/ <C-\><C-n>:FZFProjectFiles<CR>
function! s:find_git_root()
    let gdir = ''
    if executable("git")
        " in a submodule dir this returns git root, otherwise returns empty
        let gdir = system('git rev-parse --show-superproject-working-tree 2> /dev/null')[:-2]
        if empty(gdir)
            " not in a submodule, returns git root
            let gdir = system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
        endif
    endif
    return gdir
endfunction

" to get our own custom preview.sh script:
" this:
"     fzf#vim#with_preview({'options': ['--bind=alt-d:kill-word']})
" becomes:
"     {'options': ['--preview', '~/bin/fzf_preview.sh {}', '--bind=alt-d:kill-word']},
" and then we can:
"     1). add a limit of 250 lines for the general fzf cmd
"     2), remove file/mime check

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>,
    \ {'options': ['--preview', '~/bin/fzf_preview250.sh {}', '--bind=alt-d:kill-word']},
    \ <bang>0)

command! FZFProjectFiles execute 'Files' s:find_git_root()

noremap <silent> <Leader>f. <C-\><C-n>:Files<CR>
" NOTE: below is note about another way to do :Files -
" but that wont support opening selection in the 3 ways, only the preset (tab) open ...
"nnoremap <silent> <Leader>f. :FloatermNew --height=0.75 --width=0.80 fzf<CR>

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
"command! -bang -nargs=+ -complete=file Ags call fzf#vim#ag_raw(<q-args>, fzf#vim#with_preview(), <bang>0)
"
" Agit: Start ag in the git/root directory
" e.g.
"   :Agit foo
"function! s:ag_inM1(bang, ...)
"  let gdir = s:find_git_root()
"  "if !isdirectory(a:1)
"  if !isdirectory(gdir)
"    throw 'not a valid directory: ' .. gdir
"  endif
"  " Use 'ctrl-alt-p' to toggle preview window
"  "call fzf#vim#ag(join(a:000[1:], ' '), fzf#vim#with_preview({'dir': a:1}, 'up:50%:hidden', 'ctrl-alt-p'), a:bang)
"  call fzf#vim#ag(join(a:000[0:], ' '), fzf#vim#with_preview({'dir': gdir}, 'up:50%:hidden', 'ctrl-alt-p'), a:bang)
"  " If you don't want preview option, use this
"  " call fzf#vim#ag(join(a:000[1:], ' '), {'dir': a:1}, a:bang)
"endfunction
"command! -bang -nargs=+ -complete=dir Agits call s:ag_inM1(<bang>0, <f-args>)
"
command! -bang -nargs=* Ag
  \ call fzf#vim#grep('\ag -U --hidden --nogroup --column --color -- '.shellescape(<q-args>),
  \ 1,
  \ {'options': ['--preview', '~/bin/fzf_preview.sh {}', '--bind=alt-d:kill-word']},
  \ <bang>0)
"
command! -bang -nargs=* Agit
  \ call fzf#vim#grep('\ag -U --hidden --nogroup --column --color -- '.shellescape(<q-args>).' '.s:find_git_root(),
  \ 1,
  \ {'options': ['--preview', '~/bin/fzf_preview.sh {}', '--bind=alt-d:kill-word']},
  \ <bang>0)
"
" TODO: see Rg command that reloads search string dynamically - can we do this with Ag ?
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
        if getbufvar(l:bufid, '&filetype') ==# 'floaterm'
            " open hidden floaterm ...
            FloatermToggle
        else
            " open hidden buffer in a new tab ...
            " TODO: or hsplit or vsplit or in current window ...
            execute 'tabnew|b'.l:bufid
        endif
    else
        call win_gotoid(l:winids[0])
    endif
endfunction

let g:blist = []
function! MylsFilter(id, key)
    " is <C-c> available in filter ? or use a callback to capture that close
    if a:key == "q" || a:key == "x" || a:key == "\<Esc>" || a:key == "\<C-c>"
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
"\   'source':  reverse(<sid>buflist(1)),
"\   'sink':    function('<sid>bufopen'),
"\   'options': '+m',
"\   'window' : { 'width': 0.8, 'height': 0.3, 'yoffset': 0.8, 'xoffset': 0.8 },
"\   'down':    len(<sid>buflist(1)) + 2
"\ })<CR>

function s:Mylsfzf(arg) abort
    call fzf#run({
\       'source' : reverse(<sid>buflist(a:arg)),
\       'sink'   : function('s:bufopen'),
\       'window' : { 'width': 0.8, 'height': 0.4, 'yoffset': 0.5, 'xoffset': 0.5 }
\   })
endfunction

" TODO: why fzf#run() down: <val> and options: +m settings ?

" native vim popup ls ...
"noremap <silent> <Leader>ls <C-\><C-n>:<C-u>call <SID>MylsPopup(0)<CR>
"noremap <silent> <Leader>lb <C-\><C-n>:<C-u>call <SID>MylsPopup(1)<CR>

" fzf terminal window ls ...
noremap <silent> <Leader>ls <C-\><C-n>:<C-u>call <SID>Mylsfzf(0)<CR>
noremap <silent> <Leader>lb <C-\><C-n>:<C-u>call <SID>Mylsfzf(1)<CR>

" NOTE: seems like a better Buffers command than the fzf default ...
command! Buffers call <SID>Mylsfzf(1)

" NOTE: fzf adds a Windows command that is essentially the same as Buffers

" buffer hide/del/wipe - good for after terminal program ends ...
noremap <silent> <Leader>bh <C-\><C-n>:hide<CR>
noremap <silent> <Leader>bd <C-\><C-n>:bdel<CR>
noremap <silent> <Leader>bw <C-\><C-n>:bwipe<CR>

" :BCommits git log options
"let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
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
" add the :enew just so we can run this from the vim startify window without errors ...
nmap <silent> <Leader>fb :enew<bar>FBCurrentFiles<CR>:redraw!<CR>
nmap <silent> <Leader>fB :enew<bar>FBProjectFiles<CR>:redraw!<CR>
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
autocmd FileType fugitiveblame nmap <buffer> qq         gq
autocmd FileType fugitiveblame nmap <buffer> <C-q>      gq
autocmd FileType fugitiveblame nmap <buffer> <Leader><Tab> O
autocmd FileType fugitiveblame nmap <buffer> <C-t> O
" NOTE: FileType autocmd does not work for this map,
"       plugin probably overwrites it, this seems to work ...
autocmd BufEnter *.fugitiveblame  nmap <buffer> <Return> O
autocmd BufEnter fugitive://**    nmap <buffer> <Return> O
autocmd BufEnter *.fugitiveblame  nmap <buffer> <2-LeftMouse> O

autocmd BufEnter fugitive://**    nmap <buffer> <2-LeftMouse> O

autocmd FileType git              nmap <buffer> <Leader><Tab> O
autocmd FileType git              nmap <buffer> <C-t> O

aug gv_lqq
    au!
    autocmd BufEnter fugitive://**    nmap <silent> <buffer> <Leader>qq  :quit<cr>:tabprevious<cr>:redraw!<cr>
    autocmd BufEnter fugitive://**    nmap <silent> <buffer> qq    :quit<cr>:tabprevious<cr>:redraw!<cr>
    autocmd BufEnter fugitive://**    nmap <silent> <buffer> <C-q> :quit<cr>:tabprevious<cr>:redraw!<cr>
    autocmd BufEnter fugitive://**    nmap <silent> <buffer> QQ    :quit<cr>:tabprevious<cr>:redraw!<cr>
    autocmd FileType git              nmap <silent> <buffer> <Leader>qq  :quit<cr>:tabprevious<cr>:redraw!<cr>
    autocmd FileType git              nmap <silent> <buffer> qq    :quit<cr>:tabprevious<cr>:redraw!<cr>
    autocmd FileType git              nmap <silent> <buffer> <C-q> :quit<cr>:tabprevious<cr>:redraw!<cr>
    autocmd FileType git              nmap <silent> <buffer> QQ    :quit<cr>:tabprevious<cr>:redraw!<cr>
aug END

" TODO: MCK should we be like less here ?
autocmd FileType git              nmap <silent> <buffer> <BS>    :call <SID>CtrlB(1)<CR>
autocmd FileType git              nmap <silent> <buffer> <Space> :call <SID>CtrlF(1)<CR>
autocmd FileType git              vmap <silent> <buffer> <BS>    <C-b>
autocmd FileType git              vmap <silent> <buffer> <Space> <C-f>
autocmd FileType git              nmap <silent> <buffer> u       <C-b>
autocmd FileType git              nmap <silent> <buffer> d       <C-f>
autocmd FileType git              vmap <silent> <buffer> u       <C-b>
autocmd FileType git              vmap <silent> <buffer> d       <C-f>

" NOTE: fugitive git <C-n>, <C-p> mappings already do these
" git diff navigation like tig ...
" NOTE: single <Leader>f,F and c,C causes input delays ...
"autocmd FileType git              nmap <silent> <buffer> <Leader>;f /^diff --git<CR>
"autocmd FileType git              nmap <silent> <buffer> <Leader>;F ?^diff --git<CR>
"autocmd FileType git              nmap <silent> <buffer> <Leader>;c /^@@<CR>
"autocmd FileType git              nmap <silent> <buffer> <Leader>;C ?^@@<CR>
"autocmd FileType git              vmap <silent> <buffer> <Leader>;f /^diff --git<CR>
"autocmd FileType git              vmap <silent> <buffer> <Leader>;F ?^diff --git<CR>
"autocmd FileType git              vmap <silent> <buffer> <Leader>;c /^@@<CR>
"autocmd FileType git              vmap <silent> <buffer> <Leader>;C ?^@@<CR>

" fugitive/GV to be like gitgutter/tig ...
" SPECIAL: some terminals may map <C-S-n> to <C-_>N ...
autocmd FileType git              map <buffer> <C-_>N /^+\\|^-<CR>
" SPECIAL: some terminals may map <C-S-p> to <C-_>P ...
autocmd FileType git              map <buffer> <C-_>P ?^+\\|^-<CR>

" ----------------

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

function MyGitHelper(ff)
    redraw!
    echo "\r"
    if a:ff =~ "blame"
        execute "normal :Git blame\<CR>"
    elseif a:ff =~ "status"
        execute "normal :Git \<CR>"
    endif
    redraw!
    echo "\r"
endfunction

aug fugitive_alias
  au!
  au VimEnter * :Alias Gblame  call\ MyGitHelper("blame")
  au VimEnter * :Alias GBlame  call\ MyGitHelper("blame")
  au VimEnter * :Alias Gstatus call\ MyGitHelper("status")
  au VimEnter * :Alias GStatus call\ MyGitHelper("status")
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

" SPECIAL: some terminals may map <C-S-n> to <C-_>N ...
nmap <C-_>N     <Plug>(GitGutterNextHunk)
" SPECIAL: some terminals may map <C-S-p> to <C-_>P ...
nmap <C-_>P     <Plug>(GitGutterPrevHunk)
" NOTE: kitty previously used ctrl+shift+p + ... for url selection
" and this was changed to ctrl+shift+/ so we can use C-S-p here ...

" TODO: or use M-n/p or M-n/N or C-A-n/p ?
" NOTE: tmux maps <M-n> to <C-^>n and same for N,p,P
" or have tmux change <C-S-n> to <C-_>N ?

nmap <silent> <Leader>gg :call gitgutter#process_buffer(bufnr(''), 0)<CR>
" SPECIAL: some terminals may map <C-S-g> to <C-_>G ...
nmap <silent> <C-_>G     :call gitgutter#process_buffer(bufnr(''), 0)<CR>

" to match fugitive and tig ...
nmap <C-n>      <Plug>(GitGutterNextHunk)
nmap <C-p>      <Plug>(GitGutterPrevHunk)

aug gg_init
  au!
  " NOTE: force auto process git changes ...
  au BufWinEnter * call gitgutter#process_buffer(bufnr(''), 0)
aug END

" NOTE: ^L redraws but also updates git changes ...
" NOTE: nvim requires the :echo "\r" to clear cmdline ...
nnoremap <silent> <expr> <C-l> pumvisible() ? '<C-l>' : ':call gitgutter#process_buffer(bufnr(""), 0)<bar>:echo "\r"<bar>:redraw!<CR>'
" gitgutter -----------

" gitv ----------------
let g:Gitv_OpenHorizontal = 1
let g:Gitv_WrapLines = 0
let g:Gitv_WipeAllOnClose = 0
" gitv ----------------

" gv ------------------
autocmd FileType GV nmap <buffer> <Leader><Tab> O
autocmd FileType GV nmap <buffer> <C-t> O
autocmd FileType GV nmap <buffer> <Return> O
autocmd FileType GV nmap <buffer> o O
autocmd FileType GV nmap <buffer> <Space> <Down>
autocmd FileType GV nmap <buffer> <Tab> <Down>
autocmd FileType GV nmap <buffer> <BS> <Up>
autocmd FileType GV nmap <buffer> <S-Tab> <Up>
autocmd FileType GV nmap <buffer> u <Up>
autocmd FileType GV nmap <buffer> d <Down>
autocmd FileType GV xmap <buffer> <Leader><Tab> O
autocmd FileType GV xmap <buffer> <C-t> O
autocmd FileType GV xmap <buffer> <Return> O
autocmd FileType GV xmap <buffer> o O
autocmd FileType GV xmap <buffer> <Space> <Down>
autocmd FileType GV xmap <buffer> <Tab> <Down>
autocmd FileType GV xmap <buffer> <BS> <Up>
autocmd FileType GV xmap <buffer> <S-Tab> <Up>
autocmd FileType GV xmap <buffer> u <Up>
autocmd FileType GV xmap <buffer> d <Down>

" or use ! ?
autocmd FileType GV nmap <buffer> QQ O
autocmd FileType GV xmap <buffer> QQ O

autocmd FileType GV setlocal cursorline

" TODO: it seems when ft==git <ScrollWheel> acts different than the map defined in this file

" M/A-DoubleClick to open (o) commit ...
autocmd FileType GV nmap <buffer> <A-LeftRelease> <Nop>
autocmd FileType GV nmap <buffer> <A-2-LeftRelease> <Nop>
autocmd FileType GV nmap <buffer> <A-2-LeftMouse> <C-\><C-n>:<C-u>call feedkeys("O")<CR>
" M/A-q to quit like q, but M/A-q is used by Unity/Gnome

" start with folds open
autocmd FileType GV set foldlevelstart=1

function QuitGV() abort
    if g:in_gv2 == 0
        redraw!
        echo " "
        quit
        return
    endif

    " --------------
    "let ans='y'
    " --------------
    echohl Statement
    echo "Last remaining view, really quit ? (Q|Y/n): "
    echohl None
    call inputsave()
    let c = getchar()
    while type(c) != 0
        let c = getchar()
    endwhile
    call inputrestore()
    let ans=nr2char(c)
    " --------------

    if ans ==# 'y' || ans ==# 'Y' || ans ==# 'q' || ans ==# 'Q' || ans ==# "\<CR>"
        "quitall
        call <SID>QuitIfOnlyNoNameLeft()
    else
        redraw!
        echo " "
    endif
endfunction

" NOTE: qq to exit GV seems good ...
"autocmd FileType GV nmap <silent> <buffer> qq    :qa!<CR>
"autocmd FileType GV nmap <silent> <buffer> qq    :echohl Statement<CR>:echo "Can't close last remaining view with \'qq\'"<CR>:echohl None<CR>
autocmd FileType GV nmap <silent> <buffer> qq    :call QuitGV()<CR>
" could make it more like a real vim session and not have qq exit ...
"autocmd FileType GV nmap <silent> <buffer> <C-q> :qa!<CR>
autocmd FileType GV nmap <silent> <buffer> <Leader>wq <C-\><C-n>:<C-u>call <SID>QuitIfOnlyNoNameLeft()<CR>
autocmd FileType GV nmap <silent> <buffer> <Leader>qq <C-\><C-n>:<C-u>call <SID>QuitIfOnlyNoNameLeft()<CR>

" also perhaps consider getcmdpos() <= 3 ...
"autocmd FileType GV cnoreabbrev <silent> <expr> q! (getcmdtype() == ':' && getcmdline() =~ '\s*q!\s*') ? 'qa!' : 'q!'

function! TabCloseRightQuit(bang)
  let cur=tabpagenr()
  while cur < tabpagenr('$')
    exe 'tabclose' . a:bang . ' ' . (cur + 1)
  endwhile
  execute "qa!"
  execute "normal! \<CR>"
endfunction
command! -bang Tabcloserightquit silent! call TabCloseRightQuit('<bang>')

function! TabCloseLeft(bang)
  while tabpagenr() > 1
    exe 'tabclose' . a:bang . ' 1'
  endwhile
endfunction
command! -bang Tabcloseleft silent! call TabCloseLeft('<bang>')

function! s:warn(message)
  redraw!
  echo " "
  redraw!
  echohl WarningMsg | echom a:message | echohl None
endfunction

function! s:shrug()
  call s:warn('¯\_(ツ)_/¯')
endfunction

function! s:browse(url)
  call netrw#BrowseX(b:git_origin.a:url, 0)
endfunction

function! s:tabnew()
  "execute (tabpagenr()-1).'tabnew'
  execute 'tabnew'
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
  "echom "split, tab: " a:tab
  "echo "splitting ..."
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
    "nnoremap <silent> <buffer> gb :Gbrowse<cr>
  elseif type == 'diff'
    call s:fill(target)
    setf diff
  endif
  if g:in_gv2 == 1
    nnoremap <silent> <buffer> qq    :close<cr>
    nnoremap <silent> <buffer> <C-q> :close<cr>
    nnoremap <silent> <buffer> QQ    :close<cr>
  else
    nnoremap <silent> <buffer> qq    :quit<cr>:tabprevious<cr>:redraw!<cr>
    nnoremap <silent> <buffer> <C-q> :quit<cr>:tabprevious<cr>:redraw!<cr>
    nnoremap <silent> <buffer> QQ    :quit<cr>:tabprevious<cr>:redraw!<cr>
  endif
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

" TODO: skip GBrowse for now ...
autocmd FileType GV nnoremap <silent> <buffer> gb    <Nop>
autocmd FileType GV nnoremap <silent> <buffer> q     <Nop>
" NOTE: could also be :qa!<CR> (see above) ...
"       this mapping is done in an nmap above ...
"autocmd FileType GV nnoremap <silent> <buffer> qq    :close<cr>
"autocmd FileType GV nnoremap <silent> <buffer> <C-q> :close<cr>

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
function! s:MyGV(args) abort
    if &buftype == 'terminal'
        call s:IsTerminalFinished()
    endif
    let errmsg = ''
    if g:in_gv2 == 1
        enew
        setlocal buftype=nofile hidden bufhidden=wipe noswapfile
    endif
    if !exists('g:loaded_fugitive')
        let errmsg = 'fugitive not found'
        call s:warn(errmsg)
        sleep 951m
        if g:in_gv2 == 1
            cquit
        else
            redraw!
            echo " "
        endif
        return
    endif
    let git_dir = FugitiveGitDir()
    if empty(git_dir)
        let errmsg = 'Not in a git repository'
        call s:warn(errmsg)
        sleep 951m
        if g:in_gv2 == 1
            cquit
        else
            redraw!
            echo " "
        endif
        return
    endif
    if !empty(a:args)
        let l:alist = split(a:args)
        let fname = l:alist[-1]
        exec 'edit ' . fname
        let fpath = expand("%:p")
        "echomsg "fpath = " . fpath
        call remove(l:alist, -1)
        if len(l:alist) >= 1
            let l:argstr = join(l:alist)
            silent execute 'GV ' . l:argstr . ' -- ' . fpath
        else
            silent execute 'GV -- ' . fpath
        endif
    else
        silent execute 'GV'
    endif
    redraw!
    echo " "
endfunction

command! -nargs=* MyGVWrapper call s:MyGV(<q-args>)

" <Leader>gv is used (below) for opening file under cursor in a vsplit
nnoremap <silent> <Leader>GV :call <SID>MyGV('')<CR>

function! s:MyGV2(args) abort
    let g:in_gv2 = 1
    aug gv_lqq
        au!
        autocmd BufEnter fugitive://**    nmap <silent> <buffer> <Leader>qq  :quit<cr>:redraw!<cr>
        autocmd BufEnter fugitive://**    nmap <silent> <buffer> qq    :quit<cr>:redraw!<cr>
        autocmd BufEnter fugitive://**    nmap <silent> <buffer> <C-q> :quit<cr>:redraw!<cr>
        autocmd BufEnter fugitive://**    nmap <silent> <buffer> QQ    :quit<cr>:redraw!<cr>
        autocmd FileType git              nmap <silent> <buffer> <Leader>qq  :quit<cr>:redraw!<cr>
        autocmd FileType git              nmap <silent> <buffer> qq    :quit<cr>:redraw!<cr>
        autocmd FileType git              nmap <silent> <buffer> <C-q> :quit<cr>:redraw!<cr>
        autocmd FileType git              nmap <silent> <buffer> QQ    :quit<cr>:redraw!<cr>
    aug END
    call <SID>MyGV(a:args)
endfunction

command! -nargs=* GV2 call s:MyGV2(<q-args>)

" vigv shell function ...
" could also add -c 'nnoremap qq :qa!<CR>' and perhaps same for <C-q> but this is done above ...
" vigv() { vim -R -c "GV2 $1 $2 $3" -c ":nnoremap <silent> <buffer> q <Nop>" -c ":cnoreabbrev <silent> <buffer> q Tabcloserightquit" -c ":cnoreabbrev <silent> <buffer> q! Tabcloserightquit" -c ":nnoremap <silent> <buffer> x <Nop>" -c ":cnoreabbrev <silent> <buffer> x Tabcloserightquit" -c ":se bt=nowrite|:tabn|:hide|:redraw!" }

function! s:MyGVF(args) abort
    let git_dir = s:find_git_root()
    if empty(git_dir)
        let errmsg = 'Not in a git repository'
        call s:warn(errmsg)
        sleep 951m
        redraw!
        echo " "
        return
    endif
    exec 'lcd ' . git_dir
    if !empty(a:args)
        execute 'GV ' . a:args . ' -- ' . expand("%")
    else
        execute 'GV -- ' . expand("%")
    endif
endfunction

command! -nargs=* GF  call s:MyGVF(<q-args>)
command! -nargs=* GFP call s:MyGVF("-p")

" -------------

function! s:MyLC() abort
    let git_dir = s:find_git_root()
    if empty(git_dir)
        let errmsg = 'Not in a git repository'
        call s:warn(errmsg)
        sleep 951m
        redraw!
        echo " "
        return
    endif
    exec 'lcd ' . git_dir
    execute 'tabnew | :Gllog | redraw! | wincmd p'
endfunction

function! s:MyLCF() abort
    let git_dir = s:find_git_root()
    if empty(git_dir)
        let errmsg = 'Not in a git repository'
        call s:warn(errmsg)
        sleep 951m
        redraw!
        echo " "
        return
    endif
    exec 'lcd ' . git_dir
    execute 'tabnew ' . expand("%") ' | :0Gllog | redraw! | wincmd p'
endfunction

command! -nargs=0 LC  call s:MyLC()
command! -nargs=0 LCF call s:MyLCF()
" gv ------------------

" vimagit -------------
let g:magit_auto_close=1
let g:magit_auto_foldopen=1
let g:magit_default_fold_level=1
let g:magit_close_mapping='\mQ'
let g:magit_ignore_mapping='\mI'
let g:magit_close_commit_mapping='\mU'
let g:magit_commit_args=''

" use R to refresh/update magit buffer (also <C-L> and <Leader>mR)
" use FF to stage/unstage a file
" use FA to stage all files
" use L to stage/unstage a line
" use S to stage/unstage a hunk
" use E to edit the file
" use M to mark a diff-line/hunk for staging (then use S to stage)
" use CC to commit
" use CS to commit --signoff
" use CA to commit --amend
" use CB to commit --amend --signoff
" use CU to undo commit (before saving)
" <Leader>mp to pull
" <Leader>mP to push
" :MPush [git options]
" :MPull [git options]

autocmd User VimagitEnterCommit startinsert
autocmd FileType magit noremap <silent> <buffer> q <Nop>
autocmd FileType magit nnoremap <silent> <buffer> <expr> <C-l> pumvisible() ? '<C-l>' : ':echo "Magit update ..."<bar>call magit#update_buffer()<CR>:sleep 551m<bar>redraw!<bar>echo " "<CR>'
autocmd FileType magit nnoremap <silent> <buffer> <Leader>mR :echo "Magit update ..."<bar>call magit#update_buffer()<CR>:sleep 551m<bar>redraw!<bar>echo " "<CR>
" these are in magit plugin now with help info -
"autocmd FileType magit nnoremap <silent> <buffer> CS :let g:magit_commit_args='--signoff'<CR>:call magit#commit_command('CC')<CR>
"autocmd FileType magit nnoremap <silent> <buffer> CB :let g:magit_commit_args='--signoff'<CR>:call magit#commit_command('CA')<CR>

let g:magit1 = 0

function! MagitWriteBuffer(arg) abort
    redraw!
    echo "\r"
    if &filetype == "magit"
        if &buftype == "nofile"
            let errmsg = 'Nothing to commit'
            call s:warn(errmsg)
            sleep 951m
            redraw!
            echo " "
            return
        endif
        if &modified
            write
            if a:arg > 0
                quit
            else
                call <SID>LaunchMagit()
            endif
        endif
    endif
endfunction

function Myxit()
    redraw!
    echo "\r"
    if &filetype == 'magit'
        call MagitWriteBuffer(1)
    else
        call MyNextOrQuit()
    endif
endfunction

"autocmd FileType magit :Alias x  call\ MagitWriteBuffer()
au VimEnter * :Alias x call\ Myxit()
autocmd FileType magit :Alias x! call\ MagitWriteBuffer(1)
autocmd FileType magit :Alias w  call\ MagitWriteBuffer(0)
autocmd FileType magit :Alias w! call\ MagitWriteBuffer(0)
autocmd FileType magit :Alias wq call\ MagitWriteBuffer(1)

nnoremap <silent> <Leader>mw :call MagitWriteBuffer(0)<CR>

function! MagitUpdateBufferTerm()
    wincmd p
    if &filetype == "magit"
        call magit#update_buffer()
    endif
    wincmd p
    " put completed terminal into normal mode for possible scrolling ...
    if has("nvim")
        call nvim_input('<C-\><C-n>')
    endif
endfunction

function! MagitUpdateBuffer()
    if &filetype == "magit"
        call magit#update_buffer()
    endif
endfunction

function! <SID>LaunchMagit()
    let git_dir = FugitiveGitDir()
    if empty(git_dir)
        let errmsg = 'Not in a git repository'
        call s:warn(errmsg)
        sleep 951m
        redraw!
        echo " "
        return
    elseif &filetype != "magit"
        if g:magit1 == 0
            autocmd FileType magit nmap <silent> <buffer> qq :conf q<CR>:redraw!<CR>:echo " "<CR>
        endif

        call magit#show_magit('v')

        if g:magit1 == 1
            execute "normal \<C-w>w"
            vertical resize 20
            setlocal winfixwidth
            execute "normal \<C-w>w"
            execute "normal \<C-w>r"

            " to get the msg widths correct ...
            call magit#update_buffer()
        endif

        " clear undo
        let cur_pos = line('.')
        setlocal undolevels=-1
        call cursor(1, 0)
        silent exe "normal! a \<BS>\<Esc>"
        call cursor(cur_pos, 0)
    else
        silent execute "q"
    endif
endfunction
command! MyMagit call s:LaunchMagit()
" do this so we are after the plugin and can overwrite it ...
au VimEnter * :command! Magit call s:LaunchMagit()
nnoremap <silent> <Leader>ma :call <SID>LaunchMagit()<CR>

function! s:Magit1(args)
    let g:magit1 = 1
    let git_dir = FugitiveGitDir()
    if empty(git_dir)
        let errmsg = 'Not in a git repository'
        call s:warn(errmsg)
        sleep 951m
        cquit
    else
        au VimEnter * :Alias! q        if\ &filetype=='magit'|call\ MyQuit("qa")|else|quit|endif|redraw!|echo\ "\ "
        au VimEnter * :Alias! qu       if\ &filetype=='magit'|call\ MyQuit("qa")|else|quit|endif|redraw!|echo\ "\ "
        au VimEnter * :Alias! qui      if\ &filetype=='magit'|call\ MyQuit("qa")|else|quit|endif|redraw!|echo\ "\ "
        au VimEnter * :Alias! quit     if\ &filetype=='magit'|call\ MyQuit("qa")|else|quit|endif|redraw!|echo\ "\ "
        au VimEnter * :Alias! q!       if\ &filetype=='magit'|call\ MyQuit("qa")|else|quit!|endif|redraw!|echo\ "\ "
        au VimEnter * :Alias! qu!      if\ &filetype=='magit'|call\ MyQuit("qa")|else|quit!|endif|redraw!|echo\ "\ "
        au VimEnter * :Alias! qui!     if\ &filetype=='magit'|call\ MyQuit("qa")|else|quit!|endif|redraw!|echo\ "\ "
        au VimEnter * :Alias! quit!    if\ &filetype=='magit'|call\ MyQuit("qa")|else|quit!|endif|redraw!|echo\ "\ "
        au VimEnter * :Alias! qa       call\ MyQuit("qa")
        au VimEnter * :Alias! qal      call\ MyQuit("qa")
        au VimEnter * :Alias! qall     call\ MyQuit("qa")
        au VimEnter * :Alias! qa!      call\ MyQuit("qa!")
        au VimEnter * :Alias! qal!     call\ MyQuit("qa!")
        au VimEnter * :Alias! qall!    call\ MyQuit("qa!")
        au VimEnter * :Alias! quitall  call\ MyQuit("qa")
        au VimEnter * :Alias! quitall! call\ MyQuit("qa!")

        autocmd FileType magit nmap <silent> <buffer> qq         :call MyQuit("conf qa")<CR>
        autocmd FileType magit nmap <silent> <buffer> <Leader>qq :call MyQuit("conf qa")<CR>
        autocmd FileType magit noremap <silent> <buffer> <Leader>ma <Nop>

        call magit#show_magit('v')

        execute "normal \<C-w>w"
        vertical resize 20
        setlocal winfixwidth
        execute "normal \<C-w>w"
        execute "normal \<C-w>r"

        " to get the msg widths correct ...
        call magit#update_buffer()

        " clear undo
        let cur_pos = line('.')
        setlocal undolevels=-1
        call cursor(1, 0)
        silent exe "normal! a \<BS>\<Esc>"
        call cursor(cur_pos, 0)

    endif
endfunction
command! -nargs=* Magit2 call s:Magit1(<q-args>)

function! s:MagitReload()
    if empty(b:magit_current_commit_mode)
        return
    endif
    "echom "MagitReload: filetype = " . &filetype
    "sleep 1
    let g:magit_commit_args=''
    if &filetype == "magit"
        let mcmd = 'tabnew | MyMagit'
        silent execute mcmd

        " width already adjusted above in MyMagit ...

        " clear undo
        let cur_pos = line('.')
        setlocal undolevels=-1
        call cursor(1, 0)
        silent exe "normal! a \<BS>\<Esc>"
        call cursor(cur_pos, 0)

        quit
    endif
endfunction
autocmd User VimagitLeaveCommit call <SID>MagitReload()

function! s:MagitPushPull(p,q,args)
    " if called from a terminal then try to close that first ...
    " NOTE: could possibly check if terminal not ended then skip cmd ...
    call s:IsTerminalFinished()
    if &filetype == "magit"
        let gcmd = 'push'
        if a:q != 0
            let gcmd = 'pull'
        endif
        let ans = 'y'
        let c = 0
        if a:p == 0
            if empty(a:args)
                let prompt = 'git ' . gcmd . ' ? (Y/n): '
            else
                let prompt = 'git ' . gcmd . ' ' . a:args . ' ? (Y/n): '
            endif
            echo prompt
            call inputsave()
            try
                let c = getchar(1)
                while c == 0
                    let c = getchar(1)
                    sleep 1m
                endwhile
                let ans=nr2char(c)
            catch /.*/
                call inputrestore()
                redraw!
                echo " "
                return
            endtry
        endif
        " enter a space first if optional arg starts with y or n ...
        if ans ==# 'y' || ans ==# 'Y' || ans == "\<CR>"
            call inputrestore()

            " clear undo
            let cur_pos = line('.')
            setlocal undolevels=-1
            call cursor(1, 0)
            silent exe "normal! a \<BS>\<Esc>"
            call cursor(cur_pos, 0)

            if empty(a:args)
                execute 'AsyncRun -raw -strip -mode=term -reuse -pos=bottom -rows=10 -name=aterm -post=call\ MagitUpdateBufferTerm() git ' gcmd
                redraw!
                echo 'git ' . gcmd
            else
                execute 'AsyncRun -raw -strip -mode=term -reuse -pos=bottom -rows=10 -name=aterm -post=call\ MagitUpdateBufferTerm() git ' gcmd a:args
                redraw!
                echo 'git ' . gcmd . ' ' . a:args
            endif
            "FloatermNew --name=fterm --autoclose=2 --height=0.75 --width=0.80
            "FloatermNew --name=fterm --autoclose=2 --height=0.75 --width=0.80 bash_ask --tty git push
            return
        else
            " handle any ctrl char as a no ?
            if c == 128 || ans ==# 'n' || ans ==# 'N' || ans == "\<Esc>" || ans == "\<C-q>" || ans == "\<C-x>"
                call inputrestore()
                redraw!
                echo " "
                return
            endif
            try
                redraw!
                echo "\r"
                let string = input('')
            catch /.*/
                call inputrestore()
                redraw!
                echo " "
                return
            endtry
            call inputrestore()
            " clear undo
            let cur_pos = line('.')
            setlocal undolevels=-1
            call cursor(1, 0)
            silent exe "normal! a \<BS>\<Esc>"
            call cursor(cur_pos, 0)

            if empty(string)
                execute 'AsyncRun -raw -strip -mode=term -reuse -pos=bottom -rows=10 -name=aterm -post=call\ MagitUpdateBufferTerm() git ' gcmd
                redraw!
                echo 'git ' . gcmd
            else
                execute 'AsyncRun -raw -strip -mode=term -reuse -pos=bottom -rows=10 -name=aterm -post=call\ MagitUpdateBufferTerm() git ' gcmd string
                redraw!
                echo 'git ' . gcmd . ' ' . string
            endif
            return
        endif
    else
        let errmsg = 'Not inside Magit'
        call s:warn(errmsg)
        sleep 951m
        redraw!
        echo " "
    endif
endfunction
nnoremap <silent> <Leader>mp :call <SID>MagitPushPull(0,1,'')<CR>
nnoremap <silent> <Leader>mP :call <SID>MagitPushPull(0,0,'')<CR>

command! -bang -nargs=* MPush call s:MagitPushPull(1,0,<q-args>)
command! -bang -nargs=* MPull call s:MagitPushPull(1,1,<q-args>)

command! -bang MUpdate  echo "Magit update ..."<bar>call magit#update_buffer()<bar>:sleep 551m<bar>redraw!<bar>echo " "
command! -bang MRefresh echo "Magit update ..."<bar>call magit#update_buffer()<bar>:sleep 551m<bar>redraw!<bar>echo " "

" overwrite plugin GV command with s:MyGV(args) ...
au VimEnter * :Alias GV MyGVWrapper

" now that custom GV cmd works no need for MGV/Mgv ...
"command! -bang -nargs=* MGV call s:MyGV(<q-args>)
"command! -bang -nargs=* Mgv call s:MyGV(<q-args>)

" this is in magit plugin now with help info -
" for CU to not leave extra tab ...
function! s:MagitUnCommit()
    if ( b:magit_current_commit_mode == '' )
        return
    endif
    call magit#close_commit()
    try
        silent exec "silent normal! /Staged\<CR>"
        silent exec "silent normal! 0"
    catch /E486:/
    endtry
endfunction

" these are in magit plugin now with help info -
"autocmd FileType magit nnoremap <silent> <buffer> CU :call <SID>MagitUnCommit()<CR>
" default map is <Leader>mU ...

function! s:MagitGitCmd(p,args)
    if empty(a:args)
        let errmsg = 'MagitGitCmd: <empty cmd>'
        call s:warn(errmsg)
        sleep 951m
        redraw!
        echo " "
        return
    endif
    if &filetype == "magit"
        " clear undo
        let cur_pos = line('.')
        setlocal undolevels=-1
        call cursor(1, 0)
        silent exe "normal! a \<BS>\<Esc>"
        call cursor(cur_pos, 0)

        execute 'AsyncRun -raw -strip -mode=term -reuse -pos=bottom -rows=10 -name=aterm -post=call\ MagitUpdateBufferTerm() git ' a:args
    else
        let errmsg = 'Not inside Magit'
        call s:warn(errmsg)
        sleep 951m
        redraw!
        echo " "
    endif
endfunction
command! -bang -nargs=* MGit call s:MagitGitCmd(1,<q-args>)
" vimagit -------------

" twiggy --------------
function! <SID>LaunchTwiggy()
    let git_dir = FugitiveGitDir()
    if empty(git_dir)
        let errmsg = 'Not in a git repository'
        call s:warn(errmsg)
        sleep 951m
        redraw!
        echo " "
        return
    else
        let t:twiggy_git_cmd = fugitive#repo().git_command()
        let t:twiggy_git_dir = git_dir
        let b:git_dir = git_dir
        silent execute "Twiggy"
    endif
endfunction
nnoremap <silent> <Leader>br :call <SID>LaunchTwiggy()<CR>
" twiggy --------------

" dispatch ------------
let g:dispatch_no_maps = 1
" dispatch ------------

" QFEnter -------------
" add C-t, C-v, C-x to open consistently with fzf ...
let g:qfenter_keymap = {}
let g:qfenter_keymap.topen = ['<Leader><Tab>',   '<C-t>']
let g:qfenter_keymap.vopen = ['<Leader><CR>',    '<C-v>']
let g:qfenter_keymap.hopen = ['<Leader><Space>', '<C-x>']
let g:qf_loclist_window_bottom = 0
" set to none if new tab and want cursor to return to orig win before qf ...
let g:qfenter_prevtabwin_policy = 'none'
function! <SID>OpenQuickfix_NotUsed(new_split_cmd)
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
    " SPECIAL: <S-F27> is terminal mapped to <A-C-P> above ...
    " SPECIAL: <S-F30> is terminal mapped to <A-BS> (via tmux for vim) ...
    " SPECIAL: <S-F29> is terminal mapped to <A-Space> (via tmux for vim) ...
    autocmd FileType qf nmap <buffer> <S-F27> <plug>(qf-preview-open)
    " NOTE: can not use <C-\> as that is reserved in terminal shell ...
    " C-/ (which is really <C-_>) - old fzf preview key
    " <C-_> used with another key so cannot use this alone without delay ...
    "autocmd FileType qf nmap <buffer> <C-_> <plug>(qf-preview-open)
augroup END
" Do we use <C-k>/<C-j> for scroll-up/down or <C-Up>/<C-Down> ?
" NOTE: mappings here have to be a single key - cannot be an esc-code ...
" NOTE: vim-qf-preview is not compatible with nvim
if has("nvim")
    "autocmd FileType qf nmap <buffer> <M-C-P> <plug>(qf-preview-open)
    autocmd FileType qf nmap <silent> <buffer> <M-C-P> :echohl WarningMsg<bar>echo "vim-qf-preview NOT compatible with nvim!"<bar>echohl None<CR>:sleep 1500m<CR>:echo " "<CR>
    let g:qfpreview = {
    \ 'top'           : "\<C-Home>",
    \ 'bottom'        : "\<C-End>",
    \ 'scrollup'      : "\<C-k>",
    \ 'scrollup2'     : "\<C-Up>",
    \ 'scrollup3'     : "\<M-X>",
    \ 'scrolldown'    : "\<C-j>",
    \ 'scrolldown2'   : "\<C-Down>",
    \ 'scrolldown3'   : "\<M-Y>",
    \ 'halfpageup'    : "\<BS>",
    \ 'halfpageup2'   : "\<C-b>",
    \ 'halfpageup3'   : "\<F28>",
    \ 'halfpagedown'  : "\<Space>",
    \ 'halfpagedown2' : "\<C-f>",
    \ 'halfpagedown3' : "\<F29>",
    \ 'fullpageup'    : "\<C-u>",
    \ 'fullpageup2'   : "\<C-PageUp>",
    \ 'fullpagedown'  : "\<C-d>",
    \ 'fullpagedown2' : "\<C-PageDown>",
    \ 'next'          : "\<Down>",
    \ 'next2'         : "\<M-j>",
    \ 'previous'      : "\<Up>",
    \ 'previous2'     : "\<M-k>",
    \ 'reset'         : "\<C-r>",
    \ 'close'         : "\<C-q>",
    \ 'close2'        : "\<M-C-P>",
    \ 'close3'        : "\<Esc>",
    \ 'number'        : 1,
    \ 'height'        : 15,
    \ 'offset'        : 7,
    \ 'sign'          : {'linehl': 'CursorLine'},
    \ }
else
    let g:qfpreview = {
    \ 'top'           : "\<C-Home>",
    \ 'bottom'        : "\<C-End>",
    \ 'scrollup'      : "\<C-k>",
    \ 'scrollup2'     : "\<C-Up>",
    \ 'scrollup3'     : "\<S-F30>",
    \ 'scrolldown'    : "\<C-j>",
    \ 'scrolldown2'   : "\<C-Down>",
    \ 'scrolldown3'   : "\<S-F29>",
    \ 'halfpageup'    : "\<BS>",
    \ 'halfpageup2'   : "\<C-b>",
    \ 'halfpageup3'   : "\<F28>",
    \ 'halfpagedown'  : "\<Space>",
    \ 'halfpagedown2' : "\<C-f>",
    \ 'halfpagedown3' : "\<F29>",
    \ 'fullpageup'    : "\<C-u>",
    \ 'fullpageup2'   : "\<S-F21>",
    \ 'fullpagedown'  : "\<C-d>",
    \ 'fullpagedown2' : "\<S-F24>",
    \ 'next'          : "\<Down>",
    \ 'next2'         : "\<F31>",
    \ 'previous'      : "\<Up>",
    \ 'previous2'     : "\<F30>",
    \ 'reset'         : "\<C-r>",
    \ 'close'         : "\<C-q>",
    \ 'close2'        : "\<S-F27>",
    \ 'close3'        : "\<Esc>",
    \ 'number'        : 1,
    \ 'height'        : 15,
    \ 'offset'        : 7,
    \ 'sign'          : {'linehl': 'CursorLine'},
    \ }
endif
" NOTE: popup mappings do not seem to work if they are
"       from MapFastKeycode() unless they use <Fxx> or <S-Fxx> ...
" vim-qf-preview ------

" lastplace -----------
" mods to skip for vimdiff
if &diff
  let b:loaded_lastplace_plugin = 1
endif
" lastplace -----------

" polygot -----------
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

" any-jump -----------
let g:any_jump_disable_default_keybindings = 1
" rg seems to have some more correct line numbers etc.
" from https://github.com/BurntSushi/ripgrep
let g:any_jump_search_prefered_engine = 'rg'
let g:any_jump_results_ui_style = 'filename_first'
let g:any_jump_max_search_results = 8
let g:any_jump_list_numbers = 0
let g:any_jump_references_enabled = 1
" if -1 then center popup vertically, otherwise use offset
let g:any_jump_window_top_offset = -1

function! s:AnyJumpPrompt(meth)
  if (a:meth == 0)
    let promptstr = 'any-gbl:/'
  elseif (a:meth == 1)
    let promptstr = 'any-ldir:/'
  elseif (a:meth == 2)
    let promptstr = 'any-rdir:/'
  else
    redraw!
    echo " "
    return
  endif
  call inputsave()
  let string = input(promptstr)
  call inputrestore()
  if (len(string) == 0)
    " should we reset @/ ?
    redraw!
    echo " "
    return
  endif
  call AnyJumpMethod(a:meth, string)
endfunction

" Normal mode: Jump to definition under cursor
" d, g, f, ., /
nnoremap <leader>a/ :AnyJump<CR>
nnoremap <leader>ag :AnyJump<CR>
nnoremap <leader>ad :AnyJumpDirLocal<CR>
nnoremap <leader>a. :AnyJumpDirRecur<CR>
" TODO: <Leader>af for files
" Visual mode: jump to selected text in visual mode
xnoremap <leader>a/ <C-\><C-n>:<C-u>AnyJumpVisual<CR>
xnoremap <leader>ag <C-\><C-n>:<C-u>AnyJumpVisual<CR>
xnoremap <leader>ad <C-\><C-n>:<C-u>AnyJumpVisualDirLocal<CR>
xnoremap <leader>a. <C-\><C-n>:<C-u>AnyJumpVisualDirRecur<CR>
" TODO: <Leader>af for files
" TODO: prompt searches ...
nnoremap <leader>a? :call <SID>AnyJumpPrompt(0)<CR>
nnoremap <leader>aG :call <SID>AnyJumpPrompt(0)<CR>
nnoremap <leader>aD :call <SID>AnyJumpPrompt(1)<CR>
nnoremap <leader>a: :call <SID>AnyJumpPrompt(2)<CR>
" Normal mode: open previous opened file (after jump) - could just use <C-o> ...
nnoremap <leader>ab :AnyJumpBack<CR>
" Normal mode: open last closed search window again
nnoremap <leader>al :AnyJumpLastResults<CR>
au FileType any-jump nnoremap <silent> <buffer> <M-C-P> :call g:AnyJumpHandlePreview()<CR>
" any-jump -----------

" asyncrun -----------
" open quickfix (10 lines) when cmd ends
" skip as we now copen at end ...
"let g:asyncrun_open = 10
" so we can see echoes at end ...
let g:asyncrun_code = 0
let g:asyncrun_silent = 0
let g:asyncrun_string = ''
autocmd User AsyncRunPre let g:asyncrun_code = 2 | echohl DiffAdd | echo "\rAsyncRun started ..." | echohl None
autocmd User AsyncRunStop if g:asyncrun_code != 0 | echohl DiffText | echo 'AsyncRun complete: [ ' . g:asyncrun_code . ' ]' | echohl None |
            \ else | echohl DiffAdd | echo 'AsyncRun complete: [ OK ]' | echohl None | copen | set nowrap | set cursorline | clearjumps | endif | if !pumvisible() | call lightline#update() | endif | let g:asyncrun_string = ''
autocmd User AsyncRunInterrupt echohl DiffText | echo 'AsyncRun complete: [TERM]' | echohl None | let g:asyncrun_code = 2 | let g:asyncrun_string = ''
" NOTE: add '| wincmd p' to go back to orig window
" NOTE: add '| set ma' after copen to make qf modifiable
" there is also <leader>sq and <Leader>sx to cancel AsyncRun search in flight ...
" TODO: is there a way to map <C-c> to send interrupt and call AsyncStop ?
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

" tmux-focus -------
" NOTE: tmux-focus plugin uses <F24>
" NOTE: tmux-focus plugin uses <F25>
" tmux-focus -------

" vimade -----------
let g:vimade = {}
let g:vimade.fadelevel = 0.6
" to keep search highlighting in dimmed windows ...
let g:vimade.fadepriority = 0
let g:vimade.checkinterval = 300
let g:vimade.enablefocusfading = 1
" BUG: alactritty terminal with selected wrapped lines can sometimes flash w/o this -
let g:vimade.usecursorhold = 1

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
" skip q for closing man window, use qq instead ...
autocmd FileType man nmap <buffer> q  <Nop>
autocmd FileType man nmap <buffer> qq :q<CR>
" vim-man ----------

" choosewin --------
let g:choosewin_return_on_single_win = 0
" overlay does not work with terminals ...
let g:choosewin_statusline_replace = 1
let g:choosewin_overlay_enable = 0
let g:choosewin_blink_on_land = 1
let g:choosewin_overlay_font_size = "small"
"nmap -          <Plug>(choosewin)
nmap <C-w><C-a>    <Plug>(choosewin)
nmap <C-w>a        <Plug>(choosewin)
imap <C-w><C-a>    <C-\><C-o><Plug>(choosewin)
imap <C-w>a        <C-\><C-o><Plug>(choosewin)
if !has("nvim")
    tmap <C-w><C-a>     <C-w>:ChooseWin<CR>
    tmap <C-w>a         <C-w>:ChooseWin<CR>
else
    tmap <C-w><C-a>     <C-\><C-n>:ChooseWin<CR>
    tmap <C-w>a         <C-\><C-n>:ChooseWin<CR>
endif
" choosewin --------

" floaterm ---------
function s:NoFloatermVless() abort
    echohl Statement
    echo "floaterm not available in vless"
    echohl None
endfunction

let g:floaterm_width = 0.72
let g:floaterm_height = 0.65
let g:floaterm_autoclose = 2
let g:floaterm_autoinsert = v:true
" NOTE: there is also <Leader>zs and <Leader>zt for terminals mapped above ...
if !exists("g:vless")
    if exists('$TMUX_PANE')
        " printf \033]11;rgb:<R>/<G>/<B>\007 sets the terminal background colour (only when inside tmux)
        let syscmd = "tmux popup -d '#{pane_current_path}' -xC -yC -w70% -h63% -E \"tmux new -s popup \\\"printf '\\\\\\033]11;rgb:30/25/25\\\\\\007' ; tmux set -w status off ; " . &shell . "\\\"\""
        nnoremap <silent> <Leader>zF :call system(syscmd)<CR>
    endif
    nnoremap <silent> <Leader>zf :FloatermToggle<CR>
    " MCK: use something else besides <C-x> here ...
    "tnoremap <silent> <expr> <C-x><C-d> (win_gettype(win_getid()) ==# 'popup' \|\| win_gettype(win_getid()) ==# 'floating') ? '<C-\><C-n><C-w>:FloatermHide<CR>' : '<C-x>'
    "tnoremap <silent> <expr> <C-x><C-d> (&filetype ==# 'floaterm') ? '<C-\><C-n><C-w>:FloatermHide<CR>' : ''
    tnoremap <silent> <expr> <F17>d (&filetype ==# 'floaterm') ? '<C-\><C-n><C-w>:FloatermHide<CR>' : ''
    tnoremap <silent> <expr> <M-x>d (&filetype ==# 'floaterm') ? '<C-\><C-n><C-w>:FloatermHide<CR>' : ''
else
    nnoremap <Leader>zf :call <SID>NoFloatermVless()<CR>
endif

" how to open file selected in floaterm - can be 'edit', 'split', 'vsplit', 'tabe'
" TODO: would be awesome if this were configurable via separate mappings ...
"       <C-v> - vsplit, <C-x> - split, <C-t> - tabe, etc.
let g:floaterm_open_command = 'tabe'

" install lf (go) -
"   env CGO_ENABLED=0 GO111MODULE=on go get -u -ldflags="-s -w" github.com/gokcehan/lf
"   NOTE: use 'i' to enter preview window (inspect) to scroll, then exit less/bat (qq etc.) to go back ...
nnoremap <silent> <Leader>lf :FloatermNew --height=0.75 --width=0.80 lf<CR>

" NOTE: <Leader>f. is mapped above to use :Files, this is another way ...
" but this wont support opening selection in the 3 ways, only the preset (tab) open ...
"nnoremap <silent> <Leader>f. :FloatermNew --height=0.75 --width=0.80 fzf<CR>
" floaterm ---------

" vifm -------------
" NOTE: these need vifm (https://github.com/vifm/vifm.git) already installed ...

" ok in nvim terminal, but vim terminal needs <C-w>.w to change to preview window for scrolling
" NOTE: use <S-Tab> instead of <C-w>w to switch to/from preview window for scrolling
nnoremap <silent> <Leader>fm :FloatermNew --height=0.75 --width=0.80 vifm<CR>

"let g:vifm_embed_term = v:true
"let g:vifm_embed_split = v:true
" if vifm plugin is installed then full window vifm in a new tab ...
nnoremap <silent> <Leader>fM :TabVifm<CR>
" vifm -------------

" float-preview ----
let g:float_preview#docked = 0
let g:float_preview#max_width = 80
" float-preview ----

" diffchar ---------
let g:DiffUnit = 'Word2' "Char, Word1, Word2
function s:UnmapSomeDiffCharKeys()
    try
        nunmap <Leader>p
        nunmap <Leader>g
    catch /E31:/
    endtry
endfunction
"autocmd BufEnter * call <SID>UnmapSomeDiffCharKeys()
"nmap <Leader>g <Nop>
"nmap <Leader>p <Nop>
" diffchar ---------

" nvim-miniyank ----
if has("nvimSKIP_MINIYANK")
    map p <Plug>(miniyank-autoput)
    map P <Plug>(miniyank-autoPut)
    let g:miniyank_maxitems = 100
    let g:miniyank_delete_maxlines = 100000
    let miniyank_path = "/dev/shm/".$LOGNAME
    if !isdirectory(miniyank_path)
        call mkdir(miniyank_path, "", 0700)
    endif
    let g:miniyank_filename = miniyank_path . "/miniyank.mpack"
endif
" nvim-miniyank ----

" vim-better-whitespace -
let g:show_spaces_that_precede_tabs=1
let g:better_whitespace_enabled=0
let g:strip_whitespace_on_save=0
let g:current_line_whitespace_disabled_soft=1
let g:better_whitespace_operator='___s'
" vim-better-whitespace -

" fixCursorHold ----
let g:cursorhold_updatetime = 10000
" fixCursorHold ----

" ====================================================
" --- plugin configurations --------------------------
" ====================================================

" ====================================================
" --- CLIPBOARD --------------------------------------
" ====================================================

" save previous reg + to reg x for exchange/paste/etc
vnoremap <silent> zy    y
vnoremap <silent> ty    :<C-u>call setreg('x', getreg('*'), getregtype('*'))<CR>gvy
vnoremap <silent> Ty    :<C-u>call setreg('x', getreg('*'), getregtype('*'))<CR>
vnoremap <silent> zY    Y
vnoremap <silent> tY    :<C-u>call setreg('x', getreg('*'), getregtype('*'))<CR>gvY
vnoremap <silent> TY    :<C-u>call setreg('x', getreg('*'), getregtype('*'))<CR>
vnoremap <silent> zx    x
vnoremap <silent> tx    :<C-u>call setreg('x', getreg('*'), getregtype('*'))<CR>gvx
vnoremap <silent> Tx    :<C-u>call setreg('x', getreg('*'), getregtype('*'))<CR>
vnoremap <silent> zX    X
vnoremap <silent> tX    :<C-u>call setreg('x', getreg('*'), getregtype('*'))<CR>gvX
vnoremap <silent> TX    :<C-u>call setreg('x', getreg('*'), getregtype('*'))<CR>
vmap     <silent> x     tx
vmap     <silent> d     tx
vmap     <silent> X     tX
" delete entire selected line(s) - different than normal D (del to end-of-line)
vmap     <silent> D     tX
vmap     <silent> <Del> tx
nnoremap <silent> ty    <Nop>
nnoremap <silent> tY    <Nop>
nnoremap <silent> tx    <Nop>
nnoremap <silent> tX    <Nop>

" copy (yank) selection, stay at end unless rectangular region ...
"vmap <silent> <expr> <C-c> (mode() =~ "\<C-v>") ? 'ty' : 'mvty`v'
"vmap <silent> <expr> y     (mode() =~ "\<C-v>") ? 'ty' : 'mvty`v'

" TODO: if in normal mode in a terminal - do we exit normal mode on a yank ?

" NOTE: to save and restore cursor without adjusting lines use: mvHmw [func/cmd] 'wzt`v
function! s:YankAndRestoreWinPos(cmd)
    " this was mvty`v or mvtY`v ...
    let l:w1 = winsaveview()
    silent execute 'silent normal gv' . a:cmd
    call winrestview(l:w1)
endfunction

"vmap <silent> <expr> <C-c> (&buftype ==# 'terminal') ? 'tyi' : (mode() =~ "\<C-v>") ? 'ty' : 'mvty`v'
vmap <silent> <expr> <C-c> (&buftype ==# 'terminal') ? 'tyi' : (mode() =~ "\<C-v>") ? 'ty' : '<C-\><C-n>:<C-u>call <SID>YankAndRestoreWinPos("ty")<CR>'
vmap <silent> <expr> y     (&buftype ==# 'terminal') ? 'tyi' : (mode() =~ "\<C-v>") ? 'ty' : '<C-\><C-n>:<C-u>call <SID>YankAndRestoreWinPos("ty")<CR>'
vmap <silent> <expr> Y     (&buftype ==# 'terminal') ? 'tyi' : (mode() =~ "\<C-v>") ? 'omvVtY`v' : '<C-\><C-n>:<C-u>call <SID>YankAndRestoreWinPos("tY")<CR>'
vmap <silent> <expr> <Leader>yy (mode() =~ "\<C-v>") ? 'ty' : '<C-\><C-n>:<C-u>call <SID>YankAndRestoreWinPos("ty")<CR>'
vmap <silent> <expr> <Leader>yY (mode() =~ "\<C-v>") ? 'omvVtY`v' : '<C-\><C-n>:<C-u>call <SID>YankAndRestoreWinPos("tY")<CR>'

if has("nvim")
    let g:clipboard = {
        \   'name': 'myclip',
        \   'copy': {
        \      '+': 'myclip -',
        \      '*': 'myclip -',
        \    },
        \   'paste': {
        \      '+': 'myclip --o',
        \      '*': 'myclip --o',
        \   },
        \   'cache_enabled': 1,
        \ }
endif

" ====================================================
" --- CLIPBOARD --------------------------------------
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

if !has("nvim")
    set esckeys
endif

" -------------------------

" cursor shape blink ...
" also note cnorm/cvvis terminfo for rxvt blinking cursor

if has("nvim")
    " does not work in st/xterm inside tmux, do we need Ss/Se ?
    set guicursor=n-v-c:block,o-i-r-ci-cr:ver25,a:blinkon500-blinkoff300
endif

if !has("nvim") && (&term =~ "^screen" || &term =~ "^tmux")
  " seems we need this for blinking cursor ...
  " vim uses vi, vs, VS, ve and may not get these from cnorm, civis, cvvis correctly
  "let &t_ve="\e[?12;25h"
  let &t_VS="\e[34h"
  let &t_ve="\e[?25h"
  "let vs=system("infocmp -1 | grep cnorm | sed 's/,//g' | awk -F\\ '{print $2}'")
  "let ve=system("infocmp -1 | grep cnorm | sed 's/,//g' | awk -F\\ '{print $3}'")
endif

"if exists('$ST_VERSION')
  " NOTE: this DISABLES modifyOtherKeys
"  let &t_TI=""
"  let &t_TE=""
"endif

"if exists('$ZUTTY_VERSION')
  " NOTE: this ENABLES modifyOtherKeys=2
"  let &t_TI = "\<Esc>[>4;2m"
"  let &t_TE = "\<Esc>[>4;m"
"endif

" can prevent some strange chars in terminator ...
"set t_TI=
"set t_TE=

" do not reset terminal at exit ...
"set t_ti=
"set t_te=

if !has("nvim")
    " change cursor shape to beam in Insert mode ...
    let &t_SI = "\e[5 q"
    let &t_EI = "\e[1 q"
    " steady underline
    "let &t_SI = "\e[4 q"
    " blinking underline
    "let &t_SI = "\e[3 q"
endif

" -------------------------

"let g:solarized_termcolors=256
"colorscheme solarized
colorscheme deus
"colorscheme gruvbox

" do not use delete/wipe with qf/ll ...
set nohidden
set bufhidden=hide

set lazyredraw

set redrawtime=10000
" :syntax sync minlines=1000
" TODO: add a mapping to syntax sync ?

set confirm

set noshowmode

" remove prev visual mark
delmarks v

" persistent undo between sessions ...
"set undodir=~/.vim/undodir

" dont save to ~/.vim/.netrwhist
let g:netrw_dirhistmax = 0

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

" change title to @t:... for terminal, so S-Insert / C-S-v paste can
" do something different (such as remove last empty NUL/NL for the terminal)
au WinEnter * call <SID>MyUpdateTitle()
if !has("nvim")
    au TerminalOpen * call <SID>MyUpdateTitle()
else
    au TermEnter,TermOpen * call <SID>MyUpdateTitle()
endif
function! s:MyUpdateTitle()
  set titleold=
  if &buftype=="terminal"
    if !has("nvim")
        set title titlestring=@t:v%.11t
    else
        set title titlestring=@t:%.12t
    endif
  else
    set title titlestring=@v:%.12t
  endif
  if (&term =~ "^screen" || &term =~ "^tmux") && !has('nvim')
    exec "set t_ts=\e]2; t_fs=\7"
  endif
  " if want to force insert mode upon entering
  "if mode() == 'n'
  "    call feedkeys("i", 'i')
  "endif
endfunction

if has("nvim")
  augroup terminal_settings
    autocmd!

    " this is set below for :terminal ... with the 'i' added at the end
    "autocmd TermOpen term://* startinsert

    autocmd WinEnter term://* startinsert
    autocmd WinLeave term://* stopinsert
    " TODO: why doesnt TermEnter/Leave work ?
    "autocmd TermEnter term://* startinsert
    "autocmd TermLeave term://* stopinsert

    " Ignore various filetypes as those will close terminal automatically
    " Ignore fzf, ranger, coc
    "autocmd TermClose term://*
    "    \ if (expand('<afile>') !~ "fzf") &&
    "    \    (expand('<afile>') !~ "ranger") &&
    "    \    (expand('<afile>') !~ "coc") |
    "    \     call nvim_input('<CR>') |
    "    \ endif

    " close terminal shell automatically if it exited ...
    autocmd TermClose term://* if (expand('<afile>') =~ ":/usr/bin/zsh") | call nvim_input('<CR>') | endif

    " a click in terminal automatically puts it in normal mode ...
    " which allows for double-click etc to select words
    " if we really wanted to override this behavior then -
    "autocmd TermOpen term://* nnoremap <buffer> <LeftRelease> <LeftRelease>i
  augroup END
endif

" visual/audio bell (terminator light bulb) off ...
set belloff=error,backspace,esc

" issue with mouse in vim when beyond 220 cols ...
if !has("nvim")
    if has("mouse_sgr")
        set ttymouse=sgr
    else
        set ttymouse=xterm2
    endif
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
" there is also <Leader>lW for ALL windows - set below in diff section ...

" ------------------------------

" normal viewing ...
"set encoding=utf-8
"set display-=uhex
"set isprint=@,161-255

" hex viewing ...
"set encoding=latin1
"set display+=uhex
"set isprint=

" ------------------------------

" show registers in popup and copy selected to '*' (x is next on stack)
function! s:reglist()
    let l:rlist = []
    redir => regout
    silent reg *,+,x,y,z,\",0,1,2,%,/
    redir END
    if !empty(regout)
        let l:rlist = split(regout, '\n')
        call remove(l:rlist, 0)
        " go thru all entries and trim to reasonable len
        let wid = &co - 20
        if wid < 10
            wid = 10
        endif
        let l:tlist = []
        for item in l:rlist
            "let l:lix = strpart(item, 0, wid)
            let l:lix = item[:wid]
            call add(l:tlist, l:lix)
        endfor
        return l:tlist
    endif
endfunction

let g:reglist = []
function! MyregFilter(id, key)
    " is <C-c> available in filter ? or use a callback to capture that close
    if a:key == "q" || a:key == "x" || a:key == "\<Esc>" || a:key == "\<C-c>"
        call popup_close(a:id, 0)
        " return > 0 to not pass on to callback ...
        return 1
    endif
    " TODO: add options to open in split, vsplit, tab, hide buffer etc.
    " pass to generic filter
    return popup_filter_menu(a:id, a:key)
endfunction

function! MyregCallback(id, indx) abort
    if a:indx <= 0
        return
    endif
    let l:rg = []
    let l:rg = split(g:reglist[a:indx-1])
    "let l:rrg = strpart(l:rg[1], 1, 1)
    let l:rrg = l:rg[1][1:1]
    "echo 'reg = ' . l:rrg
    if empty(l:rrg) || l:rrg ==# '*'
        return
    endif
    call setreg('*', getreg(l:rrg), getregtype(l:rrg))
endfunction

function! MyregClear(tid) abort
    call feedkeys("\<Esc>", "m")
endfunction

function! s:MyregPopup() abort
    let g:reglist = <SID>reglist()
    if empty(g:reglist)
        " shouldn't happen now that buflist always returns something ...
        let g:reglist = [ 'registers empty ...' ]
    endif
    call popup_menu(g:reglist, #{ title: ' Type Name Content ', filter: 'MyregFilter', callback: 'MyregCallback', time: 20000 })
endfunction

function! s:MyregfzfCB(reg) abort
    let l:rg = []
    let l:rg = split(a:reg)
    "let l:rrg = strpart(l:rg[1], 1, 1)
    let l:rrg = l:rg[1][1:1]
    "echo 'reg = ' . l:rrg
    if empty(l:rrg) || l:rrg ==# '*'
        return
    endif
    call setreg('*', getreg(l:rrg), getregtype(l:rrg))
endfunction

function s:Myregfzf() abort
    call fzf#run({
\       'source' : <sid>reglist(),
\       'sink'   : function('s:MyregfzfCB'),
\       'window' : { 'width': 0.8, 'height': 0.4, 'yoffset': 0.5, 'xoffset': 0.5 }
\   })
endfunction

" orig cmdline reg ...
"nnoremap <silent> <Leader>rg :reg *,+,x,y,z,\",0<CR>

" native vim popup reg ...
"nnoremap <silent> <Leader>rg :call <SID>MyregPopup()<CR>

" fzf terminal window reg ...
nnoremap <silent> <Leader>rg :call <SID>Myregfzf()<CR>

" ------------------------------

" if added changes to search.c to ui_delay() after give_warning()
"set matchtime=3

" no incremental search ...
set noincsearch

" make n always search forward and N backward
vnoremap <expr> n 'Nn'[v:searchforward]
vnoremap <expr> N 'nN'[v:searchforward]

" if set nowrapscan then get -
" E384: search hit TOP without match for: <search-exp>
" E385: search hit BOTTOM without match for: <search-exp>
" could also get -
" E486: Pattern not found: <search-exp>
" catch /^Vim\%((\a\+)\)\=:E385/

" hack to pause a little on search wraps ...
" causes too many redraws

nnoremap <buffer> <silent> n :call <SID>Searchn()<CR>
nnoremap <buffer> <silent> N :call <SID>SearchN()<CR>
function s:Searchn() abort
  let l:stext=@/
  if (len(l:stext) == 0)
    return
  endif
  try
    nunmap <buffer> n
  catch /E31:/
  endtry
  set nows
  try
    "exe "normal n"
    exe "silent normal /\<CR>"
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
      " eat typeahead ...
      while getchar(0)
          sleep 1m
      endwhile
      redraw!
      if has("nvim")
          echo "\r"
      endif
    catch /E486:/
      echo " "
      redraw
      echohl WarningMsg
      echo "E486: Pattern not found: " . l:stext
      echohl None
      sleep 200m
      " eat typeahead ...
      while getchar(0)
          sleep 1m
      endwhile
      redraw!
      echo "\r"
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
          sleep 1m
      endwhile
      redraw!
      if has("nvim")
          echo "\r"
      endif
    catch /E486:/
      echo " "
      redraw
      echohl WarningMsg
      echo "E486: Pattern not found: " . l:stext
      echohl None
      sleep 200m
      " eat typeahead ...
      while getchar(0)
          sleep 1m
      endwhile
      redraw!
      echo "\r"
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
  try
    nunmap <buffer> N
  catch /E31:/
  endtry
  set nows
  try
    "exe "normal N"
    exe "silent normal ?\<CR>"
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
          sleep 1m
      endwhile
      redraw!
      if has("nvim")
          echo "\r"
      endif
    catch /E486:/
      echo " "
      redraw
      echohl WarningMsg
      echo "E486: Pattern not found: " . l:stext
      echohl None
      sleep 200m
      " eat typeahead ...
      while getchar(0)
          sleep 1m
      endwhile
      redraw!
      echo "\r"
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
      " eat typeahead ...
      while getchar(0)
          sleep 1m
      endwhile
      redraw!
      if has("nvim")
          echo "\r"
      endif
    catch /E486:/
      echo " "
      redraw
      echohl WarningMsg
      echo "E486: Pattern not found: " . l:stext
      echohl None
      sleep 200m
      " eat typeahead ...
      while getchar(0)
          sleep 1m
      endwhile
      redraw!
      echo "\r"
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
" read/write .viminfo file, don't save/restore registers -
" NOTE: do not want to overwrite existing */+ registers
"       as that is the current selection/clipboard
set viminfo='20,/20,:20,<0
" keep 20 lines of command line history
set history=20
" :help 'viminfo' (with quotes) for more info
" show the cursor position all the time
set ruler

" display parts of long lines when wrap is on
set display+=lastline

set selection=inclusive

function s:CrossHairs() abort
    set cursorline
    set cursorcolumn
    redraw
    sleep 200m
    " eat typeahead ...
    while getchar(0)
          sleep 1m
    endwhile
    set nocursorline
    set nocursorcolumn
endfunction
nmap <silent> + :call <SID>CrossHairs()<CR>

" -------- mouse / cut - paste - clipboard --------

" to disable mouse in visual mode
"set mouse-=a
" to get mouse support and
" selection buffer copied automatically to clipboard
"set mouse=nv
" all modes / full support
set mouse=a

" use shift + left click to get terminal selection (mouse=~a)

" ====================================================
" --- CLIPBOARD --------------------------------------
" ====================================================

" selection '*' (XA_PRIMARY/unnamed) (ie mouse 'middle-click')
" clipboard '+' (XA_CLIPBOARD/unnamedplus) (ie ctrl-shift-c/v, cut/paste)

" Should we use none or * or + or both * and + ?
" NOTE: With a clipboard mgr, using both _may_ cause problems.
"       Use * and have clipboard mgr sync to + and then vim will
"       clear * (selection) at exit; we can optionally restore *
"       Use + and have clipboard mgr sync to * and then vim will
"       clear + (clipboard) at exit; we can optionally restore +
"       And using both clears both at exit ...
" NOTE: one issue with preserving clipboard at vim exit is that
"       + and * are loaded at start up (even if registers are not saved!)
"       so exiting vim can change the clipboard without having actually
"       selected anything - so initialize + and * at startup also ...

set clipboard^=unnamed
set clipboard-=unnamedplus

" preserve clipboard(s) at exit ...
function! s:PreserveClipboard() abort
    if executable("copyq") && executable("myclip") && !exists('$SSH_CLIENT') && !exists('$VIM_SKIP_PRESERVE_CLIPBOARD')
        " if copyq and myclip exe and not ssh shell and special vim_skip_preserve_clipboard env not set ...
        "silent call system("setsid -w copyq >/dev/null 2>/dev/null copySelection -", getreg('*'))
        "silent call system("setsid -w copyq >/dev/null 2>/dev/null copy -", getreg('*'))
        " trim(getreg('*'), '\n', 2)

        " if contents have not changed then dont save as this will add a duplicate to the copyq list
        "if @* != @"
        "    silent call system("setsid -w myclip", getreg('*'))
        "endif

        " -------------------------------------
        " NOTE: dont seem to need this if block - but why ?
        let regtype = getregtype('*')
        if ! (regtype =~ "")
            silent call system("setsid -w myclip -", getreg('*'))
        endif
        " -------------------------------------

        " clear regs ?
        "call setreg('+', [])
        "call setreg('*', [])
        call setreg('x', [])
        call setreg('y', [])
    endif
endfunction
autocmd VimLeave * silent call <SID>PreserveClipboard()

" save reg type for next vim session
function! s:SaveRegType() abort
    if has("nvim")
        return
    endif
    let regtype = getregtype('*')
    let fname = fnamemodify("~/.vimsrt", ":p")
    " TODO: obtain lock/mutex to prevent collisions ...
    call writefile([regtype], fname, "b")
endfunction
if !has("nvim")
    autocmd VimLeavePre * call <SID>SaveRegType()
endif

" initially set + and * regs (and regtype), even if clipboard empty ...
" otherwise they can get loaded from elsewhere
function s:InitializeClipboard()
    if executable("copyq") && executable("myclip") && !exists('$SSH_CLIENT')
        " if copyq and myclip exe and copyq not running and not ssh shell then start it ...
        if executable("pgrep")
            let copyqpid = system('pgrep --exact copyq')
            if empty(copyqpid)
                silent call system('setsid copyq &')
                sleep 651m
            endif
        endif
        if !exists('$VIM_SKIP_PRESERVE_CLIPBOARD')
            "let clipdata = system("copyq clipboard")
            let clipdata = system("myclip --o")
            if empty(clipdata)
                "echom "clearing out + and * registers"
                call setreg('+', [])
                call setreg('*', [])
            else
                "echom "initializing + and * registers"
                if !has("nvim")
                    " try to also restore regtype ...
                    let regtype = []
                    let fname = fnamemodify("~/.vimsrt", ":p")
                    " TODO: obtain lock/mutex to prevent collisions ...
                    let regtype = readfile(fname, "b")
                    if len(regtype) == 1
                        call setreg('+', clipdata, regtype[0])
                        call setreg('*', clipdata, regtype[0])
                    else
                        call setreg('+', clipdata)
                        call setreg('*', clipdata)
                    endif
                else
                    call setreg('+', clipdata)
                    call setreg('*', clipdata)
                endif
            endif
            call setreg('x', [])
            call setreg('y', [])
        endif
    endif
endfunction
autocmd VimEnter * call <SID>InitializeClipboard()

" NOTE: removing autoselect means visual selection is not automatically copied to unnamed clipboard (*)
"       also removing autoselectml makes things fail weirdly
"       this also affects getregtype("*") se we need to use visualmode() instead
set clipboard-=autoselect
set clipboard-=autoselectplus
" add this to get decent mouse selection and copy to clipboard when in command-mode ...
if !has("nvim")
    set clipboard^=autoselectml guioptions+=A
endif

" ====================================================
" --- CLIPBOARD --------------------------------------
" ====================================================

" --- KEYMAP -------------

" NOTE: nvim handles <M-y> mapping ok, vim only sees <Esc>y ...
" NOTE: it seems we want terminal to send <C-b> instead of <C-B>, at least with xterm
" NOTE: do we want to map both <C-b> and <C-B> ?
" NOTE: do we send <C-b> or <C-B> ?
" NOTE: it seems <M-C-B> works so far for lower case (no shift) b ...

" --- KEYMAP -------------

" NOTE: use MapFastKeycode(<Fxx>, ...) to remove explicit leading <Esc> from mappings ...
" then with no mappings starting with <Esc> we can increase ttimeoutlen for mapped and
" <Leader> key sequences without having a delay on <Esc> ...
"set timeoutlen=1000 ttimeoutlen=0
"set notimeout ttimeout timeoutlen=100
set timeout timeoutlen=1500
set ttimeout ttimeoutlen=7
"set nottimeout

" use <S-Tab> as a left-handed . (dot) ...
"nnoremap <S-Tab> .
"vnoremap <S-Tab> .
" SKIP: for now use <A-a> (S-F28) and along with that use
"       <A-Up/Down/Right/Left> as app keys and not tmux ...
" And <A-e> for undo

" NOTE: cannot nmap <Tab> because it affects code nav <C-i> to go back to previous jump
"nnoremap <buffer> <Tab> 4l
"vnoremap <buffer> <Tab> 4l

" <S-Tab> as an undo or as a 4h ?
"nnoremap <buffer> <S-Tab> 4h
"vnoremap <buffer> <S-Tab> 4h

" a for insert after cursor is confusing, and accidentally typed often, use i instead
nnoremap a <Nop>

" s/S is confusing, use cl/cc instead
nnoremap s <Nop>
vnoremap s <Nop>
nnoremap S <Nop>
vnoremap S <Nop>

" dont exit this way ...
noremap ZZ <Nop>

" dont do this in visual mode ...
vnoremap J <Nop>

" tag stack (<C-t>) remapped ...
 noremap <C-t> <Nop>

nnoremap <silent> <C-t>t         :tabnext<CR>
nnoremap <silent> <C-t><C-t>     :tabnext<CR>
nnoremap <silent> <C-t><Left>    :tabprevious<CR>
nnoremap <silent> <C-t><Right>   :tabnext<CR>
nnoremap <silent> <C-t><C-Left>  :tabprevious<CR>
nnoremap <silent> <C-t><C-Right> :tabnext<CR>

vnoremap <silent> <C-t>t         <C-\><C-n>:<C-u>tabnext<CR>
vnoremap <silent> <C-t><C-t>     <C-\><C-n>:<C-u>tabnext<CR>
vnoremap <silent> <C-t><Left>    <C-\><C-n>:<C-u>tabprevious<CR>
vnoremap <silent> <C-t><Right>   <C-\><C-n>:<C-u>tabnext<CR>
vnoremap <silent> <C-t><C-Left>  <C-\><C-n>:<C-u>tabprevious<CR>
vnoremap <silent> <C-t><C-Right> <C-\><C-n>:<C-u>tabnext<CR>

nnoremap <silent> <C-t><Tab>     :tabnext<CR>
nnoremap <silent> <C-t><S-Tab>   :tabprevious<CR>

vnoremap <silent> <C-t><Tab>     <C-\><C-n>:<C-u>tabnext<CR>
vnoremap <silent> <C-t><S-Tab>   <C-\><C-n>:<C-u>tabprevious<CR>

" alternate <Leader> cmd for tag stack ...
" (<Leader>t? is usually for tab-based cmds)
 noremap <silent> <Leader><C-t> <C-t>

 noremap <silent> <C-t><C-^>     <Nop>

nnoremap <silent> <C-t><BS>      :tabnext<CR>
nnoremap <silent> <C-t><C-BS>    :tabnext<CR>
nnoremap <silent> <C-t><C-^><BS> :tabnext<CR>

vnoremap <silent> <C-t><BS>      <C-\><C-n>:<C-u>tabnext<CR>
vnoremap <silent> <C-t><C-BS>    <C-\><C-n>:<C-u>tabnext<CR>
vnoremap <silent> <C-t><C-^><BS> <C-\><C-n>:<C-u>tabnext<CR>

nnoremap <silent> <C-t><Space>   :tabprevious<CR>
nnoremap <silent> <C-t><C-Space> :tabprevious<CR>
nnoremap <silent> <C-t><C-@>     :tabprevious<CR>

vnoremap <silent> <C-t><Space>   <C-\><C-n>:<C-u>tabprevious<CR>
vnoremap <silent> <C-t><C-Space> <C-\><C-n>:<C-u>tabprevious<CR>
vnoremap <silent> <C-t><C-@>     <C-\><C-n>:<C-u>tabprevious<CR>

nnoremap <silent> <M-Tab>        :tabnext<CR>
nnoremap <silent> <M-S-Tab>      :tabprevious<CR>
nnoremap <silent> <C-^><Tab>     :tabnext<CR>
nnoremap <silent> <C-^><S-Tab>   :tabprevious<CR>

vnoremap <silent> <M-Tab>        <C-\><C-n>:<C-u>tabnext<CR>
vnoremap <silent> <M-S-Tab>      <C-\><C-n>:<C-u>tabprevious<CR>
vnoremap <silent> <C-^><Tab>     <C-\><C-n>:<C-u>tabnext<CR>
vnoremap <silent> <C-^><S-Tab>   <C-\><C-n>:<C-u>tabprevious<CR>

" dont do this, it messes up viw ...
"vnoremap i <Nop>

" ------------------------------

" MapFastKeycode: helper for fast keycode mappings
" makes use of unused vim keycodes <[S-]F15> to <[S-]F37>
" indx 15-37 for <F15-37>, indx 115-137 for <S-F15-37>
" NOTE: also look into fixtermkeys.vim from http://www.leonerd.org.uk/hacks/vim/fixtermkeys.html
function! s:MapFastKeycode(key, keycode, indx)
    let lindx = a:indx
    if lindx < 15
        echohl WarningMsg
        echomsg "Warning: key ".a:key." cannot be mapped, invalid indx:".lindx
        echohl None
        return
    elseif lindx > 37 && lindx < 115
        echohl WarningMsg
        echomsg "Warning: key ".a:key." cannot be mapped, invalid indx:".lindx
        echohl None
        return
    elseif lindx > 137
        echohl WarningMsg
        echomsg "Warning: key ".a:key." cannot be mapped, invalid indx:".lindx
        echohl None
        return
    endif
    if exists("g:loaded_tmux_focus_events") || exists("g:autoloaded_tmux_focus_events")
        " NOTE: tmux focus plugin uses F24, F25
        if lindx == 24 || lindx == 25
            echohl WarningMsg
            echomsg "Warning: key ".a:key." cannot be mapped - is reserved (tmux focus), indx:".lindx
            echohl None
            return
        endif
    endif
    let vkeycode = '<F'.lindx.'>'
    if lindx > 100
        let lindx -= 100
        let vkeycode = '<S-F'.lindx.'>'
    endif
    " skip over existing mappings ...
    if !hasmapto('vkeycode', 'nvoict') && (maparg('vkeycode', 'nvoict') ==# '' || maparg('vkeycode', 'nvoict') ==# '<Nop>')
        exec 'set  '.vkeycode.'='.a:keycode
        exec 'map  '.vkeycode.' '.a:key
        exec 'imap '.vkeycode.' '.a:key
        exec 'cmap '.vkeycode.' '.a:key
        exec 'tmap '.vkeycode.' '.a:key
    else
        echohl WarningMsg
        echomsg "Warning: key ".a:key." cannot be mapped - already has a mapping, indx:".lindx
        echohl None
    endif
endfunction

" NOTE: only for term =~ ^screen || ^tmux || ^xterm || ^alacritty || ^rxvt || ^urxvt ?

" NOTE: if we use these then they do not work in popups,
"       do not map <Up>/<Down>/<Home><End> this way,
"       use set <xUp>/<xDown>/<xHome>/<xEnd> as below
"call <SID>MapFastKeycode('<C-Up>',         "\e[1;5A", 15)
"call <SID>MapFastKeycode('<C-Down>',       "\e[1;5B", 16)
"call <SID>MapFastKeycode('<C-Left>',       "\e[1;5D", 17)
"call <SID>MapFastKeycode('<C-Right>',      "\e[1;5C", 18)

"call <SID>MapFastKeycode('<S-Up>',         "\e[1;2A", 19)
"call <SID>MapFastKeycode('<S-Down>',       "\e[1;2B", 20)
" <A-S-Del> - (vim) reverse case four letters at a time ...
call <SID>MapFastKeycode('<F20>',           "\e[3;4~", 20) " A-S-Del
"call <SID>MapFastKeycode('<S-Left>',       "\e[1;2D", 21)
" <A-S-Insert> - (vim) reverse case four letters at a time ...
call <SID>MapFastKeycode('<F21>',           "\e[2;4~", 21) " A-S-Insert
"call <SID>MapFastKeycode('<S-Right>',      "\e[1;2C", 22)
" <A-C-Insert> - (vim) reverse case four letters at a time ...
call <SID>MapFastKeycode('<F22>',           "\e[2;7~", 22) " A-C-Insert

"call <SID>MapFastKeycode('<C-S-Up>',       "\e[1;6A", 23)
" NOTE: need to skip MapFastKeycode('<F24>') as its used by tmux focus plugin
" NOTE: need to skip MapFastKeycode('<F25>') as its used by tmux focus plugin
"call <SID>MapFastKeycode('<C-S-Down>',     "\e[1;6B", 26)
"call <SID>MapFastKeycode('<C-S-Left>',     "\e[1;6D", 27)
"call <SID>MapFastKeycode('<C-S-Right>',    "\e[1;6C", 28)

"call <SID>MapFastKeycode('<A-Up>',         "\e[1;3A", 29)
"call <SID>MapFastKeycode('<A-Down>',       "\e[1;3B", 30)
"call <SID>MapFastKeycode('<A-Left>',       "\e[1;3D", 31)
"call <SID>MapFastKeycode('<A-Right>',      "\e[1;3C", 32)

" NOTE: <A-S-U/D/L/R> used by tmux to resize panes
"call <SID>MapFastKeycode('<A-S-Up>',       "\e[1;4A", xx)
"call <SID>MapFastKeycode('<A-S-Down>',     "\e[1;4B", xx)
"call <SID>MapFastKeycode('<A-S-Left>',     "\e[1;4D", xx)
"call <SID>MapFastKeycode('<A-S-Right>',    "\e[1;4C", xx)

" --------- x maps -----------

call <SID>MapFastKeycode('<F33>',     "\e[2;5~", 33) " C-Insert
call <SID>MapFastKeycode('<F34>',     "\e[2;2~", 34) " S-Insert
call <SID>MapFastKeycode('<F35>',     "\e[2;6~", 35) " C-S-Insert
" NOTE: <A-Insert> used by tmux/gnome for copyq toggle
"call <SID>MapFastKeycode('<A-Insert>',     "\e[2;3~", xx) " A-Insert

call <SID>MapFastKeycode('<F36>',     "\e[3;5~", 36) " C-Del
call <SID>MapFastKeycode('<F37>',     "\e[3;2~", 37) " S-Del
" NOTE: start at 100 + 15 ...
call <SID>MapFastKeycode('<S-F15>',   "\e[3;6~", 115) " C-S-Del
call <SID>MapFastKeycode('<S-F16>',   "\e[3;3~", 116) " A-Del

" NOTE: <Home> (khome) can be: ^[[H or ^[[1~ or ^[[7~
"call <SID>MapFastKeycode('<C-Home>',       "\e[1;5H", 117)
" <S-Home>
" <C-S-Home>
"call <SID>MapFastKeycode('<A-Home>',       "\e[1;3H", 119)
" <A-S-Home>

" NOTE: <End>  (kend)  can be: ^[[F or ^[[4~ or ^[[8~
"call <SID>MapFastKeycode('<C-End>',        "\e[1;5F", 118)
" <S-End>
" <C-S-End>
"call <SID>MapFastKeycode('<A-End>',        "\e[1;3F", 120)
" <A-S-End>

call <SID>MapFastKeycode('<S-F21>',   "\e[5;5~", 121) " C-PageUp
call <SID>MapFastKeycode('<S-F17>',   "\e[5;2~", 117) " S-PageUp
call <SID>MapFastKeycode('<S-F22>',   "\e[5;6~", 122) " C-S-PageUp
call <SID>MapFastKeycode('<S-F23>',   "\e[5;3~", 123) " A-PageUp
call <SID>MapFastKeycode('<S-F19>',   "\e[5;4~", 119) " A-S-PageUp

call <SID>MapFastKeycode('<S-F24>',   "\e[6;5~", 124) " C-PageDown
call <SID>MapFastKeycode('<S-F18>',   "\e[6;2~", 118) " S-PageDown
call <SID>MapFastKeycode('<S-F25>',   "\e[6;6~", 125) " C-S-PageDown
call <SID>MapFastKeycode('<S-F26>',   "\e[6;3~", 126) " A-PageDown
call <SID>MapFastKeycode('<S-F20>',   "\e[6;4~", 120) " A-S-PageDown

" NOTE: addl mappings start at <S-F27> 127 ...
"       so we have what is not used above ...

" This used to be <S-Tab> but <A-e> seems better.
call <SID>MapFastKeycode('<F32>',  "\ee", 32)
nnoremap <buffer> <F32> u
vnoremap <buffer> <F32> u
cnoremap <F32> <C-v><Esc>e
inoremap <F32> <C-v><Esc>e
tnoremap <F32> <Esc>e
if has("nvim")
    nnoremap <buffer> <M-e> u
    vnoremap <buffer> <M-e> u
    cnoremap <F32> <M-e>
    inoremap <F32> <M-e>
    tnoremap <F32> <M-e>
endif

" This used to be <S-Tab> but <A-a> seems better.
" Or how about <A-`> ?
" And with this, use <A-Up/Down/Right/Left> as app keys and not tmux ...
call <SID>MapFastKeycode('<S-F28>',  "\e`", 128)
nmap <S-F28> .
vmap <S-F28> .
cnoremap <S-F28> <C-v><Esc>a
inoremap <S-F28> <C-v><Esc>a
tnoremap <S-F28> <Esc>a
if has("nvim")
    nmap <M-`> .
    vmap <M-`> .
    cnoremap <S-F28> <M-`>
    inoremap <S-F28> <M-`>
    tnoremap <S-F28> <M-`>
endif

" <A-C-P> for fzf preview ...
call <SID>MapFastKeycode('<S-F27>',  "\e\<C-p>", 127)
" so <M-C-P> goes up to match <M-C-N> goes down
noremap <S-F27> <C-p>
" map it back to orig in terminal so fzf can use it as ctrl-alt-p ...
cnoremap <S-F27> <C-v><Esc><C-v>
inoremap <S-F27> <C-v><Esc><C-v>
tnoremap <S-F27> <Esc><C-p>
if has("nvim")
    cnoremap <S-F27> <M-C-P>
    inoremap <S-F27> <M-C-P>
    tnoremap <S-F27> <M-C-P>
endif

" ------------------------------

" to get all of top/bottom lines ...
nnoremap 1G 1G0
nnoremap gg 1G0
nnoremap G  G0
vnoremap 1G 1G0
vnoremap gg 1G0
vnoremap G  G$

call <SID>MapFastKeycode('<F18>',  "\eg", 18)
nnoremap <F18> 1G0
vnoremap <F18> 1G0
cnoremap <F18> <C-v><Esc>g
inoremap <F18> <C-v><Esc>g
tnoremap <F18> <Esc>g
if has("nvim")
    nnoremap <M-g> 1G0
    vnoremap <M-g> 1G0
    cnoremap <F18> <M-g>
    inoremap <F18> <M-g>
    tnoremap <F18> <M-g>
endif

call <SID>MapFastKeycode('<F19>',  "\eG", 19)
nnoremap <F19> G0
vnoremap <F19> G$
cnoremap <F19> <C-v><Esc>G
inoremap <F19> <C-v><Esc>G
tnoremap <F19> <Esc>G
if has("nvim")
    nnoremap <M-G> G0
    vnoremap <M-G> G$
    cnoremap <F19> <M-G>
    inoremap <F19> <M-G>
    tnoremap <F19> <M-G>
endif

" ------------------------------

" use <M-x> instead of <C-x> for advanced terminal mappings ...
" (we use <C-x> as a single key mapping in a few other places)
call <SID>MapFastKeycode('<F17>',  "\ex", 17)
cnoremap <F17> <C-v><Esc>x
inoremap <F17> <C-v><Esc>x
tnoremap <F17> <Esc>x
if has("nvim")
    cnoremap <F17> <M-x>
    inoremap <F17> <M-x>
    tnoremap <F17> <M-x>
endif

" ------------------------------

" resize windows
" NOTE: do not use w<Up> mapping, as then all
" 'w' cmds (including dw) take timeoutlen ...

" Up/Down/Left/Right confusing as its really larger/smaller not directional
" use +/-/,/.
map <Leader>w+   <C-w>5+
" also map = same, as its easier than +
map <Leader>w=   <C-w>5+

map <Leader>w-   <C-w>5-

map <Leader>w,   <C-w>5<
" also map < same
map <Leader>w<   <C-w>5<

map <Leader>w.   <C-w>5>
" also map > same
map <Leader>w>   <C-w>5>

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

" NOTE: <F34> is mapped to paste below
"   and <F33> is vmapped to copy selection below
nmap <silent> <F33>      <Nop>
nmap <silent> <C-Insert> <Nop>
imap <silent> <F33>      <Esc>l
imap <silent> <C-Insert> <Esc>l
cmap <silent> <F33>      <Nop>
cmap <silent> <C-Insert> <Nop>
tmap <silent> <F33>      <Nop>
tmap <silent> <C-Insert> <Nop>

" <A-C-Insert> - (vim) reverse case four letters at a time
" but this is painful when using A-C-BS to switch tmux windows and we press it accitdentally
map <silent>  <F22>         <Nop>
map <silent>  <M-C-Insert>  <Nop>
imap <silent> <F22>         <Esc>l
imap <silent> <M-C-Insert>  <Esc>l

" NOTE: <A-Insert> used by tmux for copyq toggle
map  <silent> <A-Insert> <Nop>
imap <silent> <A-Insert> <Nop>
cmap <silent> <A-Insert> <Nop>
tmap <silent> <A-Insert> <Nop>

" <A-S-Insert> - (vim) reverse case four letters at a time ...
map  <silent> <F21>         <Nop>
map  <silent> <A-S-Insert>  <Nop>
imap <silent> <F21>         <Esc>l
imap <silent> <A-S-Insert>  <Esc>l

" ---------------------------

" NOTE: X apps might use S-PageUp/Down to scroll alt screen ...
" <S-F17> => <S-PageUp>
" <S-F18> => <S-PageDown>

 noremap <silent> <expr> <S-F17>        (line('.') == line('w$')) ? '5k' : '5<C-y>5k'
 noremap <silent> <expr> <S-PageUp>     (line('.') == line('w$')) ? '5k' : '5<C-y>5k'
 noremap <silent> <expr> <S-F18>        (line('.') == line('w0')) ? '5j' : ((line('$') - line('w$')) < 5) ? 'mfG`f5j' : '5<C-e>5j'
 noremap <silent> <expr> <S-PageDown>   (line('.') == line('w0')) ? '5j' : ((line('$') - line('w$')) < 5) ? 'mfG`f5j' : '5<C-e>5j'

inoremap <silent> <expr> <S-F17>        pumvisible() ? '<Up>'   : '<C-\><C-o>:call <SID>Saving_scrollVUp1("<C-V><C-U>")<CR>'
inoremap <silent> <expr> <S-PageUp>     pumvisible() ? '<Up>'   : '<C-\><C-o>:call <SID>Saving_scrollVUp1("<C-V><C-U>")<CR>'
inoremap <silent> <expr> <S-F18>        pumvisible() ? '<Down>' : '<C-\><C-o>:call <SID>Saving_scrollVDn1("<C-V><C-D>")<CR>'
inoremap <silent> <expr> <S-PageDown>   pumvisible() ? '<Down>' : '<C-\><C-o>:call <SID>Saving_scrollVDn1("<C-V><C-D>")<CR>'

" <S-F19> => <A-S-PageUp>
" <S-F20> => <A-S-PageDown>

 noremap <silent> <expr> <S-F19>        (line('.') == line('w$')) ? '10k' : '10<C-y>10k'
 noremap <silent> <expr> <A-S-PageUp>   (line('.') == line('w$')) ? '10k' : '10<C-y>10k'
 noremap <silent> <expr> <S-F20>        (line('.') == line('w0')) ? '10j' : ((line('$') - line('w$')) < 10) ? 'mfG`f10j' : '10<C-e>10j'
 noremap <silent> <expr> <A-S-PageDown> (line('.') == line('w0')) ? '10j' : ((line('$') - line('w$')) < 10) ? 'mfG`f10j' : '10<C-e>10j'

inoremap <silent> <expr> <S-F19>        pumvisible() ? '<Up>'   : '<C-\><C-o>:call <SID>Saving_scrollVUp1("<C-V><C-U>")<CR>'
inoremap <silent> <expr> <A-S-PageUp>   pumvisible() ? '<Up>'   : '<C-\><C-o>:call <SID>Saving_scrollVUp1("<C-V><C-U>")<CR>'
inoremap <silent> <expr> <S-F20>        pumvisible() ? '<Down>' : '<C-\><C-o>:call <SID>Saving_scrollVDn1("<C-V><C-D>")<CR>'
inoremap <silent> <expr> <A-S-PageDown> pumvisible() ? '<Down>' : '<C-\><C-o>:call <SID>Saving_scrollVDn1("<C-V><C-D>")<CR>'

" ---------------------------

map  <silent> <A-Home> 0
imap <silent> <A-Home> <C-o>0
cmap <silent> <A-Home> <Nop>
tmap <silent> <A-Home> <Nop>
" TODO: <S-Home> ?
" TODO: <C-S-Home> ?
" TODO: <A-S-Home> ?

map  <silent> <A-End> $
imap <silent> <A-End> <C-o>$
cmap <silent> <A-End> <Nop>
tmap <silent> <A-End> <Nop>
" TODO: <S-End> ?
" TODO: <C-S-End> ?
" TODO: <A-S-End> ?

" ------------------------------

" This code from Vim tips to restore window exactly as it was

" Save current view settings on a per-window, per-buffer basis.
function! AutoSaveWinView()
    if &diff
        return
    endif
    if !exists("w:SavedBufView")
        let w:SavedBufView = {}
    endif
    let w:SavedBufView[bufnr("%")] = winsaveview()
endfunction

" Restore current view settings.
function! AutoRestoreWinView()
    if &diff
        return
    endif
    let buf = bufnr("%")
    if exists("w:SavedBufView") && has_key(w:SavedBufView, buf)
        let v = winsaveview()
        let atStartOfFile = v.lnum == 1 && v.col == 0
        if atStartOfFile
            call winrestview(w:SavedBufView[buf])
        endif
        unlet w:SavedBufView[buf]
    endif
endfunction

" When switching buffers, preserve window view.
aug winrest
    au!
    autocmd BufLeave * call AutoSaveWinView()
    autocmd BufEnter * call AutoRestoreWinView()
aug END

" ----------- yank / cut / paste -----------

" explicit force load @* to clipboard ...
function! ForceLoadNammedReg() abort
    if executable("copyq") && executable("myclip")
        " if copyq and myclip exe ...
        "silent call system("setsid -w xsel -i -b --rmlastnl --sc 0", getreg('+'))
        silent call system("setsid -w myclip -", getreg('*'))
        echohl DiffText | echo "@* -> clipboard ; register copied" | echohl None
        sleep 651m
        redraw!
        echo " "
    else
        echohl WarningMsg | echo "copyq/myclip not found, cannot set clipboard" | echohl None
    endif
endfunction
nnoremap <silent> <Leader>lr :call ForceLoadNammedReg()<CR>
vnoremap <silent> <Leader>lr :<C-u>call ForceLoadNammedReg()<CR>

" ----------------------

function! s:CopyReg(arg)
    call setreg('x', getreg('*'), getregtype('*'))
    if a:arg == 1
        echohl DiffText | echo "@* -> @x ; register copied" | echohl None
        sleep 651m
        redraw!
        echo " "
    endif
endfunction

" copy @* to @x ...
nnoremap <silent> <Leader>zc :call <SID>CopyReg(1)<CR>
vnoremap <silent> <Leader>zc :<C-u>call <SID>CopyReg(1)<CR>gv

" ----------------------

function! s:SwapReg(arg)
    call setreg('y', getreg('*'), getregtype('*'))
    call setreg('*', getreg('x'), getregtype('x'))
    call setreg('x', getreg('y'), getregtype('y'))
    call setreg('y', [])
    if a:arg == 1
        echohl DiffText | echo "@* <-> @x ; registers swapped" | echohl None
        sleep 651m
        redraw!
        echo " "
    endif
endfunction

" swap @* with @x ...
nnoremap <silent> <Leader>zx :call <SID>SwapReg(1)<CR>
vnoremap <silent> <Leader>zx :<C-u>call <SID>SwapReg(1)<CR>gv

" replace highlighted selection with x reg (usually after swapping * with x (<Leader>zx))
" NOTE: yanking now fills reg x with previous reg * ...
" NOTE: see all visual mode 'p' mapping for similar method ...
vnoremap <silent> <Leader>zp "_x"xP<Esc>

" only works for visual mode ...
nnoremap <silent> <Leader>zp <Nop>

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
            echo " "
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
        echo " "
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

" C-S-v / S-Insert / M-! / C-S-Insert / M-* - paste ...

" cannot differentiate between C-S-v and C-v ...
"nnoremap <expr> <C-S-v> (&buftype == 'terminal') ? '<Nop>' : 'p'
"vnoremap <expr> <C-S-v> (&buftype == 'terminal') ? '<Nop>' : '<Esc>p'
"inoremap <C-S-v> <C-r>+
"cnoremap <C-S-v> <C-r>+
"tnoremap <C-S-v> <C-w>"+

" <F34> paste after
nnoremap <expr> <F34>      (&buftype == 'terminal') ? '<Nop>' : 'p'
nnoremap <expr> <S-Insert> (&buftype == 'terminal') ? '<Nop>' : 'p'
" NOTE: <F34>/<S-Insert> vmapped below ...
"vnoremap <expr> <F34> (&buftype == 'terminal') ? '<Nop>' : '<Esc>p'
inoremap <silent> <F34>      <C-\><C-o>:set paste<CR><C-r>*<C-\><C-o>:set nopaste<CR>
inoremap <silent> <S-Insert> <C-\><C-o>:set paste<CR><C-r>*<C-\><C-o>:set nopaste<CR>
cnoremap <F34>      <C-r>*
cnoremap <S-Insert> <C-r>*
tnoremap <F34>      <C-w>"*
tnoremap <S-Insert> <C-w>"*

" <M-!> paste after [menu?]
call <SID>MapFastKeycode('<S-F34>',  "\e!", 134)
nnoremap <expr> <S-F34> (&buftype == 'terminal') ? '<Nop>' : 'p'
vnoremap <expr> <S-F34> (&buftype == 'terminal') ? '<Nop>' : '<Esc>p'
inoremap <silent> <S-F34> <C-\><C-o>:set paste<CR><C-r>*<C-\><C-o>:set nopaste<CR>
cnoremap <S-F34> <C-r>*
tnoremap <S-F34> <C-w>"*
if has("nvim")
    nnoremap <expr> <M-!> (&buftype == 'terminal') ? '<Nop>' : 'p'
    vnoremap <expr> <M-!> (&buftype == 'terminal') ? '<Nop>' : '<Esc>p'
    inoremap <silent> <M-!> <C-\><C-o>:set paste<CR><C-r>*<C-\><C-o>:set nopaste<CR>
    cnoremap <M-!> <C-r>*
    tnoremap <M-!> <C-w>"*
endif

" <F35> paste before
nnoremap <expr> <F35>        (&buftype == 'terminal') ? '<Nop>' : 'P`['
nnoremap <expr> <C-S-Insert> (&buftype == 'terminal') ? '<Nop>' : 'P`['
" NOTE: <F35>/<C-S-Insert> vmapped below ...
"vnoremap <expr> <F35> (&buftype == 'terminal') ? '<Nop>' : '<Esc>P`['
inoremap <silent> <F35>        <C-\><C-o>:set paste<CR><C-\><C-o>mp<C-r>*<C-\><C-o>:set nopaste<CR><C-\><C-o>`p
inoremap <silent> <C-S-Insert> <C-\><C-o>:set paste<CR><C-\><C-o>mp<C-r>*<C-\><C-o>:set nopaste<CR><C-\><C-o>`p
cnoremap <F35>        <C-r>*
cnoremap <C-S-Insert> <C-r>*
tnoremap <F35>        <C-w>"*
tnoremap <C-S-Insert> <C-w>"*

" <M-*> paste before [menu?]
call <SID>MapFastKeycode('<S-F35>',  "\e*", 135)
nnoremap <expr> <S-F35> (&buftype == 'terminal') ? '<Nop>' : 'P`]'
vnoremap <expr> <S-F35> (&buftype == 'terminal') ? '<Nop>' : '<Esc>P`]'
inoremap <silent> <S-F35> <C-\><C-o>:set paste<CR><C-r>*<C-\><C-o>:set nopaste<CR>
cnoremap <S-F35> <C-r>*
tnoremap <S-F35> <C-w>"*
if has("nvim")
    nnoremap <expr> <M-*> (&buftype == 'terminal') ? '<Nop>' : 'P`]'
    vnoremap <expr> <M-*> (&buftype == 'terminal') ? '<Nop>' : '<Esc>P`]'
    inoremap <silent> <M-*> <C-\><C-o>:set paste<CR><C-r>*<C-\><C-o>:set nopaste<CR>
    cnoremap <M-*> <C-r>*
    tnoremap <M-*> <C-w>"*
endif

" C-S-c / M-& copy ...

" cannot differentiate between C-S-c and C-c ...
"nnoremap <C-S-c> <Nop>
"vnoremap <C-S-c> "*y
"inoremap <C-S-c> <Nop>

" some terminal configs (urxvt) map C-S-c => M-&
call <SID>MapFastKeycode('<S-F36>',  "\e&", 136)
nnoremap <S-F36> <Nop>
vmap <expr> <S-F36> (mode() =~ "\<C-v>") ? 'ty' : 'mvty`v'
cnoremap <S-F36> <C-v><Esc>&
inoremap <S-F36> <C-v><Esc>&
tnoremap <S-F36> <Esc>&
if has("nvim")
    nnoremap <M-&> <Nop>
    vmap <expr> <M-&> (mode() =~ "\<C-v>") ? 'ty' : 'mvty`v'
    cnoremap <S-F36> <M-&>
    inoremap <S-F36> <M-&>
    tnoremap <S-F36> <M-&>
endif

" C-S-x / M-( cut ...

" cannot differentiate between C-S-x and C-x ...
"nnoremap <C-S-x> <Nop>
"vnoremap <expr> <C-S-x> (&buftype == 'terminal') ? '<Nop>' : '"*d'
"inoremap <C-S-x> <Nop>

call <SID>MapFastKeycode('<S-F37>',  "\e(", 137)
nnoremap <S-F37> <Nop>
vmap <expr> <S-F37> (&buftype == 'terminal') ? '<Nop>' : 'tx'
cnoremap <S-F37> <C-v><Esc>(
inoremap <S-F37> <C-v><Esc>(
tnoremap <S-F37> <Esc>(
if has("nvim")
    nnoremap <M-(> <Nop>
    vmap <expr> <M-(> (&buftype == 'terminal') ? '<Nop>' : 'tx'
    cnoremap <S-F37> <M-(>
    inoremap <S-F37> <M-(>
    tnoremap <S-F37> <M-(>
endif

" cut selection
"vnoremap <silent> <C-x> "*d<LeftRelease>
" NOTE: <C-x>] may be mapped above for terminal ...
nnoremap <C-x> <Nop>
" NOTE: seems more logical/safe to have <C-x> quit than cut ?
"vmap <expr> <C-x> (&buftype == 'terminal') ? '<Nop>' : 'tx'
"vmap <expr> <C-x> (&buftype == 'terminal') ? '<Nop>' : '<Esc>'
vmap <C-x> <Nop>

" ---------------

" <C-v> to toggle block-mode instead of on or cancel visual-mode
" simple and almost there -
"xnoremap <silent> <expr> <C-v> mode()=="\<C-v>" ? "v" : "\<C-v>"

" if these two are pressed together quickly it may scroll when not wanted ...
" cannot really do this as then a single <C-v> suffers a delay ...
"noremap <silent> <C-v><C-Up>    <C-v>
"noremap <silent> <C-v><C-Down>  <C-v>

let w:vc = 'u'
let w:vp = 'u'
nnoremap <silent> <C-v> :<C-u>call <SID>MyVisCvN()<CR>
function! s:MyVisCvN()
    " if ctrl char typed then skip first one to prevent down/up scroll
    sleep 300m
    call inputsave()
    let typahead = getchar(1)
    call inputrestore()
    while getchar(0)
          sleep 1m
    endwhile
    let w:vc = 'x'
    let w:vp = 'u'
    exe "silent! normal! \<C-v>"
endfunction

xnoremap <silent> <C-v> <C-\><C-n>:<C-u>call <SID>MyVisCv()<CR>
function! s:MyVisCv()
    " if ctrl char typed then skip first one to prevent down/up scroll
    sleep 300m
    call inputsave()
    let typahead = getchar(1)
    call inputrestore()
    while getchar(0)
          sleep 1m
    endwhile
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

" <C-q> seems to start visual mode ...
nmap <C-q> <Nop>

" q to exit visual-mode and clear previous w:v* states
" if we just map q to <Esc> then q works well to go back to original mode,
" (ie a visual select from insert ...) but then if we want to get out of
" insert we need 2 key stokes - q + <Esc> ...
"xnoremap q <Esc>
xnoremap <silent> q     <C-\><C-n>:<C-u>call <SID>MyVisQ()<CR>
"xnoremap <silent> Q     <C-\><C-n>:<C-u>call <SID>MyVisQ()<CR>
xnoremap <silent> <C-q> <C-\><C-n>:<C-u>call <SID>MyVisQ()<CR>

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
        echo " "
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
" NOTE: use <F34> or <C-S-v> instead ...

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

if has("nvimSKIP_MINIYANK") " miniyank
    nmap <silent> <buffer> <expr> P (&buftype == 'terminal') ? '<Nop>' : '<Plug>(miniyank-autoPut)`['
else
    nmap <silent> <buffer> <expr> P (&buftype == 'terminal') ? '<Nop>' : 'P`['
endif

" Make p in Visual mode replace the selected text with the previous + register.
" NOTE: see also <Leader>zx / <Leader>zp above ...
"vnoremap <silent> <buffer> <expr> p (&buftype == 'terminal') ? '<Nop>' : ':<C-u>call <SID>SwapReg(0)<CR>gv"_x"xP'
if has("nvimSKIP_MINIYANK") " miniyank
    vmap <silent> <buffer> <expr> p (&buftype == 'terminal') ? '<Nop>' : '"_x"*<Plug>(miniyank-autoPut)'
    vmap <silent> <buffer> <expr> P (&buftype == 'terminal') ? '<Nop>' : '"_x"*<Plug>(miniyank-autoPut)'
else
    vmap <silent> <buffer> <expr> p (&buftype == 'terminal') ? '<Nop>' : '"_x"*P'
    vmap <silent> <buffer> <expr> P (&buftype == 'terminal') ? '<Nop>' : '"_x"*P'
endif

" skip <F34> as a vis-mode 'replace' ...
"vnoremap <silent> <buffer> <expr> <F34>   (&buftype == 'terminal') ? '<Nop>' : 's'

if has("nvimSKIP_MINIYANK") " miniyank
    vmap <silent> <buffer> <expr> <F34>      (&buftype == 'terminal') ? '<Nop>' : '"_x"*<Plug>(miniyank-autoPut)'
    vmap <silent> <buffer> <expr> <S-Insert> (&buftype == 'terminal') ? '<Nop>' : '"_x"*<Plug>(miniyank-autoPut)'
    vmap <silent> <buffer> <expr> <F35>        (&buftype == 'terminal') ? '<Nop>' : '"_x"*<Plug>(miniyank-autoPut)'
    vmap <silent> <buffer> <expr> <C-S-Insert> (&buftype == 'terminal') ? '<Nop>' : '"_x"*<Plug>(miniyank-autoPut)'
else
    vmap <silent> <buffer> <expr> <F34>      (&buftype == 'terminal') ? '<Nop>' : '"_x"*P'
    vmap <silent> <buffer> <expr> <S-Insert> (&buftype == 'terminal') ? '<Nop>' : '"_x"*P'
    vmap <silent> <buffer> <expr> <F35>        (&buftype == 'terminal') ? '<Nop>' : '"_x"*P'
    vmap <silent> <buffer> <expr> <C-S-Insert> (&buftype == 'terminal') ? '<Nop>' : '"_x"*P'
endif

" NOTE: to match legacy editors/DOS/etc -
"  <F33> is copy
"  <F34> is paste (mapped below)
"  <F37> is cut (mapped below)
vmap <silent> <expr> <F33>      (&buftype ==# 'terminal') ? 'tyi' : (mode() =~ "\<C-v>") ? 'ty' : 'mvty`v'
vmap <silent> <expr> <C-Insert> (&buftype ==# 'terminal') ? 'tyi' : (mode() =~ "\<C-v>") ? 'ty' : 'mvty`v'
vmap <silent> <F37>   tx
vmap <silent> <S-Del> tx

" ---------------------------------------------------------------------------------
" NOTE: TMUX C-Insert in terminal does not use bracketed-paste, but <C-S-v> is ok
" ---------------------------------------------------------------------------------

" set paste mode, paste, set nopaste mode
function! WrapForTmux_NOTUSED(as)
  if !exists('$TMUX')
    return a:as
  endif
  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"
  return tmux_start . substitute(a:as, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

" not needed anymore
"if !exists('$VIM_TERMINAL')
"   let &t_SI .= WrapForTmux("\<Esc>[?2004h")
"   let &t_EI .= WrapForTmux("\<Esc>[?2004l")
"endif

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

" mouse paste etc.

nnoremap <M-C-LeftMouse> <Nop>
vnoremap <M-C-LeftMouse> <Nop>
inoremap <M-C-LeftMouse> <Nop>
tnoremap <M-C-LeftMouse> <LeftMouse>

nnoremap <M-C-2-LeftMouse> <Nop>
vnoremap <M-C-2-LeftMouse> <Nop>
inoremap <M-C-2-LeftMouse> <Nop>
tnoremap <M-C-2-LeftMouse> <2-LeftMouse>

nnoremap <M-C-3-LeftMouse> <Nop>
vnoremap <M-C-3-LeftMouse> <Nop>
inoremap <M-C-3-LeftMouse> <Nop>
tnoremap <M-C-3-LeftMouse> <3-LeftMouse>

nnoremap <M-C-4-LeftMouse> <Nop>
vnoremap <M-C-4-LeftMouse> <Nop>
inoremap <M-C-4-LeftMouse> <Nop>
tnoremap <M-C-4-LeftMouse> <Nop>

nnoremap <M-C-MiddleMouse> <Nop>
vnoremap <M-C-MiddleMouse> <Nop>
inoremap <M-C-MiddleMouse> <Nop>
tnoremap <M-C-MiddleMouse> <MiddleMouse>

nnoremap <M-C-2-MiddleMouse> <Nop>
vnoremap <M-C-2-MiddleMouse> <Nop>
inoremap <M-C-2-MiddleMouse> <Nop>
tnoremap <M-C-2-MiddleMouse> <2-MiddleMouse>

nnoremap <M-C-3-MiddleMouse> <Nop>
vnoremap <M-C-3-MiddleMouse> <Nop>
inoremap <M-C-3-MiddleMouse> <Nop>
tnoremap <M-C-3-MiddleMouse> <3-MiddleMouse>

nnoremap <M-C-4-MiddleMouse> <Nop>
vnoremap <M-C-4-MiddleMouse> <Nop>
inoremap <M-C-4-MiddleMouse> <Nop>
tnoremap <M-C-4-MiddleMouse> <Nop>

nnoremap <M-C-RightMouse> <Nop>
vnoremap <M-C-RightMouse> <Nop>
inoremap <M-C-RightMouse> <Nop>
tnoremap <M-C-RightMouse> <RightMouse>

nnoremap <M-C-2-RightMouse> <Nop>
vnoremap <M-C-2-RightMouse> <Nop>
inoremap <M-C-2-RightMouse> <Nop>
tnoremap <M-C-2-RightMouse> <2-RightMouse>

nnoremap <M-C-3-RightMouse> <Nop>
vnoremap <M-C-3-RightMouse> <Nop>
inoremap <M-C-3-RightMouse> <Nop>
tnoremap <M-C-3-RightMouse> <3-RightMouse>

nnoremap <M-C-4-RightMouse> <Nop>
vnoremap <M-C-4-RightMouse> <Nop>
inoremap <M-C-4-RightMouse> <Nop>
tnoremap <M-C-4-RightMouse> <Nop>

" -----------------

nnoremap <MiddleMouse> <Nop>
vnoremap <MiddleMouse> <Nop>
inoremap <MiddleMouse> <Nop>
tnoremap <MiddleMouse> <Nop>

nnoremap <2-MiddleMouse> <Nop>
vnoremap <2-MiddleMouse> <Nop>
inoremap <2-MiddleMouse> <Nop>
tnoremap <2-MiddleMouse> <Nop>

nnoremap <3-MiddleMouse> <Nop>
vnoremap <3-MiddleMouse> <Nop>
inoremap <3-MiddleMouse> <Nop>
tnoremap <3-MiddleMouse> <Nop>

nnoremap <4-MiddleMouse> <Nop>
vnoremap <4-MiddleMouse> <Nop>
inoremap <4-MiddleMouse> <Nop>
tnoremap <4-MiddleMouse> <Nop>

" -----------------

nnoremap <C-MiddleMouse> <Nop>
vnoremap <C-MiddleMouse> <Nop>
inoremap <C-MiddleMouse> <Nop>
tnoremap <C-MiddleMouse> <Nop>

nnoremap <C-2-MiddleMouse> <Nop>
vnoremap <C-2-MiddleMouse> <Nop>
inoremap <C-2-MiddleMouse> <Nop>
tnoremap <C-2-MiddleMouse> <Nop>

nnoremap <C-3-MiddleMouse> <Nop>
vnoremap <C-3-MiddleMouse> <Nop>
inoremap <C-3-MiddleMouse> <Nop>
tnoremap <C-3-MiddleMouse> <Nop>

nnoremap <C-4-MiddleMouse> <Nop>
vnoremap <C-4-MiddleMouse> <Nop>
inoremap <C-4-MiddleMouse> <Nop>
tnoremap <C-4-MiddleMouse> <Nop>

" -----------------

nnoremap <A-MiddleMouse> <Nop>
vnoremap <A-MiddleMouse> <Nop>
inoremap <A-MiddleMouse> <Nop>
tnoremap <A-MiddleMouse> <Nop>

nnoremap <A-2-MiddleMouse> <Nop>
vnoremap <A-2-MiddleMouse> <Nop>
inoremap <A-2-MiddleMouse> <Nop>
tnoremap <A-2-MiddleMouse> <Nop>

nnoremap <A-3-MiddleMouse> <Nop>
vnoremap <A-3-MiddleMouse> <Nop>
inoremap <A-3-MiddleMouse> <Nop>
tnoremap <A-3-MiddleMouse> <Nop>

nnoremap <A-4-MiddleMouse> <Nop>
vnoremap <A-4-MiddleMouse> <Nop>
inoremap <A-4-MiddleMouse> <Nop>
tnoremap <A-4-MiddleMouse> <Nop>

" could add `[ to go back to orig col ...

" ---- if want vim menu ----

let g:list3b = ['Copy', 'Paste', 'Quit']
function! My3BFilter(id, key)
    " is <C-c> available in filter ? or use a callback to capture that close
    if a:key == "q" || a:key == "x" || a:key == "\<Esc>" || a:key == "\<C-c>"
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
tnoremap <C-RightMouse> <Nop>

nnoremap <C-2-RightMouse> <Nop>
vnoremap <C-2-RightMouse> <Nop>
inoremap <C-2-RightMouse> <Nop>
tnoremap <C-2-RightMouse> <Nop>

nnoremap <C-3-RightMouse> <Nop>
vnoremap <C-3-RightMouse> <Nop>
inoremap <C-3-RightMouse> <Nop>
tnoremap <C-3-RightMouse> <Nop>

nnoremap <C-4-RightMouse> <Nop>
vnoremap <C-4-RightMouse> <Nop>
inoremap <C-4-RightMouse> <Nop>
tnoremap <C-4-RightMouse> <Nop>

" ---------------

"nnoremap <A-RightMouse> p
"vnoremap <A-RightMouse> p
"inoremap <A-RightMouse> <C-o>p

"nnoremap <A-2-RightMouse> p
"vnoremap <A-2-RightMouse> p
"inoremap <A-2-RightMouse> <C-o>p

"nnoremap <A-3-RightMouse> p
"vnoremap <A-3-RightMouse> p
"inoremap <A-3-RightMouse> <C-o>p

"nnoremap <A-4-RightMouse> p
"vnoremap <A-4-RightMouse> p
"inoremap <A-4-RightMouse> <C-o>p

nnoremap <A-RightMouse> <Nop>
vnoremap <A-RightMouse> <Nop>
inoremap <A-RightMouse> <Nop>
tnoremap <A-RightMouse> <Nop>

nnoremap <A-2-RightMouse> <Nop>
vnoremap <A-2-RightMouse> <Nop>
inoremap <A-2-RightMouse> <Nop>
tnoremap <A-2-RightMouse> <Nop>

nnoremap <A-3-RightMouse> <Nop>
vnoremap <A-3-RightMouse> <Nop>
inoremap <A-3-RightMouse> <Nop>
tnoremap <A-3-RightMouse> <Nop>

nnoremap <A-4-RightMouse> <Nop>
vnoremap <A-4-RightMouse> <Nop>
inoremap <A-4-RightMouse> <Nop>
tnoremap <A-4-RightMouse> <Nop>

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

aug setival
    au!
    au InsertEnter * let @i="2"
    au InsertLeave * if (!(mode() =~ 'n')) | let @i="0" | endif
aug END

" see mousetime for double-click delay

" DoubleClick for word (lbvhe/lbve) (is h needed ?)
nmap <2-LeftMouse> mvviwTygvzygv
if !has("nvim")
    vmap <expr> <2-LeftMouse> (@i=="2") ? '<Esc>i<C-\><C-o>viwTy<C-\><C-o>gvzy<C-\><C-o>gv' : '<C-\><C-n>viwTy<C-\><C-n>gvzy<C-\><C-n>gv'
    imap <2-LeftMouse> <C-\><C-o>viwTy<C-\><C-o>gvzy<C-\><C-o>gv
else
    vmap <expr> <2-LeftMouse> (@i=="2") ? '<Esc>viwTygvzyi<C-\><C-o>gv' : '<C-\><C-n>viwTy<C-\><C-n>gvzy<C-\><C-n>gv'
    imap <2-LeftMouse> <Esc>viwTygvzyi<C-\><C-o>gv
endif
"imap <silent> <2-LeftMouse> <C-\><C-o>:let @i="2"<bar>:call <SID>GetWord(1)<CR>

" TripleClick for next larger entity, not whole line (lBvhE/lBvE) (is h needed ?)
"nnoremap <silent> <3-LeftMouse> mvviWygv
"vnoremap <silent> <3-LeftMouse> mviWygv

" NOTE: Use GetPath instead of lBvhE/lBvE (is h needed ?)
"nnoremap <3-LeftMouse> <LeftMouse>:call GetPath(1,1)<CR>
"vnoremap <3-LeftMouse> <LeftMouse><C-\><C-n>:call GetPath(1,1)<CR>
nmap <3-LeftMouse> mvviWTygvzygv
if !has("nvim")
    vmap <expr> <3-LeftMouse> (@i=="2") ? '<Esc>i<C-\><C-o>viWTy<C-\><C-o>gvzy<C-\><C-o>gv' : '<C-\><C-n>viWTy<C-\><C-n>gvzy<C-\><C-n>gv'
    imap <3-LeftMouse> <C-\><C-o>viWTy<C-\><C-o>gvzy<C-\><C-o>gv
else
    vmap <expr> <3-LeftMouse> (@i=="2") ? '<Esc>viWTygvzyi<C-\><C-o>gv' : '<C-\><C-n>viWTy<C-\><C-n>gvzy<C-\><C-n>gv'
    imap <3-LeftMouse> <Esc>viWTygvzyi<C-\><C-o>gv
endif
"imap <silent> <3-LeftMouse> <C-\><C-o>:let @i="2"<bar>:call <SID>GetWord2(1)<CR>

" QuadrupleClick for whole line
nmap <4-LeftMouse> mvVTygvzygv
if !has("nvim")
    vmap <expr> <4-LeftMouse> (@i=="2") ? '<Esc>i<C-\><C-o>VTy<C-\><C-o>gvzy<C-\><C-o>gv' : '<C-\><C-n>VTy<C-\><C-n>gvzy<C-\><C-n>gv'
    imap <4-LeftMouse> <C-\><C-o>VTy<C-\><C-o>gvzy<C-\><C-o>gv
else
    vmap <expr> <4-LeftMouse> (@i=="2") ? '<Esc>VTygvzyi<C-\><C-o>gv' : '<C-\><C-n>VTy<C-\><C-n>gvzy<C-\><C-n>gv'
    imap <4-LeftMouse> <Esc>VTygvzyi<C-\><C-o>gv
endif
"imap <silent> <4-LeftMouse> <C-\><C-o>:let @i="2"<bar>:call <SID>GetLine(1)<CR>

" change C-LeftMouse searching tags file for symbol under cursor
" and select words under cursor instead (lBvhE/lBvE) (is h needed ?)
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
"inoremap <silent> <C-2-LeftMouse> <C-\><C-o>:let @i="2"<bar>:call <SID>GetWord(1)<CR>

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

" TripleClick for next larger entity, not whole line (lBvhE/lBvE) (is h needed ?)
"nmap <C-3-LeftMouse> mvviWtygv
"vmap <C-3-LeftMouse> <Esc>mvviWtygv
"inoremap <silent> <expr> <C-3-LeftMouse> (@j=="0") ? '<LeftMouse><C-\><C-o>:let @j="1"<bar>:call <SID>GetWord(1)<CR>' : '<LeftMouse><C-\><C-o>:call <SID>GetPath(1,1)<CR>'

" QuadrupleClick for whole line
"nmap <C-4-LeftMouse> mvVtygv
"vmap <C-4-LeftMouse> <Esc>mvVtygv
"inoremap <C-4-LeftMouse> <Nop>
" --------------------------------

" TODO: use Alt mapping where we leave vis-mode upon release ...
nmap <silent> <C-2-LeftMouse>      mvviwty:call <SID>Delay(1)<CR><Esc>
vmap <silent> <C-2-LeftMouse> <Esc>mvviwty:call <SID>Delay(1)<CR><Esc>
imap <silent> <C-2-LeftMouse> <LeftMouse><C-\><C-o>:let @j="1"<bar>:call <SID>GetWord(2)<CR>

if exists('$TMUX_PANE')
    nmap <silent> <C-3-LeftMouse> <Nop>
    vmap <silent> <C-3-LeftMouse> <Nop>
    imap <silent> <C-3-LeftMouse> <Nop>

    nmap <silent> <C-4-LeftMouse> <Nop>
    vmap <silent> <C-4-LeftMouse> <Nop>
else
    nmap <silent> <C-3-LeftMouse> <LeftMouse>:call <SID>GetPath(2,1)<CR>
    vmap <silent> <C-3-LeftMouse> <LeftMouse><C-\><C-n>:call <SID>GetPath(2,1)<CR>
    imap <silent> <C-3-LeftMouse> <LeftMouse><C-\><C-o>:call <SID>GetPath(2,1)<CR>

    nmap <silent> <C-4-LeftMouse>      mvVty:call <SID>Delay(1)<CR><Esc>
    vmap <silent> <C-4-LeftMouse> <Esc>mvVty:call <SID>Delay(1)<CR><Esc>
endif

imap <silent> <C-4-LeftMouse> <Nop>

" NOTE: tmux maps C-Triple to M-C to be able to know its a triple-click ...
call <SID>MapFastKeycode('<S-F32>',  "\eC", 132)
"nmap <silent> <S-F32> mvviWty:call <SID>Delay(1)<CR><Esc>
"vmap <silent> <S-F32> <Esc>mvviWty:call <SID>Delay(1)<CR><Esc>
"nmap <silent> <expr> <S-F32> (@j=="0") ? '<LeftMouse>:let @j="1"<bar>:call <SID>GetWord(2)<CR>' : '<LeftMouse>:call <SID>GetPath(2,1)<CR>'
"vmap <silent> <expr> <S-F32> (@j=="0") ? '<LeftMouse><C-\><C-n>:let @j="1"<bar>:call <SID>GetWord(2)<CR>' : '<LeftMouse><C-\><C-n>:call <SID>GetPath(2,1)<CR>'
nmap <silent> <S-F32> <LeftMouse>:call <SID>GetPath(2,1)<CR>
vmap <silent> <S-F32> <LeftMouse><C-\><C-n>:call <SID>GetPath(2,1)<CR>
imap <silent> <S-F32> <LeftMouse><C-\><C-o>:call <SID>GetPath(2,1)<CR>
if has("nvim")
    "nmap <silent> <M-C> mvviWty:call <SID>Delay(1)<CR><Esc>
    "vmap <silent> <M-C> <Esc>mvviWty:call <SID>Delay(1)<CR><Esc>
    "nmap <silent> <expr> <M-C> (@j=="0") ? '<LeftMouse>:let @j="1"<bar>:call <SID>GetWord(2)<CR>' : '<LeftMouse>:call <SID>GetPath(2,1)<CR>'
    "vmap <silent> <expr> <M-C> (@j=="0") ? '<LeftMouse><C-\><C-n>:let @j="1"<bar>:call <SID>GetWord(2)<CR>' : '<LeftMouse><C-\><C-n>:call <SID>GetPath(2,1)<CR>'
    nmap <silent> <M-C> <LeftMouse>:call <SID>GetPath(2,1)<CR>
    vmap <silent> <M-C> <LeftMouse><C-\><C-n>:call <SID>GetPath(2,1)<CR>
    imap <silent> <M-C> <LeftMouse><C-\><C-o>:call <SID>GetPath(2,1)<CR>
endif

vmap <silent> <C-LeftRelease> tygv:<C-u>call <SID>Delay(0)<CR><Esc>
imap <silent> <C-LeftMouse> <C-\><C-o>:let @i="2"<CR><LeftMouse>

" ------------------------------
" TODO: inside A-2-LeftMouse functions, check for 3rd click ...
"    let c = getchar()
"    if c == '\<LeftMouse>' && v:mouse_win > 0
" ------------------------------

function! s:Delay(arg) abort
    if a:arg == 1
        silent exe "normal! gv"
        "redraw
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
    echo " "
endfunction

" ------------------------------

" M- same as C- (was viW)
" NOTE: copy/yank and returns to normal mode
" NOTE: these were <A-2-LeftRelease>

" NOTE: single click after double ...

nmap <silent> <A-2-LeftMouse>      mvviwty:call <SID>Delay(1)<CR><Esc>
vmap <silent> <A-2-LeftMouse> <Esc>mvviwty:call <SID>Delay(1)<CR><Esc>
imap <silent> <A-2-LeftMouse> <LeftMouse><C-\><C-o>:let @j="1"<bar>:call <SID>GetWord(2)<CR>

if exists('$TMUX_PANE')
    nmap <silent> <A-3-LeftMouse> <Nop>
    vmap <silent> <A-3-LeftMouse> <Nop>
    imap <silent> <A-3-LeftMouse> <Nop>

    nmap <silent> <A-4-LeftMouse> <Nop>
    vmap <silent> <A-4-LeftMouse> <Nop>
else
    nmap <silent> <A-3-LeftMouse> <LeftMouse>:call <SID>GetPath(2,1)<CR>
    vmap <silent> <A-3-LeftMouse> <LeftMouse><C-\><C-n>:call <SID>GetPath(2,1)<CR>
    imap <silent> <A-3-LeftMouse> <LeftMouse><C-\><C-o>:call <SID>GetPath(2,1)<CR>

    nmap <silent> <A-4-LeftMouse>      mvVty:call <SID>Delay(1)<CR><Esc>
    vmap <silent> <A-4-LeftMouse> <Esc>mvVty:call <SID>Delay(1)<CR><Esc>
endif

imap <silent> <A-4-LeftMouse> <Nop>

" NOTE: tmux maps A-Triple to M-B to be able to know its a triple-click ...
call <SID>MapFastKeycode('<S-F33>',  "\eB", 133)
"nmap <silent> <S-F33> mvviWty:call <SID>Delay(1)<CR><Esc>
"vmap <silent> <S-F33> <Esc>mvviWty:call <SID>Delay(1)<CR><Esc>
"nmap <silent> <expr> <S-F33> (@j=="0") ? '<LeftMouse>:let @j="1"<bar>:call <SID>GetWord(2)<CR>' : '<LeftMouse>:call <SID>GetPath(2,1)<CR>'
"vmap <silent> <expr> <S-F33> (@j=="0") ? '<LeftMouse><C-\><C-n>:let @j="1"<bar>:call <SID>GetWord(2)<CR>' : '<LeftMouse><C-\><C-n>:call <SID>GetPath(2,1)<CR>'
nmap <silent> <S-F33> <LeftMouse>:call <SID>GetPath(2,1)<CR>
vmap <silent> <S-F33> <LeftMouse><C-\><C-n>:call <SID>GetPath(2,1)<CR>
imap <silent> <S-F33> <LeftMouse><C-\><C-o>:call <SID>GetPath(2,1)<CR>
if has("nvim")
    "nmap <silent> <M-B> mvviWty:call <SID>Delay(1)<CR><Esc>
    "vmap <silent> <M-B> <Esc>mvviWty:call <SID>Delay(1)<CR><Esc>
    "nmap <silent> <expr> <M-B> (@j=="0") ? '<LeftMouse>:let @j="1"<bar>:call <SID>GetWord(2)<CR>' : '<LeftMouse>:call <SID>GetPath(2,1)<CR>'
    "vmap <silent> <expr> <M-B> (@j=="0") ? '<LeftMouse><C-\><C-n>:let @j="1"<bar>:call <SID>GetWord(2)<CR>' : '<LeftMouse><C-\><C-n>:call <SID>GetPath(2,1)<CR>'
    nmap <silent> <M-B> <LeftMouse>:call <SID>GetPath(2,1)<CR>
    vmap <silent> <M-B> <LeftMouse><C-\><C-n>:call <SID>GetPath(2,1)<CR>
    imap <silent> <M-B> <LeftMouse><C-\><C-o>:call <SID>GetPath(2,1)<CR>
endif

vmap <silent> <A-LeftRelease> tygv:<C-u>call <SID>Delay(0)<CR><Esc>
imap <silent> <A-LeftMouse> <C-\><C-o>:let @i="2"<CR><LeftMouse>

" ------------------------------

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
"imap <silent> <expr> <A-3-LeftMouse> (@j=="0") ? '<LeftMouse><C-\><C-o>:let @j="1"<bar>:call <SID>GetWord(2)<CR>' : '<LeftMouse><C-\><C-o>:call <SID>GetPath(2,1)<CR>'
"inoremap <silent> <expr> <A-4-LeftMouse> (@j=="0") ? '<LeftMouse><C-\><C-o>:let @j="1"<bar>:call <SID>GetWord(2)<CR>' : '<LeftMouse><C-\><C-o>:call <SID>GetPath(2,1)<CR>'

" TODO: or could select and copy whole line ?
" NOTE: need to set z reg to 'c' also ... (this y is not YankIt)
"nnoremap <silent> <expr> <A-LeftRelease> (&filetype == 'GV') ? '' : '<LeftRelease>Vy:let @z="c"<CR>gv'
" or call YankIt() ...
"nnoremap <silent> <expr> <A-LeftRelease> (&filetype == 'GV') ? '' : '<LeftRelease>V<C-\><C-n>:echo "copied to clipboard"<bar>:sleep 651m<bar>:call YankIt("*y")<bar>:redraw!<CR>
" NOTE: M- Drag end now copies selection to clipboard and returns to normal mode
"vnoremap <silent> <A-LeftRelease> <C-\><C-n>mv<LeftRelease><C-\><C-n>:echo "copied to clipboard"<bar>:sleep 651m<bar>:call YankIt("*y", 2)<bar>:redraw!<CR>`v
"vnoremap <silent> <expr> <A-LeftRelease> (@i=="1") ? '<C-\><C-n>mv<LeftRelease><C-\><C-n>:let @i="0"<bar>:echo "copied to clipboard"<bar>:sleep 651m<bar>:call YankIt("*y", 2)<bar>:redraw!<CR>`v<Esc>i' : '<C-\><C-n>mv<LeftRelease><C-\><C-n>:echo "copied to clipboard"<bar>:sleep 651m<bar>:call YankIt("*y", 2)<bar>:redraw!<CR>`v'

" ------------------------------

" YankIt() now leaves cursor at end position ...
"vnoremap <expr> <A-LeftRelease> (@i=="1") ? '<LeftRelease><C-\><C-n>:let @i="0"<bar>:echo "copied to clipboard"<bar>:sleep 651m<bar>:call YankIt("*y", 2)<bar>:redraw!<CR><Esc>i' : '<LeftRelease><C-\><C-n>:echo "copied to clipboard"<bar>:sleep 651m<bar>:call YankIt("*y", 2)<bar>:redraw!<CR>'
"vnoremap <expr> <A-LeftRelease> (@i=="1") ? '<LeftRelease><C-\><C-n>:let @i="0"<bar>:echo "copied to clipboard"<bar>:sleep 651m<bar>:call YankIt("*y", 2)<CR><Esc>i' : '<LeftRelease><C-\><C-n>:echo "copied to clipboard"<bar>:sleep 651m<bar>:call YankIt("*y", 2)<CR>'
"vmap <expr> <A-LeftRelease> (@i=="1") ? '<LeftRelease><C-\><C-n>:<C-u>sleep 651m<bar>:let @i="0"<bar>:call YankIt("*y", 2)<CR><Esc>i' : '<LeftRelease><C-\><C-n>:<C-u>sleep 651m<bar>:call YankIt("*y", 2)<CR>'

"vmap <A-LeftRelease> "*ygv

"vnoremap <A-2-LeftRelease>  <Nop>
"vnoremap <A-3-LeftRelease>  <Nop>
"vnoremap <A-4-LeftRelease>  <Nop>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Word commands NOTE: selection is USUALLY copied to clipboard
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" highlight word under cursor (lbvhe/lbve) (is h needed ?)
" NOTE: also copy to clipboard (since its not a mouse click event) ?
"nmap <silent> <Leader>ws mv:call <SID>CopyReg(0)<CR>viwtygv
nmap <silent> <Leader>ws mvviw
vmap <silent> <Leader>ws <C-\><C-n>mvviw

" highlight WORD under cursor (lBvhE/lBvE) (does not use iskeyword) (is h needed ?)
" NOTE: also copy to clipboard (since its not a mouse click event) ?
nmap <silent> <Leader>wS mvviW
vmap <silent> <Leader>wS <C-\><C-n>mvviW

" grab file path (ie w / and w/o :)
" NOTE: also copy to clipboard (since its not a mouse click event) ?
nmap <silent> <Leader>wp mv:call <SID>GetPath(0,0)<CR>
vmap <silent> <Leader>wp mv<C-\><C-n>:call <SID>GetPath(0,0)<CR>

" grab url path (ie w / and w :) but really about the same as \wS
nmap <silent> <Leader>wP mv:call <SID>GetPath(0,1)<CR>
vmap <silent> <Leader>wP mv<C-\><C-n>:call <SID>GetPath(0,1)<CR>

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
nmap <silent> <Leader>wg viwtybb:set hlsearch<CR>/<C-r>*<CR>
nmap <silent> <Leader>wG viwtyw:set hlsearch<CR>?<C-r>*<CR>
" -----------------------------------------------------

" search for visual selection
" if register is regex with literal metachars then :let @/=escape(@", '.*\\$^')
"vnoremap <silent> <Leader>wf y <Bar> <Esc>:let @/=@"<CR> <Bar> 2n
" (without copying selection to clipboard)
vnoremap <silent> <Leader>wf "sybb<C-\><C-n>:set hlsearch<CR>/<C-r>s<CR>
vnoremap <silent> <Leader>wF "syw<C-\><C-n>:set hlsearch<CR>?<C-r>s<CR>

" to match normal mode (copying selection to clipboard)
vmap <silent> <Leader>wg tybb<C-\><C-n>:set hlsearch<CR>/<C-r>*<CR>
vmap <silent> <Leader>wG tyw<C-\><C-n>:set hlsearch<CR>?<C-r>*<CR>

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
nnoremap <silent> <Leader>wx "_ciw<C-r>*<Esc>
if has("nvimSKIP_MINIYANK") " miniyank
    vmap <silent> <Leader>wx "_x"*<Plug>(miniyank-autoPut)
else
    vmap <silent> <Leader>wx "_x"*P
endif

" replace at cursor pos with clipboard (not from beg of word like \we above)
nnoremap <silent> <Leader>wr "_cw<C-r>*<Esc>
if has("nvimSKIP_MINIYANK") " miniyank
    vmap <silent> <Leader>wr "_x"*<Plug>(miniyank-autoPut)
else
    vmap <silent> <Leader>wr "_x"*P
endif

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

" NOTE: <A-Return> (S-F31) to copy/end vis-mode to match tmux
call <SID>MapFastKeycode('<S-F31>',  "\e\<Return>", 131)
"vmap <silent> <S-F31> mvty`v
noremap <silent> <buffer> <S-F31> gk
cnoremap <S-F31> <C-v><Esc><Return>
inoremap <S-F31> <C-v><Esc><Return>
tnoremap <S-F31> <Esc><Return>
if has("nvim")
    noremap <silent> <buffer> <M-Return> gk
    cnoremap <S-F31> <M-Return>
    inoremap <S-F31> <M-Return>
    tnoremap <S-F31> <M-Return>
endif

noremap <silent> <expr> <M-BS> AtBot(0) ? '<C-y>' : '<C-y>k'
noremap <silent> <expr> <M-X>  AtBot(0) ? '<C-y>' : '<C-y>k'
" SPECIAL: <A-BS> is mapped to \eX in tmux - scroll up one line ...
call <SID>MapFastKeycode('<S-F30>',  "\eX", 130)
noremap <silent> <expr> <S-F30> AtBot(0) ? '<C-y>' : '<C-y>k'
" but unmap it in terminal so fzf can use it as alt-bs ...
cnoremap <S-F30> <C-v><Esc><BS>
inoremap <S-F30> <C-v><Esc><BS>
tnoremap <S-F30> <Esc><BS>
if has("nvim")
    cnoremap <S-F30> <M-BS>
    inoremap <S-F30> <M-BS>
    tnoremap <S-F30> <M-BS>
endif

noremap <silent> <expr> <M-Space> ((line('$') - line('w$')) < 1) ? 'gj' : AtTop(0) ? '<C-e>' : '<C-e>j'
" SPECIAL: <A-Space> is mapped to \eY in tmux - scroll down one line ...
call <SID>MapFastKeycode('<S-F29>',  "\eY", 129)
noremap <silent> <expr> <M-Y>     ((line('$') - line('w$')) < 1) ? 'gj' : AtTop(0) ? '<C-e>' : '<C-e>j'
noremap <silent> <expr> <S-F29> ((line('$') - line('w$')) < 1) ? 'gj' : AtTop(0) ? '<C-e>' : '<C-e>j'
" but unmap it in terminal so fzf can use it as alt-space ...
cnoremap <S-F29> <C-v><Esc><Space>
inoremap <S-F29> <C-v><Esc><Space>
tnoremap <S-F29> <Esc><Space>
if has("nvim")
    cnoremap <S-F29> <M-Space>
    inoremap <S-F29> <M-Space>
    tnoremap <S-F29> <M-Space>
endif

" -------------------

" trim trailing blanks ...
function s:MyTrimTrailingBlanks(mov) abort
    exe "normal g_"
    if line(".") != line("$")
        exe "normal l\"_D"
    endif
    if !empty(a:mov)
        exe "normal " . a:mov
        exe "normal g_"
    endif
endfunction

nnoremap <silent> <Leader>lx :call <SID>MyTrimTrailingBlanks('')<CR>
nnoremap <silent> <Leader>lk :call <SID>MyTrimTrailingBlanks('k')<CR>
nnoremap <silent> <Leader>lj :call <SID>MyTrimTrailingBlanks('j')<CR>

" trim all trailing blanks ...
function s:MyTrimAllTrailingBlanks() abort
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfunction

command! TTWS                   call <SID>MyTrimAllTrailingBlanks()
command! TrimAllLines           call <SID>MyTrimAllTrailingBlanks()
command! TrimTrailingWhiteSpace call <SID>MyTrimAllTrailingBlanks()

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
"nnoremap <silent> <expr> <F37> (col('.') == 1) ? '"_dW' : (col('.') != col('$')-1) ? '"_db' : ':call <SID>SDel()<CR>'
nnoremap <silent> <expr> <F37>   (col('.') == 1) ? '"_dW' : (col('.') != col('$')-1) ? '"_db' : (nr2char(strgetchar(getline('.')[col('.') - 1:], 0)) == ' ') ? '"_dvb' : '"_diw'
nnoremap <silent> <expr> <S-Del> (col('.') == 1) ? '"_dW' : (col('.') != col('$')-1) ? '"_db' : (nr2char(strgetchar(getline('.')[col('.') - 1:], 0)) == ' ') ? '"_dvb' : '"_diw'
" NOTE: *-Del in v-mode does not make much sense, Del deletes entire selection etc ...
vnoremap <silent>        <F37>   <Del>
vnoremap <silent>        <S-Del> <Del>
inoremap <silent> <expr> <F37>   (col('.') == 1) ? '<C-o>"_dW' : (col('.') != col('$')) ? '<C-o>"_db' : (nr2char(strgetchar(getline('.')[col('.') - 1:], 0)) == ' ') ? '<C-o>"_dvb' : '<C-o>"_diw'
inoremap <silent> <expr> <S-Del> (col('.') == 1) ? '<C-o>"_dW' : (col('.') != col('$')) ? '<C-o>"_db' : (nr2char(strgetchar(getline('.')[col('.') - 1:], 0)) == ' ') ? '<C-o>"_dvb' : '<C-o>"_diw'

" ctrl-del to delete from cursor to end of word, to match kill-word ...
" also skip alt-d
"nnoremap <silent> <expr> <F36> (col('.') == 1 && col('$') == 1) ? '"_dW' : (col('.') != col('$')-1) ? '"_de' : ':call <SID>CDel()<CR>'
nnoremap <silent> <expr> <F36>   (col('.') == 1 && col('$') == 1) ? '"_dW' : (col('.') != col('$')-1) ? '"_de' : (nr2char(strgetchar(getline('.')[col('.') - 1:], 0)) == ' ') ? '"_dvb' : '"_diw'
nnoremap <silent> <expr> <C-Del> (col('.') == 1 && col('$') == 1) ? '"_dW' : (col('.') != col('$')-1) ? '"_de' : (nr2char(strgetchar(getline('.')[col('.') - 1:], 0)) == ' ') ? '"_dvb' : '"_diw'
" NOTE: *-Del in v-mode does not make much sense, Del deletes entire selection etc ...
vnoremap <silent>        <F36>   <Del>
vnoremap <silent>        <C-Del> <Del>
inoremap <silent> <expr> <F36>   (col('.') == 1 && col('$') == 1) ? '<C-o>"_dW' : (col('.') != col('$')) ? '<C-o>"_de' : (nr2char(strgetchar(getline('.')[col('.') - 1:], 0)) == ' ') ? '<C-o>"_dvb' : '<C-o>"_diw'
inoremap <silent> <expr> <C-Del> (col('.') == 1 && col('$') == 1) ? '<C-o>"_dW' : (col('.') != col('$')) ? '<C-o>"_de' : (nr2char(strgetchar(getline('.')[col('.') - 1:], 0)) == ' ') ? '<C-o>"_dvb' : '<C-o>"_diw'

" ctrl-shift-del to delete whole word under cursor
"nnoremap <silent> <expr> <S-F15> (col('.') == 1 && col('$') == 1) ? '"_dW' : (col('.') != col('$')-1) ? 'lb"_dW' : ':call <SID>CSDel()<CR>'
nnoremap <silent> <expr> <S-F15>   (col('.') == 1 && col('$') == 1) ? '"_dW' : (col('.') != col('$')-1) ? 'lb"_dW' : (nr2char(strgetchar(getline('.')[col('.') - 1:], 0)) == ' ') ? '"_dvb' : '"_diw'
nnoremap <silent> <expr> <C-S-Del> (col('.') == 1 && col('$') == 1) ? '"_dW' : (col('.') != col('$')-1) ? 'lb"_dW' : (nr2char(strgetchar(getline('.')[col('.') - 1:], 0)) == ' ') ? '"_dvb' : '"_diw'
" NOTE: *-Del in v-mode does not make much sense, Del deletes entire selection etc ...
vnoremap <silent>        <S-F15>   <Del>
vnoremap <silent>        <C-S-Del> <Del>
inoremap <silent> <expr> <S-F15>   (col('.') == 1 && col('$') == 1) ? '<C-o>"_dW' : (col('.') != col('$')) ? '<Esc>llb"_dWi' : (nr2char(strgetchar(getline('.')[col('.') - 1:], 0)) == ' ') ? '<C-o>"_dvb' : '<C-o>"_diw'
inoremap <silent> <expr> <C-S-Del> (col('.') == 1 && col('$') == 1) ? '<C-o>"_dW' : (col('.') != col('$')) ? '<Esc>llb"_dWi' : (nr2char(strgetchar(getline('.')[col('.') - 1:], 0)) == ' ') ? '<C-o>"_dvb' : '<C-o>"_diw'

" NOTE: dont really need/use A-Del
" alt-del to delete whole word under cursor
nnoremap <silent> <expr> <S-F16> (col('.') == 1 && col('$') == 1) ? '"_dW' : (col('.') != col('$')-1) ? 'lb"_dW' : (nr2char(strgetchar(getline('.')[col('.') - 1:], 0)) == ' ') ? '"_dvb' : '"_diw'
nnoremap <silent> <expr> <A-Del> (col('.') == 1 && col('$') == 1) ? '"_dW' : (col('.') != col('$')-1) ? 'lb"_dW' : (nr2char(strgetchar(getline('.')[col('.') - 1:], 0)) == ' ') ? '"_dvb' : '"_diw'
" NOTE: *-Del in v-mode does not make much sense, Del deletes entire selection etc ...
vnoremap <silent>        <S-F16> <Del>
vnoremap <silent>        <A-Del> <Del>
inoremap <silent> <expr> <S-F16> (col('.') == 1 && col('$') == 1) ? '<C-o>"_dW' : (col('.') != col('$')) ? '<Esc>llb"_dWi' : (nr2char(strgetchar(getline('.')[col('.') - 1:], 0)) == ' ') ? '<C-o>"_dvb' : '<C-o>"_diw'
inoremap <silent> <expr> <A-Del> (col('.') == 1 && col('$') == 1) ? '<C-o>"_dW' : (col('.') != col('$')) ? '<Esc>llb"_dWi' : (nr2char(strgetchar(getline('.')[col('.') - 1:], 0)) == ' ') ? '<C-o>"_dvb' : '<C-o>"_diw'

" <A-S-Del> - (vim) reverse case four letters at a time ...
map <silent>  <F20>      <Nop>
map <silent>  <A-S-Del>  <Nop>
imap <silent> <F20>      <Esc>l
imap <silent> <A-S-Del>  <Esc>l

call <SID>MapFastKeycode('<F16>', "\e[3;7~", 16) " A-C-Del
map <silent>  <F16>         <Nop>
map <silent>  <M-C-Del>     <Nop>
imap <silent> <F16>         <Nop>
imap <silent> <M-C-Del>     <Nop>

" SPECIAL: TODO: add cmap <A-Del> and all the others ...

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab
"set noexpandtab

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
" <Leader>Qx to record to register x
" enter keys/cmds ...
" <Leader>Q to end recording
" 20@x to playback for 20 times ...
noremap Q <Nop>
noremap <silent> <Leader>Q q
nmap <silent> q <Nop>
" nvim
nnoremap <silent> <M-q> <Nop>
" NOTE: q will be re-mapped later on ...

" for block select beyond shorter line lengths
set virtualedit=block

" ------ scroll ------

set nostartofline
set scrolloff=0

" ---------

aug scrjump
    au!
    " TODO: not sure what is best
    " half window height (was winheight('%')/2, but -50 is 50%)
    au BufEnter,BufWinEnter,WinEnter,WinNew,VimResized * call <SID>MySetScrollJump(-50)
    " disable when in insert mode ...
    "au InsertEnter * call <SID>MySetScrollJump(1)
    "au InsertLeave * let &scrolljump=-50
aug END

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
nnoremap <silent> Z<S-Left>  10zh10h
nnoremap <silent> Z<S-Right> 10zl10l
vnoremap <silent> Z<S-Left>  10zh10h
vnoremap <silent> Z<S-Right> 10zl10l

" use <M-l> as l so we can do
" <M-l> for right and then <M-`> for repeat prev cmd
" and same for <M-h>
" NOTE: wish we could send CSI mappings for these ...
nnoremap <silent> <M-h>      h
nnoremap <silent> <M-l>      l
vnoremap <silent> <M-h>      h
vnoremap <silent> <M-l>      l
"nnoremap <silent> <M-h>      10zh10h
"nnoremap <silent> <M-l>      10zl10l
"vnoremap <silent> <M-h>      10zh10h
"vnoremap <silent> <M-l>      10zl10l
nnoremap <silent> <M-,>      10zh10h
nnoremap <silent> <M-.>      10zl10l
vnoremap <silent> <M-,>      10zh10h
vnoremap <silent> <M-.>      10zl10l

" to be consistent, <M-h>/<M-l> to move like h/l
inoremap <silent> <M-h>      <C-\><C-o>h
inoremap <silent> <M-l>      <C-\><C-o>l
"inoremap <silent> <M-h>      <C-\><C-o>10zh<C-\><C-o>10h
"inoremap <silent> <M-l>      <C-\><C-o>10zl<C-\><C-o>10l
inoremap <silent> <M-,>      <C-\><C-o>10zh<C-\><C-o>10h
inoremap <silent> <M-.>      <C-\><C-o>10zl<C-\><C-o>10l

" NOTE: tmux may send <C-^> + char for these ...
nnoremap <silent> <C-^>h     h
nnoremap <silent> <C-^>l     l
vnoremap <silent> <C-^>h     h
vnoremap <silent> <C-^>l     l
"nnoremap <silent> <C-^>h     10zh10h
"nnoremap <silent> <C-^>l     10zl10l
"vnoremap <silent> <C-^>h     10zh10h
"vnoremap <silent> <C-^>l     10zl10l
nnoremap <silent> <C-^>,     10zh10h
nnoremap <silent> <C-^>.     10zl10l
vnoremap <silent> <C-^>,     10zh10h
vnoremap <silent> <C-^>.     10zl10l

inoremap <silent> <C-^>h     <C-\><C-o>h
inoremap <silent> <C-^>l     <C-\><C-o>l
"inoremap <silent> <C-^>h     <C-\><C-o>10zh<C-\><C-o>10h
"inoremap <silent> <C-^>l     <C-\><C-o>10zl<C-\><C-o>10l
inoremap <silent> <C-^>,     <C-\><C-o>10zh<C-\><C-o>10h
inoremap <silent> <C-^>.     <C-\><C-o>10zl<C-\><C-o>10l

" NOTE: there is also M-H, M-L, M-<, M->

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

" N<C-D> and N<C-U> changes the scroll setting ...
function! s:Saving_scrollV(cmd)
  let save_scroll = &scroll
  " want normal! here
  execute "keepjumps normal!" . a:cmd
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
  execute "keepjumps normal!" . g:hal1 . a:cmd
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

" could also remap these ...
"nnoremap <silent> <expr> <C-D> (line('.') == line('w0')) ? g:hdn : '<C-D>'
"vnoremap <silent> <expr> <C-D> (line('.') == line('w0')) ? g:hdn : '<C-D><C-l>'
"nnoremap <silent> <expr> <C-U> (line('.') == line('w$')) ? g:hup : '<C-U>'
"vnoremap <silent> <expr> <C-U> (line('.') == line('w$')) ? g:hup : '<C-U><C-l>'

" to get back orig if needed
"noremap <Leader><C-D> <C-D>
"noremap <Leader><C-U> <C-U>

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
"nmap            k      gk
nmap            <Up>   gk
inoremap <expr> <Up>   pumvisible() ? '<Up>'   : '<C-\><C-o>gk'

"nmap            j      gj
nmap            <Down> gj
inoremap <expr> <Down> pumvisible() ? '<Down>' : '<C-\><C-o>gj'

noremap         <Home> g<Home>
inoremap <expr> <Home> pumvisible() ? '<Home>' : '<C-\><C-o>g<Home>'

noremap         <End>  g<End>
inoremap <expr> <End>  pumvisible() ? '<End>'  : '<C-\><C-o>g<End>'

" ---------

function AtTop(strict)
    return winline() == 1
endfunction

function AtBot(strict)
    return winline() == g:full
endfunction

"call <SID>NoremapNormalCmd("<C-j>",    0, "1<C-D>")
noremap <silent> <expr> <C-Down>   ((line('$') - line('w$')) < 1) ? 'gj' : AtTop(0) ? '<C-e>' : '<C-e>j'
noremap <silent> <expr> <C-j>      ((line('$') - line('w$')) < 1) ? 'gj' : AtTop(0) ? '<C-e>' : '<C-e>j'

noremap <silent> <expr> <C-S-Space> AtTop(0) ? ((line("$") - line("w$")) >= 10 ? '10<C-e>' : (line("$") - line("w$")) >= 9 ? '9<C-e>' : (line("$") - line("w$")) >= 8 ? '8<C-e>' : (line("$") - line("w$")) >= 7 ? '7<C-e>' : (line("$") - line("w$")) >= 6 ? '6<C-e>' : (line("$") - line("w$")) >= 5 ? '5<C-e>' : (line("$") - line("w$")) >= 4 ? '4<C-e>' : (line("$") - line("w$")) >= 3 ? '3<C-e>' : (line("$") - line("w$")) >= 2 ? '2<C-e>' :(line("$") - line("w$")) >= 1 ? '1<C-e>' : '\<Nop>') : ((line("$") - line("w$")) >= 10 ? '10<C-e>10j' : (line("$") - line("w$")) >= 9 ? '9<C-e>9j' : (line("$") - line("w$")) >= 8 ? '8<C-e>8j' : (line("$") - line("w$")) >= 7 ? '7<C-e>7j' : (line("$") - line("w$")) >= 6 ? '6<C-e>6j' : (line("$") - line("w$")) >= 5 ? '5<C-e>5j' : (line("$") - line("w$")) >= 4 ? '4<C-e>4j' : (line("$") - line("w$")) >= 3 ? '3<C-e>3j' : (line("$") - line("w$")) >= 2 ? '2<C-e>2j' :(line("$") - line("w$")) >= 1 ? '1<C-e>1j' : '\<Nop>')
" SPECIAL: NOTE: some terminals map <C-S-Space> to <C-_><Space>
noremap <silent> <expr> <C-_><Space> AtTop(0) ? ((line("$") - line("w$")) >= 10 ? '10<C-e>' : (line("$") - line("w$")) >= 9 ? '9<C-e>' : (line("$") - line("w$")) >= 8 ? '8<C-e>' : (line("$") - line("w$")) >= 7 ? '7<C-e>' : (line("$") - line("w$")) >= 6 ? '6<C-e>' : (line("$") - line("w$")) >= 5 ? '5<C-e>' : (line("$") - line("w$")) >= 4 ? '4<C-e>' : (line("$") - line("w$")) >= 3 ? '3<C-e>' : (line("$") - line("w$")) >= 2 ? '2<C-e>' :(line("$") - line("w$")) >= 1 ? '1<C-e>' : '\<Nop>') : ((line("$") - line("w$")) >= 10 ? '10<C-e>10j' : (line("$") - line("w$")) >= 9 ? '9<C-e>9j' : (line("$") - line("w$")) >= 8 ? '8<C-e>8j' : (line("$") - line("w$")) >= 7 ? '7<C-e>7j' : (line("$") - line("w$")) >= 6 ? '6<C-e>6j' : (line("$") - line("w$")) >= 5 ? '5<C-e>5j' : (line("$") - line("w$")) >= 4 ? '4<C-e>4j' : (line("$") - line("w$")) >= 3 ? '3<C-e>3j' : (line("$") - line("w$")) >= 2 ? '2<C-e>2j' :(line("$") - line("w$")) >= 1 ? '1<C-e>1j' : '\<Nop>')

"vnoremap <silent> <expr> <C-Down> ((line('$') - line('w$')) < 1) ? 'j' : '<C-e>j'
"vnoremap <silent> <expr> <C-j>    ((line('$') - line('w$')) < 1) ? 'j' : '<C-e>j'

inoremap <silent> <expr> <C-Down>   pumvisible() ? '<C-Down>' : '<C-\><C-o>:call <SID>Saving_scrollV("1<C-V><C-D>")<CR>'
inoremap <silent> <expr> <C-j>      pumvisible() ? '<C-j>'    : '<C-\><C-o>:call <SID>Saving_scrollV("1<C-V><C-D>")<CR>'

"call <SID>NoremapNormalCmd("<C-k>",    0, "1<C-U>")
noremap <silent> <expr> <C-Up>     AtBot(0) ? '<C-y>' : '<C-y>k'
noremap <silent> <expr> <C-k>      AtBot(0) ? '<C-y>' : '<C-y>k'

noremap <silent> <expr> <C-S-BS> AtBot(0) ? ((line("w0") - 1 - line("0")) >= 10 ? '10<C-y>' : (line("w0") - 1 - line("0")) >= 9 ? '9<C-y>' : (line("w0") - 1 - line("0")) >= 8 ? '8<C-y>' : (line("w0") - 1 - line("0")) >= 7 ? '7<C-y>' : (line("w0") - 1 - line("0")) >= 6 ? '6<C-y>' : (line("w0") - 1 - line("0")) >= 5 ? '5<C-y>' : (line("w0") - 1 - line("0")) >= 4 ? '4<C-y>' : (line("w0") - 1 - line("0")) >= 3 ? '3<C-y>' : (line("w0") - 1 - line("0")) >= 2 ? '2<C-y>' : (line("w0") - 1 - line("0")) >= 1 ? '1<C-y>' : '\<Nop>') : ((line("w0") - 1 - line("0")) >= 10 ? '10<C-y>10k' : (line("w0") - 1 - line("0")) >= 9 ? '9<C-y>9k' : (line("w0") - 1 - line("0")) >= 8 ? '8<C-y>8k' : (line("w0") - 1 - line("0")) >= 7 ? '7<C-y>7k' : (line("w0") - 1 - line("0")) >= 6 ? '6<C-y>6k' : (line("w0") - 1 - line("0")) >= 5 ? '5<C-y>5k' : (line("w0") - 1 - line("0")) >= 4 ? '4<C-y>4k' : (line("w0") - 1 - line("0")) >= 3 ? '3<C-y>3k' : (line("w0") - 1 - line("0")) >= 2 ? '2<C-y>2k' : (line("w0") - 1 - line("0")) >= 1 ? '1<C-y>1k' : '\<Nop>')
" SPECIAL: NOTE: some terminals map <C-S-BS> to <C-_><BS>
noremap <silent> <expr> <C-_><BS> AtBot(0) ? ((line("w0") - 1 - line("0")) >= 10 ? '10<C-y>' : (line("w0") - 1 - line("0")) >= 9 ? '9<C-y>' : (line("w0") - 1 - line("0")) >= 8 ? '8<C-y>' : (line("w0") - 1 - line("0")) >= 7 ? '7<C-y>' : (line("w0") - 1 - line("0")) >= 6 ? '6<C-y>' : (line("w0") - 1 - line("0")) >= 5 ? '5<C-y>' : (line("w0") - 1 - line("0")) >= 4 ? '4<C-y>' : (line("w0") - 1 - line("0")) >= 3 ? '3<C-y>' : (line("w0") - 1 - line("0")) >= 2 ? '2<C-y>' : (line("w0") - 1 - line("0")) >= 1 ? '1<C-y>' : '\<Nop>') : ((line("w0") - 1 - line("0")) >= 10 ? '10<C-y>10k' : (line("w0") - 1 - line("0")) >= 9 ? '9<C-y>9k' : (line("w0") - 1 - line("0")) >= 8 ? '8<C-y>8k' : (line("w0") - 1 - line("0")) >= 7 ? '7<C-y>7k' : (line("w0") - 1 - line("0")) >= 6 ? '6<C-y>6k' : (line("w0") - 1 - line("0")) >= 5 ? '5<C-y>5k' : (line("w0") - 1 - line("0")) >= 4 ? '4<C-y>4k' : (line("w0") - 1 - line("0")) >= 3 ? '3<C-y>3k' : (line("w0") - 1 - line("0")) >= 2 ? '2<C-y>2k' : (line("w0") - 1 - line("0")) >= 1 ? '1<C-y>1k' : '\<Nop>')

"vnoremap <silent>       <C-Up> <C-y>k
"vnoremap <silent>       <C-k>  <C-y>k

inoremap <silent> <expr> <C-Up>     pumvisible() ? '<C-Up>' : '<C-\><C-o>:call <SID>Saving_scrollV("1<C-V><C-U>")<CR>'
inoremap <silent> <expr> <C-k>      pumvisible() ? '<C-k>'  : '<C-\><C-o>:call <SID>Saving_scrollV("1<C-V><C-U>")<CR>'

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
vnoremap <ScrollWheelUp>     5gkg0
vnoremap <ScrollWheelDown>   5gjg$
" C-Wheel is often font scaling but ...
vnoremap <C-ScrollWheelUp>   24gkg0
vnoremap <C-ScrollWheelDown> 24gjg$
vnoremap <A-ScrollWheelUp>   48gkg0
vnoremap <A-ScrollWheelDown> 48gjg$

"inoremap <silent> <ScrollWheelUp>     <C-\><C-o>5k
"inoremap <silent> <ScrollWheelDown>   <C-\><C-o>5j
"inoremap <silent> <A-ScrollWheelUp>   <C-\><C-o>40k
"inoremap <silent> <A-ScrollWheelDown> <C-\><C-o>40j

" ---------

" move by 5/10 ...
" NOTE: probably already mapped in tmux ...

nnoremap <C-S-Up>    5gk
nnoremap <C-S-Down>  5gj
nnoremap <C-S-Left>  10gh
nnoremap <C-S-Right> 10gl
vnoremap <C-S-Up>    5gk
vnoremap <C-S-Down>  5gj
vnoremap <C-S-Left>  10gh
vnoremap <C-S-Right> 10gl
inoremap <C-S-Up>    <C-\><C-o>5gk
inoremap <C-S-Down>  <C-\><C-o>5gj
inoremap <C-S-Left>  <C-\><C-o>10gh
inoremap <C-S-Right> <C-\><C-o>10gl

" use <M-k> as gk so we can do
" <M-k> for up and then <M-`> for repeat prev cmd
call <SID>MapFastKeycode('<F30>',  "\ek", 30)
noremap <F30> gk
noremap <M-k> gk
inoremap <F30> <C-\><C-o>gk
inoremap <M-k> <C-\><C-o>gk
"noremap <F30> 5gk
"noremap <M-k> 5gk
"inoremap <F30> <C-\><C-o>5gk
"inoremap <M-k> <C-\><C-o>5gk
if has("nvim")
    cnoremap <F30> <M-k>
    tnoremap <F30> <M-k>
else
    cnoremap <F30> <C-v><Esc>k
    tnoremap <F30> <Esc>k
endif

" use <M-j> as gj so we can do
" <M-j> for down and then <M-`> for repeat prev cmd
call <SID>MapFastKeycode('<F31>',  "\ej", 31)
noremap <F31> gj
noremap <M-j> gj
inoremap <F31> <C-\><C-o>gj
inoremap <M-j> <C-\><C-o>gj
"noremap <F31> 5gj
"noremap <M-j> 5gj
"inoremap <F31> <C-\><C-o>5gj
"inoremap <M-j> <C-\><C-o>5gj
if has("nvim")
    cnoremap <F31> <M-j>
    tnoremap <F31> <M-j>
else
    cnoremap <F31> <C-v><Esc>j
    tnoremap <F31> <Esc>j
endif

call <SID>MapFastKeycode('<F28>',  "\e\<C-k>", 28)
noremap <silent> <expr> <F28>    (line('.') == line('w$')) ? '5k' : '5<C-y>5k'
noremap <silent> <expr> <M-C-K>  (line('.') == line('w$')) ? '5k' : '5<C-y>5k'
inoremap <silent> <expr> <F28>   (line('.') == line('w$')) ? '<C-\><C-o>5k' : '<C-\><C-o>5<C-y><C-\><C-o>5k'
inoremap <silent> <expr> <M-C-K> (line('.') == line('w$')) ? '<C-\><C-o>5k' : '<C-\><C-o>5<C-y><C-\><C-o>5k'
if !has("nvim")
    cnoremap <F28> <C-v><Esc><C-v>
    tnoremap <F28> <Esc><C-k>
else
    cnoremap <F28> <M-C-K>
    tnoremap <F28> <M-C-K>
endif

" SPECIAL: some terminals might map C-S-k to <C-_>K ...
 noremap <C-_>K 10gk
inoremap <C-_>K <C-\><C-o>10gk

" SPECIAL: some terminals might map A-C-j to M-C-o ...
" use ^O instead of ^J (or ^M or \n or \r)
call <SID>MapFastKeycode('<F29>',  "\e\<C-o>", 29)
noremap <silent> <expr> <F29>    (line('.') == line('w0')) ? '5j' : ((line('$') - line('w$')) < 5) ? 'mfG`f5j' : '5<C-e>5j'
noremap <silent> <expr> <M-C-O>  (line('.') == line('w0')) ? '5j' : ((line('$') - line('w$')) < 5) ? 'mfG`f5j' : '5<C-e>5j'
noremap <silent> <expr> <M-C-J>  (line('.') == line('w0')) ? '5j' : ((line('$') - line('w$')) < 5) ? 'mfG`f5j' : '5<C-e>5j'
inoremap <silent> <expr> <F29>   (line('.') == line('w0')) ? '<C-\><C-o>5j' : ((line('$') - line('w$')) < 5) ? '<C-\><C-o>mf<C-\><C-o>G<C-\><C-o>`f<C-\><C-o>5j' : '<C-\><C-o>5<C-e><C-\><C-o>5j'
inoremap <silent> <expr> <M-C-O> (line('.') == line('w0')) ? '<C-\><C-o>5j' : ((line('$') - line('w$')) < 5) ? '<C-\><C-o>mf<C-\><C-o>G<C-\><C-o>`f<C-\><C-o>5j' : '<C-\><C-o>5<C-e><C-\><C-o>5j'
inoremap <silent> <expr> <M-C-J> (line('.') == line('w0')) ? '<C-\><C-o>5j' : ((line('$') - line('w$')) < 5) ? '<C-\><C-o>mf<C-\><C-o>G<C-\><C-o>`f<C-\><C-o>5j' : '<C-\><C-o>5<C-e><C-\><C-o>5j'
if !has("nvim")
    cnoremap <F29> <C-v><Esc><C-v> 
    tnoremap <F29> <Esc><C-o>
else
    cnoremap <F29> <M-C-J>
    cnoremap <M-C-O> <M-C-J>
    " TODO: send M-C-O or M-C-J here ?
    tnoremap <F29> <M-C-J>
    tnoremap <M-C-O> <M-C-J>
endif

" SPECIAL: some terminals might map C-S-j to <C-_>J ...
 noremap <C-_>J 10gj
inoremap <C-_>J <C-\><C-o>10gj

" ---------

call <SID>MapFastKeycode('<F26>',  "\eK", 26)
noremap <silent> <expr> <F26>    (line('.') == line('w$')) ? '5k' : '5<C-y>5k'
noremap <silent> <expr> <M-K>    (line('.') == line('w$')) ? '5k' : '5<C-y>5k'
inoremap <silent> <expr> <F26>   (line('.') == line('w$')) ? '<C-\><C-o>5k' : '<C-\><C-o>5<C-y><C-\><C-o>5k'
inoremap <silent> <expr> <M-K>   (line('.') == line('w$')) ? '<C-\><C-o>5k' : '<C-\><C-o>5<C-y><C-\><C-o>5k'
if !has("nvim")
    cnoremap <F26> <C-v><Esc>K
    tnoremap <F26> <Esc>K
else
    cnoremap <F26> <M-K>
    tnoremap <F26> <M-K>
endif

call <SID>MapFastKeycode('<F23>',  "\eJ", 23)
noremap <silent> <expr> <F23>    (line('.') == line('w0')) ? '5j' : ((line('$') - line('w$')) < 5) ? 'mfG`f5j' : '5<C-e>5j'
noremap <silent> <expr> <M-J>    (line('.') == line('w0')) ? '5j' : ((line('$') - line('w$')) < 5) ? 'mfG`f5j' : '5<C-e>5j'
inoremap <silent> <expr> <F23>   (line('.') == line('w0')) ? '<C-\><C-o>5j' : ((line('$') - line('w$')) < 5) ? '<C-\><C-o>mf<C-\><C-o>G<C-\><C-o>`f<C-\><C-o>5j' : '<C-\><C-o>5<C-e><C-\><C-o>5j'
inoremap <silent> <expr> <M-J>   (line('.') == line('w0')) ? '<C-\><C-o>5j' : ((line('$') - line('w$')) < 5) ? '<C-\><C-o>mf<C-\><C-o>G<C-\><C-o>`f<C-\><C-o>5j' : '<C-\><C-o>5<C-e><C-\><C-o>5j'
if !has("nvim")
    cnoremap <F23> <C-v><Esc>J
    tnoremap <F23> <Esc>J
else
    cnoremap <F23> <M-J>
    tnoremap <F23> <M-J>
endif

" -------------------------------

" NOTE: <M-n/N/p/P> could be used in vim, less, tig
" for scrollng/movement, similar to <M-j/J/k/K> ...

" NOTE: wish we could send CSI mappings for these ...
" use <M-n> as n so we can do
" <M-n> for next search and then <M-`> to repeat prev cmd
 noremap <silent> <M-n>  n
 noremap <silent> <M-p>  N
 noremap <silent> <M-N>  <Nop>
 noremap <silent> <M-P>  <Nop>

" and get back orig for insert
inoremap <silent> <M-n>  <C-v><Esc>n
inoremap <silent> <M-p>  <C-v><Esc>p
inoremap <silent> <M-N>  <C-v><Esc>N
inoremap <silent> <M-P>  <C-v><Esc>P

" NOTE: tmux may send <C-^> + char for these ...
 noremap <silent> <C-^>n n
 noremap <silent> <C-^>p N
 noremap <silent> <C-^>N <Nop>
 noremap <silent> <C-^>P <Nop>

inoremap <silent> <C-^>n <C-v><Esc>n
inoremap <silent> <C-^>p <C-v><Esc>p
inoremap <silent> <C-^>N <C-v><Esc>N
inoremap <silent> <C-^>P <C-v><Esc>P

" -------------------------------

nnoremap <silent> <expr> gH winline() - 1 - &scrolloff > 0
      \ ? ':normal! ' . (winline() - 1 - &scrolloff) . "gkg^\<CR>"
      \ : 'g^'

nnoremap <silent> <expr> gM winline() < (winheight(0)+1)/2
      \ ? ':normal! ' . ((winheight(0)+1)/2 - winline()) . "gjg^\<CR>"
      \ : winline() == (winheight(0)+1)/2
      \         ? 'g^'
      \         : ':normal! ' . (winline() - (winheight(0)+1)/2) . "gkg^\<CR>"

nnoremap <silent> <expr> gL winheight(0) - winline() - &scrolloff > 0
      \ ? ':normal! ' . (winheight(0) - winline() - &scrolloff) . "gjg^\<CR>"
      \ : 'g^'

" ---------

function s:CtrlF_Experiment(multi) abort
    let l:ol = line('.')
    let l:owl = winline()
    if (line('.') == line("w0"))
        execute "keepjumps normal! M"
        let l:nl = line('.')
        let l:nwl = winline()
        if (l:owl == l:nwl && l:ol == l:nl)
            execute 'keepjumps normal! ' . g:half . 'gj'
        endif
        return
    endif
    let l:amt = a:multi * g:half + 1
    let l:hgt = winheight(0)
    let l:owl = winline()
    let l:dff = l:hgt - l:owl
    let prevsj=&scrolljump
    let &scrolljump=1
    let prevso=&scrolloff
    let &scrolloff=l:dff
    "if (l:dff < 10)
    "    let l:nxt = 10 - l:dff
    "    let l:owl = l:owl - l:nxt
    "endif
    execute 'keepjumps normal! ' . l:amt . 'gj'
    "let l:nwl = winline()
    "if (l:nwl < l:owl)
    "    let l:dwl = l:owl - l:nwl
    "    execute 'keepjumps normal! ' . l:dwl . 'gj'
    "    let &scrolljump=prevsj
    "    let &scrolloff=prevso
    "    return
    "endif
    "let l:dff = l:hgt - l:nwl
    "if (l:dff < 10)
    "    let l:nxt = 10 - l:dff
    "    execute 'keepjumps normal! ' . l:nxt . 'gk'
    "endif
    let &scrolljump=prevsj
    let &scrolloff=prevso
endfunction

function s:CtrlB_Experiment(multi) abort
    let l:ol = line('.')
    let l:owl = winline()
    if (line('.') == line("w$"))
        execute "keepjumps normal! M"
        let l:nl = line('.')
        let l:nwl = winline()
        if (l:owl == l:nwl && l:ol == l:nl)
            execute 'keepjumps normal! ' . g:hal1 . 'gk'
        endif
        return
    endif
    let l:amt = a:multi * g:hal1
    let l:owl = winline()
    let l:dff = l:owl
    let prevsj=&scrolljump
    let &scrolljump=1
    let prevso=&scrolloff
    let &scrolloff=l:dff
    "if (l:dff < 10)
    "    let l:nxt = 10 - l:dff
    "    let l:owl = l:owl + l:nxt
    "endif
    execute 'keepjumps normal! ' . l:amt . 'gk'
    "let l:nwl = winline()
    "if (l:nwl > l:owl)
    "    let l:dwl = l:nwl - l:owl
    "    execute 'keepjumps normal! ' . l:dwl . 'gk'
    "    let &scrolljump=prevsj
    "    let &scrolloff=prevso
    "    return
    "endif
    "let l:dff = l:nwl
    "if (l:dff < 10)
    "    let l:nxt = 10 - l:dff
    "    execute 'keepjumps normal! ' . l:nxt . 'gj'
    "endif
    let &scrolljump=prevsj
    let &scrolloff=prevso
endfunction

" ---------

function s:CtrlF(multi) abort
    let l:ol = line('.')
    let l:owl = winline()
    if (line('.') == line("w0"))
        execute "keepjumps normal " . g:half . "gj"
        return
    endif
    let l:dff = line('$') - line('.')
    if (l:dff <= 10)
        execute "keepjumps normal 5gj"
        return
    endif
    let prevsj=&scrolljump
    let &scrolljump=1
    let &scrolloff=10
    let save_scroll = &scroll
    if (a:multi == 2)
        " want normal! here
        execute "keepjumps normal! " . g:half . "\<C-d>\<C-d>"
    elseif (a:multi == 3)
        " want normal! here
        execute "keepjumps normal! " . g:half . "\<C-d>\<C-d>\<C-d>"
    elseif (a:multi == 4)
        " want normal! here
        execute "keepjumps normal! " . g:half . "\<C-d>\<C-d>\<C-d>\<C-d>"
    else
        " want normal! here
        execute "keepjumps normal! " . g:half . "\<C-d>"
    endif
    let &scroll = save_scroll
    let l:hgt = winheight(0)
    let l:nwl = winline()
    let l:dff = l:hgt - l:nwl
"   to prevent flip-flopping ...
"   if (l:dff < 10)
"       let l:nxt = 10 - l:dff
"       execute "keepjumps normal! " . l:nxt . "gk"
"       let l:nwl = winline()
"   endif
    let l:nl = line('.')
    if (l:owl == l:nwl && l:ol == l:nl)
        execute "keepjumps normal 5gj"
    endif
    let &scrolloff=0
    let &scrolljump=prevsj
endfunction

function s:CtrlB(multi) abort
    let l:ol = line('.')
    let l:owl = winline()
    if (line('.') == line("w$"))
        execute "keepjumps normal " . g:hal1 . "gk"
        return
    endif
    let l:dff = line('.')
    if (l:dff <= 10)
        execute "keepjumps normal 5gk"
        return
    endif
    let prevsj=&scrolljump
    let &scrolljump=1
    let &scrolloff=10
    let save_scroll = &scroll
    if (a:multi == 2)
        " want normal! here
        execute "keepjumps normal! " . g:hal1 . "\<C-u>\<C-u>"
    elseif (a:multi == 3)
        " want normal! here
        execute "keepjumps normal! " . g:hal1 . "\<C-u>\<C-u>\<C-u>"
    elseif (a:multi == 4)
        " want normal! here
        execute "keepjumps normal! " . g:hal1 . "\<C-u>\<C-u>\<C-u>\<C-u>"
    else
        " want normal! here
        execute "keepjumps normal! " . g:hal1 . "\<C-u>"
    endif
    let &scroll = save_scroll
    let l:nwl = winline()
    let l:dff = l:nwl
"   to prevent flip-flopping ...
"   if (l:dff < 10)
"       let l:nxt = 10 - l:dff
"       execute "keepjumps normal! " . l:nxt . "gj"
"       let l:nwl = winline()
"   endif
    let l:nl = line('.')
    if (l:owl == l:nwl && l:ol == l:nl)
        execute "keepjumps normal 5gk"
    endif
    let &scrolloff=0
    let &scrolljump=prevsj
endfunction

" ---------

function! s:MapScrollKeys()
  let g:half = winheight(0) / 2
  if (g:half < 1)
    g:half = 1
  endif
  let g:full = winheight(0)
  let g:full2x = g:full + g:full

  " 47 / 2 = 23 but if we are at 24 then 23 up is 1 and 23 down is 47 - ok
  " 46 / 2 = 23 but if we are at 23 then 23 up is 0 and 23 down is 46 - not ok, need to make up one less ...

  let g:hal1 = g:half

  let g:hu6 = g:hal1 - 6
  if (g:hu6 < 1)
      g:hu6 = 1
  endif
  let g:hu6a = g:hal1 + 6

  let g:hd6 = g:half - 6
  if (g:hd6 < 1)
      g:hd6 = 1
  endif
  let g:hd6a = g:half + 6

  " ------------

  let g:fu6 = g:full - 6
  if (g:fu6 < 1)
      g:fu6 = 1
  endif
  let g:fu6a = g:full + 6

  let g:fd6 = g:full - 6
  if (g:fd6 < 1)
      g:fd6 = 1
  endif
  let g:fd6a = g:full + 6

  " ------------

  let g:f2u6 = g:full2x - 6
  if (g:f2u6 < 1)
      g:f2u6 = 1
  endif
  let g:f2u6a = g:full2x + 6

  let g:f2d6 = g:full2x - 6
  if (g:f2d6 < 1)
      g:f2d6 = 1
  endif
  let g:f2d6a = g:full2x + 6

  " BUG:  gj in visual mode past screen bottom does NOT seem to cause scrolljump to jump properly ...
  "       so add zz to make it consistent, but ...
  " TODO: zz here causes empty bottom half of screen when at end of file ...

  "let g:hup = g:hal1 . 'gkzz'
  "let g:hdn = g:half . 'gjzz'
  "let g:hup = g:hal1 . 'gkzz3gk'
  "let g:hdn = g:half . 'gjzz4gj'
  "let g:hup = g:hal1 . 'gkzz11<C-e>'
  "let g:hdn = g:half . 'gjzz11<C-y>'

  " BUG: sometimes scrolling up back into a selection highlights lines below the cursor
  "      add <C-l> to help as a work-around ...

  if !has("nvim")
      let g:hup = ' (line("v") >= line(".")) ? "' . g:hu6 . 'gkzz6gk<C-l>" : "' . g:hu6a . 'gkzz6gj<C-l>"'
      let g:hdn = ' (line("v") <= line(".")) ? "' . g:hd6 . 'gjzz6gj<C-l>" : "' . g:hd6a . 'gjzz6gk<C-l>"'

      let g:fup = ' (line("v") >= line(".")) ? "' . g:fu6 . 'gkzz6gk<C-l>" : "' . g:fu6a . 'gkzz6gj<C-l>"'
      let g:fdn = ' (line("v") <= line(".")) ? "' . g:fd6 . 'gjzz6gj<C-l>" : "' . g:fd6a . 'gjzz6gk<C-l>"'

      let g:f2up = ' (line("v") >= line(".")) ? "' . g:f2u6 . 'gkzz6gk<C-l>" : "' . g:f2u6a . 'gkzz6gj<C-l>"'
      let g:f2dn = ' (line("v") <= line(".")) ? "' . g:f2d6 . 'gjzz6gj<C-l>" : "' . g:f2d6a . 'gjzz6gk<C-l>"'
  else
      let g:hup = ' (line("v") >= line(".")) ? "' . g:hu6 . 'gkzz6gk" : "' . g:hu6a . 'gkzz6gj"'
      let g:hdn = ' (line("v") <= line(".")) ? "' . g:hd6 . 'gjzz6gj" : "' . g:hd6a . 'gjzz6gk"'

      let g:fup = ' (line("v") >= line(".")) ? "' . g:fu6 . 'gkzz6gk" : "' . g:fu6a . 'gkzz6gj"'
      let g:fdn = ' (line("v") <= line(".")) ? "' . g:fd6 . 'gjzz6gj" : "' . g:fd6a . 'gjzz6gk"'

      let g:f2up = ' (line("v") >= line(".")) ? "' . g:f2u6 . 'gkzz6gk" : "' . g:f2u6a . 'gkzz6gj"'
      let g:f2dn = ' (line("v") <= line(".")) ? "' . g:f2d6 . 'gjzz6gj" : "' . g:f2d6a . 'gjzz6gk"'
  endif

  " TODO: could add same if at top then M logic to imap <C-f> ...

  "noremap            <expr> <C-f> (line('.') == line('w0')) ? g:hdn : '<C-D>'
  nnoremap <silent> <C-f> :call <SID>CtrlF(1)<CR>
  "vnoremap <silent> <expr> <C-f> (line('v') < line('.')) ? g:half . 'gjzz6gj' : g:half . 'gjzz6gk'
  execute 'vnoremap <silent> <expr> <C-f> ' . g:hdn
  inoremap  <silent> <expr> <C-f> pumvisible() ? '<C-f>' : '<C-\><C-o>:call <SID>Saving_scrollVDn1("<C-V><C-D>")<CR>'

  "noremap            <expr> <C-b> (line('.') == line('w$')) ? g:hup : '<C-U>'
  nnoremap <silent> <C-b> :call <SID>CtrlB(1)<CR>
  "vnoremap <silent> <expr> <C-b> (line('v') > line('.')) ? g:hal1 . 'gkzz6gk' : g:hal1 . 'gkzz6gj'
  execute 'vnoremap <silent> <expr> <C-b> ' . g:hup
  inoremap  <silent> <expr> <C-b> pumvisible() ? '<C-b>' : '<C-\><C-o>:call <SID>Saving_scrollVUp1("<C-V><C-U>")<CR>'

  " to match tig etc, a <Leader> mapping for page-down,up ...

  " <leader><Tab>, <S-Tab> might have been good here but <Leader><Tab> is used in several places above ...

  nnoremap <silent> <Leader>` :<C-u>call <SID>CtrlB(1)<CR>
  execute 'vnoremap <silent> <expr> <Leader>` ' . g:hup

  nnoremap <silent> <Leader>1 :<C-u>call <SID>CtrlF(1)<CR>
  execute 'vnoremap <silent> <expr> <Leader>1 ' . g:hdn

  " ok to unmap these ...

  noremap `` <Nop>
  noremap `\ <Nop>
  noremap <Leader>~ <Nop>

  " interesting | (pipe) cmd to go to screen column specified

  nnoremap \| <Nop>
  vnoremap \| <Nop>

  " but skip mapping shifts and partial shifts of <Leader>1,2 to also scroll ...

  "noremap `\| <Nop>
  "noremap \|`       <Nop>
  "noremap \|~       <Nop>
  "noremap <Leader>! <Nop>
  "noremap \|1       <Nop>
  "noremap \|!       <Nop>
  "noremap <Leader>@ <Nop>
  "noremap \|2       <Nop>
  "noremap \|@       <Nop>

  " -------------------

  nnoremap <silent> <S-BS>   :<C-u>call <SID>CtrlB(1)<CR>
  execute 'vnoremap <silent> <expr> <S-BS> '   . g:hup
  inoremap <S-BS> <BS>
  cnoremap <S-BS> <BS>
  tnoremap <S-BS> <BS>
  " SPECIAL: S-BS in some terminals (via tmux) may be mapped to <C-^><C-h> in vim ...
  nnoremap <silent> <C-^><C-h>   :<C-u>call <SID>CtrlB(1)<CR>
  execute 'vnoremap <silent> <expr> <C-^><C-h> '   . g:hup
  inoremap <C-^><C-h> <BS>
  cnoremap <C-^><C-h> <BS>
  tnoremap <C-^><C-h> <BS>

  nnoremap <silent> <S-Space> :<C-u>call <SID>CtrlF(1)<CR>
  execute 'vnoremap <silent> <expr> <S-Space> ' . g:hdn
  inoremap <S-Space> <Space>
  cnoremap <S-Space> <Space>
  tnoremap <S-Space> <Space>
  " SPECIAL: S-Space in some terminals (via tmux) may be mapped to <C-^><Space> in vim ...
  nnoremap <silent> <C-^><Space> :<C-u>call <SID>CtrlF(1)<CR>
  execute 'vnoremap <silent> <expr> <C-^><Space> ' . g:hdn
  inoremap <C-^><Space> <Space>
  cnoremap <C-^><Space> <Space>
  tnoremap <C-^><Space> <Space>

  " -------------------

  "noremap            <expr> <PageDown>   (line('.') == line('w0')) ? g:hdn : '<C-D><C-D>'
  nnoremap <silent> <PageDown> :call <SID>CtrlF(2)<CR>
  "execute 'vnoremap <silent> <expr> <PageDown> (line(".") != line("w0")) ? "<C-D><C-D><C-l>" : ' . g:hdn
  execute 'vnoremap <silent> <expr> <PageDown> ' . g:fdn
  inoremap  <silent> <expr> <PageDown>   pumvisible() ? '<PageDown>' : '<C-\><C-o>:call <SID>Saving_scrollVDn2("<C-V><C-D>")<CR>'

  "noremap            <expr> <PageUp>     (line('.') == line('w$')) ? g:hup : '<C-U><C-U>'
  nnoremap <silent> <PageUp> :call <SID>CtrlB(2)<CR>
  "execute 'vnoremap <silent> <expr> <PageUp> (line(".") != line("w$")) ? "<C-U><C-U><C-l>" : ' . g:hup
  execute 'vnoremap <silent> <expr> <PageUp> ' . g:fup
  inoremap  <silent> <expr> <PageUp>     pumvisible() ? '<PageUp>'   : '<C-\><C-o>:call <SID>Saving_scrollVUp2("<C-V><C-U>")<CR>'

  " NOTE: tmux could send Up/Down cmds instead of this key ...
  "noremap            <expr> <S-F24> (line('.') == line('w0')) ? g:hdn : '<C-D>'
  nnoremap <silent> <S-F24>      :call <SID>CtrlF(1)<CR>
  nnoremap <silent> <C-PageDown> :call <SID>CtrlF(1)<CR>
  "execute 'vnoremap <silent> <expr> <S-F24> (line(".") != line("w0")) ? "<C-D><C-l>" : ' . g:hdn
  execute 'vnoremap <silent> <expr> <S-F24> '      . g:hdn
  execute 'vnoremap <silent> <expr> <C-PageDown> ' . g:hdn
  inoremap  <silent> <expr> <S-F24>      pumvisible() ? '<PageDown>' : '<C-\><C-o>:call <SID>Saving_scrollVDn1("<C-V><C-D>")<CR>'
  inoremap  <silent> <expr> <C-PageDown> pumvisible() ? '<PageDown>' : '<C-\><C-o>:call <SID>Saving_scrollVDn1("<C-V><C-D>")<CR>'

  "noremap            <expr> <S-F21>   (line('.') == line('w$')) ? g:hup : '<C-U>'
  nnoremap <silent> <S-F21>    :call <SID>CtrlB(1)<CR>
  nnoremap <silent> <C-PageUp> :call <SID>CtrlB(1)<CR>
  "execute 'vnoremap <silent> <expr> <S-F21> (line(".") != line("w$")) ? "<C-U><C-l>" : ' . g:hup
  execute 'vnoremap <silent> <expr> <S-F21> '    . g:hup
  execute 'vnoremap <silent> <expr> <C-PageUp> ' . g:hup
  inoremap  <silent> <expr> <S-F21>      pumvisible() ? '<PageUp>'   : '<C-\><C-o>:call <SID>Saving_scrollVUp1("<C-V><C-U>")<CR>'
  inoremap  <silent> <expr> <C-PageUp>   pumvisible() ? '<PageUp>'   : '<C-\><C-o>:call <SID>Saving_scrollVUp1("<C-V><C-U>")<CR>'

  " NOTE: tmux could send Up/Down cmds instead of this key ...
  " TODO: wish <C-e>/<C-y> would scroll virtual lines ...
  noremap   <silent> <expr> <S-F25>        (line('.') == line('w0')) ? '10j' : ((line('$') - line('w$')) < 10) ? 'mfG`f10j' : '10<C-e>10j'
  noremap   <silent> <expr> <C-S-PageDown> (line('.') == line('w0')) ? '10j' : ((line('$') - line('w$')) < 10) ? 'mfG`f10j' : '10<C-e>10j'
  inoremap  <silent> <expr> <S-F25>        pumvisible() ? '<PageDown>' : '<C-\><C-o>:call <SID>Saving_scrollVDn1("<C-V><C-D>")<CR>'
  inoremap  <silent> <expr> <C-S-PageDown> pumvisible() ? '<PageDown>' : '<C-\><C-o>:call <SID>Saving_scrollVDn1("<C-V><C-D>")<CR>'
  noremap   <silent> <expr> <S-F22>        (line('.') == line('w$')) ? '10k' : '10<C-y>10k'
  noremap   <silent> <expr> <C-S-PageUp>   (line('.') == line('w$')) ? '10k' : '10<C-y>10k'
  inoremap  <silent> <expr> <S-F22>        pumvisible() ? '<PageUp>'   : '<C-\><C-o>:call <SID>Saving_scrollVUp1("<C-V><C-U>")<CR>'
  inoremap  <silent> <expr> <C-S-PageUp>   pumvisible() ? '<PageUp>'   : '<C-\><C-o>:call <SID>Saving_scrollVUp1("<C-V><C-U>")<CR>'

  " NOTE: tmux could send Up/Down cmds instead of this key ...
  "noremap            <expr> <S-F26> (line('.') == line('w0')) ? g:hdn : '<C-D><C-D><C-D><C-D>'

  nnoremap <silent> <S-F26>      :call <SID>CtrlF(4)<CR>
  nnoremap <silent> <A-PageDown> :call <SID>CtrlF(4)<CR>
  "execute 'vnoremap <silent> <expr> <S-F26> (line(".") != line("w0")) ? "<C-D><C-D><C-D><C-D><C-l>" : ' . g:hdn
  execute 'vnoremap <silent> <expr> <S-F26> '      . g:f2dn
  execute 'vnoremap <silent> <expr> <A-PageDown> ' . g:f2dn
  inoremap  <silent> <expr> <S-F26>      pumvisible() ? '<PageDown>' : '<C-\><C-o>:call <SID>Saving_scrollVDn4("<C-V><C-D>")<CR>'
  inoremap  <silent> <expr> <A-PageDown> pumvisible() ? '<PageDown>' : '<C-\><C-o>:call <SID>Saving_scrollVDn4("<C-V><C-D>")<CR>'

  "noremap            <expr> <S-F23>   (line('.') == line('w$')) ? g:hup : '<C-U><C-U><C-U><C-U>'
  nnoremap <silent> <S-F23>    :call <SID>CtrlB(4)<CR>
  nnoremap <silent> <A-PageUp> :call <SID>CtrlB(4)<CR>
  "execute 'vnoremap <silent> <expr> <S-F23> (line(".") != line("w$")) ? "<C-U><C-U><C-U><C-U><C-l>" : ' . g:hup
  execute 'vnoremap <silent> <expr> <S-F23> '    . g:f2up
  execute 'vnoremap <silent> <expr> <A-PageUp> ' . g:f2up
  inoremap  <silent> <expr> <S-F23>      pumvisible() ? '<PageUp>'   : '<C-\><C-o>:call <SID>Saving_scrollVUp4("<C-V><C-U>")<CR>'
  inoremap  <silent> <expr> <A-PageUp>   pumvisible() ? '<PageUp>'   : '<C-\><C-o>:call <SID>Saving_scrollVUp4("<C-V><C-U>")<CR>'
endfunction

let g:hal1 = 24
let g:half = 24
let g:full = 48
let g:full2x = 96

autocmd VimEnter,VimResized * call <SID>MapScrollKeys()

" ---------

" if in Insert mode with no input/movement for 10 sec then revert to Normal mode ...
set updatetime=10000
function! s:IdleToNormalMode()
    if pumvisible()
        return
    endif
    let mymode = mode()
    if mymode ==# 'i' || mymode ==# 'R'
        call feedkeys("\<Esc>", "m")
        echo "Exiting Insert mode after idle timeout ..."
        if has("nvim")
            call My_StartIdleTimer()
        endif
    endif
endfunction
autocmd CursorHoldI * call <SID>IdleToNormalMode()
autocmd User MyCursorHoldI call <SID>IdleToNormalMode()

function! s:ClearCmdWindow()
    if pumvisible()
        return
    endif
    "exe 'normal :'
    if has("nvim")
        redraw!
    endif
    echo "\r"
endfunction
" nice but can clear asyncrun status in cmdline ...
autocmd CursorHold * call <SID>ClearCmdWindow()
autocmd User MyCursorHold call <SID>ClearCmdWindow()

" ---------

let g:my_cursorhold_updatetime = 10000

function My_Nvim_CursorHold_Cb(timer_id) abort
  set eventignore-=CursorHold
  doautocmd <nomodeline> CursorHold
  set eventignore+=CursorHold
endfunction

let g:my_cursorhold_nvim_timer = -1
function My_Nvim_CursorHold_Fix() abort
    if !has("nvim")
        return
    endif
    if mode() != 'n'
        return
    endif
    call timer_stop(g:my_cursorhold_nvim_timer)
    let g:my_cursorhold_nvim_timer = timer_start(g:my_cursorhold_updatetime, 'My_Nvim_CursorHold_Cb')
endfunction

" ---------

" work-around for nvim CursorHold[I] issue ...

let g:my_insertidle_nvim_timer = -1
function My_StartIdleTimer_Cb(timer_id) abort
    let mymode = mode()
    if mymode ==# 'i' || mymode ==# 'R'
        doautocmd User MyCursorHoldI
    else
        doautocmd User MyCursorHold
    endif
endfunction

function My_StartIdleTimer() abort
    call timer_stop(g:my_insertidle_nvim_timer)
    let g:my_insertidle_nvim_timer = timer_start(g:my_cursorhold_updatetime, 'My_StartIdleTimer_Cb')
endfunction

if has("nvim")
    autocmd CmdlineLeave * call My_StartIdleTimer()
    autocmd InsertEnter *  call My_StartIdleTimer()
    " TODO: ouch ...
    autocmd CursorMovedI * call My_StartIdleTimer()
    autocmd CursorMoved  * call My_StartIdleTimer()
endif

" ---------

" NOTE: S-L,R used for tab nav ...

" NOTE: C-S-Left/Right/Up/Down move by 5 ...
" NOTE: A-L,R,U,D was used by tmux for window nav ...
" NOTE: some terminals work with A/M-L/R but some need esc seq ...

" NOTE: many other mappings for tab nav -
"       <C-w><S-Left>, <S-Right>
"       <C-w><Tab>, <S-Tab>
"       <Leader>tn, p
"       <Leader>tt, T
"       <Leader>>>, <<
"       <Leader>s<S-Left>, <S-Right>
"       <Leader>s<, >

" prev tab
" used to be <S-Left>
"--nnoremap <silent> <S-Left>      :tabprevious<CR>
"--vnoremap <silent> <S-Left> <Left>
"--inoremap <silent> <S-Left> <Esc>:tabprevious<CR>
"--if has("nvim")
"--    tnoremap <silent> <S-Left> <C-\><C-n>:tabprevious<CR>
"--else
"--    tnoremap <silent> <S-Left> <C-w>:tabprevious<CR>
"--endif

" next tab
" used to be <S-Right>
"--nnoremap <silent> <S-Right>      :tabnext<CR>
"--vnoremap <silent> <S-Right> <Right>
"--inoremap <silent> <S-Right> <Esc>:tabnext<CR>
"--if has("nvim")
"--    tnoremap <silent> <S-Right> <C-\><C-n>:tabnext<CR>
"--else
"--    tnoremap <silent> <S-Right> <C-w>:tabnext<CR>
"--endif

noremap  <S-Left>  <Left>
noremap  <S-Right> <Right>
inoremap <S-Left>  <Left>
inoremap <S-Right> <Right>
tnoremap <S-Left>  <Left>
tnoremap <S-Right> <Right>
cnoremap <S-Left>  <Left>
cnoremap <S-Right> <Right>

noremap  <M-Left>  <Left>
noremap  <M-Right> <Right>
inoremap <M-Left>  <Left>
inoremap <M-Right> <Right>
tnoremap <M-Left>  <Left>
tnoremap <M-Right> <Right>
cnoremap <M-Left>  <Left>
cnoremap <M-Right> <Right>

" NOTE: <A-S-arrow> used by tmux for resizing panes ...
noremap  <M-S-Left>  <Left>
noremap  <M-S-Right> <Right>
inoremap <M-S-Left>  <Left>
inoremap <M-S-Right> <Right>
tnoremap <M-S-Left>  <Left>
tnoremap <M-S-Right> <Right>
cnoremap <M-S-Left>  <Left>
cnoremap <M-S-Right> <Right>

" NOTE: S-Up, Down are available ...
" Perhaps same as <Up>/<Down> so we can repeat cmds
" with <S-Tab> (.) without lifting <Shift> before <Down> ...
" NOTE: with <Up>/<Down> as a noremap these will be original
"       and not gk/gj ...
noremap  <S-Up>    <Up>
noremap  <S-Down>  <Down>
inoremap <S-Up>    <Up>
inoremap <S-Down>  <Down>
tnoremap <S-Up>    <Up>
tnoremap <S-Down>  <Down>
cnoremap <S-Up>    <Up>
cnoremap <S-Down>  <Down>

noremap  <M-Up>    <Up>
noremap  <M-Down>  <Down>
inoremap <M-Up>    <Up>
inoremap <M-Down>  <Down>
tnoremap <M-Up>    <Up>
tnoremap <M-Down>  <Down>
cnoremap <M-Up>    <Up>
cnoremap <M-Down>  <Down>

" NOTE: <A-S-arrow> used by tmux for resizing panes ...
noremap  <M-S-Up>    <Up>
noremap  <M-S-Down>  <Down>
inoremap <M-S-Up>    <Up>
inoremap <M-S-Down>  <Down>
tnoremap <M-S-Up>    <Up>
tnoremap <M-S-Down>  <Down>
cnoremap <M-S-Up>    <Up>
cnoremap <M-S-Down>  <Down>

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
" <C-_> used with another key so cannot use this alone without delay ...
"noremap <silent> <C-_> zz
noremap <silent> <Leader>cz zz

" ---- BS, C-BS, C-S-BS, and Space ----

"nnoremap <Char-0x07F> <BS>
" SPECIAL: NOTE: S-BS in terminals often mapped to BS/Del ...
noremap  <silent> <S-BS> <BS>
inoremap          <S-BS> <BS>
" TODO: if shift-BS is ever reliably recognized have it delete curr/prev word ...

" TODO: MCK - does <C-BS> move up or scroll up ?  And same for <C-Space>

"noremap <silent> <C-BS>     gk
" SPECIAL: NOTE: terminals could map <C-BS> to <C-^><BS>
noremap <silent> <C-^><BS>  gk
noremap <silent> <C-^><Del> gk

" TODO: what are the leading spaces when inserting a \ with .vim files ... ?
"inoremap <silent> <expr> \ (&filetype ==# 'vim') ? '<C-v>\' : '\'

" annoying ...
nmap - <Nop>
nmap _ <Nop>

noremap <C-^> <Nop>
noremap <C-_> <Nop>

noremap <silent> <C-^>- <Nop>
inoremap         <C-^>- -
cnoremap         <C-^>- -
tnoremap         <C-^>- -

map <silent> <buffer> <M-C-Return> gk
imap         <buffer> <M-C-Return> <Nop>
" SPECIAL: NOTE: terminals could map <A-C-Return> to <C-^><Return>
"nmap <silent> <buffer> <C-^><Return> <Nop>
"vmap <silent> <buffer> <C-^><Return> mvty`v
map <silent> <buffer> <C-^><Return> gk
imap         <buffer> <C-^><Return> <Nop>

nnoremap <silent> <C-Space> gj
vnoremap <silent> <C-Space> gj
" SPECIAL: NOTE: C-Space in most terminals is C-@
nnoremap <silent> <C-@> gj
vnoremap <silent> <C-@> gj

" ------------------
" BUG: vim terminal does not generate C-@ (C-Space) - may be fixed now with tnoremap (see below)
"      tmux can send A-, in its place when in a terminal
call <SID>MapFastKeycode('<F27>',  "\e-", 27)
noremap <F27> gj
noremap <A--> gj
cnoremap <F27> <C-v><Esc>-
inoremap <F27> <C-v><Esc>-
tnoremap <F27> <Esc>-
if has("nvim")
    cnoremap <F27> <M-->
    inoremap <F27> <M-->
    tnoremap <F27> <M-->
endif

" NOTE: this seems to produce the correct key code ...
" also need this to send <C-w>w to app inside vim terminal ...
" but if its for vifm then <S-Tab> also works to switch to/from preview for scrolling
if !has("nvim")
    tnoremap <C-@> <C-Space>
    tnoremap <C-w>w <C-w>.w
    tnoremap <C-w><C-w> <C-w>.w
else
    tnoremap <C-w><C-w> <C-w>w
endif

" to match normal mode ...
inoremap <C-w>w      <C-\><C-o><C-w>w
inoremap <C-w><C-w>  <C-\><C-o><C-w>w

" ------------------

" <Return> was nmapped above to gj also if not terminal ...
nmap <silent> <buffer> <Return> gj
vmap <silent> <buffer> <Return> gj

nmap <silent> <buffer> <C-Return> gj
vmap <silent> <buffer> <C-Return> gj

" SPECIAL: NOTE: some terminals map <C-S-BS> to <C-_><BS>
" SPECIAL: NOTE: some terminals map <C-S-Space> to <C-_><Space>
"       if this is done then <C-_> -> zz above is lost
" C-S-BS    -> is mapped to scroll up 10
" C-S-Space -> is mapped to scroll down 10

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
" NOTE: these cannot be z* mappings or it adds delay when inserting z ...
"inoremap  z<Down>  <Esc>:m .+1<CR>==gi
"inoremap  z<Up>    <Esc>:m .-2<CR>==gi

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

 function s:ResetTabs()
     " and some other fts ...
     "if &filetype ==# 'c'
         setlocal tabstop=4 expandtab shiftwidth=4 noai
     "endif
 endfunction

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
  " NOTE: dont know where or why but tabstops are reset for .c file types ...
  "       and some others ...
  au BufWinEnter * call s:ResetTabs()
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

 "function! s:CheckDir()
 "    let fname = expand("%:p")
 "    if fname =~ "^fugitive://"
 "        return
 "    elseif fname =~ ".fugitiveblame"
 "        return
 "    elseif fname =~ "^git://"
 "        return
 "    endif
 "    let dname = expand("%:p:h")
 "    if !isdirectory(dname)
 "        echo '"' . dname . '" dir does not exist, create? (y/N): '
 "        call inputsave()
 "        let c = getchar()
 "        while type(c) != 0
 "            let c = getchar()
 "        endwhile
 "        call inputrestore()
 "        let ans=nr2char(c)
 "        if ans ==# 'y' || ans ==# 'Y'
 "            "TODO mkdir -p dname ...
 "            echom "mkdir " . dname " ..."
 "        else
 "            call <SID>ConfNextOrQuit()
 "        endif
 "    else
 "        return
 "    endif
 "endfunction

 " clear all jumps when starting new edit
 aug VimStartup
   au!
   autocmd VimEnter * :clearjumps
   "autocmd BufWinEnter * call <SID>CheckDir()
 aug END

endif " has("autocmd")

"================================================================
"================================================================
"================================================================

set completeopt=longest,menuone,preview,noselect
inoremap <silent> <expr> <Tab> pumvisible() ? '<C-n>' : '<Tab>'

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
" if have preview,popup in completeopt then vim will use an addl popup instead of preview window
" nvim doesnt support popup, but there is a float-preview to do similar
let g:clang_debug=0
set splitbelow
set splitright
set previewheight=5
" BUG: since vim 8.2.2426 completefunc cannot change windows and vim-clang does this
"      disable for now until we can start diag window some other way ...
"let g:clang_diagsopt = ''
" diagnostic window ...
let g:clang_diagsopt = 'botright:8'
" TODO: make call to ClangSyntaxCheck be async ...
noremap <silent> <Leader>do :let orig_do = g:clang_diagsopt<CR>:let g:clang_diagsopt = 'botright:8'<CR>:ClangSyntaxCheck<CR>:let g:clang_diagsopt = orig_do<CR>
noremap <silent> <Leader>dc :ClangCloseWindow<CR>

" extra info in popup menu ...
"let g:clang_verbose_pmenu = 1
let g:clang_exec = 'clang++-9'
let g:clang_cpp_options = '-std=c++11 -DNDEBUG -Wno-inconsistent-missing-override'
" put this in the local .lvimrc now ...
"let g:clang_compilation_database = '~/lnrs/wip/buildln/compile_commands.json'
"let g:clang_compilation_database = '~/lnrs/wip/buildln'
if has("nvim")
    " adding preview here without popup isnt great as we get preview window split
    " there is a nvim float-preview plugin but that doesnt stop the preview split
    let g:clang_c_completeopt = 'longest,menuone,preview'
    let g:clang_cpp_completeopt = 'longest,menuone,preview'
    " is there a way to supress preview window ?
    " this works, but it flashes the preview window for a brief moment ...
    "autocmd User FloatPreviewWinOpen pclose
    " same with this ...
    "autocmd WinEnter * if &previewwindow && pumvisible() | pclose | endif
    " this seems ok so far ...
    aug fltpop
        au!
        autocmd WinEnter <buffer> if pumvisible() | pclose | endif
    aug END
else
    " vim has popup option ...
    let g:clang_c_completeopt = 'longest,menuone,preview,popup'
    let g:clang_cpp_completeopt = 'longest,menuone,preview,popup'
endif
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
function s:CloseClangWin() abort
    try
        silent execute "normal :ClangCloseWindow\<CR>"
    catch /E492:/
    endtry
    redraw!
    echo " "
endfunction

let g:rtagsUseLocationList=1
" dont start rdm if from sudo
if $USER != 'root'
  let g:rtagsAutoLaunchRdm=1
else
  let g:rtagsAutoLaunchRdm=0
endif
nnoremap <silent> <C-]> :call rtags#JumpTo(g:SAME_WINDOW)<CR>
autocmd BufReadPost quickfix nnoremap <silent> <buffer> <C-]> <Return>
" C-o to go back
" C-t to go back (not implemented)
" nmap <C-t> :call rtags#JumpBack()<bar>:echo<CR>
" \cc to close quickfix, listview, preview

function s:IsTerminalFinished()
    " just to clear the cmdline of this function ...
    redraw!
    echo "\r"
    redir => lsout
    silent ls
    redir END
    if empty(lsout)
        return
    endif
    let blist = split(lsout, '\n')
    for lline in blist
        let bdict = split(lline, ' ')
        if bdict[1] ==# 'aF' || bdict[1] ==# '%aF'
            let bnum = str2nr(bdict[0])
            if getbufvar(bnum, '&buftype') ==# 'terminal'
                "echo "finished terminal buffer to end: " . bnum
                try
                    silent exec "normal :bdel! " . bnum . "\<CR>"
                catch /.*/
                    " just to clear the cmdline of this function ...
                    redraw!
                    echo "\r"
                endtry
            endif
        endif
    endfor
    echo "\r"
    redraw!
endfunction

function s:CloseUtilWins()
    " just to clear the cmdline of this function ...
    redraw!
    echo "\r"
    ccl
    lcl
    pcl
    call s:CloseClangWin()
    call s:IsTerminalFinished()
endfunction

nnoremap <silent> <Leader>cc           :call <SID>CloseUtilWins()<CR>
vnoremap <silent> <Leader>cc <C-\><C-n>:<C-u>call <SID>CloseUtilWins()<CR>

"nnoremap <silent> <Leader>cc           :ccl<bar>lcl<bar>pcl<bar>:call <SID>CloseClangWin()<CR>
"vnoremap <silent> <Leader>cc <C-\><C-n>:ccl<bar>lcl<bar>pcl<bar>:call <SID>CloseClangWin()<CR>

"noremap <silent> <Leader>cc :windo lcl<bar>ccl<bar>pcl<bar>:echo<CR>
" qq to also close location list, but we already have a q mapping ...
"autocmd BufReadPost quickfix nnoremap <silent> <buffer> qq :ccl<bar>lcl<bar>pcl<bar>:echo<CR>
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
" should we use <C-y> for paste ?
"nmap <C-y> <Plug>UnconditionalPasteCharBefore
nnoremap <C-y> <Nop>
vnoremap <C-y> <Nop>

" to get back orig if needed
noremap <Leader><C-y> <C-y>

nmap <Leader>pc <Plug>UnconditionalPasteCharAfter
nmap <Leader>p1 <Plug>UnconditionalPasteCharAfter

nmap <Leader>Pc <Plug>UnconditionalPasteCharBefore
nmap <Leader>p- <Plug>UnconditionalPasteCharBefore
" p0 adds a trailing space
nmap <Leader>p0 <Plug>UnconditionalPasteCharBefore`]li<Space><Esc>w
" pp is p0 unless at end and then it is pE
nmap <expr> <Leader>pp (col('.') < (col('$')-1)) ? '<Plug>UnconditionalPasteCharBefore`]li<Space><Esc>w' : '$A<Space><Esc><Plug>UnconditionalPasteCharAfter`]'

nmap <Leader>pj <Plug>UnconditionalPasteJustJoinedAfter
nmap <Leader>Pj <Plug>UnconditionalPasteJustJoinedBefore
"
" at end of line
nmap <Leader>pe $<Plug>UnconditionalPasteCharAfter`]
" adds a leading space
nmap <Leader>pE $A<Space><Esc><Plug>UnconditionalPasteCharAfter`]
" at beg of first word (^ not 0)
nmap <Leader>pa ^<Plug>UnconditionalPasteCharBefore`]
" NOTE: use <Esc>hlb instead of <Esc>B because M-B is mapped to A-3click in tmux ...
"nmap <Leader>pA ^<Plug>UnconditionalPasteCharBefore`]li<Space><Esc>hlb
" adds a trailing space
nmap <Leader>pA ^<Plug>UnconditionalPasteCharBefore`]li<Space><Esc>w

" change l to i to match current indentation ...
"nmap <Leader>Pl <Plug>UnconditionalPasteIndentedBefore
"nmap <Leader>pl <Plug>UnconditionalPasteIndentedAfter
" at orig offset
nmap <Leader>pl <Plug>UnconditionalPasteLineAfter
nmap <Leader>Pl <Plug>UnconditionalPasteLineBefore
"
" indented (used to be pi/Pi, but switched with px/Px below)
nmap <Leader>px <Plug>UnconditionalPasteIndentedAfter
nmap <Leader>Px <Plug>UnconditionalPasteIndentedBefore

" use . for more (>) and , for less (<) indentation
nmap <Leader>p. <Plug>UnconditionalPasteMoreIndentAfter
nmap <Leader>P. <Plug>UnconditionalPasteMoreIndentBefore

nmap <Leader>p, <Plug>UnconditionalPasteLessIndentAfter
nmap <Leader>P, <Plug>UnconditionalPasteLessIndentBefore

nmap <Leader>pb <Plug>UnconditionalPasteBlockAfter
nmap <Leader>Pb <Plug>UnconditionalPasteBlockBefore

" slightly confusing and has some delay ...
"nmap <Leader>P> <Plug>UnconditionalPasteShiftedBefore
"nmap <Leader>p> <Plug>UnconditionalPasteShiftedAfter

" paste indented line, like <Leader>px/Px, but with more indent logic
" (used to be px/Px but switched with pi/Pi above)
function s:MyUPIndentAfter() abort
    execute 'keepjumps normal mx^'
    let ccol = col('.')
    " keep going down until non-blank line ...
    call search('^.\+', 'W')
    execute 'keepjumps normal 0^'
    let ncol = col('.')
    execute 'keepjumps normal `x'
    " TODO: can we paste at ncol ?
    if ncol > ccol
        "call feedkeys('\p.')
        execute "keepjumps normal \<Plug>UnconditionalPasteMoreIndentAfter"
    else
        "call feedkeys('\pi')
        execute "keepjumps normal \<Plug>UnconditionalPasteIndentedAfter"
    endif
endfunction
nmap <silent> <Leader>pi <C-\><C-n>:<C-u>call <SID>MyUPIndentAfter()<CR>

function s:MyUPIndentBefore() abort
    execute 'keepjumps normal mx^'
    let ccol = col('.')
    " keep going up until non-blank line ...
    call search('^.\+', 'bW')
    execute 'keepjumps normal 0^'
    let pcol = col('.')
    execute 'keepjumps normal `x'
    " TODO: can we paste at pcol ?
    if pcol > ccol
        "call feedkeys('\P.')
        execute "keepjumps normal \<Plug>UnconditionalPasteMoreIndentBefore"
    else
        "call feedkeys('\Pi')
        execute "keepjumps normal \<Plug>UnconditionalPasteIndentedBefore"
    endif
endfunction
nmap <silent> <Leader>Pi <C-\><C-n>:<C-u>call <SID>MyUPIndentBefore()<CR>
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
nnoremap <silent> <Leader>CC :ColorToggle!<CR>
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
  if empty(bufname())
      exec ":f vless:stdin"
  endif
endfunction
" less as a pager --

"================================================================

function s:MySearch(meth) abort
  " TODO: - make it so there are 2 modes, prompt or expand("<cword>") ...
  if (a:meth == 0)
    let promptstr = 'sqf-buf:/'
  elseif (a:meth == 1)
    let promptstr = 'sqf-gbl:/'
  elseif (a:meth == 2)
    let promptstr = 'sqf-dir:/'
  elseif (a:meth == 3)
    let promptstr = 'fzf-gbl:/'
  elseif (a:meth == 4)
    let promptstr = 'fzf-dir:/'
  else
    redraw!
    echo " "
    return
  endif
  call inputsave()
  let string = input(promptstr)
  call inputrestore()
  if (len(string) == 0)
    " should we reset @/ ?
    redraw!
    echo " "
    return
  endif
  if g:asyncrun_status == 'running'
    echohl WarningMsg | echo "AsyncRun currently running" | echohl None
    return
  endif
  let g:asyncrun_string = string
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
    if empty(files)
      redraw | echohl DiffText | echo "No files to search" | echohl None
    else
      execute 'AsyncRun! -strip \ag --vimgrep -- ' shellescape(string, 1) join(files) ' 2>/dev/null'
    endif
  elseif (a:meth == 1)
    "execute 'AsyncRun! -strip ack -s -H --nopager --nocolor --nogroup --column --smart-case --follow' shellescape(string, 1) s:find_git_root() ' 2>/dev/null'
    execute 'AsyncRun! -strip \ag --vimgrep -U --hidden -- ' shellescape(string, 1) s:find_git_root() ' 2>/dev/null'
  elseif (a:meth == 2)
    "execute 'AsyncRun! -strip -cwd ack -s -H --nopager --nocolor --nogroup --column --smart-case --follow' shellescape(string, 1) ' 2>/dev/null'
    execute 'AsyncRun! -strip \ag --vimgrep -U --hidden -- ' shellescape(string, 1) ' 2>/dev/null'
  elseif (a:meth == 3)
    call fzf#vim#grep('\ag -U --hidden --nogroup --column --color -- '.shellescape(string, 1).' '.s:find_git_root(), 1, {'options': ['--preview', '~/bin/fzf_preview.sh {}', '--bind=alt-d:kill-word']}, 0)
  elseif (a:meth == 4)
    call fzf#vim#grep('\ag -U --hidden --nogroup --column --color -- '.shellescape(string, 1), 1, {'options': ['--preview', '~/bin/fzf_preview.sh {}', '--bind=alt-d:kill-word']}, 0)
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
  let g:asyncrun_string = string
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
    if empty(files)
      redraw | echohl DiffText | echo "No files to search" | echohl None
    else
      execute 'AsyncRun! -strip \ag --vimgrep -- ' shellescape(string, 1) join(files) ' 2>/dev/null'
    endif
  elseif (a:meth == 1)
    "execute 'AsyncRun! -strip ack -s -H --nopager --nocolor --nogroup --column --smart-case --follow' shellescape(string, 1) s:find_git_root() ' 2>/dev/null'
    execute 'AsyncRun! -strip \ag --vimgrep -U --hidden -- ' shellescape(string, 1) s:find_git_root() ' 2>/dev/null'
  elseif (a:meth == 2)
    "execute 'AsyncRun! -strip -cwd ack -s -H --nopager --nocolor --nogroup --column --smart-case --follow' shellescape(string, 1) ' 2>/dev/null'
    execute 'AsyncRun! -strip \ag --vimgrep -U --hidden -- ' shellescape(string, 1) ' 2>/dev/null'
  elseif (a:meth == 3)
    call fzf#vim#grep('\ag -U --hidden --nogroup --column --color -- '.shellescape(string, 1).' '.s:find_git_root(), 1, {'options': ['--preview', '~/bin/fzf_preview.sh {}', '--bind=alt-d:kill-word']}, 0)
  elseif (a:meth == 4)
    call fzf#vim#grep('\ag -U --hidden --nogroup --column --color -- '.shellescape(string, 1), 1, {'options': ['--preview', '~/bin/fzf_preview.sh {}', '--bind=alt-d:kill-word']}, 0)
  endif
  let @/=string
  set hlsearch
endfunction

" use :let @/="" to clear out search pattern and stop any running search - wish we could use <C-c>
nnoremap <silent> <Leader>sx :let @/=""<bar>:redraw!<CR>:echo " "<CR>:let g:asyncrun_code=2<CR>:AsyncStop!<CR>:sleep 500m<CR>:AsyncStop!<CR>
vnoremap <silent> <Leader>sx <Esc>:let @/=""<bar>:redraw!<CR>:echo " "<CR>:let g:asyncrun_code=2<CR>:AsyncStop!<CR>:sleep 500m<CR>:AsyncStop!<CR>
" stop running search - wish we could use <C-c>
nnoremap <silent> <Leader>sk :let g:asyncrun_code=2<CR>:AsyncStop!<CR>:sleep 500m<CR>:AsyncStop!<CR>
vnoremap <silent> <Leader>sk <Esc>:let g:asyncrun_code=2<CR>:AsyncStop!<CR>:sleep 500m<CR>:AsyncStop!<CR>
" search normally
nnoremap <Leader>sn :let @/=""<bar>:set hlsearch<CR>/
vnoremap <Leader>sn "sy<Esc>:let @/=""<bar>:set hlsearch<CR>/<C-r>"
" search normally
nnoremap <Leader>sN :let @/=""<bar>:set hlsearch<CR>?
vnoremap <Leader>sN "sy<Esc>:let @/=""<bar>:set hlsearch<CR>?<C-r>"

" search all currently open files with results in qf list - NOTE: make sure to save buffers to disk before searching!
nnoremap <silent> <Leader>sf :let @s = expand('<cword>')<CR>:call <SID>MyVisSearch(0)<CR>
vnoremap <silent> <Leader>sf "sy<Esc>:call <SID>MyVisSearch(0)<CR>
nnoremap <silent> <Leader>sF :call <SID>MySearch(0)<CR>
vnoremap <silent> <Leader>sF <Esc>:call <SID>MySearch(0)<CR>
" search dir with results in qf list
nnoremap <silent> <Leader>sd :let @s = expand('<cword>')<CR>:call <SID>MyVisSearch(2)<CR>
vnoremap <silent> <Leader>sd "sy<Esc>:call <SID>MyVisSearch(2)<CR>
nnoremap <silent> <Leader>sD :call <SID>MySearch(2)<CR>
vnoremap <silent> <Leader>sD <Esc>:call <SID>MySearch(2)<CR>
" search globally (root/project/git dir) with results in qf list
nnoremap <silent> <Leader>sg :let @s = expand('<cword>')<CR>:call <SID>MyVisSearch(1)<CR>
vnoremap <silent> <Leader>sg "sy<Esc>:call <SID>MyVisSearch(1)<CR>
nnoremap <silent> <Leader>sG :call <SID>MySearch(1)<CR>
vnoremap <silent> <Leader>sG <Esc>:call <SID>MySearch(1)<CR>

"aug ack_alias
"  au!
"  au VimEnter * :Alias Acks   cdo
"  au VimEnter * :Alias Ackfs  cfdo
"  au VimEnter * :Alias LAcks  ldo
"  au VimEnter * :Alias LAckfs lfdo
"aug END
command! -nargs=+ -bang Acks   execute ':cdo<bang> '  . <q-args>
command! -nargs=+ -bang Ackfs  execute ':cfdo<bang> ' . <q-args>
command! -nargs=+ -bang LAcks  execute ':ldo<bang> '  . <q-args>
command! -nargs=+ -bang LAckfs execute ':lfdo<bang> ' . <q-args>

" search dir (root/project/git dir) with results in fzf/Ag list
" same as :Ag ...
nnoremap <silent> <Leader>s. :let @s = expand('<cword>')<CR>:call <SID>MyVisSearch(4)<CR>
vnoremap <silent> <Leader>s. "sy<Esc>:call <SID>MyVisSearch(4)<CR>
" <Leader>s> is used below ...
nnoremap <silent> <Leader>s: :call <SID>MySearch(4)<CR>
vnoremap <silent> <Leader>s: <Esc>:call <SID>MySearch(4)<CR>
" search globally (root/project/git dir) with results in fzf/Ag list
" same as :Agit ...
nnoremap <silent> <Leader>s/ :let @s = expand('<cword>')<CR>:call <SID>MyVisSearch(3)<CR>
vnoremap <silent> <Leader>s/ "sy<Esc>:call <SID>MyVisSearch(3)<CR>
nnoremap <silent> <Leader>s? :call <SID>MySearch(3)<CR>
vnoremap <silent> <Leader>s? <Esc>:call <SID>MySearch(3)<CR>

function! RipgrepFzf(query, fullscreen)
  let command_fmt = '\rg --column --line-number --no-heading --color=always --smart-case --hidden --iglob \!".git" -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

function! RipgrepGitFzf(query, fullscreen)
  let command_fmt = '\rg --column --line-number --no-heading --color=always --smart-case --hidden --iglob \!".git" -- %s ' . s:find_git_root() . ' || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang Rg call RipgrepFzf(<q-args>, <bang>0)
command! -nargs=* -bang Rgit call RipgrepGitFzf(<q-args>, <bang>0)

" TODO: can we do this with Ag also ?

"================================================================

let g:orig_pos = getcurpos()
let g:click_start = reltime()
let @i="0"
let @j="0"

" to grab a word - like file path below
function s:GetWord(arg) abort
  " 0 selects in visual mode - (0)ygv is like (1)
  " 1 selects in visual mode and yanks
  " 2 selects, yanks and returns to previous mode
  if @i=="2"
    startinsert
  endif
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
    sleep 351m
    execute 'normal ty`v'
    "redraw!
    if &buftype == "terminal"
      " NOTE: should we go back to live terminal mode ?
      exe "silent! normal! i"
    endif
    " TODO: can we use getchar() here to get A-3-LeftMouse ?
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
    sleep 351m
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
    sleep 351m
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
    sleep 651m
    execute 'normal ty`v'
    redraw
    if &buftype == "terminal"
      " NOTE: should we go back to live terminal mode ?
      exe "silent! normal! i"
    endif
  endif
endfunction

"================================================================

" NOTE: make qf window full width ...
" (otherwise its often below wrong window [ie on the right])
au FileType qf wincmd J

"au FileType qf noremap <buffer> <C-q> :q<CR>

" limit quickfix height ...
au FileType qf call <SID>AdjustWindowHeight(5, 10)
function! s:AdjustWindowHeight(minheight, maxheight)
  let l = 1
  let n_lines = 0
  "let w_width = winwidth(0)
  " full width qf ...
  let w_width = &co
  if &signcolumn == "yes"
    let w_width -= 2
  endif
  " ------------------
  let qfwrap = getwinvar(0, '&wrap')
  " probably run before nowrap is set ...
  let qfwrap = 0
  " ------------------
  while l <= line('$')
    " number to float for division
    if qfwrap > 0
      let l_len = strlen(getline(l)) + 0.0
      let line_width = l_len/w_width
      let n_lines += float2nr(ceil(line_width))
    else
      let n_lines += 1
    endif
    let l += 1
  endw
  exe max([min([n_lines, a:maxheight]), a:minheight]) . "wincmd _"
endfunction
" https://gist.github.com/juanpabloaj/5845848

" automatically quit Vim if quickfix window is the last ...
aug mywin
    au!
    au BufEnter * call <SID>MyWindow()
aug END
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

aug mywin2
    au!
    au BufWinEnter * call <SID>MyWindow2()
aug END
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
        autocmd WinEnter * nested silent! call <SID>QuitIfOnlyWindow()
    aug END
endif

endif " quickfix quit/close

" -----------------------------

" move current window into new tab
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

" NOTE: also :Tabmerge and <Leader>tM, <Leader>tm

" <C-w>t<C-w>K to split 2 vertical windows into horiz windows
" <C-w>t<C-w>H to split 2 horiz windows into vertical windows
" <C-w>t makes topleft window current
" <C-w>K moves curr window to topmost
" <C-w>H moves curr window to leftmost

" -----------------------------

" <Leader>: in visual mode for raw cmdline without range (can still use : or <C-w>:)
"vnoremap : <C-\><C-n>:<C-u>call <SID>MyVisQ()<CR>:
"vnoremap : <C-w>:
vnoremap <Leader>: <C-\><C-n>:<C-u>call <SID>MyVisQ()<CR>:

" -----------------------------

noremap <C-a> ^
" ctrl-e was scroll down one line so we lose that
" (but its been remapped to <C-j>)
noremap <C-e> $

" easier to type than ^
noremap <Leader>l1 g^
noremap <Leader>la ^
" to match same <Leader>l1 key pattern ...
noremap <Leader>l2 g$
noremap <Leader>le $
" for consistency ...
noremap <Leader>l0 0

" to get back orig if needed
noremap <Leader><C-e> <C-e>

" cmdline movement
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
" insert as well, wish <C-a> was ^ but that would leave insert mode briefly, causing those autocmds ...
inoremap <C-a> <Home>
inoremap <C-e> <End>

function! SkipTerminalsQuitCmd(cmd) abort
    " just to clear the cmdline of this function ...
    redraw!
    echo "\r"
    let l:bmod = 0
    let l:doquit = 1
    for b in getbufinfo()
        if b.listed
            if getbufvar(b.bufnr, '&buftype') !=# 'terminal' && getbufvar(b.bufnr, '&buftype') !=# 'popup'
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
        execute "normal! \<CR>"
    else
        execute a:cmd
    endif
endfunction

function! SkipTerminalsConfQA() abort
    " just to clear the cmdline of this function ...
    redraw!
    echo "\r"
    let l:bmod = 0
    let l:doquit = 1
    for b in getbufinfo()
        if b.listed
            if getbufvar(b.bufnr, '&buftype') !=# 'terminal' && getbufvar(b.bufnr, '&buftype') !=# 'popup'
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
        execute "normal! \<CR>"
    else
        execute "conf qa"
    endif
endfunction

function! s:QuitIfOnlyNoNameLeft() abort
    " just to clear the cmdline of this function ...
    redraw!
    echo "\r"
    if g:in_gv2 == 0
        quit
        return
    endif
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
        execute "normal! \<CR>"
    else
        execute "q!"
        "execute "tabclose!"
    endif
endfunction

" close all windows and write then quit
" no imap for this
" <C-x> used in visual mode already
"vnoremap <silent> <C-x>w     <Esc>:call SkipTerminalsQuitCmd("wqa")<CR>
"nnoremap <silent> <C-x>w          :call SkipTerminalsQuitCmd("wqa")<CR>

" no imap for this
" <C-x> used in visual mode already
"vnoremap <silent> <C-x><C-w> <Esc>:call SkipTerminalsQuitCmd("wqa")<CR>
" skip for now
"nnoremap <silent> <C-x><C-w>      :call SkipTerminalsQuitCmd("wqa")<CR>

" close all windows and confirm then quit
" no imap for this
" <C-x> used in visual mode already
"vnoremap <silent> <C-x>c     <Esc>:call SkipTerminalsQuitCmd("conf qa")<CR>
"nnoremap <silent> <C-x>c          :call SkipTerminalsQuitCmd("conf qa")<CR>

" another way to exit insert mode ...
inoremap <C-c> <Esc>

" NOTE: need to remap <C-c> for <C-x><C-c> below to work ...
"nnoremap <C-c> <C-c>
" (<C-c> previously remapped in visual mode above)
" no imap for this
" <C-x> used in visual mode already
""vnoremap <silent> <C-x><C-c> <Esc>:call SkipTerminalsQuitCmd("conf qa")<CR>
" skip for now
"nnoremap <silent> <C-x><C-c>            :call SkipTerminalsQuitCmd("conf qa")<CR>

" no imap for this
vnoremap <silent> <Leader>xc  <C-\><C-n>:<C-u>call SkipTerminalsQuitCmd("conf qa")<CR>
nnoremap <silent> <Leader>xc            :<C-u>call SkipTerminalsQuitCmd("conf qa")<CR>

" no imap for this
" skip for now
"vnoremap <silent> <Leader>ax  <C-\><C-n>:<C-u>call SkipTerminalsQuitCmd("conf qa")<CR>
"nnoremap <silent> <Leader>ax            :<C-u>call SkipTerminalsQuitCmd("conf qa")<CR>

function! EndTerminalsConfQA() abort
    " just to clear the cmdline of this function ...
    redraw!
    echo "\r"
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
"cnoreabbrev <silent> <expr> exi (getcmdtype() == ':' && getcmdline() =~ '\s*exi\s*')  ? 'call EndTerminalsConfQA()' : 'exi'
"cnoreabbrev <silent> <expr> exit (getcmdtype() == ':' && getcmdline() =~ '\s*exit\s*') ? 'call EndTerminalsConfQA()' : 'exit'
au VimEnter * :Alias exi   call\ EndTerminalsConfQA()
au VimEnter * :Alias exit  call\ EndTerminalsConfQA()

"cnoreabbrev <silent> <expr> qa (getcmdtype() == ':' && getcmdline() =~ '\s*qa\s*')  ? 'call SkipTerminalsConfQA()' : 'qa'
"cnoreabbrev <silent> <expr> qal (getcmdtype() == ':' && getcmdline() =~ '\s*qal\s*')  ? 'call SkipTerminalsConfQA()' : 'qal '
"cnoreabbrev <silent> <expr> qall (getcmdtype() == ':' && getcmdline() =~ '\s*qall\s*')  ? 'call SkipTerminalsConfQA()' : 'qall'
"cnoreabbrev <silent> <expr> quita (getcmdtype() == ':' && getcmdline() =~ '\s*quita\s*')  ? 'call SkipTerminalsConfQA()' : 'quita'
"cnoreabbrev <silent> <expr> quital (getcmdtype() == ':' && getcmdline() =~ '\s*quital\s*')  ? 'call SkipTerminalsConfQA()' : 'quital'
"cnoreabbrev <silent> <expr> quitall (getcmdtype() == ':' && getcmdline() =~ '\s*quitall\s*')  ? 'call SkipTerminalsConfQA()' : 'quitall'
au VimEnter * :Alias qal     call\ SkipTerminalsConfQA()
au VimEnter * :Alias qall    call\ SkipTerminalsConfQA()
au VimEnter * :Alias quita   call\ SkipTerminalsConfQA()
au VimEnter * :Alias quital  call\ SkipTerminalsConfQA()
au VimEnter * :Alias quitall call\ SkipTerminalsConfQA()

function! MyQuit(arg) abort
    " just to clear the cmdline of this function ...
    echo "                                    "
    redraw!
    echo "\r"
    if &buftype != 'terminal' && &buftype != 'popup'
        exe "conf " . a:arg
    endif
    echo " "
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

function s:Xdiff1(arg)
    let bufnr = winbufnr(winnr())
    let bufmod = getbufvar(bufnr, "&mod")
    if bufmod
        if a:arg == 1
            silent execute "normal! :b " . bufnr . " \<CR>"
            silent execute "normal! :w\<CR>"
            return
        elseif a:arg > 1
            silent execute "normal! :b " . bufnr . " \<CR>"
            silent execute "normal! :wq\<CR>"
            return
        endif
        redraw!
        echo "Buffer " . fnamemodify(bufname(bufnr), ':p') . " modified, save now? (y/N): "
        call inputsave()
        let c = getchar()
        while type(c) != 0
            let c = getchar()
        endwhile
        call inputrestore()
        let ans=nr2char(c)
        if ans ==# 'y' || ans ==# 'Y'
            silent execute "normal! :b " . bufnr . " \<CR>"
            silent execute "normal! :wq\<CR>"
        else
            silent execute "normal! :bd!" . bufnr . " \<CR>"
        endif
    endif
endfunction

function Xdiff(arg)
    " just to clear the cmdline of this function ...
    redraw!
    echo "\r"
    windo call <SID>Xdiff1(a:arg)
    if a:arg != 1
        call MyQuit("conf qa")
    endif
    wincmd p
endfunction

function s:SwapDiffWins(arg)
    execute "normal \<C-w>x"
endfunction
command! -nargs=* SwapDiffs call s:SwapDiffWins(<q-args>)

if &diff
  " TODO: do we want conf qa here ? ...
  "nmap  <silent> <Leader>qq           :conf qa<CR>
  "vmap  <silent> <Leader>qq <C-\><C-n>:conf qa<CR>
  nmap  <silent> <Leader>qq           :call Xdiff(0)<CR>
  vmap  <silent> <Leader>qq <C-\><C-n>:<C-u>call Xdiff(0)<CR>

  "cnoreabbrev <silent> <expr> q! (getcmdtype() == ':' && getcmdline() =~ '\s*q!\s*') ? 'qa!' : 'q!'
  "cnoreabbrev <silent> <expr> q  (getcmdtype() == ':' && getcmdline() =~ '\s*q\s*')  ? 'qa' : 'q'
  "cnoreabbrev <silent> <expr> n  (getcmdtype() == ':' && getcmdline() =~ '\s*n\s*')  ? 'qa' : 'n'
  "cnoreabbrev <silent> <expr> next (getcmdtype() == ':' && getcmdline() =~ '\s*next\s*') ? 'qa' : 'next'

  "try
  "  cuna exi
  "catch /E24:/
  "endtry
  "cnoreabbrev <silent> <expr> exi (getcmdtype() == ':' && getcmdline() =~ '\s*exi\s*') ? 'cquit' : 'exi'
  "try
  "  cuna exit
  "catch /E24:/
  "endtry
  "cnoreabbrev <silent> <expr> exit (getcmdtype() == ':' && getcmdline() =~ '\s*exit\s*') ? 'cquit' : 'exit'

  " if no mods, then :x is like :q ...
  "cnoreabbrev <silent> <expr> x (getcmdtype() == ':' && getcmdline() =~ '\s*x\s*') ? 'call Xdiff()' : 'x'

  " -------------

  " TODO: vim insert mode <arrow> / esc-seq keys may be caught as typed chars ...
  " (nvim is ok here)

  if !has("nvim")

      "let g:diff_translations = 0

      au WinEnter * imap <buffer> <Up>    <Up>
      au WinEnter * imap <buffer> <Down>  <Down>
      au WinEnter * imap <buffer> <Home>  <Home>
      au WinEnter * imap <buffer> <End>   <End>

      " what to do about these ?
      "au WinEnter * imap <buffer> <C-Up>       <C-\><C-o><C-k>
      "au WinEnter * imap <buffer> <C-Down>     <C-\><C-o><C-j>
      "au WinEnter * imap <buffer> <PageUp>     <C-\><C-o><C-u>
      "au WinEnter * imap <buffer> <PageDown>   <C-\><C-o><C-d>
      "au WinEnter * imap <buffer> <C-PageUp>   <C-\><C-o><C-b>
      "au WinEnter * imap <buffer> <C-PageDown> <C-\><C-o><C-f>

  endif

  " -------------

  au WinEnter * nnoremap <silent> <buffer> uu u
  au WinEnter * nnoremap <silent> <buffer> U  u
  au WinEnter * nmap     <silent> <buffer> u <Nop>

  au WinEnter * vnoremap <silent> <buffer> uu u
  au WinEnter * vnoremap <silent> <buffer> U  u
  au WinEnter * vmap     <silent> <buffer> u <Nop>

  let g:prevdiffopt = &diffopt

  function! s:ToggleDiffopt()
      if &diffopt =~ 'filler'
          set diffopt-=filler
      else
          set diffopt+=filler
      endif
      let g:prevdiffopt = &diffopt
      redraw!
  endfunction

  function! s:SaveAndDisableFiller()
      " this helps prevent recursive calls to here when a normal cmd or <C-\><C-o> mapping is used,
      " causing another InserLeave/InsertEnter autocmd event
      if mode(1) ==# 'niI'
          return
      endif
      let g:prevdiffopt = &diffopt
      "let g:prevView = winsaveview()
      let bline = winline()
      set diffopt-=filler
      let aline = winline()
      let mvdelta = bline - aline
      "call winrestview(g:prevView)
      "echom "mvdelta = " . mvdelta
      " feedkeys() might be a way to not have to exit/enter insertmode with <C-\><C-o> ...
      "call feedkeys("\<C-e>\<C-e>\<C-e>", "n")
      if mvdelta < 0
          exec "normal " . -mvdelta . "\<C-j>"
      elseif mvdelta > 0
          exec "normal " . mvdelta . "\<C-k>"
      endif
  endfunction

  function! s:RestoreFillerAndUpdate()
      " this helps prevent recursive calls to here when a normal cmd or <C-\><C-o> mapping is used,
      " causing another InserLeave/InsertEnter autocmd event
      if mode(1) ==# 'niI'
          return
      endif
      let bline = winline()
      if g:prevdiffopt =~ 'filler'
        set diffopt+=filler
      endif
      let g:prevdiffopt = &diffopt
      "echom "mvdelta = " . mvdelta
      diffupdate
      let aline = winline()
      let mvdelta = bline - aline
      if mvdelta < 0
          exec "normal " . -mvdelta . "\<C-j>k"
      elseif mvdelta > 0
          exec "normal " . mvdelta . "\<C-k>j"
      endif
  endfunction

  function! s:TempNoFiller()
      " this helps prevent recursive calls to here when a normal cmd or <C-\><C-o> mapping is used,
      " causing another InserLeave/InsertEnter autocmd event
      if mode(1) ==# 'niI'
          return
      endif
      let g:prevView = winsaveview()
      let bline = winline()
      set diffopt-=filler
      if g:prevdiffopt =~ 'filler'
        set diffopt+=filler
      endif
      call winrestview(g:prevView)
      let aline = winline()
      let mvdelta = bline - aline
      "echom "mvdelta = " . mvdelta
      "if mvdelta < 0
      "    exec "normal " . -mvdelta . "\<C-j>k"
      "elseif mvdelta > 0
      "    exec "normal " . mvdelta . "\<C-k>j"
      "endif
  endfunction

  aug diff_alias
      au!
      au VimEnter * :Alias! q    call\ Xdiff(0)
      au VimEnter * :Alias! qa   call\ Xdiff(0)
      au VimEnter * :Alias! n    call\ Xdiff(0)
      au VimEnter * :Alias! next call\ Xdiff(0)
      au VimEnter * :Alias! w    call\ Xdiff(1)
      au VimEnter * :Alias! x    call\ Xdiff(2)
      au VimEnter * :Alias! q!   call\ MyCQuit()
      au VimEnter * :Alias! qa!  call\ MyCQuit()
      au VimEnter * :Alias! exi  call\ MyCQuit()
      au VimEnter * :Alias! exit call\ MyCQuit()
      "au InsertEnter * diffoff
      "au InsertLeave * diffthis
      au InsertEnter * call <SID>SaveAndDisableFiller()
      au InsertLeave * call <SID>RestoreFillerAndUpdate()
      " work-around tp help keep cursor at correct line ...
      au TextChanged * call <SID>TempNoFiller()
  aug END

  " -----------

  nnoremap  <silent> <Leader>nf           :qa<CR>
  vnoremap  <silent> <Leader>nf <C-\><C-n>:qa<CR>
  nnoremap  <silent> <Leader>xc           :cquit<CR>
  vnoremap  <silent> <Leader>xc <C-\><C-n>:cquit<CR>
  nnoremap           <C-l>                :diffupdate<CR><C-l>
  vnoremap           <C-l>      <C-\><C-n>:diffupdate<CR><C-l>
  noremap  <silent> <Leader>dn ]c
  noremap  <silent> <Leader>dp [c

  "syntax off

  " to ignore whitespace diffs
  "set diffopt+=iwhite

  "colorscheme desert
  "colorscheme evening

  highlight! link DiffText MatchParen

  "hi DiffAdd    ctermfg=233 ctermbg=LightGreen guifg=#003300 guibg=#DDFFDD gui=none cterm=none
  "hi DiffChange             ctermbg=white                    guibg=#ececec gui=none cterm=none
  "hi DiffText   ctermfg=233 ctermbg=yellow     guifg=#000033 guibg=#DDDDFF gui=none cterm=none

  highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=238 gui=none guifg=bg guibg=Red
  highlight DiffDelete cterm=bold ctermfg=10 ctermbg=238 gui=none guifg=bg guibg=Red
  highlight DiffChange cterm=bold ctermfg=10 ctermbg=238 gui=none guifg=bg guibg=Red
  highlight DiffText   cterm=bold ctermfg=10 ctermbg=90  gui=none guifg=bg guibg=Red

  " vimdiff default has wrap off (as screen width is cut in half)
  " set sidescroll=1 to help navigate smoothly when wrap is off
  set sidescroll=1
  " use zhh and lzl to scroll horizontal without moving cursor
  " use Z<S-Right>/Z<S-Left> or <M-.>/<M-,> to scroll horizontally
  " or force wrap on in all windows ...
  "au VimEnter * if &diff | execute 'windo set wrap' | endif
  " but this can mess up alignment of long lines
  " and Bram said a fix is not planned ...

  " TODO: seems weird these dont work in diff ...
  "try
  "  "unmap <C-d>
  "  "unmap <C-u>
  "  unmap <C-f>
  "  unmap <C-b>
  "catch /E31:/
  "endtry
  " dont use <C-\><C-o> because those leave and enter insert mode again, triggering the slow functions and messing up mapped with input
  "inoremap <buffer> <C-f> <Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down><Down>
  "inoremap <buffer> <C-b> <Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up>

else

  aug not_diff_alias
  "!&diff
    au!
    au VimEnter * :Alias q     call\ MyQuit("q")
    au VimEnter * :Alias q!    call\ MyQuit("q!")
    au VimEnter * :Alias qa    call\ SkipTerminalsQuitCmd("qa")
    au VimEnter * :Alias qa!   call\ SkipTerminalsQuitCmd("qa!")
    au VimEnter * :Alias qu    call\ MyQuit("q")
    au VimEnter * :Alias qui   call\ MyQuit("q")
    au VimEnter * :Alias quit  call\ MyQuit("q")
    au VimEnter * :Alias qu!   call\ MyQuit("q!")
    au VimEnter * :Alias qui!  call\ MyQuit("q!")
    au VimEnter * :Alias quit! call\ MyQuit("q!")
    au VimEnter * :Alias PU    PluginUpdate
  aug END

  "cnoreabbrev <silent> <expr> x (getcmdtype() == ':' && getcmdline() =~ '\s*x\s*')  ? 'call <SID>NextOrQuit()' : 'x'
  " Alias x handled above in Magit section ...

  noremap <silent> <Leader>nf :call <SID>ConfNextOrQuit()<CR>

endif

" patience diff algo ...
"if has("patch-8.1.0360")
  "set diffopt=context:6,internal,algorithm:patience,indent-heuristic,closeoff
  set diffopt=context:6,closeoff,foldcolumn:0
  set diffopt+=filler
  noremap <silent> <Leader>df :call <SID>ToggleDiffopt()<CR>
"endif

" set wrap for vimdiff ...
"au VimEnter * if &diff | execute 'windo setlocal wrap' | endif
nnoremap <silent> <Leader>lW :silent windo setlocal nowrap! nowrap?<CR>
"there is also diffopt+=followwrap

function! MyCQuit()
    " just to clear the cmdline of this function ...
    redraw!
    echo "\r"
    cquit 1
endfunction

" if want vimdiff to exit when files are equal
"autocmd VimEnter * call Diffstart()

" if start vimdiff file1 -c 'vert diffsplit file2'
" then dont get '2 files to edit' msg at exit ...
" but shell alias for arguments ($1 $2) doesnt like
" when $2 is a dir ...

" add custom diffexpr so we do not get default diff -b cmd, as we want all space diffs highlighted
" set diffopt+=iwhite etc. to skip whitespace diffs ...
function! DiffEx()
    let opt = ""
    if &diffopt =~ "icase"
      let opt = opt . "-i "
    endif
    if &diffopt =~ "iwhite"
      let opt = opt . "-w " " swapped vim's -b with -w
    endif
    silent execute "!diff -a --binary " . opt . v:fname_in . " " . v:fname_new .  " > " . v:fname_out
endfunction

set diffexpr=DiffEx()

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
        call Xdiff(0)
    endif
endfunction

" -----------

" :x to save (if modified) and go to next (w/o prompting) or exit
function MyNextOrQuit() abort
    " TODO: should we auto hide/bdel/bwipe and/or set modifiable on these terminal buffers ?
    if &buftype ==# 'terminal' && mode() != 'n'
        echohl Statement
        echo "Unable to :quit terminal (hide|bdel|bwipe buffer)"
        echohl None
        return
    endif
    if &buftype ==# 'terminal' && mode() == 'n'
        try
            quit
            return
        catch /.*/
            " just to clear the cmdline of this function ...
            redraw!
            echo "\r"
        endtry
        echohl Statement
        echo "Unable to :quit terminal (hide|bdel|bwipe buffer)"
        echohl None
        return
    endif
    " just to clear the cmdline of this function ...
    redraw!
    echo "\r"
    update
    try
        next
    catch /E163:/
        exit
    catch /E165:/
        exit
    endtry
endfunction

function s:ConfNextOrQuit() abort
    " check if buf has changed and prompt to save now instead of after all files ?
    " TODO: should we auto hide/bdel/bwipe and/or set modifiable on these terminal buffers ?
    if &buftype ==# 'terminal' && mode() != 'n'
        echohl Statement
        echo "Unable to :quit terminal (hide|bdel|bwipe buffer)"
        echohl None
        return
    endif
    if &buftype ==# 'terminal' && mode() == 'n'
        try
            quit
            return
        catch /.*/
            " just to clear the cmdline of this function ...
            redraw!
            echo "\r"
        endtry
        echohl Statement
        echo "Unable to :quit terminal (hide|bdel|bwipe buffer)"
        echohl None
        return
    endif
    if &modified
        echo "Buffer " . bufname("") . " modified, save now? (y/N): "
        call inputsave()
        let c = getchar()
        while type(c) != 0
            let c = getchar()
        endwhile
        call inputrestore()
        let ans=nr2char(c)
        if ans ==# 'y' || ans ==# 'Y'
            update
        endif
    else
        " just to clear the cmdline of this function ...
        redraw!
        echo "\r"
    endif
    try
        next
    catch /E163:/
        silent! FloatermKill!
        conf q
    catch /E165:/
        silent! FloatermKill!
        conf q
    endtry
endfunction

" could also look into autowrite for :n to write (if modified) ...

" -----------

" terminal in cur tab NOTE: added <C-w>:se scl=no<CR> at end to turn off signcolumn in terminal only ...
if has("nvim")
    nnoremap <silent> <Leader>zs           :terminal<CR><C-\><C-n>:se scl=no<CR>i
    vnoremap <silent> <Leader>zs <C-\><C-n>:terminal<CR><C-\><C-n>:se scl=no<CR>i
else
    nnoremap <silent> <Leader>zs           :terminal ++close ++norestore ++kill=term ++curwin<CR><C-w>:se scl=no<CR>
    vnoremap <silent> <Leader>zs <C-\><C-n>:terminal ++close ++norestore ++kill=term ++curwin<CR><C-w>:se scl=no<CR>
endif
" terminal in new tab NOTE: added <C-w>:se scl=no<CR> at end to turn off signcolumn in terminal only ...
noremap <silent> zt <Nop>
if has("nvim")
    nnoremap <silent> <Leader>zt           :$tabnew<bar>terminal<CR><C-\><C-n>:se scl=no<CR>i
    vnoremap <silent> <Leader>zt <C-\><C-n>:$tabnew<bar>terminal<CR><C-\><C-n>:se scl=no<CR>i
else
    nnoremap <silent> <Leader>zt           :$tabnew<bar>terminal ++close ++norestore ++kill=term ++curwin<CR><C-w>:se scl=no<CR>
    vnoremap <silent> <Leader>zt <C-\><C-n>:$tabnew<bar>terminal ++close ++norestore ++kill=term ++curwin<CR><C-w>:se scl=no<CR>
endif
"
" NOTE: there is also <Leader>zf for new floating terminal (floaterm)
"
" terminal in new tab when already in a terminal
" MCK: use something else besides <C-x> here ...
if has("nvim")
    tnoremap <silent> <F17> <Nop>
    tnoremap <silent> <F17>t <C-\><C-n>:$tabnew<bar>:terminal<CR><C-\><C-n>:se scl=no<CR>i
    tnoremap <silent> <F17><Tab> <C-\><C-n>:$tabnew<bar>:terminal<CR><C-\><C-n>:se scl=no<CR>i
    tnoremap <silent> <F17>v <C-\><C-n>:$tabnew<CR>
    tnoremap <silent> <M-x> <Nop>
    tnoremap <silent> <M-x>t <C-\><C-n>:$tabnew<bar>:terminal<CR><C-\><C-n>:se scl=no<CR>i
    tnoremap <silent> <M-x><Tab> <C-\><C-n>:$tabnew<bar>:terminal<CR><C-\><C-n>:se scl=no<CR>i
    tnoremap <silent> <M-x>v <C-\><C-n>:$tabnew<CR>
else
    tnoremap <silent> <F17> <Nop>
    tnoremap <silent> <F17><Tab> <C-w>:$tabnew<bar>:terminal ++close ++norestore ++kill=term ++curwin<CR><C-w>:se scl=no<CR>
    tnoremap <silent> <F17>t <C-w>:$tabnew<bar>:terminal ++close ++norestore ++kill=term ++curwin<CR><C-w>:se scl=no<CR>
    tnoremap <silent> <F17>v <C-w>:$tabnew<CR>
    tnoremap <silent> <M-x> <Nop>
    tnoremap <silent> <M-x>t <C-w>:$tabnew<bar>:terminal ++close ++norestore ++kill=term ++curwin<CR><C-w>:se scl=no<CR>
    tnoremap <silent> <M-x><Tab> <C-w>:$tabnew<bar>:terminal ++close ++norestore ++kill=term ++curwin<CR><C-w>:se scl=no<CR>
    tnoremap <silent> <M-x>v <C-w>:$tabnew<CR>
endif
" window in new tab when already in a terminal
" <C-w><N> or <C-\><C-n> to get into normal mode
" a or i get back into terminal mode
" or <C-\><C-n> to toggle
"nnoremap <silent> <expr> <C-\><C-n> (&buftype == 'terminal') ? 'i' : '<C-\><C-n>'
" or <Return>, like tmux
"nmap <silent> <buffer> <expr> <Return> (&buftype == 'terminal') ? 'i' : 'gj'
" to enter normal mode, like tmux
" there is no alternate screen so this removes these from less/more/etc.
"tnoremap <silent> <C-Up>   <C-\><C-n>
"tnoremap <silent> <PageUp> <C-\><C-n>
" ctrl-x-] like tmux enter copy-mode-vi (ctrl-s-])
" MCK: use something else besides <C-x> here ...
tnoremap <silent> <F17>]     <C-\><C-n>
tnoremap <silent> <F17><C-]> <C-\><C-n>
tnoremap <silent> <M-x>]     <C-\><C-n>
tnoremap <silent> <M-x><C-]> <C-\><C-n>
" dont really want to map <C-x> + anything as <C-x> is used alone as a map in several other places
nnoremap <silent> <expr> <F17>]     (&buftype == 'terminal') ? 'i' : '<Esc>x]'
nnoremap <silent> <expr> <F17><C-]> (&buftype == 'terminal') ? 'i' : '<Esc>x<C-]>]'
nnoremap <silent> <expr> <M-x>]     (&buftype == 'terminal') ? 'i' : '<M-x>]'
nnoremap <silent> <expr> <M-x><C-]> (&buftype == 'terminal') ? 'i' : '<M-x><C-]>]'

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
    echo 'Undo all changes? (y/N): '
    call inputsave()
    let ans=nr2char(getchar())
    call inputrestore()
    if ans ==# 'y' || ans ==# 'Y'
      execute 'silent! earlier 999999'
    endif
  else
    echo 'No changes to undo'
    sleep 900m
  endif
  redraw!
  echo " "
endfunction
nnoremap <Leader>uu           :call UndoAll()<CR>
vnoremap <Leader>uu <C-\><C-n>:call UndoAll()<CR>

" TODO: u is close to i so remap t to uu and/or U ?
nnoremap <silent> <buffer> uu u
nnoremap <silent> <buffer> U  u
nmap     <silent> <buffer> u <Nop>

vnoremap <silent> <buffer> uu u
vnoremap <silent> <buffer> U  u
vmap     <silent> <buffer> u <Nop>

" NOTE: then in vless.vim we can unmap u ...
"try
"  nunmap <buffer> u
"  nunmap <buffer> uu
"  vunmap <buffer> u
"  vunmap <buffer> uu
"catch /E31:/
"endtry

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
"nmap <silent> <Leader>qq           :conf q<CR>:<CR>
"vmap <silent> <Leader>qq <C-\><C-n>:conf q<CR>:<CR>
if !&diff
    nmap <silent> <Leader>qq           :call <SID>ConfNextOrQuit()<CR>
    vmap <silent> <Leader>qq <C-\><C-n>:call <SID>ConfNextOrQuit()<CR>
endif
" window keep current and close all others
nnoremap <silent> <Leader>wk           :only<CR>
vnoremap <silent> <Leader>wk <C-\><C-n>:only<CR>

" NOTE: many other mappings for tab nav -
"       <C-w><S-Left>, <S-Right>
"       <C-w><Tab>, <S-Tab>
"       <Leader>tn, p
"       <Leader>tt, T
"       <Leader>>>, <<
"       <Leader>s<S-Left>, <S-Right>
"       <Leader>s<, >

" next tab
nnoremap <silent> <Leader>tn           :tabnext<CR>
vnoremap <silent> <Leader>tn <C-\><C-n>:tabnext<CR>
nnoremap <silent> <Leader>tt           :tabnext<CR>
vnoremap <silent> <Leader>tt <C-\><C-n>:tabnext<CR>
nnoremap <silent> <Leader>>>           :tabnext<CR>
vnoremap <silent> <Leader>>> <C-\><C-n>:tabnext<CR>
" prev tab
nnoremap <silent> <Leader>tp           :tabprevious<CR>
vnoremap <silent> <Leader>tp <C-\><C-n>:tabprevious<CR>
nnoremap <silent> <Leader>tT           :tabprevious<CR>
vnoremap <silent> <Leader>tT <C-\><C-n>:tabprevious<CR>
nnoremap <silent> <Leader><<           :tabprevious<CR>
vnoremap <silent> <Leader><< <C-\><C-n>:tabprevious<CR>

" ----------------------

" --- FOLDs ---

" to stop <Space> from opening fold ...
noremap <Space> <Space>
" use <Leader>Space to toggle (also <Leader>ff)
"noremap <Leader><Space> za

" toggle fold
noremap <Leader>ff za
" open fold
noremap <Leader>fo zo
" close fold
noremap <Leader>fc zc
" prev fold
noremap <Leader>fk zk
" next fold
noremap <Leader>fj zj
" open all folds
noremap <Leader>fO zR
" close all folds
noremap <Leader>fC zM

function! NextClosedFold(dir)
    let cmd = 'norm!z' . a:dir
    let view = winsaveview()
    let [l0, l, open] = [0, view.lnum, 1]
    while l != l0 && open
        exe cmd
        let [l0, l] = [l, line('.')]
        let open = foldclosed(l) < 0
    endwhile
    if open
        call winrestview(view)
    endif
endfunction

function! RepeatCmd(cmd) range abort
    let n = v:count < 1 ? 1 : v:count
    while n > 0
        exe a:cmd
        let n -= 1
    endwhile
endfunction

" zk goes to prev fold (open or closed), this goes to prev closed fold
nnoremap <silent> <Leader>fp :<C-u>call RepeatCmd('call NextClosedFold("k")')<CR>
" zj goes to next fold (open or closed), this goes to next closed fold
nnoremap <silent> <Leader>fn :<C-u>call RepeatCmd('call NextClosedFold("j")')<CR>

" FOLDS ---

" ----------------------

function! s:TermQuit()
    let skipquit = 0
    for b in getbufinfo()
        if b.listed
            if bufnr('%') !=# b.bufnr
                " not curr buffer
                if getbufvar(b.bufnr, '&buftype') ==# 'terminal' || getbufvar(b.bufnr, '&buftype') ==# 'popup'
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
    try
        bwipe!
    catch /E994:/
    endtry
endfunction

" DO NOT do this, it causes problems with popup shells ...
"tnoremap <silent> <C-d> <C-w>:call <SID>TermQuit()<CR>

" just because hyphen requires no shift, so = is like + w/o shift ...
 noremap <silent> <C-w>=       <C-w>+

" NOTE: many other mappings for tab nav -
"       <C-w><S-Left>, <S-Right>
"       <C-w><Tab>, <S-Tab>
"       <Leader>tn, p
"       <Leader>tt, T
"       <Leader>>>, <<
"       <Leader>s<S-Left>, <S-Right>
"       <Leader>s<, >

nnoremap <silent> <C-w><                   :tabprevious<CR>
nnoremap <silent> <C-w>>                   :tabnext<CR>
nnoremap <silent> <C-w><S-Left>            :tabprevious<CR>
nnoremap <silent> <C-w><S-Right>           :tabnext<CR>
vnoremap <silent> <C-w><         <C-\><C-n>:tabprevious<CR>
vnoremap <silent> <C-w>>         <C-\><C-n>:tabnext<CR>
vnoremap <silent> <C-w><S-Left>  <C-\><C-n>:tabprevious<CR>
vnoremap <silent> <C-w><S-Right> <C-\><C-n>:tabnext<CR>
inoremap <silent> <C-w><         <C-\><C-o>:tabprevious<CR>
inoremap <silent> <C-w>>         <C-\><C-o>:tabnext<CR>
inoremap <silent> <C-w><S-Left>  <C-\><C-o>:tabprevious<CR>
inoremap <silent> <C-w><S-Right> <C-\><C-o>:tabnext<CR>
if !has("nvim")
    " this leaves terminal in insert mode
    tnoremap <silent> <C-w><              <C-w>:tabprevious<CR>
    tnoremap <silent> <C-w>>              <C-w>:tabnext<CR>
    tnoremap <silent> <C-w><S-Left>       <C-w>:tabprevious<CR>
    tnoremap <silent> <C-w><S-Right>      <C-w>:tabnext<CR>
else
    " this leaves terminal in normal mode
    tnoremap <silent> <C-w><         <C-\><C-n>:tabprevious<CR>
    tnoremap <silent> <C-w>>         <C-\><C-n>:tabnext<CR>
    tnoremap <silent> <C-w><S-Left>  <C-\><C-n>:tabprevious<CR>
    tnoremap <silent> <C-w><S-Right> <C-\><C-n>:tabnext<CR>
endif

nnoremap <silent> <C-w><Tab>             :tabnext<CR>
nnoremap <silent> <C-w><C-Tab>           :tabnext<CR>
vnoremap <silent> <C-w><Tab>   <C-\><C-n>:tabnext<CR>
vnoremap <silent> <C-w><C-Tab> <C-\><C-n>:tabnext<CR>
inoremap <silent> <C-w><Tab>   <C-\><C-o>:tabnext<CR>
inoremap <silent> <C-w><C-Tab> <C-\><C-o>:tabnext<CR>
if !has("nvim")
    tnoremap <silent> <C-w><Tab>        <C-w>:tabnext<CR>
    tnoremap <silent> <C-w><C-Tab>      <C-w>:tabnext<CR>
else
    tnoremap <silent> <C-w><Tab>   <C-\><C-n>:tabnext<CR>
    tnoremap <silent> <C-w><C-Tab> <C-\><C-n>:tabnext<CR>
endif

nnoremap <silent> <C-w><S-Tab>             :tabprevious<CR>
vnoremap <silent> <C-w><S-Tab>   <C-\><C-n>:tabprevious<CR>
inoremap <silent> <C-w><S-Tab>   <C-\><C-o>:tabprevious<CR>
if !has("nvim")
    tnoremap <silent> <C-w><S-Tab>        <C-w>:tabprevious<CR>
else
    tnoremap <silent> <C-w><S-Tab>   <C-\><C-n>:tabprevious<CR>
endif

" to stop some errors about alternate file (<C-^> ...)
"-noremap <silent> <C-w><BS>      <Nop>
"-noremap <silent> <C-w><C-BS>    <Nop>
noremap <silent> <C-w><C-^>     <Nop>
"-noremap <silent> <C-w><C-^><BS> <Nop>

" QUES: move to next, previous tab, or window (below) ... ?
" SPECIAL: NOTE: terminals could map <C-BS> to <C-^><BS>
"--nnoremap <silent> <C-w><BS>      :tabprevious<CR>
"--nnoremap <silent> <C-w><C-BS>    :tabprevious<CR>
"--nnoremap <silent> <C-w><C-^><BS> :tabprevious<CR>
"--vnoremap <silent> <C-w><BS>      <C-\><C-n>:tabprevious<CR>
"--vnoremap <silent> <C-w><C-BS>    <C-\><C-n>:tabprevious<CR>
"--vnoremap <silent> <C-w><C-^><BS> <C-\><C-n>:tabprevious<CR>

"--nnoremap <silent> <C-w><Space>   :tabnext<CR>
"--nnoremap <silent> <C-w><C-Space> :tabnext<CR>
"--nnoremap <silent> <C-w><C-@>     :tabnext<CR>
"--vnoremap <silent> <C-w><Space>   <C-\><C-n>:tabnext<CR>
"--vnoremap <silent> <C-w><C-Space> <C-\><C-n>:tabnext<CR>
"--vnoremap <silent> <C-w><C-@>     <C-\><C-n>:tabnext<CR>

" some safety <C-w>? remaps, as these would close/quit many/all windows ...
nnoremap <silent> <C-w>q     <Nop>
nnoremap <silent> <C-w><C-q> <Nop>
nnoremap <silent> <C-w>z     <Nop>
nnoremap <silent> <C-w><C-z> <Nop>
nnoremap <silent> <C-w>o     <Nop>
nnoremap <silent> <C-w><C-o> <Nop>
nnoremap <silent> <C-w>c     <Nop>
nnoremap <silent> <C-w><C-c> <Nop>

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

" NOTE: move to next, previous window, or tab (above) ... ?
" SPECIAL: NOTE: terminals could map <C-BS> to <C-^><BS>
nnoremap <silent> <C-w><BS>      <C-w>W
nnoremap <silent> <C-w><C-BS>    <C-w>W
nnoremap <silent> <C-w><C-^><BS> <C-w>W
vnoremap <silent> <C-w><BS>      <C-w>W
vnoremap <silent> <C-w><C-BS>    <C-w>W
vnoremap <silent> <C-w><C-^><BS> <C-w>W

nnoremap <silent> <C-w><Space>   <C-w>w
nnoremap <silent> <C-w><C-Space> <C-w>w
nnoremap <silent> <C-w><C-@>     <C-w>w
vnoremap <silent> <C-w><Space>   <C-w>w
vnoremap <silent> <C-w><C-Space> <C-w>w
vnoremap <silent> <C-w><C-@>     <C-w>w

nnoremap <silent> <Leader>,,      <C-w>W
nnoremap <silent> <C-w>p          <C-w>W
nnoremap <silent> <C-w><C-p>      <C-w>W
vnoremap <silent> <C-w>p          <C-w>W
vnoremap <silent> <C-w><C-p>      <C-w>W

nnoremap <silent> <Leader>..      <C-w>w
nnoremap <silent> <C-w>n          <C-w>w
nnoremap <silent> <C-w><C-n>      <C-w>w
vnoremap <silent> <C-w>n          <C-w>w
vnoremap <silent> <C-w><C-n>      <C-w>w

" -----------------------------

function! s:OpenFile(m) abort
    let cmd = "normal! gf"
    if a:m == 1 " tab
        let cmd = "normal! \<C-w>gf"
    elseif a:m == 2 " vsplit
        let cmd = "normal! \<C-w>vgf"
    elseif a:m == 3 " hsplit
        let cmd = "normal! \<C-w>\<C-f>"
    endif
    let git_dir = s:find_git_root()
    if empty(git_dir)
        execute cmd
        return
    endif
    let opath=&path
    let &path=opath.','.git_dir.'/**'
    "echo "path = " . &path
    try
        execute cmd
        let &path = substitute(&path, ",\\=[^,]*$", "", "")
    catch /.*/
        let &path = substitute(&path, ",\\=[^,]*$", "", "")
        redraw!
        call s:warn("Error: unable to find file: \"" . expand('<cword>') . "\" in path")
        sleep 2500m
        redraw!
        echo " "
    endtry
endfunction

" try to open file under cursor
nnoremap <silent> <Leader>gf      :call <SID>OpenFile(0)<CR>
vnoremap <silent> <Leader>gf <Esc>:call <SID>OpenFile(0)<CR>
" try to open file under cursor in a tab
nnoremap <silent> <Leader>gt      :call <SID>OpenFile(1)<CR>
vnoremap <silent> <Leader>gt <Esc>:call <SID>OpenFile(1)<CR>
" try to open file under cursor in a vsplit
nnoremap <silent> <Leader>gv      :call <SID>OpenFile(2)<CR>
vnoremap <silent> <Leader>gv <Esc>:call <SID>OpenFile(2)<CR>
" try to open file under cursor in a hsplit
nnoremap <silent> <Leader>gh      :call <SID>OpenFile(3)<CR>
vnoremap <silent> <Leader>gh <Esc>:call <SID>OpenFile(3)<CR>

" convenience, so there is [v,h]split, [v,h]new
"cnoreabbrev <silent> <expr> hsplit (getcmdtype() == ':' && getcmdline() =~ '\s*hsplit\s*')  ? 'split' : 'hsplit'
"cnoreabbrev <silent> <expr> hnew   (getcmdtype() == ':' && getcmdline() =~ '\s*hnew\s*')    ? 'new'   : 'hnew'
au VimEnter * :Alias hsplit split
au VimEnter * :Alias hnew   new
" TODO: look into vim-alias ...

" most <Leader>s? mappings are for search, but these h,v,t,<Tab> +shift are for splits ...
" there is also one more: <Leader>sp for select-pane (choosewin)

" split buffer vertical
nnoremap <silent> <Leader>sV       :vsplit<CR>
" split buffer horizontal
nnoremap <silent> <Leader>sH       :split<CR>
" split buffer new tab
nnoremap <silent> <Leader>s<S-Tab> :tab split<CR>
" TODO should we also use sT ?
nnoremap <silent> <Leader>sT       :tab split<CR>

" new, empty splits - to match tmux
nnoremap <silent> <Leader>s\|     :vnew<CR>
nnoremap <silent> <Leader>s<C-\>  :vnew<CR>
nnoremap <silent> <C-w>\|         :vnew<CR>
nnoremap <silent> <C-w><C-\>      :vnew<CR>

nnoremap <silent> <Leader>s_      :new<CR>
nnoremap <silent> <Leader>s<C-^>- :new<CR>
nnoremap <silent> <C-w>_          :new<CR>
nnoremap <silent> <C-w><C-^>-     :new<CR>
nnoremap <silent> <C-w><C-->      :new<CR>

" and tab ...
nnoremap <silent> <Leader>s<Tab> :$tabnew<CR>
" (also matches <Leader>to)
" also these ...
nnoremap <silent> <Leader>sv     :vnew<CR>
nnoremap <silent> <Leader>sh     :new<CR>
" TODO should we also use st ?
nnoremap <silent> <Leader>st     :$tabnew<CR>

noremap <silent> <Leader>ss       <C-w>w
noremap <silent> <Leader>s<Left>  <C-w>W
noremap <silent> <Leader>s<Right> <C-w>w

nnoremap <silent> <Leader>s<S-Left>            :tabprevious<CR>
vnoremap <silent> <Leader>s<S-Left>  <C-\><C-n>:tabprevious<CR>
nnoremap <silent> <Leader>s<S-Right>           :tabnext<CR>
vnoremap <silent> <Leader>s<S-Right> <C-\><C-n>:tabnext<CR>

nnoremap <silent> <Leader>s<                   :tabprevious<CR>
vnoremap <silent> <Leader>s<         <C-\><C-n>:tabprevious<CR>
nnoremap <silent> <Leader>s>                   :tabnext<CR>
vnoremap <silent> <Leader>s>         <C-\><C-n>:tabnext<CR>

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

function! MyGSCloseHandlerNvim(job_id, data, event)
  if a:event == "stdout"
    let b:mckgitstatus = join(a:data)
    if exists('b:MyGSJob')
      unlet b:MyGSJob
    endif
  endif
endfunction

function! MyGSStart(timer)
  let l:jstat = "complete"
  if exists('b:MyGSJob')
    "echomsg "MyGSStart: b:MyGSJob = " . b:MyGSJob
    if has("nvim")
      let l:running = jobwait([b:MyGSJob], 0)[0]
      if l:running == -1
        let l:jstat = "run"
      endif
    else
      let l:jstat = job_status(b:MyGSJob)
    endif
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
      if !pumvisible()
        call lightline#update()
      endif
      return
    endif
    if filereadable(expand(g:gitinfo_script))
      if has("nvim")
        " TODO: add nvim jobstart() ...
        let l:command = g:gitinfo_script . ' ' . expand('%:p:h')
        "echomsg "starting job " . l:command
        let b:MyGSJob = jobstart(["/bin/bash", "-c", l:command], { 'on_stdout':function('MyGSCloseHandlerNvim'), 'stdout_buffered':v:true })
      else
        let l:command = '/bin/bash -c ' . '"' . g:gitinfo_script . ' ' . expand('%:p:h') . '"'
        "echomsg "starting job " . l:command
        let b:MyGSJob = job_start(l:command, { 'out_mode':'nl' , 'stoponexit':'kill' , 'close_cb':'MyGSCloseHandler' })
      endif
    endif
  endif
  if !pumvisible()
    call lightline#update()
  endif
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

" NOTE: add ^xterm || ^rxvt || ^urxvt here ?
" enable bracketed paste in terminal mode
if &term =~ "^screen" || &term =~ "^tmux" || &term =~ "^alacritty"
  let &t_BE="\<Esc>[?2004h"
  let &t_BD="\<Esc>[?2004l"
  let &t_PS="\<Esc>[200~"
  let &t_PE="\<Esc>[201~"
  " tmux will send xterm-style keys when its xterm-keys option is on
  exec "set <xHome>=\e[1;*H"
  exec "set <xEnd>=\e[1;*F"
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
"cnoreabbrev <silent> <expr> GstatusXX (getcmdtype() == ':' && getcmdline() =~ '\s*GstatusXX\s*')  ? 'call <SID>GitStatusXX()' : 'GstatusXX'

" -----------------------------

" vim+gdb debugging, requires gdb v7.12+
" :help terminal-debug
packadd termdebug
":Termdebug a.out

" -----------------------------

" To filter a quickfix/location list:
" :Cfilter[!] /{pat}/
" :Lfilter[!] /{pat}/

" NOTE: QFGrep plugin can also do this

packadd cfilter

aug cfilter_alias
  au!
  au VimEnter * :Alias Cold  colder
  au VimEnter * :Alias Cnew  cnewer
  au VimEnter * :Alias Lold  lolder
  au VimEnter * :Alias Lnew  lnewer
aug END

" -----------------------------

" when editing a file that is already edited with
" another Vim instance, go to that Vim instance
if !has("nvim")
    packadd! editexisting
endif

" -----------------------------
