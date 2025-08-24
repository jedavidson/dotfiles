#!/bin/sh

# Install Stow for managing these dotfiles
sudo apt install stow

# Install fzf for fuzzy file finding
sudo apt install fzf

# Install Rust, as well as some CLI tool replacements
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install --locked eza        # `ls` replacement
cargo install --locked zoxide     # `cd` replacement
cargo install --locked ripgrep    # `grep` replacement
cargo install --locked bat        # `cat` replacement
cargo install --locked fd-find    # `find` replacement
cargo install --locked git-delta  # `git` differ

# Pre-install VSCode extensions from the CLI
code --install-extension atomiks.moonlight
code --install-extension sainnhe.gruvbox-material
code --install-extension miguelsolorio.symbols
code --install-extension miguelsolorio.fluent-icons
code --install-extension usernamehw.errorlens
code --install-extension gruntfuggly.todo-tree
code --install-extension eamodio.gitlens

# Set up separately-managed kickstart.nvim config
git clone git@github.com:jedavidson/kickstart.nvim.git "$HOME/.config/nvim"

# Other nice-to-haves
sudo apt install earlyoom  # Eager OOM killer
sudo snap install btop     # A nicer-looking `htop`
