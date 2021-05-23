
# exa & file navigation
set -g EXA_BASIC_OPTIONS --color=always --time modified --time-style long-iso --group-directories-first
set -g EXA_STANDARD_OPTIONS $EXA_BASIC_OPTIONS --long --all --header 

function la 
    exa $EXA_STANDARD_OPTIONS --group --binary --links --inode --blocks $argv | less -RF
end
function ll
    exa $EXA_STANDARD_OPTIONS $argv | less -RF
end
function lt 
    exa $EXA_STANDARD_OPTIONS --tree --level 2 $argv | less -RF
end
function ld 
    exa $EXA_STANDARD_OPTIONS --tree --level $argv[1] $argv[2..] | less -RF
end
function cl
    cd $argv && l
end

alias l 'exa $EXA_BASIC_OPTIONS $argv'
alias lm 'll --sort=modified --reverse $argv'


# git
alias g 'git'
abbr -a -g glg git lg1
abbr -a -g gco git checkout
abbr -a -g gcos git checkout --recurse-submodules
abbr -a -g gbr git branch
abbr -a -g gst git status
abbr -a -g gsh git stash
abbr -a -g gcm git commit
abbr -a -g gcmm git commit -m
abbr -a -g gfc git fetch
abbr -a -g grb git rebase
abbr -a -g grbi git rebase -i
abbr -a -g gmg git merge
abbr -a -g gdf git diff
abbr -a -g gdfc git diff --compact-summary
abbr -a -g grs git reset
abbr -a -g grt git restore
abbr -a -g gcp git cherry-pick
abbr -a -g gad git add
abbr -a -g gau git add -u
abbr -a -g gpu git push
abbr -a -g gpo git push origin
abbr -a -g gpfl git push --force-with-lease origin
abbr -a -g gsm git submodule


# pyenv
set -gx PATH $PATH $HOME/.pyenv/bin
abbr -a -g pe pyenv exec
abbr -a -g pei pyenv exec pip
abbr -a -g pep pyenv exec python


# tide
# set -g tide_left_prompt_items pwd git newline prompt_char
# set -g tide_left_prompt_suffix ""
# function _tide_item_example
#     set_color yellow
#     echo "Hello hello!"
# end
# set -g tide_left_prompt_items pwd git newline prompt_char
# set tide_example_bg_color red


# spacefish
# set -g SPACEFISH_PROMPT_DEFAULT_PREFIX "| "

