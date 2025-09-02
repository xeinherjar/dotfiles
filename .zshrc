# Created by newuser for 5.9
source ~/.zprofile

# History
HISTSIZE=9001
HISTFILE=~/.zsh_history
SAVEHIST=9001
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt incappendhistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Autoloads
autoload -Uz compinit && compinit

# Prompt w/ git info
autoload -Uz vcs_info
+vi-git-untracked(){
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | grep '??' &> /dev/null ; then
        hook_com[staged]+='?'
    fi
}

# Styles
## Git Prompt
precmd_functions+=( vcs_info )
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
zstyle ':vcs_info:*' unstagedstr '!'
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:git:*' formats '[%b][%u%c%m]'

## General
zstyle ':completion:*' menu select

setopt prompt_subst
NEWLINE=$'\n'
PROMPT='%n@%m %D %T %~ ${vcs_info_msg_0_}${NEWLINE}λ '


# XDG
export XDG_CONFIG_HOME=$HOME/.config
# Paths
if [ -d "$HOME/bin" ] ; then
    export PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
    export PATH="$HOME/.local/bin:$PATH"
fi

# Add rustup and rust support
export PATH="$PATH:$HOME/.cargo/bin"

# Enable FNM (fast node manager)
if [ -x "$(command -v fnm)" ]; then
    eval "$(fnm env)"
fi

# Work Laptop?
[ -e ~/projects/work.rc ] && source ~/projects/work.rc

# kubectl completes me
if [ -x "$(command -v kubectl)" ]; then
    source <(kubectl completion zsh)
fi

# NGROCK completions
if command -v ngrok &>/dev/null; then
  eval "$(ngrok completion)"
fi

if command -v jj &>/dev/null; then
  source <(jj util completion zsh)
fi


export EDITOR='nvim'
# So this is silly, if zsh sees the string vi in EDITOR it defaults to vim bindings
# not sure if this only happens in tmux or not..., but lets unbind it
bindkey -e

if [ -d "$HOME/.emacs.d/bin" ] ; then
  export PATH="$HOME/.emacs.d/bin:$PATH"
fi

. "$HOME/.local/bin/env"
