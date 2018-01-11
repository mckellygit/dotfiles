# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=2000
SAVEHIST=2000
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/$LOGNAME/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

random_title=$[$RANDOM%100]
precmd () { print -Pn "\e]2;%n@%M | %~ $random_title\a" }

# skip SHARE_HISTORY
setopt APPEND_HISTORY INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS HIST_IGNORE_ALL_DUPS HIST_EXPIRE_DUPS_FIRST HIST_SAVE_NO_DUPS HIST_FIND_NO_DUPS

h() { if [ -z "$*" ]; then history 1; else history 1 | egrep "$@"; fi; }

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

# set -o ignoreeof

export KEYTIMEOUT=3

alias ll='ls -ltr'
alias rm='rm -i'
#if [ ! -f /etc/redhat-release ] ; then
#  alias dmesg='dmesg -T'
#fi
alias dmesg='dmesg -keux'

# export NCPUS=`cat /proc/cpuinfo | grep processor | wc -l`
numcpus=$(getconf _NPROCESSORS_ONLN 2>/dev/null)
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
#path+=(~/mpich/bin)
#path+=(~/mvapich2.1rc1/bin)
path+=(~/openmpi/bin)

path+=(~/bin)
export PATH

function collapse_pwd {
    echo $(pwd | sed -e "s,^$HOME,~,")
}
PS1='%n@%m:%~%% '
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ] ; then
    PS1='ssh-%n@%m:%~%% '
fi

export MANPATH=${MANPATH}:/usr/share/bcc/man

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

alias gitsubrecur='git submodule update --init --recursive'

alias cmakedbg='cmake    -DCMAKE_BUILD_TYPE=Debug          -DUSE_LIBXSLT=ON -DUSE_CPPUNIT=ON  -DUSE_SHLIBDEPS=OFF -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DECLWATCH_BUILD_STRATEGY=NO_COMPRESS ../HPCC-Platform'
alias cmakeprod='cmake   -DCMAKE_BUILD_TYPE=Release        -DUSE_LIBXSLT=ON -DUSE_CPPUNIT=OFF -DUSE_SHLIBDEPS=ON  -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DECLWATCH_BUILD_STRATEGY=NO_COMPRESS ../HPCC-Platform'
alias cmakereldbg='cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DUSE_LIBXSLT=ON -DUSE_CPPUNIT=ON  -DUSE_SHLIBDEPS=OFF -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DECLWATCH_BUILD_STRATEGY=NO_COMPRESS ../HPCC-Platform'

alias Qt='~/qtcreator-3.5.1/bin/qtcreator &|'

# add --shell.prompt=<cluster-name> to get prompt label ...
alias radssh='python -m radssh.shell $@'

alias thor_regression='./ecl-test run --target thor -e=embedded,3rdparty'
alias hthor_regression='./ecl-test run --target hthor -e=embedded,3rdparty'
alias roxie_regression='./ecl-test run --target roxie -e=embedded,3rdparty'
alias hpcc_regression='./ecl-test run -e=embedded,3rdparty'

export MANPATH=${MANPATH}:/usr/share/bcc/man

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
 if [ -f ~/.git-repo.sh ] ; then
   source ~/.git-repo.sh
   if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ] ; then
     precmd () { __git_ps1 "ssh-%n@%m" ":%~%% " "|%s" } 
   else
     precmd () { __git_ps1 "%n@%m" ":%~%% " "|%s" } 
   fi
 fi

