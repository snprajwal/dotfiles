# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Zsh-specific configuration
setopt promptsubst histsavenodups histignorealldups autocd
autoload -Uz colors compinit
autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
colors
eval "$(dircolors)"
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zmodload zsh/complist
compinit
_comp_options+=(globdots)
bindkey -e
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Keybindings
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search
bindkey -M menuselect '^[[Z' reverse-menu-complete
bindkey "^[[3~" delete-char
bindkey "^[[H" beginning-of-line
bindkey "^[[4~" end-of-line
bindkey -s '^O' 'lfcd\n'

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.config/zsh/history.zsh

# Plugins, themes and lfcd
source $ZSH/aliases.zsh
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
source $HOME/.config/lf/lfcd.sh
source /home/snprajwal/.opam/opam-init/init.zsh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
