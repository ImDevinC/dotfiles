# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="af-magic"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
unameOut="$(uname -s)"
case "${unameOut}" in
  Linux*)   machine=Linux;;
  Darwin*)  machine=Mac;;
  *)        machine="Uknown:${unameOut}"
esac

plugins=(git adb cp)
if [ ${machine}=="Mac" ]; then
  plugins+=(mac)
elif [ ${machine}=="Linux" ]; then
  plugins+=(archlinux)
fi


# User configuration

PATH=""
if [ -d "/usr/local/sbin" ]; then PATH="${PATH}:/usr/local/sbin" fi
if [ -d "/usr/local/bin" ]; then PATH="${PATH}:/usr/local/bin" fi
if [ -d "/usr/lib/jvm/default/bin" ]; then PATH="${PATH}:/usr/lib/jvm/default/bin" fi
if [ -d "/usr/bin/site_perl" ]; then PATH="${PATH}:/usr/bin/site_perl" fi
if [ -d "/usr/bin/vendor_perl" ]; then PATH="${PATH}:/usr/bin/vendor_perl" fi
if [ -d "/usr/bin/core_perl" ]; then PATH="${PATH}:/usr/bin/core_perl" fi
if [ -d "${HOME}/.gem/ruby/2.5.0/bin" ]; then PATH="${PATH}:${HOME}/.gem/ruby/2.5.0/bin" fi
if [ -d "${HOME}/.bin" ]; then PATH="${PATH}:${HOME}/.bin" fi
if [ -d "${HOME}/.go" ]; then PATH="${PATH}:${HOME}/.go" fi
if [ -d "${HOME}/.local/bin" ]; then PATH="${PATH}:${HOME}/.local/bin" fi
if [ -d "/usr/bin" ]; then PATH="${PATH}:/usr/bin" fi
if [ -d "/bin" ]; then PATH="${PATH}:/bin" fi
if [ -d "/usr/sbin" ]; then PATH="${PATH}:/usr/sbin" fi
if [ -d "/sbin" ]; then PATH="${PATH}:/sbin" fi
export PATH=${PATH}
source $ZSH/oh-my-zsh.sh

# If .nvm exists, source it
if [ -f "/usr/share/nvm/init-nvm.sh" ]; then
  source /usr/share/nvm/init-nvm.sh
fi

# If .go exists, source it
if [ -d "$HOME/.go" ]; then
  export GOPATH="$HOME/.go"
fi

# If terraform exists (it should if docker exists), setup some aliases
command -v terraform > /dev/null 2>&1 && {
  function tf () {
    local COMMAND=${1?"Must specify command"}
    shift
    local ENV=${1?"Must specify env"}
    shift
    local IMAGE_TAG=$ENV
    if [[ $# > 0 ]]; then
        case "$1" in
            -*) ;;
            *)
                IMAGE_TAG=$1
                shift
                ;;
        esac
    fi
    echo "[terraform ${COMMAND}] env:${ENV} image_tag:${IMAGE_TAG} options: $@"
    terraform init && terraform workspace select ${ENV} && terraform ${COMMAND} -var-file="./tfvars/${ENV}.tfvars" -var "image_tag=${IMAGE_TAG}" "$@"
  }
  alias tfapply="tf apply"
  alias tfplan="tf plan"
  alias tfdestroy="tf destroy"
  alias tfrefresh="tf refresh"
} 

# If hub is installed, alias it
command -v hub > /dev/null 2>&1 && {
  alias git=hub
}

# If gpg-agent is installed, setup some pre-reqs
command -v gpg-connect-agent > /dev/null 2>&1 && {
  export GPG_TTY=$(tty)
  gpg-connect-agent updatestartuptty /bye > /dev/null
  unset SSH_AGENT_PID
  export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
  gpgconf --launch gpg-agent
  if [ ${machine}=="Linux" ]; then export XDG_RUNTIME_DIR=/run/user/`id -u`; fi
}

if [ -f $HOME/.cache/wal/sequences ]; then
  (cat $HOME/.cache/wal/sequences &)
fi

if [ ${machine}=="Linux" ]; then
  alias r2w="sudo ~/.bin/reboottowindows.sh"
  bindkey ';5D' backward-word
  bindkey ';5c' forward-word
  unset zle_bracketed_paste
fi
