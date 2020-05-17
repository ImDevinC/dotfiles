#!/bin/bash

COMMANDS=('clipit' 'dunst' 'htop' 'networkmanager-dmenu' 'obmenu-generator' 'ranger' 'rofi' 'tint2' 'openbox' 'volumeicon')

for c in ${COMMANDS[@]}; do
  command -v ${c} > /dev/null 2>&1 && {
    mkdir -p "${HOME}/.config/${c}" > /dev/null 2>&1
    if [[ -L "${HOME}/.config/${c}" ]]; then
      echo "Creating link for ${c}"
      ln -sf "${PWD}/.config/${c}" "${HOME}/.config/${c}"
    fi
  }
done

command -v picom > /dev/null 2>&1 && {
  if [[ -L "${HOME}/.config/picom.conf" ]]; then
    echo "Creating link for picom.conf"
    ln -sf "${PWD}/.config/picom.conf" "${HOME}/.config/picom.conf"
  fi
}

command -v vim > /dev/null 2>&1 && {
  echo "Creating links for vim"
  if [[ ! -L "$HOME/.vim/autoload" ]]; then
    ln -sf "${PWD}/.vim/autoload" "$HOME/.vim/autoload"
  fi
  if [[ ! -L "$HOME/.vimrc" ]]; then
    ln -sf "${PWD}/.vimrc" "$HOME/.vimrc"
  fi
}

command -v zsh > /dev/null 2>&1 && {
  echo "Creating links for zsh"
  ln -sf "${PWD}/.oh-my-zsh/themes/zash.zsh-theme" "$HOME/.oh-my-zsh/themes/zash.zsh-theme"

  if [[ ! -L "$HOME/.zshrc" ]]; then
    ln -sf "${PWD}/.zshrc" "$HOME/.zshrc"
  fi
}

echo "Creating .Xresources link"
mkdir -p "$HOME/.Xresources" > /dev/null 2>&1
if [[ ! -L "$HOME/.Xresources" ]]; then
  ln -sf "${PWD}/.Xresources" "$HOME/.Xresources"
fi
