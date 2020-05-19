#!/bin/bash

COMMANDS=('clipit' 'dunst' 'htop' 'networkmanager-dmenu' 'obmenu-generator' 'ranger' 'rofi' 'tint2' 'openbox' 'volumeicon')

for c in ${COMMANDS[@]}; do
  command -v ${c} > /dev/null 2>&1 && {
    if [[ ! -L "$HOME/.config/${c}" ]]; then
      echo "Creating link for ${c}"
      ln -sf "${PWD}/.config/${c}/" "${HOME}/.config/${c}/"
    fi
  }
done

command -v picom > /dev/null 2>&1 && {
  if [[ ! -L "${HOME}/.config/picom.conf" ]]; then
    echo "Creating link for picom.conf"
    ln -sf "${PWD}/.config/picom.conf" "${HOME}/.config/picom.conf"
  fi
}

command -v vim > /dev/null 2>&1 && {
  if [[ ! -L "$HOME/.vim/autoload" ]]; then
    echo "Creating links for vim autoload"
    ln -sf "${PWD}/.vim/autoload" "$HOME/.vim/autoload"
  fi
  if [[ ! -L "$HOME/.vimrc" ]]; then
    echo "Creating links for vim"
    ln -sf "${PWD}/.vimrc" "$HOME/.vimrc"
  fi
}

command -v zsh > /dev/null 2>&1 && {
  if [[ ! -L "$HOME/.zshrc" ]]; then
    echo "Creating links for zsh"
    ln -sf "${PWD}/.zshrc" "$HOME/.zshrc"
  fi
  if [[ ! -L "$HOME/.oh-my-zsh/themes/zash.zsh-theme" ]]; then
    echo "Creating links for zsh theme"
    ln -sf "${PWD}/.oh-my-zsh/themes/zash.zsh-theme" "$HOME/.oh-my-zsh/themes/zash.zsh-theme"
  fi
}

command -v tmux > /dev/null 2>&1 && {
  if [[ ! -L "$HOME/.tmux.conf" ]]; then
    echo "Creating links for tmux"
    ln -sf "$PWD/.tmux.conf" "$HOME/.tmux.conf"
  fi
}

if [[ ! -L "$HOME/.Xresources" ]]; then
  echo "Creating .Xresources link"
  ln -sf "${PWD}/.Xresources" "$HOME/.Xresources"
fi
