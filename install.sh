#!/bin/zsh

run_cmd () {
    sh $1 > /dev/null 2>&1
    if [[ $1 != 0 ]]; then
        echo "[!] Something went wrong while running the command\n  $1"
        exit
    fi
}

# Prompt user to manually install applications
echo "Before proceeding, please manually install the following apps:"
echo "  -> Visual Studio Code"
echo "  -> iTerm"
echo "  -> Karabiner Elements"
read -sk $'?Press any key to continue setup once you\'re done.\n\n'

# Install Homebrew
echo "Installing Homebrew..."
run_cmd "sh -c $(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install oh-my-zsh
echo "Installing oh-my-zsh..."
run_cmd "sh -c $(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install zsh plugins
#echo "Installing zsh plugins..."
#echo "  -> zsh-autosuggestions"
#run_cmd "git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
#echo "  -> zsh-syntax-highlighting"
#run_cmd "git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"

# Install Rust and some nice command line utilities; this may take a while
#echo "Installing Rust and assorted shell utils..."
#echo "  -> Rust"
#run_cmd "curl https://sh.rustup.rs -sSf | sh"
#echo "  -> exa"
#run_cmd "cargo install exa"
#echo "  -> fd"
#run_cmd "cargo install fd-find"
#echo "  -> sd"
#run_cmd "cargo install sd"
#echo "  -> bat"
#run_cmd "cargo install --locked bat"

# Install VSCode extensions
#echo "Installing VSCode extensions..."
#echo "  -> Remote - SSH"
#run_cmd "code --install-extension ms-vscode-remote.remote-ssh"
#echo "  -> C/C++"
#run_cmd "code --install-extension ms-vscode.cpptools"
#echo "  -> Python"
#run_cmd "code --install-extension ms-python.python"
#echo "  -> Pyright"
#run_cmd "code --install-extension ms-pyright.pyright"
#echo "  -> Visual Studio IntelliCode"
#run_cmd "code --install-extension visualstdioexptteam.vscodeintellicode"
#echo "  -> GitLens"
#run_cmd "code --install-extension eamodio.gitlens"
#echo "  -> Material Icon Theme"
#run_cmd "code --install-extension pkief.material-icon-theme"
#echo "  -> Gruvbox Material Theme"
#run_cmd "code --install-extension sainnhe.gruvbox-material"
#echo "  -> One Dark Pro Theme"
#run_cmd "code --install-extension zhuangtongfa.material-theme"
#echo "  -> Monokai Pro Theme"
#run_cmd "code --install-extension monokai.theme-monokai-pro-vscode"

# Configure applications by linking dotfiles
echo "Configuring applications..."
