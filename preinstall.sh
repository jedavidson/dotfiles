#!/bin/sh

# Install `zsh`, which we are going to use as a shell
sudo apt install zsh

# Install Stow for managing these dotfiles
sudo apt install stow

# Install powerlevel10k, which is used for `zsh`'s prompt
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$HOME/powerlevel10k"

# Install fzf for fuzzy file finding
sudo apt install fzf

# Install Rust, as well as some CLI tool replacements
# We will need `build-essential` to be able to do that
sudo apt install build-essential
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

# Install GCC and Clang tooling
CLANG_VERSION=18
GCC_VERSION=13
wget -qO- https://apt.llvm.org/llvm.sh | sudo bash -s -- "$CLANG_VERSION"
sudo apt update
sudo apt install \
	"libstdc++-${GCC_VERSION}-dev" \
	"clang-${CLANG_VERSION}" \
	"clang-tools-${CLANG_VERSION}" \
	"clang-format-${CLANG_VERSION}" \
	"clang-tidy-${CLANG_VERSION}"

# Set up separately-managed kickstart.nvim config, as well as the `tree-sitter` CLI
# which it depends on
git clone git@github.com:jedavidson/kickstart.nvim.git "$HOME/.config/nvim"
cargo install --locked tree-sitter-cli

# Install Ulauncher, an app launcher
sudo add-apt-repository universe -y
sudo add-apt-repository ppa:agornostal/ulauncher -y
sudo apt update
sudo apt install ulauncher

# Other nice-to-haves
sudo apt install earlyoom  # Eager OOM killer
sudo snap install btop     # A nicer-looking `htop`
