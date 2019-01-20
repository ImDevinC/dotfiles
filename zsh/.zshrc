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
plugins=(git adb archlinux cp)

# User configuration

  export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/opt/android-sdk/build-tools/18.0.1/:/opt/android-sdk/platform-tools:/opt/android-sdk/tools:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:$HOME/Android/Sdk/platform-tools:/home/devin/.gem/ruby/2.5.0/bin:$HOME/.go/bin:$HOME/.local/bin"

source $ZSH/oh-my-zsh.sh

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias r2w="sudo ~/.bin/reboottowindows.sh"

# Base16 Shell
#BASE16_SHELL="$HOME/.themes/oceanic-next.dark.sh"
#[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# If .nvm exists, source it
if [ -d "$HOME/.nvm" ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
  unset zle_bracketed_paste
fi

# If .go exists, source it
if [ -d "$HOME/.go" ]; then
  export GOPATH="$HOME/.go"
fi

# If docker exists, setup some base aliases
command -v docker > /dev/null 2>&1 && {
  alias terraform="docker run --rm -t -v $(pwd):/app -w /app -v ~/.aws:/root/.aws hashicorp/terraform:0.11.10"
  alias redis-cli="docker run --rm -t -it redis:latest redis-cli"
}

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
  export XDG_RUNTIME_DIR=/run/user/`id -u`
}

(cat ~/.cache/wal/sequences &)

bindkey ';5D' backward-word
bindkey ';5c' forward-word
