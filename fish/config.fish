
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
alias ocaml "rlwrap ocaml"
alias dune "rlwrap dune"
if exists opam
    if not contains ~/.opam/default/bin $PATH
        set -gxa PATH ~/.opam/default/bin
    end
    eval (opam env)
end

# golang
if not contains /usr/local/go/bin $PATH
    set -gxa PATH /usr/local/go/bin
end

# apt
if exists apt
    abbr -a -g sau sudo apt update
    abbr -a -g sar sudo apt remove
    abbr -a -g sai sudo apt install
end

# dnf
if exists dnf
    abbr -a -g sdi sudo dnf install
    abbr -a -g sdc sudo dnf check-update
    abbr -a -g sdu sudo dnf upgrade
    abbr -a -g sdr sudo dnf remove
end

# exa & file navigation
if exists exa
    set -g EXA_BASIC_OPTIONS --color=always --time modified --time-style long-iso --group-directories-first
    set -g EXA_STANDARD_OPTIONS $EXA_BASIC_OPTIONS --long --all --header 

    function la 
        exa $EXA_STANDARD_OPTIONS --group --binary --links --inode --blocks $argv
    end
    function ll
        exa $EXA_STANDARD_OPTIONS $argv
    end
    function lt 
        exa $EXA_STANDARD_OPTIONS --tree --level 2 $argv
    end
    function ld 
        exa $EXA_STANDARD_OPTIONS --tree --level $argv[1] $argv[2..] | less -RF
    end

    alias l 'exa $EXA_BASIC_OPTIONS $argv'
    alias lm 'll --sort=modified --reverse $argv'
    alias lM 'll --sort=modified $argv'

    function lal
        la $argv | less -RF
    end
    function lll
        ll $argv | less -RF
    end
    function ltl
        lt $argv | less -RF
    end
    function lml
        lm $argv | less -RF
    end
    function lMl
        lM $argv | less -RF
    end
else
    alias l 'ls'
    alias ll 'ls -alh'
    alias lll 'ls -alh | less -RF'
end

function cl
    cd $argv && l
end

# git
if exists git
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
    abbr -a -g gac "git add -u && git commit -m"
end

# python
abbr -a -g pym python -m
abbr -a -g pipi pip install
abbr -a -g pyp python -m pip
abbr -a -g pypi python -m pip install
if exists pyenv && not exists conda
    if not contains ~/.pyenv/bin $PATH
        set -gxa PATH ~/.pyenv/bin
    end
    status is-login; and pyenv init --path | source
    status is-interactive; and pyenv init --path | source
    abbr -a -g pex pyenv exec
end
abbr tfset set -gxa LD_LIBRARY_PATH $CONDA_PREFIX/lib/

# dvc
if exists dvc
    abbr -a -g dad dvc add
    abbr -a -g dst dvc status
    abbr -a -g dpu dvc push
    abbr -a -g dpl dvc pull
    abbr -a -g dco dvc checkout
    abbr -a -g drm dvc remove
end

# tide
# set -g tide_left_prompt_items pwd git newline prompt_char
# set -g tide_left_prompt_suffix ""
# function _tide_item_example
#     set_color yellow
#     echo "Hello hello!"
# end
# set -g tide_left_prompt_items pwd git newline prompt_char
# set tide_example_bg_color red

if [ (hostname) = "ampc12" ] || [ (string sub -l 4 (hostname)) = "sacs" ]
    set -gx http_proxy http://192.168.1.10:3128
    set -gx https_proxy http://192.168.1.10:3128
    set -gx ftp_proxy http://192.168.1.10:3128

    # this line prevents `Exception ignored in: <_io.TextIOWrapper name='<stdout>' mode='w' encoding='UTF-8'>`
    status is-interactive &&
    # below line is written by `conda init`
    eval /home/jaeyoung/Programs/anaconda3/bin/conda "shell.fish" "hook" $argv | source
end

#>>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/jaeyoung/Softwares/anaconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

