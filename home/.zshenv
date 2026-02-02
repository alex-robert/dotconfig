#--------------------------------#
#### ---- Path path path ---- ####
#--------------------------------#

export PATH="$PATH:$HOME/.local/bin:/.cargo/bin:/Users/alex/.lmstudio/bin"

### HomeBrew
eval "$(/opt/homebrew/bin/brew shellenv)"

#-------------------#
#### --- ZSH --- ####
#-------------------#

## Environment 
export XDG_CONFIG_HOME="$HOME/.config"
export HOME_CONFIG="$HOME/.config"

export HISTFILE="$ZDOTDIR/.zsh_history"
export HISTSIZE=50000
export SAVEHIST=50000

export EDITOR="env NVIM_APPNAME=nvim-minimal nvim"

export CLAUDE_CONFIG_DIR="$HOME/.config/claude"

## My Little secret
[ -f ~/.zsecret ] && source ~/.zsecret
