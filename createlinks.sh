#!/bin/bash

command -v i3 > /dev/null 2>&1 && {
  ln -sf ~/.dotfiles/i3/config ~/.config/i3/config
  ln -sf ~/.dotfiles/polybar ~/.config/polybar
}

command -v zsh > /dev/null 2>&1 && {
  git submodule init
  git submodule update
  ln -sf ~/.dotfiles/zsh/.oh-my-zsh ~/.oh-my-zsh
  ln -sf ~/.dotfiles/zsh/.zshrc ~/.zshrc
}

if [ -d "~/Library/Application Support/iTerm2/DynamicProfiles" ]; then
  ln -sf ~/.dotfiles/iTerm/profile.json "~/Library/Application Support/iTerm2/DynamicProfiles/profile.json"
fi
