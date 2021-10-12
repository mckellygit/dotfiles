# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# if we wanted to have some aliases in scripts (non-interactive) ...
export BASH_ENV=~/.bash_git_alias

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Enable bracketed paste: printf "\e[?2004h"
# Wait for paste to start: you’ll see \e[200~ on STDIN.
# Wait for paste to stop: you’ll see \e[201~ on STDIN.
# Disable bracketed paste: printf "\e[?2004l"
# or see .inputrc file:
# set enable-bracketed-paste on
# or:
bind 'set enable-bracketed-paste on'

# don't put duplicate lines in the history (ignoredups).
# See bash(1) for more options - skipping ignorespace (ignoreboth)
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# if we are just xterm then try xterm-256color
if [ -n "$TERM" ] ; then
    if [ "$TERM" = "xterm" ] ; then
        export TERM=xterm-256color
    fi
fi

# 2x ctrl-d to exit ...
export IGNOREEOF=1

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# change \w to ${PWD:(-11)} to prevent really long prompts ...
# change \w to ${pwd2} to prevent really long prompts ...

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]${pwd2}\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:${pwd2}\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h:${pwd2}\a\]$PS1"
    ;;
*)
    ;;
esac

# -----------------------

export VISUAL=nvim
export EDITOR=nvim
export TIG_EDITOR=nvim

export VLESS=nvimless
export VDIFF=nvimdiff

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
    elif [[ "$VDIFF" == "vdiff" ]] ; then
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

# -----------------------

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

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

alias st='command st -g 194x51+690+678'

# some more ls aliases
#alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias ll='ls -ltr'
alias lla='ls -lAtr'
alias rm='rm -i'
#if [ ! -f /etc/redhat-release ] ; then
#  alias dmesg='dmesg -T'
#fi
alias dmesg='dmesg -kuxT'

# skip -X arg to less to get alternate screen so tmux mouse can scroll ...
alias more='less -R'
# there is also moar
#alias more='moar'
alias less-pyg='less-pyg'
#alias less='less -K -iR -x4'
#alias less='$BATNAME'
alias less='smartless'

# uses $BATNAME underneath to get $BATNAME syntax color but less driver with multiple files, etc.
export LESSOPEN="|lessfilter %s"
export LESS='-iR -K -x4 -c~'

# number of lines to directly display before entering the pager
export SMARTLESS_NUM_LINES=$((LINES-6))
# the pager to be used
export SMARTLESS_PAGER='less'
# the default arguments to the pager
export SMARTLESS_PAGER_ARGUMENTS='-iR -K -x4 -c~'

#export PAGER='less -RX'
#export PAGER='$BATNAME -p'

#alias cat='ccat'
#alias cat='mckless -EXR:'
#alias cat='$BATNAME --plain --paging=never'
alias catc='$BATNAME --plain --tabs 4 --paging never'

alias smesg='vless /var/log/syslog'
alias vsmesg='vimless /var/log/syslog'
alias nsmesg='nvimless /var/log/syslog'

alias tailrdm='tail -f /tmp/rdm-$LOGNAME.log'
alias difff='diff'
# gv.vim uses noremap so need to override q, x here
alias vigv='vi -R -c GV -c ":nnoremap <buffer> q <Nop>" -c ":cnoreabbrev <buffer> q Tabcloserightquit" -c ":cnoreabbrev <buffer> q! Tabcloserightquit" -c ":nnoremap <buffer> x <Nop>" -c ":cnoreabbrev <buffer> x Tabcloserightquit" -c ":redraw!"'
alias vvigv='vim -R -c GV -c ":nnoremap <buffer> q <Nop>" -c ":cnoreabbrev <buffer> q Tabcloserightquit" -c ":cnoreabbrev <buffer> q! Tabcloserightquit" -c ":nnoremap <buffer> x <Nop>" -c ":cnoreabbrev <buffer> x Tabcloserightquit" -c ":redraw!"'
alias nvigv='nvim -R -c GV -c ":nnoremap <buffer> q <Nop>" -c ":cnoreabbrev <buffer> q Tabcloserightquit" -c ":cnoreabbrev <buffer> q! Tabcloserightquit" -c ":nnoremap <buffer> x <Nop>" -c ":cnoreabbrev <buffer> x Tabcloserightquit" -c ":redraw!"'
alias sync-hpcc='sync_hpcc'
alias stop-hpcc='stop_hpcc'
alias stat-hpcc='stat_hpcc'
alias start-hpcc='start_hpcc'
alias kill-hpcc='kill_hpcc'
alias make-hpcc='make_hpcc'

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
#alias ag='command ag -U --hidden '
#alias rg='command rg --color=always --smart-case --hidden --iglob !".git" '

# use these instead of aliasas above, only because git is a custom command now
# and ag git wont find anything, you need ag 'git' ...
ag() { command ag -U --hidden "$@"; }
rg() { command rg --color=always --smart-case --hidden --iglob !".git" "$@"; }

# ------------------

# cannot override builtin git diff with git cmds/aliases so do it this way ...
# git is an alias in the BASH_ENV ~/.bash_git_alias file so it is always sourced (non-interactive shells/scripts)
# do we need this ?  Since its already an alias ??
git() { $HOME/bin/git "$@"; }

# ------------------

alias radssh='python3 -m radssh.shell $@'
#alias radssh='python ~/radssh/plugins/shell1.py $@'

# export NCPUS=`cat /proc/cpuinfo | grep processor | wc -l`
# numcpus=$(getconf _NPROCESSORS_ONLN 2>/dev/null)
numcpus=$(nproc 2> /dev/null)
if [ -z "$numcpus" ] ; then
  export NCPUS=1
else
  export NCPUS=$numcpus
fi
alias make='make -j$NCPUS'

alias fzf='fzf-tmux'

# ------------------

# kubernetes, helm etc.

alias kc='kubectl'

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

# ------------------

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

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# PROMPT_COMMAND='echo -ne "\033]0; ${PWD##*/}\007"'
# PROMPT_DIRTRIM=3
# PROMPT_COMMAND='echo -ne "\033]0;${HOSTNAME}:${PWD}\007"'
# PROMPT_COMMAND='echo -ne "\033]0;${HOSTNAME}:$(echo $PWD | tail -c 11)\007"'
# PROMPT_COMMAND='echo -ne "\033]0;${HOSTNAME}:${PWD:(-11)}\007"'
# dont print hostname in tmux if not ssh (remote)

# why do we need to run tmux set-window-option automatic-rename in precmd() ?
#PROMPT_COMMAND='pwd2=${PWD/#$HOME/\~} ; if [ ${#pwd2} -gt 11 ] ; then pwd2=..${pwd2:(-10)} ; fi ; if [[ -n "$TMUX_PANE" ]] ; then tmux set-window-option automatic-rename on ; fi ; if [[ -n "$SSH_CLIENT" ]] ; then echo -ne "\033]0;ssh-${HOSTNAME}:${pwd2}\007" ; else echo -ne "\033]0;${pwd2}\007" ; fi'

PROMPT_COMMAND='pwd2=${PWD/#$HOME/\~} ; if [ ${#pwd2} -gt 11 ] ; then pwd2=..${pwd2:(-10)} ; fi ; if [[ -n "$SSH_CLIENT" ]] ; then echo -ne "\033]0;ssh-${HOSTNAME}:${pwd2}\007" ; else echo -ne "\033]0;${pwd2}\007" ; fi'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# --------------------------

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Completion for kitty
#source <(kitty + complete setup bash)

# this changes PS1 ...
# [ -r ~/.byobu/prompt ] && . ~/.byobu/prompt   #byobu-prompt#

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

alias getnewkeys='ssh -A keyphemeral@10.173.48.129'

# needed to have gdb stop with ^C ...
stty ixany > /dev/null 2>&1
stty werase undef > /dev/null 2>&1

# do these in .inputrc
#bind "\C-p": backward-kill-word
#bind "\e[3;5~": backward-kill-word
#bind "\C-n": nop
#bind "\e[1;5D": vi-prev-word
#bind "\e[1;5C": vi-next-word

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

# git autocomplete ...
if [[ -f /etc/bash_completion.d/git ]] ; then
    source /etc/bash_completion.d/git
elif [[ -f /usr/share/bash-completion/completions/git ]] ; then
    source /usr/share/bash-completion/completions/git
fi

# skip for now ...
if [[ -f ~/.bash_completion/alacritty ]] ; then
    source ~/.bash_completion/alacritty
fi

