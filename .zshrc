# Lines configured by zsh-newuser-install

ZSH_HIST=~/.zsh_hist.$$
if [[ -z "$SUDO_USER" && -z "$SUDO_UID" ]] ; then
    flock ~/.histfile-lock cp -p ~/.histfile $ZSH_HIST
else
    cp -p ~/.histfile $ZSH_HIST
fi
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=$ZSH_HIST

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

#   if [[ -z "$WSL_DISTRO_NAME" && -z "$WSLENV" ]] ; then
#       which pgrep > /dev/null 2>&1
#       rc=$?
#       if [[ $rc -eq 0 ]] ; then
#           which wmctrl > /dev/null 2>&1
#           rc=$?
#           if [[ $rc -eq 0 ]] ; then
#               # remove copyq from app-switcher window list ...
#               pgrep -x copyq > /dev/null 2>&1
#               rc=$?
#               if [[ $rc -eq 0 ]] ; then
#                   wmctrl -r copyq -b add,skip_taskbar > /dev/null 2>&1
#               fi
#           fi
#       fi
#   fi

    if [[ -z "$WSL_DISTRO_NAME" && -z "$WSLENV" ]] ; then
        if [[ -s /sys/class/power_supply/BAT0/status ]] ; then
            cat /sys/class/power_supply/BAT0/status 2>/dev/null | grep -q Discharging
            rc1=$?
            if [[ $rc1 -ne 0 ]] ; then
                # we are plugged in, try to inhibit idle check ...
                who 2>/dev/null | grep -q ttyUSB0
                rc2=$?
                if [[ $rc2 -eq 0 ]] ; then
                    # logged in via serial tty ...
                    # if inhibit process is not running then start one
                    #dbus-send --session --type=method_call --print-reply --dest=org.gnome.SessionManager /org/gnome/SessionManager org.gnome.SessionManager.GetInhibitors
                    #user pid ppid 0 17:17 ? 00:00:00 gnome-session-inhibit --inhibit suspend:idle sleep 1000000
                    #setsid -f gnome-session-inhibit --inhibit suspend:idle sleep 1000000 >/dev/null 2>&1
                    # but then kill this inhibit process at serial tty logout ?
                fi
            fi
        fi
    fi
}

# NOTE: dont add SIGINT here as then its not handled from ^c key press on cmdline ...
trap "if [[ -n \"$HISTFILE\" ]] ; then merge_zhist ; rm -f $HISTFILE; fi" SIGTERM SIGQUIT EXIT

# --------------

# git is an alias in the .zshenv file so it is always sourced (non-interactive shells/scripts)

# if we wanted to have some aliases in bash scripts (non-interactive) ...
export BASH_ENV=~/.bash_git_alias

# --------------

unsetopt beep

# allow # on command line
setopt interactivecomments

# Esc to get into vi edit mode
bindkey -v

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/$LOGNAME/.zshrc'

# --------------

# so vim terminal TERM is set properly (xterm by default)
# NOTE: vim should set it to xterm-256color as that is what it expects/uses
#if [[ -n "$VIM_TERMINAL" ]] && [[ -n "$TMUX_PANE" ]] ; then
#  export TERM=screen-256color
#fi

if [ -n "$TERM" ] ; then
    # if we are just xterm then try xterm-256color ...
    if [ "$TERM" = "xterm" ] ; then
        export TERM=xterm-256color
    # if screen is used to connect via serial line ...
    # NOTE: C-a \ to exit screen (or perhaps C-\ Q)
    elif [ "$TERM" = "ttyterm" ] ; then
        if [[ -z "$WSL_DISTRO_NAME" && -z "$WSLENV" ]] ; then
            export SSH_CLIENT=ttyterm
            export SSH_TTY=$(tty)
            # xterm-256color has problems with bce ...
            # export TERM=screen-256color-bce
            # alt-screen scrollback buffer works ok with tmux-256color
            # when tmux own default-terminal is also tmux-256color
            export TERM=tmux-256color
            tset
            resize
            stty ixoff > /dev/null 2>&1
        fi
    fi
fi

# --------------

#fpath+=${ZDOTDIR:-~}/.zsh_functions
fpath=( ~/.zsh_functions "${fpath[@]}" )

zstyle ':completion:*' menu select
zstyle ':completion:*' show-completer true
zstyle ':completion:*' verbose false
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# yes this points to bash - but its correct ...
zstyle ':completion:*:*:git:*' script /usr/share/bash-completion/completions/git

# --------

# fzf for zsh tab completion of many/most cmds ...
# ok, but then some things do not work, like vi f<tab> ...
#source ~/Downloads/fzf-tab-completion/zsh/fzf-zsh-completion.sh
#zstyle ':completion:*' fzf-search-display true

# --------

# costs, but refreshes cmd cache automatically
# zstyle ":completion:*:commands" rehash 1
# or could just run hash -rf ...

if [[ -z "$SUDO_USER" && -z "$SUDO_UID" ]] ; then
    autoload -Uz compinit && compinit
fi

zmodload -i zsh/complist

# --------------

LS_COLORS=$(echo $LS_COLORS | sed 's/ow=[0-9]*;[0-9]*/ow=30;46/')
export LS_COLORS
#eval "$(dircolors)"

if [[ -z "$ZUTTY_VERSION" ]] ; then
    # some apps use this to know
    export COLORTERM="truecolor"
fi

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

# Enable bracketed paste: printf "\e[?2004h"
# Wait for paste to start: you’ll see \e[200~ on STDIN.
# Wait for paste to stop: you’ll see \e[201~ on STDIN.
# Disable bracketed paste: printf "\e[?2004l"
# To disable bracketed paste
# unset zle_bracketed_paste

# -----------

# This speeds up pasting w/ autosuggest
# https://github.com/zsh-users/zsh-autosuggestions/issues/238
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

# https://github.com/zsh-users/zsh-autosuggestions/issues/351
ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(bracketed-paste)
ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(accept-line)

# -----------

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

# why do we need to run tmux set-window-option automatic-rename in precmd() ?
# precmd () { if [[ -n "$SSH_CLIENT" ]] ; then PS1='%F{007}ssh%f-%F{100}%n@%m%f:%F{150}%12<..<%~%<<%f%% '; print -Pn '\e]2;ssh-%M:%12<..<%~%<<\a'; else ; PS1='%F{100}%n@%m%f:%F{150}%12<..<%~%<<%f%% '; print -Pn '\e]2;%12<..<%~%<<\a' ; fi ; if [[ -n "$TMUX_PANE" ]] ; then tmux set-window-option automatic-rename on; fi }

  precmd () { if [[ -z "$SSH_CLIENT" ]] ; then PS1='%F{100}%n@%m%f:%F{150}%12<..<%~%<<%f%% '; print -Pn '\e]2;%12<..<%~%<<\a' ; elif [[ "$SSH_CLIENT" == "ttyterm" ]] ; then PS1='%F{007}tty%f-%F{100}%n@%m%f:%F{150}%12<..<%~%<<%f%% '; print -Pn '\e]2;tty-%M:%12<..<%~%<<\a'; else ; PS1='%F{007}ssh%f-%F{100}%n@%m%f:%F{150}%12<..<%~%<<%f%% '; print -Pn '\e]2;ssh-%M:%12<..<%~%<<\a'; fi }

# on each cd/chdir ...

  chpwd() { }

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

# --------------------

# gcc/clang -fsanitize=leak ...

export ASAN_OPTIONS="detect_leaks=0"
export LSAN_OPTIONS="detect_leaks=0 exitcode=0 max_leaks=100"

# also can add to ASAN_OPTIONS=fast_unwind_on_malloc=0 if trace is missing

# also can add to LSAN_OPTIONS: suppressions=/tmp/leak_suppresion.txt
# where leak_supression.txt file is:
# leak:FooBar

# to remove FooBar symbol from checking

# and may need to manually dump leak summary ...

#   #include <sanitizer/lsan_interface.h>
#
#   void handler(int sig)
#   {
#       __lsan_do_leak_check();
#       if (sig == SIGUSR1)
#           return;
#       exit(1);
#   }

# --------------------

# no-op utility zle function
function noop() { }
zle -N noop

# S-Insert no-op ...
bindkey  -M viins "\e[2;2~" noop
bindkey  -M vicmd "\e[2;2~" noop

# C-Insert no-op ...
bindkey  -M viins "\e[2;5~" noop
bindkey  -M vicmd "\e[2;5~" noop

# M-Insert no-op ...
bindkey  -M viins "\e[2;3~" noop
bindkey  -M vicmd "\e[2;3~" noop

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
    if [[ -n "$ZUTTY_VERSION" || -n "$ST_VERSION_SKIP" ]] ; then
        return
    fi
    case "$(zle-vi-mode)" in
        $ZLE_VI_MODE_CMD)
            echo -ne '\e[4 q' ;; # cursor -> underline
        $ZLE_VI_MODE_INS)
            echo -ne '\e[1 q' ;; # cursor -> block
        $ZLE_VI_MODE_REP)
            echo -ne '\e[1 q'    # cursor -> block
            MARK=$CURSOR
            ;;
        *)
            ;;
    esac
}

zle -N zle-line-init
if [[ -z "$ZUTTY_VERSION" && -z "$ST_VERSION_SKIP" ]] ; then
    zle -N zle-keymap-select
fi

bindkey '^?' zle-backward-delete-char-fix
bindkey '^h' zle-backward-delete-char-fix

# Ctrl-BS is ^^^? in some terminals

bindkey '^^^?' zle-backward-delete-char-fix
bindkey '^^^h' zle-backward-delete-char-fix

# Alt-BS is discarded in many terminals and tmux ...
# should we make it BS ???

# --------------------

# echo -ne '\e[1 q'                # Use block shape cursor on startup.
# preexec() { echo -ne '\e[1 q' ;} # Use block shape cursor for each new prompt.

#function zle-keymap-select {
#  if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
#    if [[ $#BUFFER -gt 0 ]] ; then
#    #  for n in {1..$#BUFFER} ; do
#    #    if [[ $BUFFER[n] != " " ]] ; then
#    #      echo -ne '\e[5 q'
#    #      break
#    #    fi
#    #  done
#       echo -ne '\e[4 q'
#    fi
#  elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] || [[ ${KEYMAP} = '' ]] || [[ $1 = 'beam' ]]; then
#    echo -ne '\e[1 q'
#  fi
#}
#zle -N zle-keymap-select
#
#zle-line-init() {
#    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
#    echo -ne "\e[1 q"
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
# if multi-line from bracketed-paste then first-non-blank does not keep going to previous line ...
#bindkey -M vicmd '^a' vi-first-non-blank
#bindkey -M viins '^a' vi-first-non-blank
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

# Shift-Left
bindkey "\e[1;2D" backward-char
# Shift-Right
bindkey "\e[1;2C" forward-char

# Alt-Left
bindkey "\e[1;3D" backward-char
# Alt-Right
bindkey "\e[1;3C" forward-char

# Alt-Shift-Left - used by tmux for pane sizing
# Alt-Shift-Right - used by tmux for pane sizing

# Alt-Down
bindkey "\e[1;3B" down-line-or-beginning-search
# Alt-Up
bindkey "\e[1;3A" up-line-or-beginning-search

# Alt-Shift-Up - used by tmux for pane sizing
# Alt-Shift-Down - used by tmux for pane sizing

# --------------------

# Shift-DEL - backward kill word
bindkey -M viins "\e[3;2~" backward-kill-word
bindkey -M vicmd "\e[3;2~" backward-kill-word
bindkey -M viins "^w"  backward-kill-word
bindkey -M vicmd "^w"  backward-kill-word
#bindkey '^P' backward-kill-word

# -------

#zle_highlight=(region:fg=#c5c5c5,bg=#14292e)
zle_highlight=(region:bg=#14292e)

function kill-all-backwards()
{
    zle set-mark-command
    CURSOR=0
    zle exchange-point-and-mark
    zle kill-region
}
zle -N kill-all-backwards

# backward-kill-line or vi-kill-line or kill-whole-line ?
# without binding then after a viins mode it wont go backwards past where it left viins mode
bindkey -M vicmd "^u" kill-all-backwards
bindkey -M viins "^u" kill-all-backwards

# Alt-Shift-DEL - delete everything backwards
bindkey -M vicmd "\e[3;4~" backward-kill-line
bindkey -M viins "\e[3;4~" backward-kill-line

# and some keys for going to abs beginning of multi-line and abs end ...
# sort of like ctrl-home / ctrl-end ?
# or perhaps alt-, / alt-. ?

# some func to kill entire multi-line no matter where (already Ctrl-c) ?

function kill-multi-line()
{
    zle abs-end-of-line
    zle set-mark-command
    CURSOR=0
    zle exchange-point-and-mark
    zle kill-region
}
zle -N kill-multi-line

# Alt-Shift-k to kill-whole-line even when multi-line
bindkey -M viins "\eK" kill-multi-line
bindkey -M vicmd "\eK" kill-multi-line

function abs-beg-of-line()
{
    CURSOR=0
}
zle -N abs-beg-of-line

function abs-end-of-line()
{
    len1=$#BUFFER
    if [[ $len1 -gt 0 ]] ; then
        ((len1-1))
    fi
    CURSOR=$len1
}
zle -N abs-end-of-line

# Ctrl-Home
bindkey -M viins "\e[1;5H" abs-beg-of-line
bindkey -M vicmd "\e[1;5H" abs-beg-of-line
# Ctrl-End
bindkey -M viins "\e[1;5F" abs-end-of-line
bindkey -M vicmd "\e[1;5F" abs-end-of-line

# -------

function yank-fix()
{
    zle yank-pop
    zle yank
    ((CURSOR--))
    ((CURSOR++))
}
zle -N yank-fix

# paste back kill buffer
bindkey -M vicmd '^y' yank-fix
bindkey -M viins '^y' yank-fix

# -------

bindkey -s "\e," ","
bindkey -s "\e." "."

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

# Ctrl-Alt-DEL (if OS doesn't usurp it)
bindkey -M viins "\e[3;7~" my-kill-word
bindkey -M vicmd "\e[3;7~" my-kill-word

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

# -------

function kill-path-word()
{
    local words word spaces
    zle set-mark-command                 # save current cursor position ("mark")
    while [[ $LBUFFER[-1] == "/" ]] {
        (( CURSOR -= 1 ))                # consume all trailing slashes
    }
    words=("${(s:/:)LBUFFER/\~/_}")      # split command line at "/" after "~" is replaced by "_" to prevent FILENAME EXPANSION messing things up
    word=$words[-1]                      # this is the portion from cursor back to previous "/"
    (( CURSOR -= $#word ))               # then, jump to the previous "/"
    zle exchange-point-and-mark          # swap "mark" and "cursor"
    zle kill-region                      # delete marked region
}
zle -N kill-path-word

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

# units are in hundredths of a sec (so 7 == 70 ms)
export KEYTIMEOUT=7

# fzf
export ESCDELAY=100

# --------------------

if command -v batcat > /dev/null; then
  export BATNAME="batcat"
  alias bat='batcat'
else
  export BATNAME="bat"
fi

if command -v fdfind > /dev/null; then
  export FDNAME="fdfind"
  alias fd='fdfind'
else
  export FDNAME="fd"
fi

# --------------------

# wsl git cred mgr ...

if [[ -n "$WSL_DISTRO_NAME" || -n "$WSLENV" ]] ; then
    if [[ -n "GCM_CREDENTIAL_STORE" ]] ; then
        export GCM_CREDENTIAL_STORE=cache
    fi
fi

# --------------------

#alias start_tmux='exec \start_tmux 1'
start_tmux()
{
    if [[ -n "$WSL_DISTRO_NAME" || -n "$WSLENV" ]] ; then
        exec byobu
    fi
    if [ -z "$TMUX" ] ; then
        exec command start_tmux 1
    else
        echo "\$TMUX set ..."
    fi
}

alias st='command st -g 194x51+690+678'

alias bye='echo "dont leave :-("'

alias ll='ls -ltr'
alias lla='ls -lAtr'
alias rm='rm -i'
#if [ ! -f /etc/redhat-release ] ; then
#  alias dmesg='dmesg -T'
#fi
alias dmesg='dmesg -kuxT'

# skip -X arg to less to get alternate screen so tmux mouse can scroll ...
# and dont use -F without -X ...
# use -S to not wrap long lines ...
alias more='less'
# there is also moar
#alias more='moar'

# ov is not as sophisticated as less ...
#alias more='BAT_PAGER=ov bat --plain --tabs 4'

#alias less-pyg='less-pyg'
alias lessc='less-pyg'
#alias less='less -K -iR -x4'
#alias less='$BATNAME'
#alias less='smartless'

# Add mouse scrolling support in less (does not work with older versions of "less")
# dont use -F without -X - and with -X there is no mouse support ...
# is this still the case with current version of less ?

# less version 600+ with -F is like smartless ...
# if file is < height then it doesn't go into pager
# (and -c would clear screen first and start at top)

# uses $BATNAME underneath to get $BATNAME syntax color but less driver with multiple files, etc.
export LESSOPEN="|lessfilter %s"
# the default arguments to the pager, note -c means clear screen and start at top
export LESS='-M -F -iR -K -x4 -~'

#export LESSHISTFILE='-'
export LESSHISTSIZE=20

# dont really need/use smartless anymore, see above ...

# number of lines to directly display before entering the pager
export SMARTLESS_NUM_LINES=$((LINES-6))
# the pager to be used
export SMARTLESS_PAGER='less'
# the default arguments to the pager, note -c means clear screen and start at top
export SMARTLESS_PAGER_ARGUMENTS='-M -iR -K -x4 -c -~'

#export PAGER='less -RX'
#export PAGER='$BATNAME -p'
#export PAGER='less'
#export BAT_PAGER='smartless'

#alias cat='ccat'
#alias cat='mckless -EXR:'
#alias cat='$BATNAME --plain --paging=never'
alias catc='$BATNAME --plain --tabs 4 --paging never'

alias smesg='vless /var/log/syslog'
alias vsmesg='vimless /var/log/syslog'
alias nsmesg='nvimless /var/log/syslog'
alias tailrdm='tail -f /tmp/rdm-$LOGNAME.log'
alias difff='diff'
alias dif='diff'

# make it a function instead of an alias so it can ignore extra arguments ...
ifconfig()
{
    ip -4 a
}

alias ztop='zenith'

alias view='vi -R'

# gv.vim uses noremap so need to override q, x here, look into using :Alias ?
# could also nnoremap qq qa!<CR> here
#alias vigv="vim -R -c \"GV2 \$1\" -c \":nnoremap <silent> <buffer> q <Nop>\" -c \":cnoreabbrev <silent> <buffer> q Tabcloserightquit\" -c \":cnoreabbrev <silent> <buffer> q! Tabcloserightquit\" -c \":nnoremap <silent> <buffer> x <Nop>\" -c \":cnoreabbrev <silent> <buffer> x Tabcloserightquit\" -c \":se bt=nowrite|:tabn|:hide|:redraw!\""
# use a function to support arguments ...
vigv()  { vi -R -c "GV2 $1 $2 $3" -c ":nnoremap <silent> <buffer> q <Nop>" -c ":cnoreabbrev <silent> <buffer> q Tabcloserightquit" -c ":cnoreabbrev <silent> <buffer> q! Tabcloserightquit" -c ":nnoremap <silent> <buffer> x <Nop>" -c ":cnoreabbrev <silent> <buffer> x Tabcloserightquit" -c ":se bt=nowrite|:tabn|:hide|:sleep 100m|:redraw!" }
vvigv() { vim -R -c "GV2 $1 $2 $3" -c ":nnoremap <silent> <buffer> q <Nop>" -c ":cnoreabbrev <silent> <buffer> q Tabcloserightquit" -c ":cnoreabbrev <silent> <buffer> q! Tabcloserightquit" -c ":nnoremap <silent> <buffer> x <Nop>" -c ":cnoreabbrev <silent> <buffer> x Tabcloserightquit" -c ":se bt=nowrite|:tabn|:hide|:sleep 100m|:redraw!" }
nvigv() { nvi -R -c "GV2 $1 $2 $3" -c ":nnoremap <silent> <buffer> q <Nop>" -c ":cnoreabbrev <silent> <buffer> q Tabcloserightquit" -c ":cnoreabbrev <silent> <buffer> q! Tabcloserightquit" -c ":nnoremap <silent> <buffer> x <Nop>" -c ":cnoreabbrev <silent> <buffer> x Tabcloserightquit" -c ":se bt=nowrite|:tabn|:hide|:sleep 100m|:redraw!" }

vical()  { vi -c "Calendar $1 $2 $3" -c ":nnoremap <silent> <buffer> q <Nop>" -c ":cnoreabbrev <silent> <buffer> q Tabcloserightquit" -c ":cnoreabbrev <silent> <buffer> q! Tabcloserightquit" -c ":nnoremap <silent> <buffer> x <Nop>" -c ":cnoreabbrev <silent> <buffer> x Tabcloserightquit" }
vvical() { vim -c "Calendar $1 $2 $3" -c ":nnoremap <silent> <buffer> q <Nop>" -c ":cnoreabbrev <silent> <buffer> q Tabcloserightquit" -c ":cnoreabbrev <silent> <buffer> q! Tabcloserightquit" -c ":nnoremap <silent> <buffer> x <Nop>" -c ":cnoreabbrev <silent> <buffer> x Tabcloserightquit" }
nvical() { nvi -c "Calendar $1 $2 $3" -c ":nnoremap <silent> <buffer> q <Nop>" -c ":cnoreabbrev <silent> <buffer> q Tabcloserightquit" -c ":cnoreabbrev <silent> <buffer> q! Tabcloserightquit" -c ":nnoremap <silent> <buffer> x <Nop>" -c ":cnoreabbrev <silent> <buffer> x Tabcloserightquit" }

magit()  { vi -c "Magit2 $1" }
vimagit()  { vi -c "Magit2 $1" }
vmagit() { vim -c "Magit2 $1" }
nmagit() { nvi -c "Magit2 $1" }

#function delete-branches() {
#  local branches_to_delete
#  branches_to_delete=$(git branch | fzf --multi)
#
#  if [ -n "$branches_to_delete" ]; then
#    git branch --delete --force $branches_to_delete
#  fi
#}

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
#alias ag='\ag -U --one-device --hidden --ignore ".git" --ignore ".cache" --ignore ".cargo" -- '
# skip -- as we might want to add -i for case-insensitive etc. ...
#alias ag='command ag -U --one-device --hidden --ignore ".git" --ignore ".cache" --ignore ".cargo" '
#alias rg='command rg --color=always --smart-case --one-file-system --hidden --iglob !".git" '

# use these instead of aliasas above, only because git is a custom command now
# and ag git wont find anything, you need ag 'git' ...

# use ~/.agignore for ignore patterns ...
# do we add a --depth 3 or so to help save huge traversals ?

ag() { command ag -U --one-device --hidden --ignore ".git" --ignore ".cache" --ignore ".ccache" --ignore ".debug" --ignore ".vscode" --ignore ".pcloud" --ignore ".rustup" --ignore ".cargo" "$@"; }

# could put all these rg cmdline options in this file ...
# do we add a --max-depth 3 or so to help save huge traversals ?
export RIPGREP_CONFIG_PATH=~/.rgrc

rg() { command rg --color=always --text --smart-case --one-file-system --hidden --iglob !".git" --iglob !".cache" --iglob !".ccache" --iglob !".debug" --iglob !".vscode" --iglob !".pcloud" --iglob !".rustup" --iglob !".cargo" "$@"; }

# cannot override builtin git diff with git cmds/aliases so do it this way ...
# also add git log

#zmodload zsh/system

#{
#    local lockvar
#    touch ~/.gitcmd-lock
#    zsystem flock -f lockvar ~/.gitcmd-lock
#    ...
#    zsystem flock -u $lockvar
#}

# git is an alias in the .zshenv file so it is always sourced (non-interactive shells/scripts)
# do we need this ?  Since its already an alias ??
alias git='~/bin/git'

# ------------------

# -x S -y R are not supported values
if [ -n "$TMUX_PANE" -a -z "$VIM_TERMINAL" ] ; then
    alias fzf='fzf-tmux -p -x C -y 38 -w 80% -h 65%'
fi

# to use tmux window instead of popup, add -d arg
# ls -l | fzf -d

# to add fzf args, add -- <fzf args>, as in
# ls -l | fzf -d -- --cycle

# ------------------

# kubernetes, helm etc.

alias kc='kubectl'

# kubectl completion zsh > ~/.kc_zsh
# source ~/.kc_zsh

# ------------------

# lazygit

alias lg='lazygit'

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
    export MAKECPUS=1
else
    ncpus=$numcpus
    if [[ $ncpus -gt 1 ]] ; then
      ncpus=$((numcpus-1))
    fi
    export NCPUS=$numcpus
    export MAKECPUS=$ncpus
fi
alias make='\make -j$MAKECPUS'

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

alias cmakedbg='CC="ccache gcc" CXX="ccache g++" cmake    -DCMAKE_BUILD_TYPE=Debug          -DUSE_LIBMEMCACHED=OFF -DUSE_LIBXSLT=ON -DUSE_CPPUNIT=ON  -DUSE_AWS=OFF -DUSE_CASSANDRA=OFF -DUSE_SHLIBDEPS=OFF -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DCPACK_CMAKE_GENERATOR=Ninja -DECLWATCH_BUILD_STRATEGY=IF_MISSING ../HPCC-Platform ; pushd ../HPCC-Platform && git clean -f -fd ./esp/src ; rm -rf ./esp/src/node_modules ./esp/src/lib ./esp/src/build ; popd ; ccache -C'
alias cmakeprod='CC="ccache gcc" CXX="ccache g++" cmake   -DCMAKE_BUILD_TYPE=Release        -DUSE_LIBMEMCACHED=OFF -DUSE_LIBXSLT=ON -DUSE_CPPUNIT=OFF -DUSE_AWS=OFF -DUSE_CASSANDRA=OFF -DUSE_SHLIBDEPS=ON  -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DCPACK_CMAKE_GENERATOR=Ninja -DECLWATCH_BUILD_STRATEGY=IF_MISSING ../HPCC-Platform ; pushd ../HPCC-Platform && git clean -f -fd ./esp/src ; rm -rf ./esp/src/node_modules ./esp/src/lib ./esp/src/build ; popd ; ccache -C'
alias cmakereldbg='CC="ccache gcc" CXX="ccache g++" cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DUSE_LIBMEMCACHED=OFF -DUSE_LIBXSLT=ON -DUSE_CPPUNIT=ON  -DUSE_AWS=OFF -DUSE_CASSANDRA=OFF -DUSE_SHLIBDEPS=OFF -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DCPACK_CMAKE_GENERATOR=Ninja -DECLWATCH_BUILD_STRATEGY=IF_MISSING ../HPCC-Platform ; pushd ../HPCC-Platform && git clean -f -fd ./esp/src ; rm -rf ./esp/src/node_modules ./esp/src/lib ./esp/src/build ; popd ; ccache -C'
alias cmakecontaner='CC="ccache gcc" CXX="ccache g++" cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCONTAINERIZED=ON -DUSE_LIBMEMCACHED=OFF -DUSE_LIBXSLT=ON -DUSE_CPPUNIT=ON -DUSE_AWS=OFF -DUSE_CASSANDRA=OFF -DUSE_SHLIBDEPS=OFF -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DCPACK_CMAKE_GENERATOR=Ninja -DECLWATCH_BUILD_STRATEGY=IF_MISSING ../HPCC-Platform ; pushd ../HPCC-Platform && git clean -f -fd ./esp/src ; rm -rf ./esp/src/node_modules ./esp/src/lib ./esp/src/build ; popd ; ccache -C'
alias cmakemysqlplug='CC="ccache gcc" CXX="ccache g++" cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DUSE_LIBMEMCACHED=OFF -DUSE_LIBXSLT=ON -DUSE_CPPUNIT=ON -DUSE_AWS=OFF -DUSE_CASSANDRA=OFF -DUSE_SHLIBDEPS=OFF -DUSE_MYSQL=ON -DINCLUDE_PLUGINS=ON -DSUPPRESS_MYSQLEMBED=OFF -DSUPPRESS_REMBED=ON -DSUPPRESS_V8EMBED=ON -DSUPPRESS_MEMCACHED=ON -DSUPPRESS_REDIS=ON -DSUPPRESS_SQS=ON -DSUPPRESS_JAVAEMBED=ON -DSUPPRESS_SQLITE3EMBED=ON -DSUPPRESS_KAFKA=ON -DSUPPRESS_COUCHBASEEMBED=ON -DSUPPRESS_SPARK=ON -DSUPPRESS_EXAMPLEPLUGIN=ON -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DCPACK_CMAKE_GENERATOR=Ninja -DECLWATCH_BUILD_STRATEGY=IF_MISSING ../HPCC-Platform ; pushd ../HPCC-Platform && git clean -f -fd ./esp/src ; rm -rf ./esp/src/node_modules ./esp/src/lib ./esp/src/build ; popd ; ccache -C'

alias Qt='~/qtcreator-3.5.1/bin/qtcreator &|'

# add --shell.prompt=<cluster-name> to get prompt label ...
alias radssh='python3 -m radssh.shell $@'
#alias radssh='python ~/radssh/plugins/shell1.py $@'

alias thor_regression='./ecl-test run --timeout -1 --target thor -e=embedded,3rdparty'
alias hthor_regression='./ecl-test run --target hthor -e=embedded,3rdparty'
alias roxie_regression='./ecl-test run --target roxie -e=embedded,3rdparty'
alias hpcc_regression='./ecl-test run --timeout -1 -e=embedded,3rdparty'

# also look at ~/.selected_editor file
if [[ -z "$WSL_DISTRO_NAME" && -z "$WSLENV" ]] ; then
    export VISUAL=nvim
    export EDITOR=nvim
    export TIG_EDITOR=nvim

    export VLESS=nvimless
    export VDIFF=nvimdiff
else
    export VISUAL=vim
    export EDITOR=vim
    export TIG_EDITOR=vim

    export VLESS=vimless
    export VDIFF=vimdiff
fi

vdiff()
{
    if [[ -z "$VDIFF" ]] ; then
        if [[ -z "$VISUAL" ]] ; then
            vimdiff $@
        elif [[ "$VISUAL" == "vim" ]] ; then
            vimdiff $@
        else
            nvimdiff $@
        fi
    elif [[ "$VDIFF" == "vimdiff" ]] ; then
        vimdiff $@
    else
        nvimdiff $@
    fi
}

alias vdifff='vdiff'
alias vdif='vdiff'

alias vvdiff='vimdiff'
alias vvdifff='vimdiff'
alias vvdif='vimdiff'

alias nvdiff='nvimdiff'
alias nvdifff='nvimdiff'
alias nvdif='nvimdiff'

# -----------------------

# an example (like with fzf history) where a zsh binding is used
# instead of a tmux binding - to get into copy-mode from shell and not when inside an app ...
# tmuxup(){ tmux copy-mode -u }
# zle -N tmuxup
# bindkey '^[v' tmuxup

# -----------------------

#lo() {
#    cd "$(llama "$@")"
#}

cx() {
    if [[ $# -ge 1 ]] ; then
        cd $1 2> /dev/null
        shift
        local result=$(command tere -f -d -S --autocd-timeout 400 --history-file '' -m ctrl-x:Exit -m ctrl-q:Exit -m alt-Enter:Exit "$@")
        [ -n "$result" ] && cd -- "$result"
    else
        local result=$(command tere -f -d -S --autocd-timeout 400 --history-file '' -m ctrl-x:Exit -m ctrl-q:Exit -m alt-Enter:Exit "$@")
        [ -n "$result" ] && cd -- "$result"
    fi
}

tere() {
    local result=$(command tere -f -d -S --autocd-timeout 400 --history-file '' -m ctrl-x:Exit -m ctrl-q:Exit -m alt-Enter:Exit "$@")
    [ -n "$result" ] && cd -- "$result"
}

# -----------------------

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# export FZF_DEFAULT_OPTS="--extended --cycle --reverse"

export FZF_TMUX_OPTS="-p -x C -y -C -w 80% -h 65%"

# --preview="head -n 200 {}" --preview-window=right:hidden --bind=ctrl-\\:toggle-preview

# fzf shell history is in CTRL_R ...

# fzf + ag or $FDNAME configuration
export FZF_PREVIEW_LINES=20
# use $FDNAME instead of ag to get dirs listed ...
#export FZF_DEFAULT_COMMAND='ag -U --one-device --hidden --ignore ".git" --ignore ".cache" --ignore ".cargo" --nocolor -g ""'

export FZF_DEFAULT_COMMAND="$FDNAME --color=always --strip-cwd-prefix --full-path -u --one-file-system --hidden --follow --exclude '.git' --exclude '.cache' --exclude '.ccache' --exclude '.debug' --exclude '.vscode' --exclude '.pcloud' --exclude '.npm' --exclude '.mozilla' --exclude '.fingerprint' --exclude '.git_keep' --exclude '.rustup' --exclude '.cargo' "

# fd without --one-file-system can search into ~/pCloudDrive and take a long time without echoing anything to stdout, which can cause
# fd | fzf to hang even if we esc/ctrl-c out of fzf since fd doesnt write to stdout and see SIGPIPE while its searching without printing

#for testing - export FZF_DEFAULT_COMMAND="$FDNAME --color=always --strip-cwd-prefix --full-path -u --hidden --follow --exclude '.git' --exclude '.cache' --exclude '.npm' --exclude '.mozilla' --exclude '.fingerprint' --exclude '.git_keep' --exclude '.cargo' "

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# could make alt-c for dirs only (add -t d) - then it automatically chdir to there ...
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND -t d"
# add --ansi because $FDNAME above uses --color=always ...

#export FZF_ALT_C_OPTS="--bind='page-down:page-down' --bind='page-up:page-up'"
#export FZF_CTRL_R_OPTS="--bind='page-down:page-down' --bind='page-up:page-up'"

# fzf from cmdline uses FZF_DEFAULT_OPTS and has a 250 line preview limit
# fzf from vim plugin does not have the 250 line max

# NOTE: alt-shift-up/down used by tmux to resize panes ...
# NOTE: alt-space used for window menu

export FZF_DEFAULT_OPTS='--height 40% --ansi --preview "$BATNAME --style=numbers --color=always --line-range :250 {}" --bind="ctrl-alt-p:toggle-preview" --bind="home:preview-top" --bind="end:preview-bottom" --bind="alt-g:preview-top,alt-G:preview-bottom" --bind="ctrl-f:half-page-down" --bind="ctrl-b:half-page-up" --bind="ctrl-k:up,ctrl-j:down" --bind="ctrl-d:backward-delete-char" --bind="alt-shift-up:preview-half-page-up" --bind="alt-shift-down:preview-half-page-down" --bind="shift-up:preview-half-page-up" --bind="shift-down:preview-half-page-down" --bind="alt-k:up,alt-j:down" --bind="alt-K:preview-half-page-up,alt-J:preview-half-page-down" --bind="ctrl-alt-k:preview-half-page-up,ctrl-alt-j:preview-half-page-down" --bind="ctrl-alt-o:preview-half-page-down" --bind="page-up:preview-page-up" --bind="page-down:preview-page-down" --bind="alt-d:kill-word,alt-u:unix-line-discard" --bind="alt-b:page-up" --bind="alt-f:page-down" --preview-window=right:hidden --color fg:242,bg:236,hl:65,fg+:15,bg+:239,hl+:108 --color info:108,prompt:109,spinner:108,pointer:168,marker:168'

# dont want to disable color with +c and dont want to add -x for extended-search as that is already enabled by default ...
#export FZF_COMPLETION_OPTS='+c -x'

export FZF_COMPLETION_TRIGGER="\`\`"

# use ag instead of the default find ...
# _fzf_compgen_path() {
#  ag -u --one-device --hidden --ignore ".git" --ignore ".cache" --ignore ".cargo" --nocolor -g "" "$1"
#}

# Ag only lists files not directories, so we can use awk to get dirnames
# _fzf_compgen_dir() {
#  ag -u --one-device --hidden --ignore ".git" --ignore ".cache" --ignore ".cargo" --nocolor -g "" "$1" | awk 'function dirname(fn) { if (fn == "") return ".";  if (fn !~ "[^/]") return "/"; sub("/*$", "", fn); if (fn !~ "/") return ".";# sub("/[^/]*$", "", fn); if (fn == "") fn = "/"; return fn } {$0 = dirname($0)} !a[$0]++'
#}

# NOTE: recent fd is not breadth-first-search (bfs) but depth-first-search (dfs)
#       and so it can take a while before all first level dirs show up ...
#       Ideally we want bfs to help when wanting to select nearer dirs
# NOTE: after selecting from fzf the parent fd does not terminate, so it can take _a while_ ...
# TODO: can we stop parent fd if fzf returns ?
#       if we use process substitution with input redirection then YES -
#       fzf < <(fd -t d --color always .)
#       this will stop the long running fd if we have made a selection in fzf and fzf ends ...

function paths_breadth_first() {
  while IFS= read -r line; do
    dirn=${line%/*}         ## dirname(line)
    echo ${#dirn},$line     ## len(dirn),line
  done | sort -n | cut -d ',' -f 2-
}

# This works ok if fd cmd completes quickly ...

#function d2() {
#  dir_name="$(fd --strip-cwd-prefix --full-path -td | paths_breadth_first | fzf)"
#  if [ -d "$dir_name" ]; then
#     cd "$dir_name"
#  fi
#}

# TODO: do we want --stript-cwd-prefix ?

# Use $FDNAME (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  if [[ -z "$1" ]] ; then
      dir="."
  else
      dir="$1"
  fi
  $FDNAME --color=always --strip-cwd-prefix --full-path -u --one-file-system --hidden --follow --exclude '.git' --exclude '.cache' --exclude '.ccache' --exclude '.debug' --exclude '.vscode' --exclude '.pcloud' --exclude '.npm' --exclude '.mozilla' --exclude '.fingerprint' --exclude '.git_keep' --exclude '.rustup' --exclude '.cargo' "$dir"
}

# Use $FDNAME to generate the list for directory completion
_fzf_compgen_dir() {
  if [[ -z "$1" ]] ; then
      dir="."
  else
      dir="$1"
  fi
  $FDNAME --color=always --strip-cwd-prefix --full-path -t d -u --one-file-system --hidden --follow --exclude '.git' --exclude '.cache' --exclude '.ccache' --exclude '.debug' --exclude '.vscode' --exclude '.pcloud' --exclude '.npm' --exclude '.mozilla' --exclude '.fingerprint' --exclude '.git_keep' --exclude '.rustup' --exclude '.cargo' "$dir"
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

# ------------------------------

# NOTE: comment _fzf_comprun() out (or change its name) to get back to original fzf without tmux window
#       or run fzf in here instead ...
_fzf_comprun() {
    # first arg is name of the command, skip over it ...
    shift
    fzf-tmux -d 20
}

# NOTE: in all below, change $(_fzfcmd) to $(__fzfcmd) to get back to original fzf without tmux window ...
#       or echo fzf in here instead ...
_fzfcmd() {
    echo "fzf-tmux -d 20 "
}

# ------------------------------

_fzf_compgen_dir2() {
    \rg --one-file-system --hidden --iglob !".git" --iglob !".cache" --iglob !".ccache" --iglob !".debug" --iglob !".vscode" --iglob !".pcloud" --iglob !".rustup" --iglob !".cargo" --files . 2>/dev/null | awk 'function dirname(fn) { if (fn == "") return ".";  if (fn !~ "[^/]") return "/"; sub("/*$", "", fn); if (fn !~ "/") return "."; sub("/[^/]*$", "", fn); if (fn == "") fn = "/"; return fn } {$0 = dirname($0)} !a[$0]++'
}

# ------------------------------

__fzf_generic_path_completion() {
  local base lbuf cmd compgen fzf_opts suffix tail dir leftover matches
  base=$1
  lbuf=$2
  cmd=$(__fzf_extract_command "$lbuf")
  compgen=$3
  fzf_opts=$4
  suffix=$5
  tail=$6

  setopt localoptions nonomatch
  eval "base=$base"
  [[ $base = *"/"* ]] && dir="$base"
  while [ 1 ]; do
    if [[ -z "$dir" || -d ${dir} ]]; then
      leftover=${base/#"$dir"}
      leftover=${leftover/#\/}
      [ -z "$dir" ] && dir='.'
      [ "$dir" != "/" ] && dir="${dir/%\//}"

      # we do it this way so an esc/ctrl-c that ends fzf also stops the fd cmd ...

      if [[ "$compgen" == "_fzf_compgen_dir" ]] ; then
          matches=$(FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse --bind=ctrl-z:ignore $FZF_DEFAULT_OPTS $FZF_COMPLETION_OPTS" FZF_DEFAULT_COMMAND="${FZF_DEFAULT_COMMAND} -t d $(printf %q "$dir")" __fzf_comprun "$cmd" ${(Q)${(Z+n+)fzf_opts}} -q "$leftover" < /dev/tty | while read item; do
            item="${item%$suffix}$suffix"
            echo -n "${(q)item} "
          done)
      elif [[ "$compgen" == "_fzf_compgen_path" ]] ; then
          matches=$(FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse --bind=ctrl-z:ignore $FZF_DEFAULT_OPTS $FZF_COMPLETION_OPTS" FZF_DEFAULT_COMMAND="${FZF_DEFAULT_COMMAND} $(printf %q "$dir")" __fzf_comprun "$cmd" ${(Q)${(Z+n+)fzf_opts}} -q "$leftover" < /dev/tty | while read item; do
            item="${item%$suffix}$suffix"
            echo -n "${(q)item} "
          done)
      else
          # NOTE: this method will not end cmd when fzf ends unless cmd writes to stdout and raises SIGPIPE when fzf encs and closes pipe ...
          matches=$(eval "$compgen $(printf %q "$dir")" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse --bind=ctrl-z:ignore $FZF_DEFAULT_OPTS $FZF_COMPLETION_OPTS" __fzf_comprun "$cmd" ${(Q)${(Z+n+)fzf_opts}} -q "$leftover" | while read item; do
            item="${item%$suffix}$suffix"
            echo -n "${(q)item} "
          done)
      fi

      #echo "lbuf    = ${lbuf}"
      #echo "matches = ${matches}"
      #echo "tail    = ${tail}"

      matches=${matches% }
      if [ -n "$matches" ]; then
        #LBUFFER="$lbuf$matches$tail"
        dirbuf="$lbuf$matches$tail"
        LBUFFER="${dirbuf%/}"
      fi
      zle reset-prompt
      break
    fi
    dir=$(dirname "$dir")
    dir=${dir%/}/
  done
}

# -----------------------

# fzf-tmux -d 20 uses tmux bottom split for 20 lines ...

# if we FZF_DEFAULT_COMMAND="sleep 20" fzf then an esc or ctrl-c will stop the sleep
# but if we sleep 20 | fzf then an esc or ctrl-c will NOT stop the sleep as it does 
# not end on SIGPIPE raised when its stdout is closed because fzf ends

# NOTE: in all below, change $(_fzfcmd) to $(__fzfcmd) to get back to original fzf without tmux window
#       or run fzf inside _fzfcmd() instead ...

# ------------------------------

__fsel() {
  local cmd="${FZF_CTRL_T_COMMAND:-"command find -L . -mindepth 1 \\( -path '*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \\) -prune \
    -o -type f -print \
    -o -type d -print \
    -o -type l -print 2> /dev/null | cut -b3-"}"
  setopt localoptions pipefail no_aliases 2> /dev/null
  local item
  #FZF_DEFAULT_COMMAND="$cmd" FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse --bind=ctrl-z:ignore $FZF_DEFAULT_OPTS $FZF_CTRL_T_OPTS" $(_fzfcmd) -m "$@" < /dev/tty | while read item; do
  FZF_DEFAULT_COMMAND="$cmd" FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --bind=ctrl-z:ignore $FZF_DEFAULT_OPTS $FZF_CTRL_T_OPTS" $(_fzfcmd) -m "$@" < /dev/tty | while read item; do
    echo -n "${(q)item} "
  done
  local ret=$?
# echo
  return $ret
}

fzf-cd-widget() {
  local cmd="${FZF_ALT_C_COMMAND:-"command find -L . -mindepth 1 \\( -path '*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \\) -prune \
    -o -type d -print 2> /dev/null | cut -b3-"}"
  setopt localoptions pipefail no_aliases 2> /dev/null
  #local dir="$(FZF_DEFAULT_COMMAND="$cmd" FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse --bind=ctrl-z:ignore $FZF_DEFAULT_OPTS $FZF_ALT_C_OPTS" $(_fzfcmd) +m < /dev/tty)"
  local dir="$(FZF_DEFAULT_COMMAND="$cmd" FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --bind=ctrl-z:ignore $FZF_DEFAULT_OPTS $FZF_ALT_C_OPTS" $(_fzfcmd) +m < /dev/tty)"
  if [[ -z "$dir" ]]; then
    zle redisplay
    return 0
  fi
  zle push-line # Clear buffer. Auto-restored on next prompt.
  BUFFER="builtin cd -- ${(q)dir}"
  zle accept-line
  local ret=$?
  unset dir # ensure this doesn't end up appearing in prompt expansion
  zle reset-prompt
  return $ret
}

fzf-history-widget() {
  local selected num
  setopt localoptions noglobsubst noposixbuiltins pipefail no_aliases 2> /dev/null
  selected=( $(fc -rl 1 | awk '{ cmd=$0; sub(/^[ \t]*[0-9]+\**[ \t]+/, "", cmd); if (!seen[cmd]++) print $0 }' |
    FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} $FZF_DEFAULT_OPTS -n2..,.. --tiebreak=index --bind=ctrl-r:toggle-sort,ctrl-z:ignore $FZF_CTRL_R_OPTS --query=${(qqq)LBUFFER} +m" $(_fzfcmd)) )
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

# ------------------------------

my-fzfcmd() {
  if [ -n "$TMUX_PANE" -a -z "$VIM_TERMINAL" ] ; then
    echo "fzf-tmux -p -x C -y C -w 80% -h 65% "
  else
    echo "\\fzf --height 40% "
  fi
}

my-fzf-history-widget() {
  local selected num
  setopt localoptions noglobsubst noposixbuiltins pipefail no_aliases 2> /dev/null
  selected=( $(fc -rl 1 | awk '{ cmd=$0; sub(/^[ \t]*[0-9]+\**[ \t]+/, "", cmd); if (!seen[cmd]++) print $0 }' |
    FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} $FZF_DEFAULT_OPTS -n2..,.. --tiebreak=index --bind=ctrl-r:toggle-sort,ctrl-z:ignore $FZF_CTRL_R_OPTS --query=${(qqq)LBUFFER} +m" $(my-fzfcmd)) )
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
  local cmd="${FZF_CTRL_T_COMMAND:-"command find -L . -mindepth 1 \\( -path '*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \\) -prune \
    -o -type f -print \
    -o -type d -print \
    -o -type l -print 2> /dev/null | cut -b3-"}"
  setopt localoptions pipefail no_aliases 2> /dev/null
  local item
  local selected
  selected=""
  #FZF_DEFAULT_COMMAND="$cmd" FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse --bind=ctrl-z:ignore $FZF_DEFAULT_OPTS $FZF_CTRL_T_OPTS" $(my-fzfcmd) -m "$@" < /dev/tty | while read item; do
  FZF_DEFAULT_COMMAND="$cmd" FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --bind=ctrl-z:ignore $FZF_DEFAULT_OPTS $FZF_CTRL_T_OPTS" $(my-fzfcmd) -m "$@" < /dev/tty | while read item; do
    selected="${selected} ${(q)item} "
    #echo -n "${(q)item} "
  done
  local ret=$?
# echo
  if [ -n "$selected" ]; then
    zle -U "${selected:1}"
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
export MANPAGER="sh -c 'col -bx | $BATNAME -l man -pp | less'"
alias manls="man -k . | fzf --bind=\"ctrl-f:half-page-down\" --bind=\"ctrl-b:half-page-up\" --bind=\"ctrl-k:up,ctrl-j:down\" --bind=\"ctrl-d:backward-delete-char\" --bind=\"alt-k:up,alt-j:down\" --bind=\"ctrl-alt-k:half-page-up,ctrl-alt-j:half-page-down\" --bind=\"ctrl-alt-o:half-page-down\" --bind=\"page-up:page-up\" --bind=\"page-down:page-down\" --bind=\"alt-d:kill-word,alt-u:unix-line-discard\" --bind=\"alt-b:page-up\" --bind=\"alt-f:page-down\" --prompt='Man> ' | awk '{print \$1}' | xargs -r man -P 'sh -c \"col -bx | $BATNAME -l man -pp | less\"'"

if [[ -z "$WSL_DISTRO_NAME" && -z "$WSLENV" ]] ; then
    alias byobu='start_tmux'
fi

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

# needed to have gdb stop with ^C (add -ixany) ...
stty ixany > /dev/null 2>&1
stty werase undef > /dev/null 2>&1
# also add these ...
stty brkint ignpar > /dev/null 2>&1
#stty brkint ignpar -ixoff -imaxbel > /dev/null 2>&1

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

# hack of setting LC_MONETARY to something to use on remote side
# because LC_MONOETRY is not really used but is carried through by ssh ...

# use it now for knowing if there is a reverse tunnel set up
# if its set to sshterm:<port> then assume we can connect to <port>
# for clipboard contents ...

# get TERM from source ...
#if [[ -n "$SSH_CLIENT" ]] || [[ -n "$SSH_TTY" ]] ; then
#    if [[ -n "$LC_MONETARY" ]] ; then
#        rstring=$LC_MONETARY
#        # strip leading whitespace
#        rstring="${rstring#"${rstring%%[![:space:]]*}"}"
#        # strip trailing whitespace
#        rstring="${rstring%"${rstring##*[![:space:]]}"}"
#        # first token
#        tstring=${rstring% *}
#        # rest of string
#        rstring=${rstring##* }
#        if [[ -n "$tstring" ]] && [[ "$TERM" == "linux" ]] ; then
#            export TERM=$tstring
#        fi
#        if [[ -n "$rstring" ]] ; then
#            export LC_MONETARY=$rstring
#        else
#            unset LC_MONETARY
#        fi
#    fi
#fi

# --------------------

# Sometimes a grep of a large file is much faster if:
#   you know its ASCII and you set LC_ALL=C or LC_CTYPE=C (instead of UTF-8)
# Also fgrep (grep -F for fixed strings (not regex)) can be faster ...

export LC_ALL=en_US.UTF-8
#export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# does it make sense to set LC_COLLATE to something other than LC_ALL/LANG/LANGUAGE ?
export LC_COLLATE=C
setopt COMBINING_CHARS

# --------------------

# seems to really help reduce stat() syscall when calling localtime() ...
if [[ -z "$TZ" ]] ; then
    export TZ=:/etc/localtime
    # or could use this string, dir/file is found in /usr/share/zoneinfo/
    #export TZ="America/New_York"
fi

# --------------------

if [[ -z "$GRUVBOX" ]] && [[ -n "$TMUX_PANE" ]] && [[ -f ~/.gruvbox_256palette.sh ]] ; then
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
# https://github.com/zsh-users/zsh-autosuggestions
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
bindkey '^_\'  vi-forward-blank-word-end
# zutty - cannot distinguish C-S-\ with C-\ with modifyOtherKeys<2

# C-\ - not a good key to use because in a terminal shell from vim
#       this key is not sent - <C-\><C-n> is mapped to normal mode
#       C-@ (C-Space) also does not work here ...

#bindkey '^\'   autosuggest-accept
#bindkey '^\'   vi-forward-blank-word-end
bindkey '^]'   vi-forward-blank-word-end

# -------

# also C-S-End ...
bindkey "\e[1;6F" forward-word
# and C-S-Home to beg line
bindkey "\e[1;6H" backward-word
# also C-A-End ...
bindkey "\e[1;7F" forward-word
# and C-A-Home to beg line
bindkey "\e[1;7H" backward-word
# also A-End ...
bindkey "\e[1;3F" forward-word
# and A-Home to beg line
bindkey "\e[1;3H" backward-word
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

# terminals may have mapped S-<Space> to ^^<Space>
bindkey -s '^^ ' ' '

# TODO: C-Space to Space ?
# bindkey -s "^@" " "

bindkey -s '^^\n' '\n'
bindkey -s '^^^J' '^J'

bindkey -s '^^\r' '\r'
bindkey -s '^^^M' '^M'

# if we can get away with this ... just to keep cmdline quiet
#bindkey '^_' noop
#bindkey '^^' noop

# these all seem benign in vim ...

# terminals may have mapped C-S-<Space> to ^_<Space>
bindkey '^_ ' autosuggest-accept
# zutty - cannot distinguish C-S-<Space> with C-<Space> with modifyOtherKeys<2
bindkey '^ '  autosuggest-accept

# M-U to clear current autosuggest text
bindkey "\eU" autosuggest-clear

#bindkey "\e "  autosuggest-accept
#bindkey '^@^@' autosuggest-accept

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
# used to be M-<, but change to M-{
bindkey "\e{" enter-cmdline

# just to be consistent ...
bindkey "\e}" noop

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

# \e, \E escape
# \NNN   character code in octal
# \xNN   character code in hexadecimal
# \uNNNN unicode character code in hexadecimal
# \M[-]X character with meta bit set
# \C[-]X control character
# ^X     control character

# modifyOtherKeys == 2 ctrl-d code -
bindkey -s "\e[27;5;100~" "\x04"
# underbar
bindkey -s "\e[27;2;95~" "_"

# ctrl-z
bindkey "^z" noop

# SPECIAL: some terminals may map <C-S-BS> to <C-_><BS> ...
bindkey -s "^_\x7f" "\x7f"
# SPECIAL: some terminals may map <C-BS> to <C-^><BS> ...
bindkey -s "^^\x7f" "\x7f"

# SPECIAL: some terminals may map <C-S-h> (or <S-C-h>) to <C-^><C-h> ...
bindkey -s "^^\x08" "\x08"

# SPECIAL: some terminals may map <C-S-x> to <C-_>X (or <C-_><C-x> ?)
bindkey "^_X" noop

# SPECIAL: some terminals may map <C-S-j> to <C-_>J ...
bindkey "^_J" noop
# SPECIAL: some terminals may map <C-S-k> to <C-_>K ...
bindkey "^_K" noop

# SPECIAL: some terminals may map <C-S-g> to <C-_>G ...
bindkey "^_G" noop
# SPECIAL: some terminals may map <C-S-n> to <C-_>N ...
bindkey "^_N" noop
# SPECIAL: some terminals may map <C-S-p> to <C-_>P ...
bindkey "^_P" noop

# SPECIAL: some terminals may map <C-i> to <C-^><Tab> ...
bindkey -s "^^\x09" "\x09"

# M-C-S-Ins/Del/Home/End/PgUp/PgDn
bindkey "\e[2;8~" noop
bindkey "\e[3;8~" noop
bindkey "\e[1;8H" noop
bindkey "\e[1;8F" noop
bindkey "\e[5;8~" noop
bindkey "\e[6;8~" noop

# f1-f12
bindkey "\eOP"   noop
bindkey "\eOQ"   noop
bindkey "\eOR"   noop
bindkey "\eOS"   noop
bindkey "\e[15~" noop
bindkey "\e[17~" noop
bindkey "\e[18~" noop
bindkey "\e[19~" noop
bindkey "\e[20~" noop
bindkey "\e[21~" noop
bindkey "\e[23~" noop
bindkey "\e[24~" noop

# C-f1-f12
bindkey "\e[1;5P"   noop
bindkey "\e[1;5Q"   noop
bindkey "\e[1;5R"   noop
bindkey "\e[1;5S"   noop
bindkey "\e[15;5~"  noop
bindkey "\e[17;5~"  noop
bindkey "\e[18;5~"  noop
bindkey "\e[19;5~"  noop
bindkey "\e[20;5~"  noop
bindkey "\e[21;5~"  noop
bindkey "\e[23;5~"  noop
bindkey "\e[24;5~"  noop

# A-f1-f12
# S-f1-f12
# C-A-f1-f12
# C-S-f1-f12
# A-S-f1-f12
# C-A-S-f1-f12

# ctrl ; ' , . = and their S,A,S+A keys ...

bindkey "\e[59;5u"  noop
bindkey "\e[39;5u"  noop
bindkey "\e[44;5u"  noop
bindkey "\e[46;5u"  noop

bindkey "\e[58;6u"  noop
bindkey "\e[34;6u"  noop
bindkey "\e[60;6u"  noop
bindkey "\e[62;6u"  noop

bindkey "\e[59;7u"  noop
bindkey "\e[39;7u"  noop
bindkey "\e[44;7u"  noop
bindkey "\e[46;7u"  noop

bindkey "\e[58;8u"  noop
bindkey "\e[34;8u"  noop
bindkey "\e[60;8u"  noop
bindkey "\e[62;8u"  noop

bindkey "\e[43;8u"  noop
bindkey "\e[61;7u"  noop

bindkey "\e[27;5;59~"  noop
bindkey "\e[27;5;39~"  noop
bindkey "\e[27;5;44~"  noop
bindkey "\e[27;5;46~"  noop

bindkey "\e[27;6;58~"  noop
bindkey "\e[27;6;34~"  noop
bindkey "\e[27;6;60~"  noop
bindkey "\e[27;6;62~"  noop

bindkey "\e[27;7;59~"  noop
bindkey "\e[27;7;39~"  noop
bindkey "\e[27;7;44~"  noop
bindkey "\e[27;7;46~"  noop

bindkey "\e[27;8;58~"  noop
bindkey "\e[27;8;34~"  noop
bindkey "\e[27;8;60~"  noop
bindkey "\e[27;8;62~"  noop

bindkey "\e[27;8;43~"  noop
bindkey "\e[27;7;61~"  noop

# Ctrl-Enter to execute suggestion
#bindkey '^\n' autosuggest-execute
# make it a no-op for safety
#bindkey '^\n' noop
#bindkey '^\n' forward-word
# safer to use Alt-Enter ...
# Alt-Enter to execute - TODO: perhaps wish it was a no-op unless at end of cmd ...
#bindkey "\e\n" autosuggest-execute

# --------------------

# turn off underline of all file/path arguments ...
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# disable paste being highlighted/reverse ...
zle_highlight+=(paste:none)

# zsh-syntax highlighting, for <= v5.8 should be at end
# https://github.com/zsh-users/zsh-syntax-highlighting.git
source ~/Downloads/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# --------------------

