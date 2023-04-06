# .bashrc

export SSH_ASKPASS=/usr/bin/ksshaskpassi
export PATH=$PATH:/home/gaia/Documents/linux_Scripts

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/gaia/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/gaia/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/gaia/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/gaia/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

#Github:

#Aliases 

alias grep='grep --color=auto'
alias c='clear'
alias p='ps aux | grep'
alias e='exit'
alias nrc='nvim /home/gaia/.config/awesome/rc.lua'

function mcd() {
    mkdir -p "$@" && cd "$@" || return
}

function extract () {
     if [ -f $1 ] ; then
         case $1 in
             *.tar.bz2)   tar xjf $1     ;;
             *.tar.gz)    tar xzf $1     ;;
             *.bz2)       bunzip2 $1     ;;
             *.rar)       unrar e $1     ;;
             *.gz)        gunzip $1      ;;
             *.tar)       tar xf $1      ;;
             *.tbz2)      tar xjf $1     ;;
             *.tgz)       tar xzf $1     ;;
             *.zip)       unzip $1       ;;
             *.Z)         uncompress $1  ;;
             *.7z)        7z x $1        ;;
             *)           echo "Cannot extract '$1': unknown archive format" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

