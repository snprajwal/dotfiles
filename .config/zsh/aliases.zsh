# General aliases
alias -g md='mkdir -p'
alias -g rd='rm -r'
alias df='df -h'
alias ds='du -h -d 1 | sort -hr'
alias g=git
alias ls='ls --color'
alias l="ls -lFh"
alias la="ls -lAFh"
alias nd='nix develop -c zsh'
alias pake="make -j $(nproc)"
alias q=exit
alias rs='sudo -E -s /bin/zsh'
alias s=sudo
alias sv='sudoedit'
alias sys='sudo systemctl'
alias t=tmux
alias v=nvim
alias yt="youtube-dl -x -o '~/music/concerts/%(title)s.%(ext)s'"

# Configs
alias cfa='nvim ~/.config/zsh/aliases.zsh'
alias cfi='nvim ~/.config/i3/config'
alias cfg='nvim ~/.gitconfig'
alias cft='nvim ~/.tmux.conf'
alias cfv='nvim ~/.config/nvim/init.vim'
alias cfz='nvim ~/.zshrc'
alias dot='git --git-dir=$HOME/.local/dotfiles/ --work-tree=$HOME'

# Pipes
alias -g G='| rg'
alias -g H='| head'
alias -g L='| less -R'
alias -g T='| tail'

# Packages
alias p='sudo pacman'
alias pd='sudo -E pacdiff'
alias pi="p -S"
alias pmir='reflector -c IN --sort rate | sudo tee /etc/pacman.d/mirrorlist; \
			reflector -l 20 --sort rate | sudo tee -a /etc/pacman.d/mirrorlist'
alias prm="p -Rns"
pu() {
	echo "Upgrading Arch packages..."
	sudo pacman -Syu
	echo "Upgrading AUR packages..."
	paru -Sua
	echo "Upgrading Rust toolchain..."
	rustup update
	echo "Upgrading Neovim components..."
	nvim +PlugUpgrade +PlugUpdate +CocUpdateSync +qa
}

alias br='sudo systemctl restart bluetooth'

compress() {
	convert "$1" -strip -quality 85% -interlace plane -gaussian-blur 0.05 -adaptive-resize 60% compressed/"$1"
}
