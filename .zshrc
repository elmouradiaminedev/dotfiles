export ZSH=$HOME/.oh-my-zsh
export EDITOR='nvim'
export ZOXIDE_CMD_OVERRIDE=cd
export FZF_BASE=$(brew --prefix)/opt/fzf/install
export FZF_DEFAULT_COMMAND='fd --type file --hidden --no-ignore'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

autoload -U compinit
compinit

plugins=(git zoxide tmux fzf fzf-tab)

source $ZSH/oh-my-zsh.sh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
eval "$(starship init zsh)"

alias v='nvim'
alias vim='nvim'
alias cat='bat'
alias ls='lsd'

[ ! -n "$TMUX" ] && neofetch --kitty $HOME/Downloads/catppuccin.png --size 650 --disable gpu uptime kernel shell wm
