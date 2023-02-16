#!/usr/bin/env bash
files=(bashrc gitconfig vimrc tmux.conf ssh zshrc)
names=(bash git vim tmux ssh zsh)
for ((i=0; i < ${#files[@]}; i++)) do
    if echo $@ | grep -q "all\|${names[i]}"; then
        cp -vr $HOME/.*${files[i]} ./dotfiles/
    fi
done
if echo $@ | grep -q "fish"; then
    cp -v $HOME/.config/fish/config.fish ./fish/config.fish
fi
if echo $@ | grep -q "starship"; then
    cp -v $HOME/.config/starship.toml ./starship.toml
fi
if echo $@ | grep -q "karabiner"; then
    cp -v $HOME/.config/karabiner/assets/complex_modifications/11111111.json ./karabiner/11111111.json
fi
