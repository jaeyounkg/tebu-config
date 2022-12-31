#!/usr/bin/env bash
files=(bashrc gitconfig vimrc tmux.conf ssh zshrc)
names=(bash git vim tmux ssh zsh)
for ((i=0; i < ${#files[@]}; i++)) do
    if echo $@ | grep -q "all\|${names[i]}"; then
        cp -vr ./dotfiles/.*${files[i]} $HOME/
    fi
done
if echo $@ | grep -q "all\|fish"; then
    cp -v ./fish/config.fish $HOME/.config/fish/config.fish
fi
