# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Zsh-specific configuration
setopt prompt_subst
setopt auto_cd
setopt hist_ignore_dups
autoload -Uz colors compinit
colors
eval "$(dircolors)"
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zmodload zsh/complist
compinit
_comp_options+=(globdots)
bindkey -e

# Keybindings
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
bindkey -M menuselect '^[[Z' reverse-menu-complete
bindkey "^[[3~" delete-char
bindkey "^[[H" beginning-of-line
bindkey "^[[4~" end-of-line
bindkey -s '^O' 'lfcd\n'

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.config/zsh/history.zsh

# Variables
export TMOUT=120
export TRAPALRM() { cmatrix -sbu 10 }
export GPG_TTY=$TTY
export PATH=$PATH:$HOME/.local/bin:$(go env GOPATH)/bin
export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim
export ZSH=$HOME/.config/zsh
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --color fg:#ebdbb2,bg:#282828,hl:#fabd2f,fg+:#ebdbb2,bg+:#3c3836,hl+:#fabd2f --color info:#83a598,prompt:#bdae93,spinner:#fabd2f,pointer:#83a598,marker:#fe8019,header:#665c54'
export FZF_DEFAULT_COMMAND='rg --hidden --files -g !.cache -g !.mozilla -g !node_modules'

# Plugins, themes and lfcd
source $ZSH/aliases.zsh
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
source $HOME/.config/lf/lfcd.sh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
