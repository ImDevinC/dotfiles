#!/bin/bash

COMMANDS=('clipit' 'dunst' 'htop' 'networkmanager-dmenu' 'obmenu-generator' 'ranger' 'rofi' 'tint2' 'openbox' 'volumeicon')

for c in ${COMMANDS[@]}; do
  command -v ${c} > /dev/null 2>&1 && {
    echo "Creating link for ${c}"
    ln -sf "${PWD}/.config/${c}/" "${HOME}/.config/${c}/"
  }
done

command -v picom > /dev/null 2>&1 && {
  echo "Creating link for picom.conf"
  ln -sf "${PWD}/.config/picom.conf" "${HOME}/.config/picom.conf"
}

command -v vim > /dev/null 2>&1 && {
  echo "Creating links for vim"
  ln -sf "${PWD}/.vim/autoload" "$HOME/.vim/autoload"
  ln -sf "${PWD}/.vimrc" "$HOME/.vimrc"
}

command -v zsh > /dev/null 2>&1 && {
  echo "Creating links for zsh"
  ln -sf "${PWD}/.oh-my-zsh/themes/zash.zsh-theme" "$HOME/.oh-my-zsh/themes/zash.zsh-theme"
  ln -sf "${PWD}/.zshrc" "$HOME/.zshrc"
}

command -v tmux > /dev/null 2>&1 && {
  echo "Creating links for tmux"
  ln -sf "$PWD/.tmux.conf" "$HOME/.tmux.conf"
}

echo "Creating .Xresources link"
ln -sf "${PWD}/.Xresources" "$HOME/.Xresources"
