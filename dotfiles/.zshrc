function exists() {
    command -v "$1" &> /dev/null
}

function wj() {
    iconv -f WINDOWS-31J -t UTF-8 $1
}


# oh-my-zsh
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell" # See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
plugins=(git z macos web-search zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh


# exa & file navigation
unalias l ls ll la # probably aliased by oh-my-zsh
export EXA_BASIC_OPTIONS=(--color=always --time=modified --time-style long-iso --group-directories-first)
export EXA_STANDARD_OPTIONS=("${EXA_BASIC_OPTIONS[@]}" --long --all --header)

function la() {
    exa $EXA_STANDARD_OPTIONS --group --binary --links --inode --blocks $argv
}
function ll() {
    exa $EXA_STANDARD_OPTIONS $argv
}
function lt() {
    exa $EXA_STANDARD_OPTIONS --tree --level 2 $argv
}
function ld() {
    exa $EXA_STANDARD_OPTIONS --tree --level $argv[1] $argv[2..] | less -RF
}

alias l="exa $EXA_BASIC_OPTIONS $argv"
alias lm="ll --sort=modified --reverse $argv"
alias lM="ll --sort=modified $argv"

function lal() {
    la $argv | less -RF
}
function lll() {
    ll $argv | less -RF
}
function ltl() {
    lt $argv | less -RF
}
function lml() {
    lm $argv | less -RF
}
function lMl() {
    lM $argv | less -RF
}
function cl() {
    cd $argv && l
}


# basic setup
export PATH=$HOME/bin:/usr/local/bin:$PATH
HYPHEN_INSENSITIVE="true" # Hyphen-insensitive completion, case-sensitive completion must be off. _ and - will be interchangeable.
zstyle ':omz:update' mode reminder  # just remind me to update when it's time
# DISABLE_MAGIC_FUNCTIONS="true" # enable if pasting URLs and other text is messed up.
# DISABLE_AUTO_TITLE="true" # disable auto-setting terminal title.
ENABLE_CORRECTION="true" # Enable command auto-correction.
COMPLETION_WAITING_DOTS="true" # display red dots whilst waiting for completion.
# DISABLE_UNTRACKED_FILES_DIRTY="true" # this makes repository status check for large repositories faster.
HIST_STAMPS="yyyy-mm-dd" # change the command execution time stamp shown in the history command output.


# zsh-abbr
source /opt/homebrew/share/zsh-abbr/zsh-abbr.zsh


# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# starship
eval "$(starship init zsh)"
