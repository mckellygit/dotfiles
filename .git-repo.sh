# bash/zsh git prompt support
#
# This code was stolen from git-prompt.sh from:
# Copyright (C) 2006,2007 Shawn O. Pearce <spearce@spearce.org>
# Distributed under the GNU General Public License, version 2.0.
#
# called as in:
#
# precmd () { __git_ps1 "%n@%m" ":%~%% " "|%s" } 
#
# to get this prompt:
#
# <username>@<hostname>|git:<branch-name>*#+o:<dir>%
#
# where:
#    * - unstaged changes present
#    + - staged changes present
#    # - untacked files present
#    o - other changes present

__git_ps1 ()
{
    ps1pc_start="$1"
    ps1pc_end="$2"
    printf_format="$3"
    # set PS1 to a plain prompt so that we can
    # simply return early if the prompt should not
    # be decorated
    PS1="$ps1pc_start$ps1pc_end"
    
    # check whether printf supports -v
    __git_printf_supports_v=
    printf -v __git_printf_supports_v -- '%s' yes >/dev/null 2>&1
    
    local repo_info="$(git rev-parse --git-dir --is-inside-git-dir \
        --is-bare-repository --is-inside-work-tree \
        --short HEAD 2>/dev/null)"
    
    if [[ -z "$repo_info" ]] ; then
        return 0
    fi
    
    branch="$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')"
    
    local gs="git:<${branch}>"
    
    let untracked_count=0 unstaged_count=0 staged_count=0 other_count=0
    
    git status --porcelain | cut -b -2 | sort -u > /tmp/git-status$$.tmp 2>/dev/null
    
    while IFS=_ read t; do
    # echo "t = <$t>"
      if [[ "$t" = " M" ]] ; then
          ((unstaged_count++))
      elif [[ "$t" = "M " ]] ; then
          ((staged_count++))
      elif [[ "$t" = "??" ]] ; then
          ((untracked_count++))
      else
          ((other_count++))
      fi
    done < /tmp/git-status$$.tmp
    
    rm -f /tmp/git-status$$.tmp
    
 ### echo "untracked_count = $untracked_count"
 ### echo "unstaged_count  = $unstaged_count"
 ### echo "staged_count    = $staged_count"
 ### echo "other_count     = $other_count"
    
    if [[ $unstaged_count -gt 0 ]] ; then
        gs="${gs}*"
    fi
    if [[ $untracked_count -gt 0 ]] ; then
        gs="${gs}#"
    fi
    if [[ $staged_count -gt 0 ]] ; then
        gs="${gs}+"
    fi
    if [[ $other_count -gt 0 ]] ; then
        gs="${gs}o"
    fi
    
    local gitstring="$gs"
    
    if [ "${__git_printf_supports_v-}" != yes ]; then
        gitstring=$(printf -- "$printf_format" "$gs")
    else
        printf -v gitstring -- "$printf_format" "$gs"
    fi
    PS1="$ps1pc_start$gitstring$ps1pc_end"
    
    return 0
}
