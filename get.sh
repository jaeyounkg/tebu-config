#!/usr/bin/env bash
cp ~/.bashrc ./dotfiles/
cp ~/.gitconfig ./dotfiles/
cp ~/.vimrc ./dotfiles/
cp ~/.tebucolemak.vimrc ./dotfiles/
cp ~/.tmux.conf ./dotfiles/
cp ~/.config/fish/config.fish ./fish/config.fish

# get but don't set
cp ~/.ssh/config ./dotfiles/.ssh/config

