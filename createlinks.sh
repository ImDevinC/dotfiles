#!/bin/bash
# git submodule init
# git submodule update
 
# command -v i3 > /dev/null 2>&1 && {
#   if [[ ! -L "$HOME/.config/i3/config" ]]; then
#     ln -sf "$(PWD)/i3/config" "$HOME/.config/i3/config"
#   fi
  
#   if [[ ! -L "$HOME/.config/polybar" ]]; then
#     ln -sf "${PWD}/polybar" "$HOME/.config/polybar"
#   fi
# }

command -v zsh > /dev/null 2>&1 && {
  if [[ ! -L "$HOME/.oh-my-zsh" ]]; then
    ln -sf "${PWD}/zsh/.oh-my-zsh" "$HOME/.oh-my-zsh"
  fi

  if [[ ! -L "$HOME/.zshrc" ]]; then
    ln -sf "${PWD}/zsh/.zshrc" "$HOME/.zshrc"
  fi
}

if [ -d "$HOME/Library/Application Support/iTerm2/DynamicProfiles" ]; then
  if [[ -d "${HOME}/.dotfiles/iTerm" ]]; then
    for f in ${HOME}/.dotfiles/iTerm/*.json; do
      if [[ ! -L "$HOME/Library/Application Support/iTerm2/DynamicProfiles/$(basename $f)" ]]; then  
        ln -sf "${PWD}/iTerm/$(basename $f)" "$HOME/Library/Application Support/iTerm2/DynamicProfiles/$(basename $f)"
      fi
    done
  fi
fi

command -v vim > /dev/null 2>&1 && {
  mkdir -p "$HOME/.vim/colors" > /dev/null 2>&1
  if [[ ! -L "$HOME/.vim/autoload" ]]; then
    ln -sf "${PWD}/vim/.vim/autoload" "$HOME/.vim/autoload"
  fi
  if [[ ! -L "$HOME/.vimrc" ]]; then
    ln -sf "${PWD}/vim/.vimrc" "$HOME/.vimrc"
  fi
}

# command -v dunst > /dev/null 2>&1 && {
#   if [[ ! -L "$HOME/.config/dunst" ]]; then
#     ln -sf "${PWD}/dunst" "${HOME}/.config/dunst"
#   fi
# }

# command -v compton > /dev/null 2>&1 && {
#   if [[ ! -L "$HOME/.config/compton" ]]; then
#     ln -sf "${PWD}/compton" "${HOME}/.config/compton"
#   fi
# }

# command -v rofi > /dev/null 2>&1 && {
#   if [[ ! -L "$HOME/.config/rofi" ]]; then
#     ln -sf "${PWD}/rofi" "${HOME}/.config/rofi"
#   fi
# }
