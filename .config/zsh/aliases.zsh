# general aliases
alias c=clear
alias s=sudo
alias df='df -h'
alias ds='du -h -d 1'
alias q=exit
alias sv='sudoedit'
alias sys='sudo systemctl'
alias v=nvim
alias yt="youtube-dl -x -o '~/music/concerts/%(title)s.%(ext)s'"
alias ls='ls --color'
alias l="ls -lFh"
alias la="ls -lAFh"
alias t=tmux
alias -g md='mkdir -p'
alias -g rd='rm -r'

# configs
alias dot='git --git-dir=$HOME/.local/dotfiles/ --work-tree=$HOME'
alias cfi='nvim ~/.config/i3/config'
alias cfv='nvim ~/.config/nvim/init.vim'
alias cfz='nvim ~/.zshrc'
alias cfa='nvim ~/.config/zsh/aliases.zsh'
alias cft='nvim ~/.tmux.conf'

# pipes
alias -g H='| head'
alias -g T='| tail'
alias -g G='| rg'
alias -g L='| less'

# packages
alias p='sudo pacman'
alias pi="p -S"
alias prm="p -Rns"
alias pmir='reflector -c IN --sort rate | sudo tee /etc/pacman.d/mirrorlist; \
			reflector -l 20 --sort rate | sudo tee -a /etc/pacman.d/mirrorlist'
alias pu="p -Syu; paru -Sua; nvim --headless +PlugUpdate +CocUpdate +qa"

# git
alias g=git
alias gps="g push"
alias gpl="g pull"
alias ga="g add"
alias gcm="g commit -m"
alias gcma="g commit -a -m"
alias gd="g diff"
alias gcl="g clone"
alias gst="g status"
alias gco="g checkout"

# wifi
wifi() {
	if [[ -n $1 ]] then
		iwctl station wlan0 connect $1
	else
		iwctl station wlan0 scan
		iwctl station wlan0 get-networks
	fi
}
