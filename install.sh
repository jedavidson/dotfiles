#!/usr/bin/bash

run_cmd () {
    sh $1 > /dev/null 2>&1
    if [[ $1 != 0 ]]; then
        echo "[!] Uh oh! Something went wrong."
        exit
    fi
}

# Install Alacritty
echo "Installing Alacritty..."
run_cmd "sudo add-apt-repository ppa:mmstick76/alacritty && sudo apt-get update"
run_cmd "sudo apt install alacritty"

# Install VSCode
# https://github.com/Microsoft/vscode/issues/15529
echo "Installing VSCode..."
cd /tmp
run_cmd "curl -o vscode.deb -L http://go.microsoft.com/fwlink/?LinkID=760868"
run_cmd "sudo apt install ./vscode.deb"
run_cmd "rm vscode.deb"
cd -

# Install neovim
echo "Installing Neovim..."
run_cmd "sudo apt install neovim"

# Install Rust and some nice command line utilities
# This may take a while
echo "Installing Rust and assorted shell utils..."
run_cmd "curl https://sh.rustup.rs -sSf | sh"
run_cmd "cargo install exa"
run_cmd "cargo install fd-find"
run_cmd "cargo install sd"
run_cmd "cargo install --locked bat"

# Install i3
echo "Installing i3..."
run_cmd "sudo apt install i3 rofi"

# Finally, link all dotfiles
# TODO
