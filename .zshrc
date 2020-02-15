# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=2000
SAVEHIST=2000
unsetopt beep
# Esc to get into vi edit mode
bindkey -v

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/$LOGNAME/.zshrc'

# if we are xterm then try xterm-256color
if [ -n "$TERM" ] ; then
    if [ "$TERM" = "xterm" ] ; then
        export TERM=xterm-256color
    fi
fi

# so vim terminal TERM is set properly (xterm by default)
if [[ -n "$VIM_TERMINAL" ]] && [[ -n "$TMUX_PANE" ]] ; then
  export TERM=screen-256color
fi

autoload -Uz compinit
compinit
# End of lines added by compinstall

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

setopt PROMPT_SUBST
setopt PROMPTSUBST

# word separators
# WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

random_title=$[$RANDOM%100]
# precmd () { print -Pn "\e]2;%n@%M.$random_title\a" }
# precmd () { print -Pn "\e]2;%n@%M" }
# precmd () { print -Pn "\e]0;%M:%12<..<%~%<<%%\a" }
# precmd () { if [[ -n "$SSH_CLIENT" ]] ; then PS1='%F{007}ssh%f-%F{100}%n@%m%f:%F{150}%12<..<%~%<<%f%% '; print -Pn '\e]0;ssh-%M:%12<..<%~%<<%\a'; else ; PS1='%F{100}%n@%m%f:%F{150}%12<..<%~%<<%f%% '; print -Pn '\e]0;%M:%12<..<%~%<<%\a' ; fi ; if [[ -n "$TMUX_PANE" ]] ; then tmux set-window-option automatic-rename on; fi }
# dont print hostname in tmux if not ssh (remote)
precmd () { if [[ -n "$SSH_CLIENT" ]] ; then PS1='%F{007}ssh%f-%F{100}%n@%m%f:%F{150}%12<..<%~%<<%f%% '; print -Pn '\e]0;ssh-%M:%12<..<%~%<<%\a'; else ; PS1='%F{100}%n@%m%f:%F{150}%12<..<%~%<<%f%% '; print -Pn '\e]0;%12<..<%~%<<%\a' ; fi ; if [[ -n "$TMUX_PANE" ]] ; then tmux set-window-option automatic-rename on; fi }

# skip SHARE_HISTORY
setopt APPEND_HISTORY INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS HIST_IGNORE_ALL_DUPS HIST_EXPIRE_DUPS_FIRST HIST_SAVE_NO_DUPS HIST_FIND_NO_DUPS

setopt HIST_IGNORE_SPACE
# save cmds to history that start with leading space(s)
# unsetopt HIST_IGNORE_SPACE

# to show .dirs in tab completion ...
setopt globdots
# to allow rm f* e* to work when no f* found ...
setopt -o cshnullglob

h() { if [ -z "$*" ]; then history 1; else history 1 | egrep "$@"; fi; }

# to not eat the space before | or & ...
export ZLE_REMOVE_SUFFIX_CHARS=""

# --------------------

autoload -U select-word-style
select-word-style bash
# perhaps same thing as above
zstyle ':zle:*' skip-whitespace-first true

# to get up-arrow to put cursor at end of line instead of beginning ...
autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '\eOA' up-line-or-beginning-search
bindkey '\e[A' up-line-or-beginning-search
bindkey '\eOB' down-line-or-beginning-search
bindkey '\e[B' down-line-or-beginning-search
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey -M menuselect '^[[Z' reverse-menu-complete
bindkey '^I' expand-or-complete-prefix

# Home
bindkey "\e[1~" beginning-of-line
# End
bindkey "\e[4~" end-of-line

# Ctrl-Home
bindkey "\e5" beginning-of-line
# Ctrl-End
bindkey "\e6" end-of-line

# Ctrl-Left
bindkey "\e[1;5D" backward-word
# Ctrl-Right
bindkey "\e[1;5C" forward-word

# Alt-d kill word
bindkey "\ed" kill-word

# --------------------

# Ins - no-op
function noop() {
}
zle -N noop
bindkey "\e[2~" noop

# -------

# Shift-DEL - backward kill word
bindkey "\e[3;2~" backward-kill-word
bindkey "^w"  backward-kill-word
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

# could use WORDCHARS above or this to select words ...
#zstyle ':zle:my-kill-word' word-style space

# Ctrl-DEL - del current word, but also if at end del backward word
bindkey "\e[3;5~" my-kill-word
# same for ^x
#bindkey "^x" my-kill-word

# -------

# del current WHOLE word, but also if at end del backward word
function my-delete-word() {
# local WORDCHARS="${WORDCHARS:s#/#}"
  zle forward-word
  zle backward-kill-word
}
zle -N my-delete-word

# could use WORDCHARS above or this to select words ...
#zstyle ':zle:my-delete-word' word-style space

# Ctrl-Shift-DEL - del current WHOLE word, but also if at end del backward word
bindkey "\e[3;6~" my-delete-word
# same for Alt-DEL
bindkey "\e[3;3~" my-delete-word

# seems to do the same thing as my-delete-word
autoload delete-whole-word-match
zle -N delete-whole-word-match

# -------

# delete current char, but also if at end then del backward char
function my-delete-char() {
# local WORDCHARS="${WORDCHARS:s#/#}"
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
bindkey "\e[3~" my-delete-char

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
bindkey "^d" bash-ctrl-d

# --------------------

# like cmd &! (or cmd &|) to stay running after exit ...
setopt NO_HUP
#setopt NO_CHECK_JOBS

export KEYTIMEOUT=1

# --------------------

alias ll='ls -ltr'
alias lla='ls -lAtr'
alias rm='rm -i'
#if [ ! -f /etc/redhat-release ] ; then
#  alias dmesg='dmesg -T'
#fi
alias dmesg='dmesg -kuxT'
alias vdiff='vimdiff'

# skip -X arg to less to get alternate screen so tmux mouse can scroll ...
alias more='less -R'
# there is also moar
#alias more='moar'
alias less-pyg='less-pyg'
alias less='less -R'
#export PAGER='less -RX'
export PAGER='bat -p'
#alias cat='ccat'
#alias cat='mckless -EXR:'
alias cat='bat --plain --paging=never'
alias smesg='vless /var/log/syslog'

alias tailrdm='tail -f /tmp/rdm-$LOGNAME.log'
alias difff='diff'
# gv.vim uses noremap so need to override q, x here
alias vigv='vim -R -c GV -c ":nnoremap <buffer> q <Nop>" -c ":cnoreabbrev <buffer> q Tabcloserightquit" -c ":cnoreabbrev <buffer> q! Tabcloserightquit" -c ":nnoremap <buffer> x <Nop>" -c ":cnoreabbrev <buffer> x Tabcloserightquit" -c ":redraw!"'
alias sync-hpcc='sync_hpcc'
alias stop-hpcc='stop_hpcc'
alias stat-hpcc='stat_hpcc'
alias start-hpcc='start_hpcc'
alias kill-hpcc='kill_hpcc'
alias make-hpcc='make_hpcc'
alias make-sync='make_sync'

alias stop-indx='rc -X all'
alias stop_indx='rc -X all'
alias strt-indx='rc -X clear'
alias strt_indx='rc -X clear'
alias start-indx='rc -X clear'
alias start_indx='rc -X clear'

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

path+=(~/${MYMPI}/bin)
export MANPATH=${MANPATH}:~/${MYMPIi}/share/man

path+=(~/bin)
path+=(~/go/bin)
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
alias freerdp='xfreerdp +clipboard /size:1580x932 /sound /microphone +unmap-buttons -grab-keyboard /d:<domain> /u:$LOGNAME /sec:tls /v:<host> > /dev/null 2>&1 &|'
# could also use /sound:sys:alsa /microphone:sys:alsa
# other sizes: 1528x832

alias gitsubrecur='git submodule update --init --recursive'

# ECLWATCH_BUILD_STRATEGY can be NO_COMPRESS or IF_MISSING
# CPACK_CMAKE_GENERATOR=Ninja may help run cpack on fewer targets
alias cmakedbg='CC="ccache gcc" CXX="ccache g++" cmake    -DCMAKE_BUILD_TYPE=Debug          -DUSE_LIBMEMCACHED=OFF -DUSE_LIBXSLT=ON -DUSE_CPPUNIT=ON  -DUSE_CASSANDRA=OFF -DUSE_SHLIBDEPS=OFF -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DCPACK_CMAKE_GENERATOR=Ninja -DECLWATCH_BUILD_STRATEGY=IF_MISSING ../HPCC-Platform'
alias cmakeprod='CC="ccache gcc" CXX="ccache g++" cmake   -DCMAKE_BUILD_TYPE=Release        -DUSE_LIBMEMCACHED=OFF -DUSE_LIBXSLT=ON -DUSE_CPPUNIT=OFF -DUSE_CASSANDRA=OFF -DUSE_SHLIBDEPS=ON  -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DCPACK_CMAKE_GENERATOR=Ninja -DECLWATCH_BUILD_STRATEGY=IF_MISSING ../HPCC-Platform'
alias cmakereldbg='CC="ccache gcc" CXX="ccache g++" cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DUSE_LIBMEMCACHED=OFF -DUSE_LIBXSLT=ON -DUSE_CPPUNIT=ON  -DUSE_CASSANDRA=OFF -DUSE_SHLIBDEPS=OFF -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DCPACK_CMAKE_GENERATOR=Ninja -DECLWATCH_BUILD_STRATEGY=IF_MISSING ../HPCC-Platform'

alias Qt='~/qtcreator-3.5.1/bin/qtcreator &|'

# add --shell.prompt=<cluster-name> to get prompt label ...
alias radssh='python -m radssh.shell $@'
#alias radssh='python ~/radssh/plugins/shell1.py $@'

alias thor_regression='./ecl-test run --timeout -1 --target thor -e=embedded,3rdparty'
alias hthor_regression='./ecl-test run --target hthor -e=embedded,3rdparty'
alias roxie_regression='./ecl-test run --target roxie -e=embedded,3rdparty'
alias hpcc_regression='./ecl-test run --timeout -1 -e=embedded,3rdparty'

export MANPATH=${MANPATH}:/usr/share/bcc/man

# also look at ~/.selected_editor file
export VISUAL=vim
export EDITOR=vim

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS="--extended --cycle --reverse"

# fzf + ag configuration
export FZF_DEFAULT_COMMAND='ag --nocolor -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='
  --color fg:242,bg:236,hl:65,fg+:15,bg+:239,hl+:108
  --color info:108,prompt:109,spinner:108,pointer:168,marker:168
  '

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

# zsh-suggestions
source ~/Downloads/zsh-autosuggestions/zsh-autosuggestions.zsh

export ZSH_AUTOSUGGEST_MANUAL_REBIND=1
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
export ZSH_AUTOSUGGEST_USE_ASYNC=1

#ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=("${(@)ZSH_AUTOSUGGEST_ACCEPT_WIDGETS:#vi-forward-blank-word}")
ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=(forward-char vi-forward-char end-of-line vi-end-of-line)

ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS=(forward-word emacs-forward-word vi-forward-word vi-forward-word-end vi-forward-blank-word vi-forward-blank-word-end vi-find-next-char vi-find-next-char-skip)

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
#bindkey '^\' forward-word
bindkey '^\' autosuggest-accept

# Ctrl-Enter to execute suggestion
#bindkey '^\n' autosuggest-execute
# make it a no-op for safety
#bindkey '^\n' noop
bindkey '^\n' forward-word
# safer to use Alt-Enter ...
# Alt-Enter to execute - TODO: perhaps wish it was a no-op unless at end of cmd ...
bindkey "\e\n" autosuggest-execute

# --------------------

