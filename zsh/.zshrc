export GPG_TTY=$(tty)
export STARSHIP_CONFIG=~/.config/starship/starship.toml
export FZF_DEFAULT_COMMAND='fd --type file --hidden --no-ignore'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(zoxide init zsh)"

eval "$(starship init zsh)"

alias ls='lsd'
alias l='lsd --almost-all --long'
alias lt='lsd --tree --depth=2'
