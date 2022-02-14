# general aliases
alias -g md='mkdir -p'
alias -g rd='rm -r'
alias c=clear
alias df='df -h'
alias ds='du -h -d 1'
alias g=git
alias l="ls -lFh"
alias la="ls -lAFh"
alias ls='ls --color'
alias q=exit
alias s=sudo
alias sv='sudoedit'
alias sys='sudo systemctl'
alias t=tmux
alias v=nvim
alias yt="youtube-dl -x -o '~/music/concerts/%(title)s.%(ext)s'"

# configs
alias cfa='nvim ~/.config/zsh/aliases.zsh'
alias cfi='nvim ~/.config/i3/config'
alias cft='nvim ~/.tmux.conf'
alias cfv='nvim ~/.config/nvim/init.vim'
alias cfz='nvim ~/.zshrc'
alias dot='git --git-dir=$HOME/.local/dotfiles/ --work-tree=$HOME'
alias per='git --git-dir=$HOME/.local/personal/ --work-tree=$HOME'

# pipes
alias -g G='| rg'
alias -g H='| head'
alias -g L='| less -R'
alias -g T='| tail'

# packages
alias p='sudo pacman'
alias pi="p -S"
alias pmir='reflector -c IN --sort rate | sudo tee /etc/pacman.d/mirrorlist; \
			reflector -l 20 --sort rate | sudo tee -a /etc/pacman.d/mirrorlist'
alias prm="p -Rns"
alias pu="p -Syu; paru -Sua; nvim --headless +PlugUpdate +CocUpdate +qa"


# wifi
wifi() {
	local HOME='Oromis'
	local HOTSPOT='Oromis - 4'
	case "$1" in
		"")
			iwctl station wlan0 scan
			iwctl station wlan0 get-networks
			;;
		reset)
			sudo systemctl restart iwd.service
			;;
		home)
			iwctl station wlan0 connect $HOME
			;;
		hs)
			iwctl station wlan0 connect $HOTSPOT
			;;
		*)
			iwctl station wlan0 connect $1
			;;
	esac
}
