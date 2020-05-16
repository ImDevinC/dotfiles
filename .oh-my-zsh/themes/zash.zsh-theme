# ZSH Theme - Zash (zsh bash like)
# ---------------------------------

PROMPT='%{$fg[red]%}%n%{$reset_color%}@%m:%{$fg[green]%}%~%{$reset_color%}$(git_prompt_info) %(!.#.$) '

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[blue]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
