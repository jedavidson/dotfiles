My personal Unix dotfiles, managed and deployed using [GNU Stow](https://www.gnu.org/software/stow/).

I use [zsh](https://www.zsh.org/) as my shell, [Ghostty](https://ghostty.org/) for my terminal, and both [Visual Studio Code](https://code.visualstudio.com/) and [Neovim](https://neovim.io/) as my text editors (though config for the latter is managed in [another repo](https://github.com/jedavidson/kickstart.nvim)).

# Automatic setup items

> This config assumes Ubuntu as an operating system, so if you're trying to follow along, then you'll need to adapt these instructions if you're on something else.

```sh
# 0. Install `git`
$ sudo apt install git

# 1. Clone this repo
$ git clone git@github.com:jedavidson/dotfiles.git $HOME/dotfiles
$ cd $HOME/dotfiles

# 2. Install as many tools and extensions as possible
$ chmod +x ./preinstall.sh && ./preinstall.sh

# 3. Change default shell to `zsh`
$ chsh -s `which zsh`

# 4. Actually install the dotfiles by symlinking config
$ stow .
```

# Manual setup items

## Properly installing Neovim

Because Ubuntu ships with a pretty old version of Neovim (too old to work with kickstart.nvim), I opt to just download the AppImage from the official project's [Releases](https://github.com/neovim/neovim/releases/) section.
Once this is done, I just put it in `$HOME/.local/bin` so that we can use it:

```sh
$ mkdir -p $HOME/.local/bin
$ mv $HOME/Downloads/nvim-linux-x86_64.appimage $HOME/.local/bin
$ chmod +x $HOME/.local/bin/nvim-linux-x86_64.appimage
```

Managing the version becomes a more manual chore (which I honestly do quite rarely).

## GNOME Setup

Most of this can be automated:

```sh
$ dconf load /org/gnome/ < dconf_org_gnome.ini
```

### Extensions

- Blur my shell
- Resource monitor
- Simple workspaces bar

### Keybinds

- `Ctrl` + `Space` opens up Ulauncher, my app launcher of choice
	- This one requires [some special setup of its own, because of Wayland](https://github.com/Ulauncher/Ulauncher/wiki/Hotkey-In-Wayland)
- `Super` + `T` opens a new terminal (via Ghostty)
	- Some config may be required to make Ghostty the default terminal.

### Misc

- I have reduced animations on (so that window snapping is faster).
