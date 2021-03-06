TERM=xterm-color
EDITOR=vim
GIT_EDITOR=vim
VISUAL=vim

export MYVIMRC='.files/vimrc'

export DEBEMAIL='pztrick@users.noreply.github.com'
export DEBFULLNAME='Patrick Paul'

export GIT_AUTHOR_NAME="Patrick Paul"
export GIT_COMMITTER_NAME="Patrick Paul"
export GIT_AUTHOR_EMAIL=pztrick@users.noreply.github.com
export GIT_COMMITTER_EMAIL=pztrick@users.noreply.github.com

export GOPATH=/opt/go
export PATH=$PATH:/usr/local/go/bin:/opt/go/bin:/snap/bin:/home/$USER/.files/scripts

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# get venv name up top so PS1 can use
function parse_venv {
    if [ "${VIRTUAL_ENV}" ]; then
        VDIR=${VIRTUAL_ENV%/*}
        VDIR_BASE=${VDIR##*/}
        VENV_BASE=${VIRTUAL_ENV##*/}
        echo "(${VDIR_BASE}/${VENV_BASE}) "
    fi
}

# get git branch up top so PS1 can use
function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# If not running interactively, don't do anything
#[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
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
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
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

if [ -n "$PS1" ]; then
    # Are we in an interactive terminal?

    # add colors to ps1 prompt
    if [ "$color_prompt" = yes ]; then
        #    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
        PS1="\$(parse_venv)${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$(parse_git_branch)\$ "
    else
        PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
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

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Start ssh-agent and keychain
# The `whoami` lines give the user and its sudo a separate ssh-agent process
#if [ -f /usr/bin/ssh-askpass ]; then
#	export SSH_ASKPASS=/usr/bin/ssh-askpass
#fi
if [ "$(hostname)" = "icarus" ]; then
    if [ -z "$DISPLAY" ] && [ -f /usr/bin/keychain ]; then
        [ `whoami` == 'root' ] && HOME=/root
        /usr/bin/keychain --quiet --inherit any $HOME/.ssh/id_rsa
        source $HOME/.keychain/$HOSTNAME-sh > /dev/null
        [ `whoami` == 'root' ] && HOME=~
    fi
    eval `keychain --eval id_rsa`
fi
# End ssh-agent and keychain

# disable CTRL+S freeze
if [ -n "$PS1" ]; then
    stty ixany
    stty ixoff -ixon
fi

# localrc
if [ -n "$PS1" ] && [ -f ~/.localrc ]; then
    . ~/.localrc
fi

# functions
if [ -f ~/.files/functions ]; then
    . ~/.files/functions
fi

# paths
export CDPATH=~/.files/paths

# inforc print at the end
if [ -f ~/.files/inforc ]; then
    . ~/.files/inforc
fi

# lastrc
if [ -n "$PS1" ] && [ -f ~/.lastrc ]; then
    . ~/.lastrc
fi

# xterm for tmux
if [ "$TERM" == "xterm-color" ]; then
    TERM=xterm-256color
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH_ORIGINAL=$PATH

cd ~

# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"


export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

export VIRTUALENV_PYTHON=$(which python3.8)

eval "$(direnv hook bash)"
export PATH="/home/patrick/.ebcli-virtual-env/executables:$PATH"

export NODE_VERSIONS=/usr/local/n/versions/node  # 
export NODE_VERSION_PREFIX=""  # no prefix; see: https://github.com/direnv/direnv/wiki/Node

eval "$(starship init bash)"
