# Load environment variables and aliases
source $HOME/dotfiles/zsh/.zsh_variables
source $DOTFILES/zsh/.zsh_aliases
source $DOTFILES/zsh/.zsh_prompt

# Set emacs keybindings
set -o emacs

# Plugins
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

