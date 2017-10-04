# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

HISTIGNORE='rm *:sudo* rm *:svn revert*:hadoop fs -rm*:sudo* hadoop fs -rm*:kill *:sudo kill *'

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

if [[ $TILIX_ID ]]; then
    source /etc/profile.d/vte-2.91.sh
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
    xterm-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

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

function parse_git_branch {

  RED="\[\033[00;31m\]"
  YELLOW="\[\033[00;33m\]"
  GREEN="\[\033[00;32m\]"
  BLUE="\[\033[00;34m\]"
  LIGHT_RED="\[\033[01;31m\]"
  LIGHT_GREEN="\[\033[01;32m\]"
  WHITE="\[\033[01;37m\]"
  LIGHT_GRAY="\[\033[00;37m\]"
  LIGHT_PURPLE="\[\033[01;35m\]"
  LIGHT_BLUE="\[\033[01;34m\]"
  COLOR_NONE="\[\e[00m\]"

  git rev-parse --git-dir &> /dev/null
  git_status="$(git status 2> /dev/null)"
  branch_pattern="^On branch ([^${IFS}]*)"
  remote_pattern="Your branch is (.*) of"
  diverge_pattern="Your branch and (.*) have diverged"
  if [[ ! ${git_status}} =~ "working tree clean" ]]; then
    state="${LIGHT_RED}⚡"
  fi
  # add an else if or two here if you want to get more specific
  if [[ ${git_status} =~ ${remote_pattern} ]]; then
    if [[ ${BASH_REMATCH[1]} == "ahead" ]]; then
      remote="${YELLOW}↑"
    else
      remote="${YELLOW}↓"
    fi
  fi
  if [[ ${git_status} =~ ${diverge_pattern} ]]; then
    remote="${YELLOW}↕"
  fi
  if [[ ${git_status} =~ ${branch_pattern} ]]; then
#    if [[ "$(ssh -p 29418 -o ConnectTimeout=1 review.criteois.lan gerrit query $(git log --oneline -1 | cut -d' ' -f1) | grep rowCount | cut -d' ' -f2)" == "1" ]]; then
#      gerrit=" ${GREEN}☑"
#    else
#      gerrit=" ${YELLOW}☐"
#    fi
    branch=${BASH_REMATCH[1]}
    echo " (${branch})${remote}${state}"  #${gerrit}"
  fi
}

__vte_urlencode() (
  # This is important to make sure string manipulation is handled
  # byte-by-byte.
  LC_ALL=C
  str="$1"
  while [ -n "$str" ]; do
    safe="${str%%[!a-zA-Z0-9/:_\.\-\!\'\(\)~]*}"
    printf "%s" "$safe"
    str="${str#"$safe"}"
    if [ -n "$str" ]; then
      printf "%%%02X" "'$str"
      str="${str#?}"
    fi
  done
)

__vte_osc7 () {
  printf "\[\033]7;file://%s%s\007\]" "${HOSTNAME:-}" "$(__vte_urlencode "${PWD}")"
}

function prompt_funct {
  RED="\[\033[00;31m\]"
  YELLOW="\[\033[00;33m\]"
  GREEN="\[\033[00;32m\]"
  BLUE="\[\033[00;34m\]"
  LIGHT_RED="\[\033[01;31m\]"
  LIGHT_GREEN="\[\033[01;32m\]"
  WHITE="\[\033[01;37m\]"
  LIGHT_GRAY="\[\033[00;37m\]"
  LIGHT_PURPLE="\[\033[01;35m\]"
  LIGHT_BLUE="\[\033[01;34m\]"
  COLOR_NONE="\[\e[00m\]"
  if [ "$VIRTUAL_ENV" ] ; then
    VENV="(`basename $VIRTUAL_ENV`)"
  else
    VENV=""
  fi

    PS1="${VENV}\[\e]0;\u@\h: \w\a\]\[\e]0;\u@\h: \w\a\]${LIGHT_RED}\u${LIGHT_PURPLE}@${LIGHT_GREEN}\h${COLOR_NONE}:\t:${LIGHT_BLUE}\w${GREEN}$(parse_git_branch)${COLOR_NONE}\r\n$ $(__vte_osc7)"
}

  RED="\[\033[00;31m\]"
  YELLOW="\[\033[00;33m\]"
  GREEN="\[\033[00;32m\]"
  BLUE="\[\033[00;34m\]"
  LIGHT_RED="\[\033[01;31m\]"
  LIGHT_GREEN="\[\033[01;32m\]"
  WHITE="\[\033[01;37m\]"
  LIGHT_GRAY="\[\033[00;37m\]"
  LIGHT_PURPLE="\[\033[01;35m\]"
  LIGHT_BLUE="\[\033[01;34m\]"
  COLOR_NONE="\[\e[00m\]"

if [ "$color_prompt" = yes ]; then
  PS1="\[\e]0;\u@\h: \w\a\]\[\e]0;\u@\h: \w\a\]${LIGHT_RED}\u${LIGHT_PURPLE}@${LIGHT_GREEN}\h${COLOR_NONE}:\t:${LIGHT_BLUE}\w${COLOR_NONE}\r\n$ "
  PROMPT_COMMAND=prompt_funct
else
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
  PS1="\[\e]0;\u@\h: \w\a\]\[\e]0;\u@\h: \w\a\]${LIGHT_RED}\u${LIGHT_PURPLE}@${LIGHT_GREEN}\h${COLOR_NONE}:\t:${LIGHT_BLUE}\w${COLOR_NONE}\r\n$ "
  PROMPT_COMMAND=prompt_funct
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac



# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
for aliases in ~/.bash_aliases ~/.bash_aliases_private ; do
    if [ -f ${aliases} ]; then
        . ${aliases}
    fi
done
if [ -f ~/.bash_funcs ]; then
    . ~/.bash_funcs
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias rgrep='rgrep --color=auto'
fi

# some more ls aliases
alias ll='ls -l'
alias la='ls -Al'
alias l='ls -CF'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

export EDITOR=vim
export HADOOP_HOME=/usr/lib/hadoop
[[ -s "$HOME/.qfc/bin/qfc.sh" ]] && source "$HOME/.qfc/bin/qfc.sh"
export PATH=~/bin:$PATH:/home/blaurencin/opt/activator:~/.local/bin

export NVM_DIR="/home/blaurencin/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# added by Anaconda2 4.4.0 installer
export PATH="$PATH:/home/blaurencin/work/anaconda2/bin"

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
