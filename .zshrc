#####################
# [[ Environment ]] #
#####################

export PATH="$PATH:$HOME/.local/bin"

# Make sure terminal colours work fine
export TERM="xterm-256color"

# Set up `vivspack`
export VIVSPACK_ROOT="$HOME/repos/vivcourt/vivspack"
source ${VIVSPACK_ROOT}/enable

# Make it so that `./diff` and `./push` automatically do Olaf validation
export VIV_INVENTORY_INCLUDE_OLAF_DEPENDS=1

# Set up `ccache`
export CMAKE_CXX_COMPILER_LAUNCHER=ccache

# # Set up zinit with plugins and snippets
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found

# Syntax highlighting config
# - Don't underline paths
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# Load Rust
. "$HOME/.cargo/env"

# Set up prompt with some basic version control info
# TODO: Make this coloured
autoload -Uz vcs_info
precmd() { vcs_info }
setopt prompt_subst
zstyle ':vcs_info:git:*' formats ' %s:%b'
zstyle ':vcs_info:git:*' actionformats ' %s:%b|%a'
zstyle ':vcs_info:*' enable git
export PROMPT=$'[%*] %n@%m %~${vcs_info_msg_0_}\n%# '

# Load zoxide
eval "`zoxide init --cmd cd zsh`"

##################
# [[ Keybinds ]] #
##################

# Use emacs/readline bindings
bindkey -e

# Ctrl+p/n to go back and forward through command history
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# Use Ctrl+left/right to go back and forward words in the prompt
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

###############
# [[ Setup ]] #
###############

# Completions
autoload -Uz compinit && compinit
zinit cdreplay -q
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Enable zmv
autoload zmv

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

#####################################
# [[ Aliases and custom commands ]] #
#####################################

# Use `bat` to format `man` pages
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export BAT_THEME="ansi"

# Use `eza` instead of `ls`
DISABLE_LS_COLORS="true"
alias ls="eza"

# Use `nvim` instead of `vim`, and as default editor
TRUE_NVIM="nvim-v0.11.2-linux-x86_64.appimage"
alias nvim="$TRUE_NVIM"
alias vim="$TRUE_NVIM"
alias vi="$TRUE_NVIM"
export EDITOR="$TRUE_NVIM"

# `cd` up n directories, instead of having to type cd ../../ forever
up () {
   n=$1
   for i in `seq $n`; do
      cd ..
   done
}

# Commit and push
cap () {
   msg=$1
   git commit -m $msg
   git push
}

# Copy file contents to clipboard
yoink () {
   file=$1
   xclip -sel c < $file
}
