#!/usr/bin/bash

# TODO: install other tools

# Install Rust and some nice command line utilities
echo "Installing Rust and assorted shell utils..."
curl https://sh.rustup.rs -sSf | sh
cargo install exa
cargo install fd-find
cargo install sd
cargo install --locked bat

# Link dotfiles
ln -svf $HOME/dotfiles/zsh/zshrc $HOME/.zshrc
ln -svf $HOME/dotfiles/ghc/ghci $HOME/.ghci
ln -svf $HOME/dotfiles/git/gitconfig $HOME/.gitconfig
ln -svf $HOME/dotfiles/rofi/config $HOME/.config/rofi/config
ln -svf $HOME/dotfiles/alacritty/alacritty.yml $HOME/.config/alacritty/alacritty.yml
ln -svf $HOME/dotfiles/i3/i3config $HOME/.config/i3/config
ln -svf $HOME/dotfiles/vscode/settings.json $HOME/.config/Code/User/settings.json
ln -svf $HOME/dotfiles/vscode/snippets $HOME/.config/Code/User/snippets
ln -svf $HOME/dotfiles/vscode/keybindings.json $HOME/.config/Code/User/keybindings.json
ln -svf $HOME/dotfiles/zsh/starship.toml $HOME/.config/starship.toml
ln -svf $HOME/dotfiles/nvim/init.vim $HOME/.config/nvim/init.vim
ln -svf $HOME/dotfiles/tmux/tmux.conf $HOME/.tmux.conf
ln -svf $HOME/dotfiles/zsh/p10k.zsh $HOME/.p10k.zsh
