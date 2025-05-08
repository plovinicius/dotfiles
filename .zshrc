# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH:$GOBIN:"${HOME}/.composer/vendor/squizlabs/php_codesniffer/bin:${HOME}.local/bin"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"


# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

# Add in Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in zsh plugins
# zinit light ohmyzsh/ohmyzsh
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-syntax-highlighting
# zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::rust
zinit snippet OMZP::docker
zinit snippet OMZP::command-not-found

# Load comopletions
autoload -Uz compinit && compinit

zinit cdreplay -q

export LD_LIBRARY_PATH=/usr/local/lib

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#######################################################
# ZSH Basic Options
#######################################################
setopt autocd              # change directory just by typing its name
# setopt correct             # auto correct mistakes
setopt interactivecomments # allow comments in interactive mode
setopt magicequalsubst     # enable filename expansion for arguments of the form ‘anything=expression’
setopt nonomatch           # hide error message if there is no match for the pattern
setopt notify              # report the status of background jobs immediately
setopt numericglobsort     # sort filenames numerically when it makes sense
setopt promptsubst         # enable command substitution in prompt

#######################################################
# Environment Variables
#######################################################
export EDITOR=nvim visudo
export VISUAL=nvim visudo
export SUDO_EDITOR=nvim
export FCEDIT=nvim
export TERMINAL=kitty

# if [[ -x "$(command -v bat)" ]]; then
# 	export MANPAGER="sh -c 'col -bx | bat -l man -p'"
# 	export PAGER=bat
# fi

# if [[ -x "$(command -v fzf)" ]]; then
# 	export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
# 	  --info=inline \
# 	  --ansi \
# 	  --layout=reverse \
# 	  --border=rounded \
# 	  --color=border:#27a1b9 \
# 	  --color=fg:#c0caf5 \
# 	  --color=gutter:#16161e \
# 	  --color=header:#ff9e64 \
# 	  --color=hl+:#2ac3de \
# 	  --color=hl:#2ac3de \
# 	  --color=info:#545c7e \
# 	  --color=marker:#ff007c \
# 	  --color=pointer:#ff007c \
# 	  --color=prompt:#2ac3de \
# 	  --color=query:#c0caf5:regular \
# 	  --color=scrollbar:#27a1b9 \
# 	  --color=separator:#ff9e64 \
# 	  --color=spinner:#ff007c \
# 	"
# fi

#######################################################
# History Configuration
#######################################################
HISTSIZE=10000
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

#######################################################
# History Configuration
#######################################################
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

source $ZSH/oh-my-zsh.sh

source ~/.nvm/nvm.sh
source ~/.zsh_profile

#######################################################
# Exports
#######################################################
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

#######################################################
# Alias
#######################################################

# Utils
alias cls="clear"

# Vim/NeoVim
alias svim='source ~/.config/nvim/init.lua'
alias vim='nvim'

# Terminal
alias skitty='source ~/.config/kitty/kitty.conf'

# Docker
alias dockerstop='docker stop $(docker ps -a -q)'
alias dockerup='docker compose up -d'

# Apache2
alias apachestop='sudo systemctl stop apache2'
alias apachestatus='sudo systemctl status apache2'

## QMK
alias qmkconfig="cd /home/plovinicius/qmk_firmware/keyboards/keebio/iris/keymaps/plovinicius"
alias qmkcomp="qmk compile -kb keebio/iris/rev2 -km plovinicius"
alias qmkflash="qmk flash -kb keebio/iris/rev2 -km plovinicius"

# Changing "ls" to "eza"
alias ls='eza -l --color=always --group-directories-first' # my preferred listing
alias la='eza -a --color=always --group-directories-first'  # all files and dirs
alias ll='eza -l --color=always --group-directories-first'  # long format
alias l.='eza -al --color=always --group-directories-first ../' # ls on the PARENT directory
alias l..='eza -al --color=always --group-directories-first ../../' # ls on directory 2 levels up
alias l...='eza -al --color=always --group-directories-first ../../../' # ls on directory 3 levels up
