# Lines configured by zsh-newuser-install

ZSH_HIST=~/.zsh_hist.$$
flock ~/.histfile-lock cp -p ~/.histfile $ZSH_HIST
HISTFILE=$ZSH_HIST
HISTSIZE=1000
SAVEHIST=1000

# skip SHARE_HISTORY as then up-arrow goes thru other shells' history, not just our own, and that can be confusing ...
# instead, update .histfile by merging session history periodically and at session exit and if update_zhist is run manually
setopt APPEND_HISTORY INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS HIST_IGNORE_ALL_DUPS HIST_EXPIRE_DUPS_FIRST HIST_SAVE_NO_DUPS HIST_FIND_NO_DUPS
setopt EXTENDED_HISTORY

setopt HIST_IGNORE_SPACE
# save cmds to history that start with leading space(s)
# unsetopt HIST_IGNORE_SPACE

purge_old_zhfiles()
{
    zhfiles=$(ls -1 ~/.zsh_hist.* | awk -F. '{print $NF}' 2>/dev/null)
    while read -r pid
    do
        kill -0 $pid >/dev/null 2>&1
        rc=$?
        if [[ $rc != 0 ]]
        then
            rm -f ~/.zsh_hist.${pid}
        fi
    done <<< "$zhfiles"
}

merge_zhist()
{
    merge_history
}

update_zhist()
{
    if [[ -n "$HISTFILE" ]]
    then
        merge_zhist
    fi
}

PERIOD=30
periodic()
{
    update_zhist
    purge_old_zhfiles
}

# NOTE: dont add SIGINT here as then its not handled from ^c key press on cmdline ...
trap "if [[ -n \"$HISTFILE\" ]] ; then merge_zhist ; rm -f $HISTFILE; fi" SIGTERM SIGQUIT EXIT

# --------------

unsetopt beep

# allow # on command line
setopt interactivecomments

# Esc to get into vi edit mode
bindkey -v

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/$LOGNAME/.zshrc'

# if we are just xterm then try xterm-256color
if [ -n "$TERM" ] ; then
    if [ "$TERM" = "xterm" ] ; then
        export TERM=xterm-256color
    fi
fi

# so vim terminal TERM is set properly (xterm by default)
# NOTE: vim should set it to xterm-256color as that is what it expects/uses
#if [[ -n "$VIM_TERMINAL" ]] && [[ -n "$TMUX_PANE" ]] ; then
#  export TERM=screen-256color
#fi

autoload -Uz compinit
compinit

if [ "$TERM" = "xterm-kitty" ] ; then
# Completion for kitty - needs to be after compinit ...
  kitty + complete setup zsh | source /dev/stdin
  # install does not put xterm-kitty into standard terminfo dir
  # so we need to find it on an ssh ...
  # see note about this in kitty docs
  # kitty +kitten ssh <server> ...
  # -or-
  # infocmp xterm-kitty | ssh <server> tic -x -o \~/.terminfo /dev/stdin
  if [ -z "$TERMINFO" ] ; then
    if [ -s /usr/local/kitty.app/lib/kitty/terminfo/x/xterm-kitty ]; then
        export TERMINFO=/usr/local/kitty.app/lib/kitty/terminfo
    else
        export TERM=xterm-256color
    fi
  fi
fi

# End of lines added by compinstall

# tcp foo
zmodload zsh/net/tcp

zmodload -i zsh/complist

zstyle ':completion:*' menu select
zstyle ':completion:*' show-completer true
zstyle ':completion:*' verbose false
eval "$(dircolors)"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# costs, but refreshes cmd cache automatically
# zstyle ":completion:*:commands" rehash 1
# or could just run hash -rf ...

# Enable bracketed paste: printf "\e[?2004h"
# Wait for paste to start: you’ll see \e[200~ on STDIN.
# Wait for paste to stop: you’ll see \e[201~ on STDIN.
# Disable bracketed paste: printf "\e[?2004l"
# To disable bracketed paste
# unset zle_bracketed_paste

# prompt styles (prompt -l to list) ...
# autoload -U promptinit && promptinit

#unsetopt PROMPT_CR
#unsetopt PROMPT_SP
#PROMPT_EOL_MARK

if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

setopt PROMPT_SUBST
setopt PROMPTSUBST

# word separators
# default WORDCHARS='*?_-.[]~=/&;!#$%^(){}<>'
WORDCHARS="${WORDCHARS:s#/#}"

# random_title=$[$RANDOM%100]
# precmd () { print -Pn "\e]2;%n@%M.$random_title\a" }
# precmd () { print -Pn "\e]2;%n@%M" }
# precmd () { print -Pn "\e]0;%M:%12<..<%~%<<\a" }
# precmd () { if [[ -n "$SSH_CLIENT" ]] ; then PS1='%F{007}ssh%f-%F{100}%n@%m%f:%F{150}%12<..<%~%<<%f%% '; print -Pn '\e]0;ssh-%M:%12<..<%~%<<\a'; else ; PS1='%F{100}%n@%m%f:%F{150}%12<..<%~%<<%f%% '; print -Pn '\e]0;%M:%12<..<%~%<<\a' ; fi ; if [[ -n "$TMUX_PANE" ]] ; then tmux set-window-option automatic-rename on; fi }

  precmd () { if [[ -n "$SSH_CLIENT" ]] ; then PS1='%F{007}ssh%f-%F{100}%n@%m%f:%F{150}%12<..<%~%<<%f%% '; print -Pn '\e]2;ssh-%M:%12<..<%~%<<\a'; else ; PS1='%F{100}%n@%m%f:%F{150}%12<..<%~%<<%f%% '; print -Pn '\e]2;%12<..<%~%<<\a' ; fi ; if [[ -n "$TMUX_PANE" ]] ; then tmux set-window-option automatic-rename on; fi }

# to show .dirs in tab completion ...
setopt globdots
# to allow rm f* e* to work when no f* found ...
setopt -o cshnullglob

h() { if [ -z "$*" ]; then history 1; else history 1 | egrep "$@"; fi; }

# if we want to use lsp and send cmd to all panes ...
# get list of panes:
#   tmux lsp -s
# remove ourselves ...
#   tmux lsp
# preexec () {
#   print ">>>preexec<<< cmd: \"$1\""
#   tmux send -t <pane-id> -l $1
#}

# to not eat the space before | or & ...
export ZLE_REMOVE_SUFFIX_CHARS=""

export ASAN_OPTIONS="detect_leaks=0"
export LSAN_OPTIONS="detect_leaks=0 exitcode=0"

# --------------------

# no-op utility zle function
function noop() { }
zle -N noop

# S-Insert no-op ...
bindkey  -M viins "\e[2;2~" noop
bindkey  -M vicmd "\e[2;2~" noop

# TODO: C-Insert ?

# --------------------

function viinsplus() {
    zle -K viins
    ((CURSOR+=0))
}
zle -N viinsplus

function vicmdplus() {
    zle -K vicmd
    ((CURSOR+=0))
}
zle -N vicmdplus

# remove <Esc> mapping to go into vm-cmd-mode and make it <C-x>, <Insert>
bindkey -rM viins '^['
# map <Esc> to something so there is no wait for addl chars ...
bindkey  -M viins '^['    noop
# <Insert> toggle
bindkey  -M viins "\e[2~" vicmdplus
# <C-x> toggle
bindkey -rM viins '^X'
bindkey  -M viins '^X'    vicmdplus
# <Esc>
bindkey -rM vicmd '^['
bindkey -sM vicmd '^['    'i'
# <C-x> toggle
bindkey -sM vicmd '^X'    'i'
# <Insert> toggle
bindkey -sM vicmd "\e[2~" 'i'

# --------------------

readonly ZLE_VI_MODE_CMD=0
readonly ZLE_VI_MODE_INS=1
readonly ZLE_VI_MODE_REP=2
readonly ZLE_VI_MODE_OTH=3

function zle-vi-mode {
    if [[ $KEYMAP == vicmd ]]; then
        echo -n $ZLE_VI_MODE_CMD
    elif [[ $KEYMAP == (viins|main) ]] && [[ $ZLE_STATE == *insert* ]]; then
        echo -n $ZLE_VI_MODE_INS
    elif [[ $KEYMAP == (viins|main) ]] && [[ $ZLE_STATE == *overwrite* ]]; then
        echo -n $ZLE_VI_MODE_REP
    else
        echo -n $ZLE_VI_MODE_OTH
    fi
}

function zle-backward-delete-char-fix {
    case "$(zle-vi-mode)" in
        $ZLE_VI_MODE_REP)
            if [[ $CURSOR -le $MARK ]]; then
                CURSOR=$(( $(($CURSOR-1)) > 0 ? $(($CURSOR-1)) : 0 ))
                MARK=$CURSOR
            else
                zle undo
            fi
            ;;
        *)
            zle backward-delete-char
            ;;
    esac
}

zle -N zle-backward-delete-char-fix

## Change cursor shape according to the current Vi-mode.
function zle-line-init zle-keymap-select {
    case "$(zle-vi-mode)" in
        $ZLE_VI_MODE_CMD)
            echo -ne '\e[3 q' ;; # cursor -> underline
        $ZLE_VI_MODE_INS)
            echo -ne '\e[2 q' ;; # cursor -> block
        $ZLE_VI_MODE_REP)
            echo -ne '\e[2 q'    # cursor -> block
            MARK=$CURSOR
            ;;
        *)
            ;;
    esac
}

zle -N zle-line-init
zle -N zle-keymap-select

bindkey '^?' zle-backward-delete-char-fix
bindkey '^h' zle-backward-delete-char-fix

# Ctrl-BS is ^^^? in some terminals

bindkey '^^^?' zle-backward-delete-char-fix
bindkey '^^^h' zle-backward-delete-char-fix

# --------------------

# echo -ne '\e[2 q'                # Use block shape cursor on startup.
# preexec() { echo -ne '\e[2 q' ;} # Use block shape cursor for each new prompt.

#function zle-keymap-select {
#  if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
#    if [[ $#BUFFER -gt 0 ]] ; then
#    #  for n in {1..$#BUFFER} ; do
#    #    if [[ $BUFFER[n] != " " ]] ; then
#    #      echo -ne '\e[5 q'
#    #      break
#    #    fi
#    #  done
#       echo -ne '\e[3 q'
#    fi
#  elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] || [[ ${KEYMAP} = '' ]] || [[ $1 = 'beam' ]]; then
#    echo -ne '\e[2 q'
#  fi
#}
#zle -N zle-keymap-select
#
#zle-line-init() {
#    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
#    echo -ne "\e[2 q"
#}
#zle -N zle-line-init

# --------------------

# Edit line in vim with ctrl-e:
#autoload edit-command-line; zle -N edit-command-line
#bindkey '^x' edit-command-line

# --------------------

# could use WORDCHARS above or this to select words ...
#autoload -U select-word-style
#select-word-style bash
# perhaps same thing as above
#zstyle ':zle:*' skip-whitespace-first true
#zstyle ':zle:*' word-style slash
#zstyle ':zle:my-delete-word' word-style slash
#zstyle ':zle:my-kill-word' word-style slash
#zstyle ':zle:forward-word' word-style slash
#zstyle ':zle:backward-word' word-style slash
#zstyle ':zle:backward-kill-word' word-style slash
#zstyle ':zle:kill-word' word-style slash

# --------------------

# to get up-arrow to put cursor at end of line instead of beginning ...
autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '\eOA' up-line-or-beginning-search
bindkey '\e[A' up-line-or-beginning-search
bindkey '\eOB' down-line-or-beginning-search
bindkey '\e[B' down-line-or-beginning-search
bindkey -M menuselect '^[[Z' reverse-menu-complete
bindkey '^I' expand-or-complete-prefix

# Home
bindkey -M viins '^a' beginning-of-line
bindkey -M vicmd '^a' beginning-of-line
bindkey -M viins "\e[H" beginning-of-line
bindkey -M vicmd "\e[H" beginning-of-line
bindkey -M viins "\e[1~" beginning-of-line
bindkey -M vicmd "\e[1~" beginning-of-line
# End
bindkey -M viins '^e' end-of-line
bindkey -M vicmd '^e' end-of-line
bindkey -M viins "\e[F" end-of-line
bindkey -M vicmd "\e[F" end-of-line
bindkey -M viins "\e[4~" end-of-line
bindkey -M vicmd "\e[4~" end-of-line

# Ctrl-Home
bindkey -M viins "\e[1;5H" beginning-of-line
bindkey -M vicmd "\e[1;5H" beginning-of-line
# Ctrl-End
bindkey -M viins "\e[1;5F" end-of-line
bindkey -M vicmd "\e[1;5F" end-of-line

# Ctrl-Left
bindkey -M viins "\e[1;5D" backward-word
bindkey -M vicmd "\e[1;5D" backward-word
# Ctrl-Right
bindkey -M viins "\e[1;5C" forward-word
bindkey -M vicmd "\e[1;5C" forward-word

# Ctrl-Down
bindkey "\e[1;5B" down-line-or-beginning-search
# Ctrl-Up
bindkey "\e[1;5A" up-line-or-beginning-search

# Alt-d kill word
bindkey -M viins "\ed" kill-word
bindkey -M vicmd "\ed" kill-word

#bindkey -M viins '^x' kill-whole-line
#bindkey -M vicmd '^x' kill-whole-line

# Shift-Home
bindkey -M viins "\e[1;2H" beginning-of-line
bindkey -M vicmd "\e[1;2H" beginning-of-line
# Shift-End
bindkey -M viins "\e[1;2F" end-of-line
bindkey -M vicmd "\e[1;2F" end-of-line

# Shift-Down
bindkey "\e[1;2B" down-line-or-beginning-search
# Shift-Up
bindkey "\e[1;2A" up-line-or-beginning-search

# --------------------

# Shift-DEL - backward kill word
bindkey -M viins "\e[3;2~" backward-kill-word
bindkey -M vicmd "\e[3;2~" backward-kill-word
bindkey -M viins "^w"  backward-kill-word
bindkey -M vicmd "^w"  backward-kill-word
#bindkey '^P' backward-kill-word

# -------

# del current word, but also if at end del backward word
function my-kill-word() {
# local WORDCHARS="${WORDCHARS:s#/#}"
  pos1=$CURSOR
  len1=$#BUFFER
  zle kill-word
  pos2=$CURSOR
  len2=$#BUFFER
  if [[ pos1 -eq pos2 && pos2 -eq len2 && len1 -eq ((len2+1)) ]] ; then
    if [[ $BUFFER[len1] == "" ]] ; then
      zle backward-kill-word
    fi
  elif [[ pos1 -eq pos2 && len1 -eq len2 ]] ; then
    zle backward-kill-word
  fi
}
zle -N my-kill-word

# Ctrl-DEL - del current word, but also if at end del backward word
bindkey -M viins "\e[3;5~" my-kill-word
bindkey -M vicmd "\e[3;5~" my-kill-word
# same for ^x
#bindkey "^x" my-kill-word

# -------

# del current WHOLE word, but also if at end del backward word
function my-delete-word() {
# local WORDCHARS="${WORDCHARS:s#/#}"
  if [[ $BUFFER[$CURSOR] == " " ]] ; then
    zle my-kill-word
  else
    zle forward-word
    zle backward-kill-word
  fi
}
zle -N my-delete-word

# Ctrl-Shift-DEL - del current WHOLE word, but also if at end del backward word
bindkey -M viins "\e[3;6~" my-delete-word
bindkey -M vicmd "\e[3;6~" my-delete-word
# same for Alt-DEL
bindkey -M viins "\e[3;3~" my-delete-word
bindkey -M vicmd "\e[3;3~" my-delete-word

# seems to do the same thing as my-delete-word
autoload delete-whole-word-match
zle -N delete-whole-word-match

# -------

# delete current char, but also if at end then del backward char
function my-delete-char() {
  pos1=$CURSOR
  len1=$#BUFFER
  zle delete-char
  pos2=$CURSOR
  len2=$#BUFFER
  if [[ pos1 -eq pos2 && len1 -eq len2 ]] ; then
    zle vi-backward-delete-char
  fi
}
zle -N my-delete-char
# DEL - delete current char, but also if at end then del backward char
bindkey -M viins "\e[3~" my-delete-char
bindkey -M vicmd "\e[3~" my-delete-char

# --------------------

# ctrl-d ...
# set -o ignoreeof

# 2x ctrl-d to exit ...
export IGNOREEOF=1

# bash like ctrl-d wrapper for IGNOREEOF
setopt ignore_eof
function bash-ctrl-d() {
  if [[ $CURSOR == 0 && -z $BUFFER ]]
  then
    [[ -z $IGNOREEOF || $IGNOREEOF == 0 ]] && exit
    [[ -z $__BASH_IGNORE_EOF ]] && (( __BASH_IGNORE_EOF = IGNOREEOF ))
    if [[ "$LASTWIDGET" == "bash-ctrl-d" ]]
    then
      (( __BASH_IGNORE_EOF <= 0 )) && exit
    else
      (( __BASH_IGNORE_EOF = IGNOREEOF ))
    fi
    (( __BASH_IGNORE_EOF-- ))
  fi
}
zle -N bash-ctrl-d
bindkey '^d' bash-ctrl-d

# --------------------

# like cmd &! (or cmd &|) to stay running after exit ...
setopt NO_HUP
#setopt NO_CHECK_JOBS

export KEYTIMEOUT=5

# fzf
export ESCDELAY=100

# --------------------

alias bye='echo "dont leave :-("'

alias ll='ls -ltr'
alias lla='ls -lAtr'
alias rm='rm -i'
#if [ ! -f /etc/redhat-release ] ; then
#  alias dmesg='dmesg -T'
#fi
alias dmesg='dmesg -kuxT'
alias vdiff='vimdiff'
alias vdifff='vimdiff'
alias vdif='vimdiff'

# skip -X arg to less to get alternate screen so tmux mouse can scroll ...
# and dont use -F without -X ...
# use -S to not wrap long lines ...
alias more='less'
# there is also moar
#alias more='moar'
#alias less-pyg='less-pyg'
alias lessc='less-pyg'
#alias less='less -K -iR -x4'
#alias less='bat'
alias less='smartless'

# uses bat underneath to get bat syntax color but less driver with multiple files, etc.
export LESSOPEN="|lessfilter %s"
export LESS='-iR -K -x4 -c~'

# number of lines to directly display before entering the pager
export SMARTLESS_NUM_LINES=$((LINES-6))
# the pager to be used
export SMARTLESS_PAGER='less'
# the default arguments to the pager
export SMARTLESS_PAGER_ARGUMENTS='-iR -K -x4 -c~'

#export PAGER='less -RX'
#export PAGER='bat -p'
#export PAGER='less'
#export BAT_PAGER='smartless'
#alias cat='ccat'
#alias cat='mckless -EXR:'
#alias cat='bat --plain --paging=never'
alias catc='bat --plain --tabs 4 --paging never'

alias smesg='vless /var/log/syslog'
alias tailrdm='tail -f /tmp/rdm-$LOGNAME.log'
alias difff='diff'
alias dif='diff'

# gv.vim uses noremap so need to override q, x here, look into using :Alias ?
# could also nnoremap qq qa!<CR> here
#alias vigv="vim -R -c \"GV2 \$1\" -c \":nnoremap <silent> <buffer> q <Nop>\" -c \":cnoreabbrev <silent> <buffer> q Tabcloserightquit\" -c \":cnoreabbrev <silent> <buffer> q! Tabcloserightquit\" -c \":nnoremap <silent> <buffer> x <Nop>\" -c \":cnoreabbrev <silent> <buffer> x Tabcloserightquit\" -c \":se bt=nowrite|:tabn|:hide|:redraw!\""
# use a function to support arguments ...
vigv() { vim -R -c "GV2 $1 $2 $3" -c ":nnoremap <silent> <buffer> q <Nop>" -c ":cnoreabbrev <silent> <buffer> q Tabcloserightquit" -c ":cnoreabbrev <silent> <buffer> q! Tabcloserightquit" -c ":nnoremap <silent> <buffer> x <Nop>" -c ":cnoreabbrev <silent> <buffer> x Tabcloserightquit" -c ":se bt=nowrite|:tabn|:hide|:redraw!" }

alias sync-hpcc='sync_hpcc'
alias stop-hpcc='stop_hpcc'
alias stat-hpcc='stat_hpcc'
alias start-hpcc='start_hpcc'
alias kill-hpcc='kill_hpcc'
alias make-hpcc='make_hpcc'
alias make-sync='make_sync'

alias pause-indx='rc -X all'
alias pause_indx='rc -X all'
alias resume-indx='rc -X clear'
alias resume_indx='rc -X clear'
alias clear-indx='rc -C'
alias clear_indx='rc -C'
alias start-indx='rc -J .'
alias start_indx='rc -J .'

alias start-rdm="rdm --tempdir /tmp/rdm-${LOGNAME} --log-file /tmp/rdm-${LOGNAME}.log --daemon"
alias start_rdm="rdm --tempdir /tmp/rdm-${LOGNAME} --log-file /tmp/rdm-${LOGNAME}.log --daemon"
alias stop-rdm='rc -q'
alias stop_rdm='rc -q'

# also could use -u or -U instead of --all-text
#alias ag='\ag -U --hidden -- '
# skip -- as we might want to add -i for case-insensitive etc. ...
alias ag='\ag -U --hidden '

# cannot override builtin git diff with git cmds/aliases so do it this way ...
# also add git log
git() { if [[ $1 == "diff" ]]; then shift ; command git dless "$@" ; elif [[ $1 == "log" ]]; then shift ; command git llog "$@" ; else command git "$@"; fi }

# ------------------

# -x S -y R are not supported values
alias fzf='fzf-tmux -p -x C -y 38 -w 80% -h 65%'

# to use tmux window instead of popup, add -d arg
# ls -l | fzf -d

# to add fzf args, add -- <fzf args>, as in
# ls -l | fzf -d -- --cycle

# ------------------

# kubernetes, helm etc.

alias kc='kubectl'

# ------------------

# dont disappear on a non-exiting command ...
# also note use of command
# bash does this automatically
exec() {
    which "$1" >/dev/null 2>&1
    rc=$?
    if [ $rc -eq 0 ] ; then
        builtin exec "$@"
    else
        "$@"
    fi
}

# export NCPUS=`cat /proc/cpuinfo | grep processor | wc -l`
# numcpus=$(getconf _NPROCESSORS_ONLN 2>/dev/null)
numcpus=$(nproc 2> /dev/null)
if [ -z "$numcpus" ] ; then
  export NCPUS=1
else
  export NCPUS=$numcpus
fi
alias make='make -j$NCPUS'

ulimit -n 32767
ulimit -c unlimited
ulimit -s unlimited

# MPI
export MYMPI=mpich
#export MYMPI=openmpi
#export MYMPI=mvapich

#path+=(~/${MYMPI}/bin)
#export MANPATH=${MANPATH}:~/${MYMPIi}/share/man

path+=(~/bin)
path+=(~/go/bin)
path+=(~/.cargo/bin)
path+=(/usr/local/go/bin)
path+=(/usr/share/bcc/tools)
export PATH

#export GOPATH=$HOME

export MANPATH=${MANPATH}:/usr/share/bcc/man

function collapse_pwd {
    echo $(pwd | sed -e "s,^$HOME,~,")
}

# needed for prompt colors ...
autoload -U colors && colors

# use %f instead of %{$reset_color%} to fix a problem with zsh autocomplete
#PS1='%n@%m:%12<..<%~%<<%% '
#PS1="%{$fg[green]%}%n@%m%f:%{$fg[yellow]%}%12<..<%~%<<%f%% "
 PS1='%F{100}%n@%m%f:%F{150}%12<..<%~%<<%f%% '
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ] ; then
#   PS1="%{$fg[red]%}ssh%f-%{$fg[green]%}%n@%m%f:%{$fg[yellow]%}%12<..<%~%<<%f%% "
    PS1='%F{007}ssh%f-%F{100}%n@%m%f:%F{150}%12<..<%~%<<%f%% '
fi
if [[ -n "$TMUX_PANE" ]] ; then
    tmux set-window-option automatic-rename on
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias rdpclient='padsp rdesktop -g 1580x932 -d <domain> -u $LOGNAME -p password -a 24 -k en-us -K -r clipboard:CLIPBOARD <host> &|'
# used to use -a 16
# other sizes: 1280x820, 1540x836
# padsp for getting sound to work but no mic support
# remove -grab-keyboard to use Ctrl-Alt-Del to change passwd ...
alias freerdp='xfreerdp +clipboard /scale:140 /size:2200x1300 /sound /microphone +unmap-buttons -grab-keyboard /d:RISK     /u:$LOGNAME /sec:tls /v:bct4171477-wxd > /dev/null 2>&1 &|'
# could also use /sound:sys:alsa /microphone:sys:alsa
# other sizes: 1528x832

alias gitsubrecur='git submodule update --init --recursive'

# ECLWATCH_BUILD_STRATEGY can be NO_COMPRESS or IF_MISSING
# CPACK_CMAKE_GENERATOR=Ninja may help run cpack on fewer targets

# NOTE: sometimes need to remove these *source* dirs before building or can get npm-run-all not found or other npm type errors ...
#       rm -rf esp/src/build esp/src/lib esp/src/node_modules
#       these dirs are listed in the .gitignore file so a git clean -fd ./esp/src does not remove them
#       git clean -f -fd ./esp/src _may_ work with the two -f's ...

alias cmakedbg='CC="ccache gcc" CXX="ccache g++" cmake    -DCMAKE_BUILD_TYPE=Debug          -DUSE_LIBMEMCACHED=OFF -DUSE_LIBXSLT=ON -DUSE_CPPUNIT=ON  -DUSE_CASSANDRA=OFF -DUSE_SHLIBDEPS=OFF -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DCPACK_CMAKE_GENERATOR=Ninja -DECLWATCH_BUILD_STRATEGY=IF_MISSING ../HPCC-Platform ; pushd ../HPCC-Platform && git clean -f -fd ./esp/src ; rm -rf ./esp/src/node_modules ./esp/src/lib ./esp/src/build ; popd ; ccache -C'
alias cmakeprod='CC="ccache gcc" CXX="ccache g++" cmake   -DCMAKE_BUILD_TYPE=Release        -DUSE_LIBMEMCACHED=OFF -DUSE_LIBXSLT=ON -DUSE_CPPUNIT=OFF -DUSE_CASSANDRA=OFF -DUSE_SHLIBDEPS=ON  -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DCPACK_CMAKE_GENERATOR=Ninja -DECLWATCH_BUILD_STRATEGY=IF_MISSING ../HPCC-Platform ; pushd ../HPCC-Platform && git clean -f -fd ./esp/src ; rm -rf ./esp/src/node_modules ./esp/src/lib ./esp/src/build ; popd ; ccache -C'
alias cmakereldbg='CC="ccache gcc" CXX="ccache g++" cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DUSE_LIBMEMCACHED=OFF -DUSE_LIBXSLT=ON -DUSE_CPPUNIT=ON  -DUSE_CASSANDRA=OFF -DUSE_SHLIBDEPS=OFF -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DCPACK_CMAKE_GENERATOR=Ninja -DECLWATCH_BUILD_STRATEGY=IF_MISSING ../HPCC-Platform ; pushd ../HPCC-Platform && git clean -f -fd ./esp/src ; rm -rf ./esp/src/node_modules ./esp/src/lib ./esp/src/build ; popd ; ccache -C'
alias cmakecontaner='CC="ccache gcc" CXX="ccache g++" cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCONTAINERIZED=ON -DUSE_LIBMEMCACHED=OFF -DUSE_LIBXSLT=ON -DUSE_CPPUNIT=ON  -DUSE_CASSANDRA=OFF -DUSE_SHLIBDEPS=OFF -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DCPACK_CMAKE_GENERATOR=Ninja -DECLWATCH_BUILD_STRATEGY=IF_MISSING ../HPCC-Platform ; pushd ../HPCC-Platform && git clean -f -fd ./esp/src ; rm -rf ./esp/src/node_modules ./esp/src/lib ./esp/src/build ; popd ; ccache -C'
alias cmakemysqlplug='CC="ccache gcc" CXX="ccache g++" cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DUSE_LIBMEMCACHED=OFF -DUSE_LIBXSLT=ON -DUSE_CPPUNIT=ON -DUSE_CASSANDRA=OFF -DUSE_SHLIBDEPS=OFF -DUSE_MYSQL=ON -DINCLUDE_PLUGINS=ON -DSUPPRESS_MYSQLEMBED=OFF -DSUPPRESS_REMBED=ON -DSUPPRESS_V8EMBED=ON -DSUPPRESS_MEMCACHED=ON -DSUPPRESS_REDIS=ON -DSUPPRESS_SQS=ON -DSUPPRESS_JAVAEMBED=ON -DSUPPRESS_SQLITE3EMBED=ON -DSUPPRESS_KAFKA=ON -DSUPPRESS_COUCHBASEEMBED=ON -DSUPPRESS_SPARK=ON -DSUPPRESS_EXAMPLEPLUGIN=ON -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DCPACK_CMAKE_GENERATOR=Ninja -DECLWATCH_BUILD_STRATEGY=IF_MISSING ../HPCC-Platform ; pushd ../HPCC-Platform && git clean -f -fd ./esp/src ; rm -rf ./esp/src/node_modules ./esp/src/lib ./esp/src/build ; popd ; ccache -C'

alias Qt='~/qtcreator-3.5.1/bin/qtcreator &|'

# add --shell.prompt=<cluster-name> to get prompt label ...
alias radssh='python -m radssh.shell $@'
#alias radssh='python ~/radssh/plugins/shell1.py $@'

alias thor_regression='./ecl-test run --timeout -1 --target thor -e=embedded,3rdparty'
alias hthor_regression='./ecl-test run --target hthor -e=embedded,3rdparty'
alias roxie_regression='./ecl-test run --target roxie -e=embedded,3rdparty'
alias hpcc_regression='./ecl-test run --timeout -1 -e=embedded,3rdparty'

# also look at ~/.selected_editor file
export VISUAL=vim
export EDITOR=vim

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS="--extended --cycle --reverse"

# --preview="head -n 200 {}" --preview-window=right:hidden --bind=ctrl-\\:toggle-preview

# fzf shell history is in CTRL_R ...

# fzf + ag or fd configuration
export FZF_PREVIEW_LINES=20
# use fd instead of ag to get dirs listed ...
#export FZF_DEFAULT_COMMAND='ag -U --hidden --nocolor -g ""'
export FZF_DEFAULT_COMMAND='fd -u --hidden --follow --exclude .git --color=always'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# could make alt-c for dirs only (add -t d) - then it automatically chdir to there ...
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND -t d"
# add --ansi because fd above uses --color=always ...
export FZF_DEFAULT_OPTS='--ansi --preview "bat --style=numbers --color=always --line-range :250 {}" --bind="ctrl-alt-p:toggle-preview" --bind="ctrl-f:preview-half-page-down" --bind="ctrl-b:preview-half-page-up" --bind="ctrl-k:preview-up,ctrl-j:preview-down" --bind="ctrl-u:preview-page-up,ctrl-d:preview-page-down" --bind="alt-bs:preview-half-page-up,alt-space:preview-half-page-down" --bind="alt-k:up,alt-j:down" --bind="ctrl-alt-k:preview-half-page-up,ctrl-alt-j:preview-half-page-down" --bind="page-up:page-up" --bind="page-down:page-down" --bind="alt-u:page-up" --bind="alt-d:page-down" --preview-window=right:hidden --color fg:242,bg:236,hl:65,fg+:15,bg+:239,hl+:108 --color info:108,prompt:109,spinner:108,pointer:168,marker:168'

# Options to fzf command
export FZF_COMPLETION_OPTS='+c -x'

export FZF_COMPLETION_TRIGGER="\`\`"

# use ag instead of the default find ...
# _fzf_compgen_path() {
#  ag -u --hidden --nocolor -g "" "$1"
#}

# Ag only lists files not directories, so we can use awk to get dirnames
# _fzf_compgen_dir() {
#  ag -u --hidden --nocolor -g "" "$1" | awk 'function dirname(fn) { if (fn == "") return ".";  if (fn !~ "[^/]") return "/"; sub("/*$", "", fn); if (fn !~ "/") return ".";# sub("/[^/]*$", "", fn); if (fn == "") fn = "/"; return fn } {$0 = dirname($0)} !a[$0]++'
#}

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd -u --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd -t d -u --hidden --follow --exclude ".git" . "$1"
}

# (EXPERIMENTAL) Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
# _fzf_comprun() {
#   local command=$1
#   shift
#   case "$command" in
#     cd)           fzf -d "$@" --preview 'tree -C {} | head -200' ;;
#     *)            fzf -d "$@" ;;
#   esac
# }

# -----------------------

my-fzfcmd() {
  [ -n "$TMUX_PANE" ] &&
    echo "fzf-tmux -p -x C -y 38 -w 80% -h 65% " || echo "fzf --height 50% "
}

my-fzf-history-widget() {
  local selected num
  setopt localoptions noglobsubst noposixbuiltins pipefail no_aliases 2> /dev/null
  selected=( $(fc -rl 1 | perl -ne 'print if !$seen{(/^\s*[0-9]+\**\s+(.*)/, $1)}++' | $(my-fzfcmd) +m +s -n 2.. --preview="" --tiebreak=index --bind=ctrl-r:toggle-sort --bind="ctrl-f:preview-half-page-down" --bind="ctrl-b:preview-half-page-up" --bind="page-up:page-up" --bind="page-down:page-down" --bind="alt-u:page-up" --bind="alt-d:page-down") )
  local ret=$?
  if [ -n "$selected" ]; then
    num=$selected[1]
    if [ -n "$num" ]; then
      zle vi-fetch-history -n $num
    fi
  fi
  zle reset-prompt
  return $ret
}
zle -N my-fzf-history-widget

# an unusual and vim harmless mapping from tmux for M-"
bindkey "\e\"" my-fzf-history-widget

my-fzf-files-widget() {
  local selected
  selected=( $(fd --color always --hidden --follow --exclude ".git" . | $(my-fzfcmd)) )
  local ret=$?
  if [ -n "$selected" ]; then
    zle -U "$selected"
  fi
  zle reset-prompt
  return $ret
}
zle -N my-fzf-files-widget

# an unusual and vim harmless mapping from tmux for M-_
bindkey "\e_" my-fzf-files-widget

# -----------------------

#export MANPAGER="less"
#alias manls="man -k . | fzf --prompt='Man> ' | awk '{print \$1}' | xargs -r man -P 'less'"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
alias manls="man -k . | fzf --prompt='Man> ' | awk '{print \$1}' | xargs -r man -P 'sh -c \"col -bx | bat -l man -p\"'"

# This can be slow, try it in byobu/tmux status bar ...
# git repo info/status in prompt
#if [ -f ~/.git-prompt.sh ] ; then
#  export GIT_PS1_SHOWDIRTYSTATE=1
#  source ~/.git-prompt.sh
#  if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ] ; then
#    precmd () { __git_ps1 "ssh-%n@%m" ":%~%% " "|%s" } 
#  else
#    precmd () { __git_ps1 "%n@%m" ":%~%% " "|%s" } 
#  fi
#fi
#if [ -f ~/.git-repo.sh ] ; then
#  source ~/.git-repo.sh
#  if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ] ; then
#    precmd () { __git_ps1 "ssh-%n@%m" ":%~%% " "|%s" }
#  else
#    precmd () { __git_ps1 "%n@%m" ":%~%% " "|%s" }
#  fi
#fi

alias getnewkeys='ssh -A keyphemeral@10.173.48.129'

sship()
{
  if [ -n "$SSH_CLIENT" ] ; then
    echo $SSH_CLIENT | awk '{print $1}'
  fi
}
#alias ssh-srcip=sship
if [ -n "$SSH_CLIENT" ] ; then
  export SSHIP=$(echo $SSH_CLIENT | awk '{print $1}')
fi

# needed to have gdb stop with ^C ...
stty ixany > /dev/null 2>&1
stty werase undef > /dev/null 2>&1

# not needed -
# genesis /etc/profile.d/fix_term.sh forces TERM=linux
# do get around that ssh host bash ...
## set TERM on remote hosts ...
#alias ssh='TERM=xterm-256color ssh'
## but not for me here ...
#if [[ -n "$SSH_CLIENT" ]] || [[ -n "$SSH_TTY" ]] ; then
#    if [[ "$TERM" == "xterm-256color" ]] ; then
#        export TERM=screen-256color
#    fi
#fi

# get TERM from source ...
if [[ -n "$SSH_CLIENT" ]] || [[ -n "$SSH_TTY" ]] ; then
    if [[ -n "$LC_MONETARY" ]] ; then
        rstring=$LC_MONETARY
        # strip leading whitespace
        rstring="${rstring#"${rstring%%[![:space:]]*}"}"
        # strip trailing whitespace
        rstring="${rstring%"${rstring##*[![:space:]]}"}"
        # first token
        tstring=${rstring% *}
        # rest of string
        rstring=${rstring##* }
        if [[ -n "$tstring" ]] && [[ "$TERM" == "linux" ]] ; then
            export TERM=$tstring
        fi
        if [[ -n "$rstring" ]] ; then
            export LC_MONETARY=$rstring
        else
            unset LC_MONETARY
        fi
    fi
fi

if [[ -z "$GRUVBOX" ]] && [[ -n "$TMUX" ]] && [[ -f ~/.gruvbox_256palette.sh ]] ; then
    export GRUVBOX=1
    source ~/.gruvbox_256palette.sh
fi

# --------------------

function my-up-line-or-beginning-search() {
  zle up-line-or-beginning-search
  zle beginning-of-line
}
zle -N my-up-line-or-beginning-search

function my-as-accept() {
  if [[ $CURSOR == 0 ]]
    zle end-of-line
  then
    zle autosuggest-accept
  fi
}
zle -N my-as-accept

# zsh-suggestions
source ~/Downloads/zsh-autosuggestions/zsh-autosuggestions.zsh

export ZSH_AUTOSUGGEST_MANUAL_REBIND=1
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
export ZSH_AUTOSUGGEST_USE_ASYNC=1

#ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=("${(@)ZSH_AUTOSUGGEST_ACCEPT_WIDGETS:#vi-forward-blank-word}")
ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=(forward-char vi-forward-char end-of-line vi-end-of-line up-line-or-beginning-search down-line-or-beginning-search)

ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS=(forward-word up-line-or-beginning-search down-line-or-beginning-search emacs-forward-word vi-forward-word vi-forward-word-end vi-forward-blank-word vi-forward-blank-word-end vi-find-next-char vi-find-next-char-skip)

# autosuggest-accept: Accepts the current suggestion.
# autosuggest-execute: Accepts and executes the current suggestion.
# autosuggest-clear: Clears the current suggestion.
# autosuggest-fetch: Fetches a suggestion (works even when suggestions are disabled).
# autosuggest-disable: Disables suggestions.
# autosuggest-enable: Re-enables suggestions.
# autosuggest-toggle: Toggles between enabled/disabled suggestions.
# For example, this would bind ctrl + space to accept the current suggestion.
# bindkey '^ ' autosuggest-accept

# End - already acts like autosuggest-accept (also Alt-Space)
# Ctrl-End is already mapped above to end of line which acts like autosuggest-accept

# partial-accept - next word of suggestion ...
#bindkey '^]' forward-word
# terminals may have mapped C-S-] to ^_]
bindkey '^_]' up-line-or-beginning-search
# terminals may have mapped C-S-[ to ^_[
bindkey '^_[' down-line-or-beginning-search
# terminals may have mapped C-S-\ to ^_\
bindkey '^_\'  forward-word
# also C-S-End ...
bindkey "\e[1;6F" forward-word
# and C-S-Home to beg line
bindkey "\e[1;6H" backward-word
# terminals may have mapped C-S-/ to ^_/
# send break because end-of-history or kill-line dont reset history completely
function ctrl-c-cmdline() {
  if [[ $CURSOR != 0 || -n $BUFFER ]]
  then
      zle send-break
  fi
}
zle -N ctrl-c-cmdline
bindkey '^_/' ctrl-c-cmdline
# terminals may have mapped C-S-<Space> to ^_<Space>
bindkey '^_ ' autosuggest-accept
# if we can get away with this ... just to keep cmdline quiet
bindkey '^_' noop
bindkey '^^' noop
# these all seem benign in vim ...

# C-\ - not a good key to use because in a terminal shell from vim
#       this key is not sent - <C-\><C-n> is mapped to normal mode
#       C-@ (C-Space) also does not work here ...
#bindkey '^\'   autosuggest-accept
bindkey '^\'   noop
#bindkey "\e "  autosuggest-accept
#bindkey '^@^@' autosuggest-accept
bindkey '^]'   autosuggest-accept

bindkey '^K' noop

bindkey -s "\e/" "/"

# Shift-Tab sometimes is ^[[Z - wierd
bindkey "\e[Z" noop

function enter-cmdline() {
  if [[ $CURSOR != 0 || -n $BUFFER ]]
  then
      zle accept-line
  fi
}
zle -N enter-cmdline
bindkey "\e<" enter-cmdline

function copy-cmdline() {
    if [[ $CURSOR != 0 || -n $BUFFER ]]
    then
        whence -cp grab_cmdline >/dev/null 2>&1
        rc=$?
        if [[ $rc == 0 ]]
        then
            echo -n "$BUFFER" | grab_cmdline
        fi
    fi
}
zle -N copy-cmdline
bindkey "\e=" copy-cmdline

bindkey -s "\e," ","

# Ctrl-Enter to execute suggestion
#bindkey '^\n' autosuggest-execute
# make it a no-op for safety
#bindkey '^\n' noop
#bindkey '^\n' forward-word
# safer to use Alt-Enter ...
# Alt-Enter to execute - TODO: perhaps wish it was a no-op unless at end of cmd ...
#bindkey "\e\n" autosuggest-execute

# --------------------

#fpath+=${ZDOTDIR:-~}/.zsh_functions
fpath=( ~/.zsh_functions "${fpath[@]}" )

