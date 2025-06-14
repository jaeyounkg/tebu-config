#!/usr/bin/env bash
files=(bashrc gitconfig tmux.conf ssh zshrc)
names=(bash git tmux ssh zsh)
for ((i=0; i < ${#files[@]}; i++)) do
    if echo $@ | grep -q "all\|${names[i]}"; then
        cp -vr ./dotfiles/.*${files[i]} $HOME/
    fi
done
if echo $@ | grep -q "vim"; then
    cp -v vim/.vimrc $HOME/
    cp -rv vim/colors $HOME/.vim/
fi
if echo $@ | grep -q "nvim"; then
    cp -v nvim/init.lua $HOME/.config/nvim/init.lua
    cp -rv vim/colors $HOME/.config/nvim/
fi
if echo $@ | grep -q "fish"; then
    cp -v ./fish/config.fish $HOME/.config/fish/config.fish
fi
if echo $@ | grep -q "starship"; then
    cp -v ./starship.toml $HOME/.config/starship.toml
fi
if echo $@ | grep -q "karabiner"; then
    cp -v ./karabiner/11111111.json $HOME/.config/karabiner/assets/complex_modifications/11111111.json
fi
