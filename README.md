My personal Unix dotfiles, managed and deployed using [GNU Stow](https://www.gnu.org/software/stow/).

I use [zsh](https://www.zsh.org/) as my shell, [ghostty](https://ghostty.org/) for my terminal, and both [Visual Studio Code](https://code.visualstudio.com/) and [Neovim](https://neovim.io/) as my text editors (though config for the latter is managed in [another repo](https://github.com/jedavidson/kickstart.nvim)).

```sh
# 1. Clone
$ git clone git@github.com:jedavidson/dotfiles.git $HOME/dotfiles
$ cd $HOME/dotfiles

# 2. Install tools and extensions, then symlink config
$ ./preinstall.sh
$ stow .
```
