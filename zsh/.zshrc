export GPG_TTY=$(tty)
export STARSHIP_CONFIG=~/.config/starship/starship.toml
export FZF_DEFAULT_COMMAND='fd --type file --hidden --no-ignore'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

autoload -U compinit
compinit

source ~/.fzf.zsh
source ~/.fzf-tab/fzf-tab.plugin.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

# Aliases
alias ls='lsd'
alias l='lsd --almost-all --long'
alias lt='lsd --tree --depth=2'
