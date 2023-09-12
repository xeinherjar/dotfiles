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
autoload -U compinit && compinit

# Prompt w/ git info
autoload -Uz vcs_info
+vi-git-untracked(){
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | grep '??' &> /dev/null ; then
        hook_com[staged]+='?'
    fi
}


precmd_functions+=( vcs_info )
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
zstyle ':vcs_info:*' unstagedstr '!'
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:git:*' formats '%b [%u%c%m]'

setopt prompt_subst
NEWLINE=$'\n'
PROMPT='%n@%m %D %T %~ ${vcs_info_msg_0_}${NEWLINE}λ '


# XDG
export XDG_CONFIG_HOME=$HOME/.config

# Add rustup and rust support
export PATH="$PATH:$HOME/.cargo/bin"

# Enable FNM (fast node manager)
if [ -x "$(command -v fnm)" ]; then
    eval "$(fnm env)"
fi

<<<<<<< HEAD
[ -f "/home/einherjar/.ghcup/env" ] && source "/home/einherjar/.ghcup/env" # ghcup-env
=======
# Work Laptop?
[ -e ~/work/work.rc ] && source ~/work/work.rc

# kubectl completes me
if [ -x "$(command -v kubectl)" ]; then
    source <(kubectl completion zsh)
fi


export EDITOR='nvim'
>>>>>>> ed802fbb1c1c1facce3a7a60542af0aefcbb86b6
