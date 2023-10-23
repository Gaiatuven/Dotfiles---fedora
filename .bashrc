# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

export nutritionix_api="dad644140552b3a48c5a7ac4b07aa63a"
export tequila_flights_api="UTQXUHk5clZwA2-RtmOX0cZzz2KCu1ZF"
export PATH=$PATH:/usr/local/bin
export EDITOR=nvim

# If not running interactively, don't do anything
case $- in
    *i*) ;;
    *) return;;
esac

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
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

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

if [ "$color_prompt" = yes ]; then
    PS1="\[$(tput setaf 39)\]>\[$(tput setaf 45)\] \w\[$(tput sgr0)\] "
else
    PS1="\[$(tput setaf 39)\]>\[$(tput setaf 45)\] \w\[$(tput sgr0)\] "
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

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

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

export LS_OPTIONS='--color=auto'
alias ls='ls $LS_OPTIONS'
HISTSIZE=10000
HISTFILESIZE=10000
HISTCONTROL=ignoredups

function mkcd() {
    mkdir -p "$1" && cd "$1"
}

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Create a Python virtual environment named "env"

# Add this at the beginning of your .bashrc

create_venv() {
    if [ -z "$1" ]; then
        echo "Usage: create_python_venv <venv_name>"
    else
        python3 -m venv "$1"
    fi
}

# Activate a virtual environment
activate() {
    source "$1/bin/activate"
}

# Deactivate the current virtual environment
deactivate_venv() {
    deactivate
}

alias py='python3'
alias pipi='pip install'
alias pipu='pip uninstall'
alias mkvenv='python3 -m venv'

function mkcd() {
    mkdir -p "$1" && cd "$1"
}

cdl () {
    cd "$1" && ls
}

findfile () {
    find . -type f -name "$1"
}

editbashrc () {
    nvim ~/.bashrc
}

reloadbashrc () {
    source ~/.bashrc
}


