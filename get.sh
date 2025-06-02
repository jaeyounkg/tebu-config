#!/usr/bin/env bash
files=(bashrc gitconfig tmux.conf ssh zshrc)
names=(bash git tmux ssh zsh)
for ((i=0; i < ${#files[@]}; i++)) do
    if echo $@ | grep -q "all\|${names[i]}"; then
        cp -vr $HOME/.*${files[i]} ./dotfiles/
    fi
done
if echo $@ | grep -q "vim"; then
    cp -v $HOME/.vimrc ./vim/
    cp -rv $HOME/.vim/colors ./vim/
fi
if echo $@ | grep -q "nvim"; then # always run `vim` together
    cp -v $HOME/.config/nvim/init.lua ./nvim/init.lua
fi
if echo $@ | grep -q "fish"; then
    cp -v $HOME/.config/fish/config.fish ./fish/config.fish
fi
if echo $@ | grep -q "starship"; then
    cp -v $HOME/.config/starship.toml ./starship.toml
fi
if echo $@ | grep -q "karabiner"; then
    cp -v $HOME/.config/karabiner/assets/complex_modifications/11111111.json ./karabiner/11111111.json
fi
