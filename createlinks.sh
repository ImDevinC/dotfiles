#!/bin/bash
git submodule init
git submodule update
 
command -v i3 > /dev/null 2>&1 && {
  ln -sf "$(PWD)/i3/config" "$HOME/.config/i3/config"
  ln -sf "${PWD}/polybar" "$HOME/.config/polybar"
}

command -v zsh > /dev/null 2>&1 && {
  ln -sf "${PWD}/zsh/.oh-my-zsh" "$HOME/.oh-my-zsh"
  ln -sf "${PWD}/zsh/.zshrc" "$HOME/.zshrc"
}

if [ -d "$HOME/Library/Application Support/iTerm2/DynamicProfiles" ]; then
  ln -sf "${PWD}/iTerm/profile.json" "$HOME/Library/Application Support/iTerm2/DynamicProfiles/profile.json"
fi

mkdir -p "$HOME/.vim/colors" > /dev/null 2>&1
cp "${PWD}/vim/miniml/colors/miniml.vim" "$HOME/.vim/colors/miniml.vim"
