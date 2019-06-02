#!/bin/bash
git submodule init
git submodule update
 
command -v i3 > /dev/null 2>&1 && {
  if [[ ! -L "$HOME/.config/i3/config" ]]; then
    ln -sf "$(PWD)/i3/config" "$HOME/.config/i3/config"
  fi
  
  if [[ ! -L "$HOME/.config/polybar" ]]; then
    ln -sf "${PWD}/polybar" "$HOME/.config/polybar"
  fi
}

command -v zsh > /dev/null 2>&1 && {
  if [[ ! -L "$HOME/.oh-my-zsh" ]]; then
    ln -sf "${PWD}/zsh/.oh-my-zsh" "$HOME/.oh-my-zsh"
  fi

  if [[ ! -L "$HOME/.zshrc" ]]; then
    ln -sf "${PWD}/zsh/.zshrc" "$HOME/.zshrc"
  fi
}

if [ -d "$HOME/Library/Application Support/iTerm2/DynamicProfiles" ]; then
  if [[ ! -L "$HOME/Library/Application Support/iTerm2/DynamicProfiles/profile.json" ]]; then  
    ln -sf "${PWD}/iTerm/profile.json" "$HOME/Library/Application Support/iTerm2/DynamicProfiles/profile.json"
  fi
fi

mkdir -p "$HOME/.vim/colors" > /dev/null 2>&1
ln -sf "${PWD}/vim/.vim/autoload" "$HOME/.vim/autoload"
if [[ ! -L "$HOME/.vimrc" ]]; then
  ln -sf "${PWD}/vim/.vimrc" "$HOME/.vimrc"
fi
