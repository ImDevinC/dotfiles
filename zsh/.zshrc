unameOut="$(uname -s)"
case "${unameOut}" in
  Linux*)   machine=Linux;;
  Darwin*)  machine=Mac;;
  *)        machine="Uknown:${unameOut}"
esac

export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="af-magic"

plugins=(git adb cp autojump docker) 
if [[ "${machine}" == "Mac" ]]; then
  plugins+=(osx)
elif [[ "${machine}" == "Linux" ]]; then
  plugins+=(archlinux)
fi

PATH=""
if [ -d "/usr/local/sbin" ]; then PATH="${PATH}:/usr/local/sbin" fi
if [ -d "/usr/local/bin" ]; then PATH="${PATH}:/usr/local/bin" fi
if [ -d "/usr/lib/jvm/default/bin" ]; then PATH="${PATH}:/usr/lib/jvm/default/bin" fi
if [ -d "/usr/bin/site_perl" ]; then PATH="${PATH}:/usr/bin/site_perl" fi
if [ -d "/usr/bin/vendor_perl" ]; then PATH="${PATH}:/usr/bin/vendor_perl" fi
if [ -d "/usr/bin/core_perl" ]; then PATH="${PATH}:/usr/bin/core_perl" fi
if [ -d "${HOME}/.gem/ruby/2.5.0/bin" ]; then PATH="${PATH}:${HOME}/.gem/ruby/2.5.0/bin" fi
if [ -d "${HOME}/.bin" ]; then PATH="${PATH}:${HOME}/.bin" fi
if [ -d "${HOME}/.local/bin" ]; then PATH="${PATH}:${HOME}/.local/bin" fi
if [ -d "/usr/bin" ]; then PATH="${PATH}:/usr/bin" fi
if [ -d "/bin" ]; then PATH="${PATH}:/bin" fi
if [ -d "/usr/sbin" ]; then PATH="${PATH}:/usr/sbin" fi
if [ -d "/sbin" ]; then PATH="${PATH}:/sbin" fi

export PATH=${PATH}

if [ -d "${HOME}/.dotfiles/zsh/sources" ]; then for f in ${HOME}/.dotfiles/zsh/sources/*; do source $f; done; fi

alias ssh='TERM=xterm-color ssh'
source $ZSH/oh-my-zsh.sh

command -v xclip > /dev/null 2>&1 && {
    alias pbcopy='xsel --clipboard --input'
    alias pbpaste='xsel --clipboard --output'
}

command -v hub > /dev/null 2>&1 && {
  alias git=hub
}

command -v gpg-connect-agent > /dev/null 2>&1 && {
  export GPG_TTY=$(tty)
  gpg-connect-agent updatestartuptty /bye > /dev/null
  unset SSH_AGENT_PID
  export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
  gpgconf --launch gpg-agent
  if [[ "${machine}" == "Linux" ]]; then export XDG_RUNTIME_DIR=/run/user/`id -u`; fi
}

if [[ -f "${HOME}/.profile" ]]; then
    source "${HOME}/.profile"
fi

if [ -d "${HOME}/.dotfiles/privates" ]; then for f in ${HOME}/.dotfiles/privates/*; do source $f; done; fi

command -v xrdb > /dev/null 2>&1 && {
  xrdb "${HOME}/.Xresources"
}
