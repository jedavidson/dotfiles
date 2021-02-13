# Load environment variables and aliases
source $HOME/dev/dotfiles/zsh/.zsh_variables
source $DOTFILES/zsh/.zsh_aliases

# Set emacs keybindings
set -o emacs

# powerlevel10k configuration
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
ZSH_THEME="powerlevel10k/powerlevel10k"
ZLE_RPROMPT_INDENT=0

# Node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Active plugins
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    nvm
)

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

