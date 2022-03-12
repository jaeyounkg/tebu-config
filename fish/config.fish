
function exists
    command -v $argv[1] &> /dev/null
end

# system
if not contains ~/bin $PATH
    set -gxa PATH ~/bin
end
if not contains ~/.local/bin $PATH
    set -gxa PATH ~/.local/bin
end

# ibus
set -gx GTK_IM_MODULE ibus
set -gx XMODIFIERS @im=ibus
set -gx QT_IM_MODULE ibus

# ocaml, opam
if not contains ~/.opam/default/bin $PATH
    set -gxa PATH ~/.opam/default/bin
end
alias ocaml "rlwrap ocaml"
alias dune "rlwrap dune"
if exists opam
    eval (opam env)
end

# apt
abbr -a -g sau sudo apt update
abbr -a -g sar sudo apt remove
abbr -a -g sai sudo apt install

# dnf
abbr -a -g sdi sudo dnf install
abbr -a -g sdc sudo dnf check-update
abbr -a -g sdu sudo dnf upgrade

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
abbr -a -g gt git tag
abbr -a -g gtl git tag --list
abbr -a -g gcl git clone
abbr -a -g glg git lg1-specific
abbr -a -g gco git checkout
abbr -a -g gcos git checkout --recurse-submodules
abbr -a -g gbr git branch
abbr -a -g gbra git branch --all
abbr -a -g gst git status
abbr -a -g gsh git stash
abbr -a -g gshl git stash list
abbr -a -g gcm git commit
abbr -a -g gcmm git commit -m
abbr -a -g gfc git fetch
abbr -a -g grb git rebase
abbr -a -g grbi git rebase -i
abbr -a -g gmg git merge
abbr -a -g gdf git diff
abbr -a -g gdfs git diff --staged
abbr -a -g gdc git diff --compact-summary
abbr -a -g gdcs git diff --compact-summary --staged
abbr -a -g grs git reset
abbr -a -g grt git restore
abbr -a -g grts git restore --staged
abbr -a -g gcp git cherry-pick
abbr -a -g gad git add
abbr -a -g gau git add -u
abbr -a -g gpu git push origin
abbr -a -g gpuf git push --force-with-lease origin
abbr -a -g gsm git submodule
abbr -a -g gsmi git submodule init
abbr -a -g gsmu git submodule update
abbr -a -g gpl git pull origin

# pyenv
if not contains ~/.pyenv/bin $PATH
    set -gxa PATH ~/.pyenv/bin
end
status is-login; and pyenv init --path | source
status is-interactive; and pyenv init --path | source
abbr -a -g pex pyenv exec

# dvc
abbr -a -g dad dvc add
abbr -a -g dst dvc status
abbr -a -g dpu dvc push
abbr -a -g dpl dvc pull
abbr -a -g dco dvc checkout
abbr -a -g drm dvc remove

# tide
# set -g tide_left_prompt_items pwd git newline prompt_char
# set -g tide_left_prompt_suffix ""
# function _tide_item_example
#     set_color yellow
#     echo "Hello hello!"
# end
# set -g tide_left_prompt_items pwd git newline prompt_char
# set tide_example_bg_color red

