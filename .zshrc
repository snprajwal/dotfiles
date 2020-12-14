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

# Search history with arrow keys
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

# Keybindings
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end
bindkey -M menuselect '^[[Z' reverse-menu-complete
bindkey "^[[3~" delete-char
bindkey -s '^O' 'lfcd\n'

# History
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.config/zsh/history.zsh

# Variables
export PATH=$PATH:$HOME/.local/bin
export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim
export ZSH=$HOME/.config/zsh
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --color=dark --color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f --color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7'
export FZF_DEFAULT_COMMAND='rg --hidden --files -g \!.npm -g \!.cache -g \!.mozilla'

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