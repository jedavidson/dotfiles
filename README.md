First, do

```sh
sudo apt install stow            # GNU Stow, for managing dotfiles 
sudo apt install fzf             # Fuzzy file finding
sudo apt install earlyoom        # Eager OOM killer

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install --locked eza       # `ls` replacement
cargo install --locked zoxide    # `cd` replacement
cargo install --locked ripgrep   # `grep` replacement
cargo install --locked bat       # `cat` replacement
cargo install --locked fd-find   # `find` replacement
cargo install --locked git-delta # `git` differ
```

These dotfiles are managed and initially deployed using [GNU Stow](https://www.gnu.org/software/stow/).
After cloning this repository into `$HOME/dotfiles`, run

```sh
stow .
```
