# Load environment variables, aliases, functions and prompt
source $HOME/dev/dotfiles/zsh/.zsh_variables
source $HOME/dev/dotfiles/zsh/.zsh_aliases
source $HOME/dev/dotfiles/zsh/.zsh_functions
source $HOME/dev/dotfiles/zsh/.zsh_prompt
source $HOME/dev/dotfiles/zsh/.zsh_plugins

# Set emacs keybindings
set -o emacs

# Node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Active oh-my-zsh plugins
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    nvm
)

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

