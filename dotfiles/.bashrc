
function exists() {
    command -v "$1" &> /dev/null
}

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

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
#shopt -s globstar

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
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
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

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

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

# PATH
export PATH=$HOME/.local/bin:$PATH

# custom commands and aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
alias ll='ls -AlF'
alias la='ls -A'
alias l='ls -CF'
function cl() {
    cd "$1" && ls -AF
}
export -f cl

# direnv
if exists direnv ; then
    eval "$(direnv hook bash)"
fi

## pyenv configs
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if exists opam ; then
    eval "$(opam env)"
fi

# disable Ctrl-s
stty stop ""

# git alias
alias gt="git tag"
alias gtl="git tag --list"
alias gcl="git clone"
alias glg="git lg1-specific"
alias gco="git checkout"
alias gcos="git checkout --recurse-submodules"
alias gbr="git branch"
alias gbra="git branch --all"
alias gst="git status"
alias gsh="git stash"
alias gshl="git stash list"
alias gcm="git commit"
alias gcmm="git commit -m"
alias gfc="git fetch"
alias grb="git rebase"
alias grbi="git rebase -i"
alias gmg="git merge"
alias gdf="git diff"
alias gdfs="git diff --staged"
alias gdc="git diff --compact-summary"
alias gdcs="git diff --compact-summary --staged"
alias grs="git reset"
alias grt="git restore"
alias grts="git restore --staged"
alias gcp="git cherry-pick"
alias gad="git add"
alias gau="git add -u"
alias gpu="git push origin"
alias gpuf="git push --force-with-lease origin"
alias gsm="git submodule"
alias gsmi="git submodule init"
alias gsmu="git submodule update"
alias gpl="git pull origin"
alias gac="git add -u && git commit -m"

# redshift
alias rshift="redshift -x && redshift -O $1"

# IBus
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

# kawahara lab
if [[ `hostname` == "ampc12" ]]; then
    export http_proxy=http://192.168.1.10:3128
    export https_proxy=http://192.168.1.10:3128
    export ftp_proxy=http://192.168.1.10:3128
fi

# force run fish
# if [ -x "$HOME/.local/bin/fish" ]; then
#     exec "$HOME/.local/bin/fish"
# fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/jaeyoung/Softwares/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/jaeyoung/Softwares/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/jaeyoung/Softwares/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/jaeyoung/Softwares/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


