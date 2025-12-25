[ -f "$ZDOTDIR/.zshenv" ] && source "$ZDOTDIR/.zshenv"

### HomeBrew 
eval "$(/opt/homebrew/bin/brew shellenv)"

## History behavior 
setopt HIST_IGNORE_DUPS       # Don't record duplicates
setopt HIST_IGNORE_ALL_DUPS   # Remove old entry if duplicated
setopt HIST_REDUCE_BLANKS     # Trim extra spaces
setopt SHARE_HISTORY          # Share history across tabs
setopt INC_APPEND_HISTORY     # Write to history immediately
setopt HIST_FIND_NO_DUPS      # Don't show dupes in history search

## Completion settings 
autoload -Uz compinit && compinit -d "$ZDOTDIR/.zcompdump"

setopt MENU_COMPLETE          # Tab-complete through matches
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[._-]=* r:|=*' # Case-insensitive, hyphen-insensitive, partial match
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Scaleway CLI autocomplete initialization.
eval "$(scw autocomplete script shell=zsh)"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

## Zsh Hooks
autoload -U add-zsh-hook

## Quality of life 
setopt AUTO_CD                # Type folder name to cd into it
setopt CORRECT                # Spell correction for commands
setopt EXTENDED_GLOB          # Advanced globbing (ls **/*.md)
setopt NO_BEEP                # Disable bell

#-----------------------#
#### --- Plugins --- ####
#-----------------------#

## Zinit plugin manager
source /opt/homebrew/opt/zinit/zinit.zsh

## Syntax highlighting
zinit light zsh-users/zsh-syntax-highlighting

## Autosuggestions
zinit light zsh-users/zsh-autosuggestions

## Fast tab completions
zinit light zsh-users/zsh-completions

## History substring search
HISTORY_SUBSTRING_SEARCH_PREFIXED=1
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=green,fg=black,bold'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='bg=red,fg=white,bold'
HISTORY_SUBSTRING_SEARCH_GLOBBING_FLAGS='i'  # case insensitive

zinit load zsh-users/zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down


## CD TAb completion 
zinit light Aloxaf/fzf-tab

#zplug "code-stats/code-stats-zsh", from:gitlab, use:"codestats.plugin.zsh"
zinit ice from"gitlab" pick"codestats.plugin.zsh"
zinit load code-stats/code-stats-zsh

## FZF
[ -f $HOME_CONFIG/.fzf.zsh ] && source $HOME_CONFIG/.fzf.zsh

## Zoxide
eval "$(zoxide init zsh)"


## NVM  
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


load-nvmrc() {
  local nvmrc_path
  nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version
    nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use --silent
    fi
  elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
    #echo "Reverting to nvm default version"
    nvm use default --silent
  fi
}

add-zsh-hook chpwd load-nvmrc
load-nvmrc


#----------------------#
#### --- Prompt --- ####
#----------------------#

## Oh My Posh
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  # eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/alex-r-v1.omp.json)"
  eval "$(oh-my-posh init zsh --config $HOME_CONFIG/oh-my-posh/themes/hungry-compact-v2.omp.json)"
fi

#-----------------------#
#### --- Aliases --- ####
#-----------------------#
alias ll="ls -lh"
alias la="ls -lha"
alias gs="git status"
# alias gc="git commit -m"
alias v="nvim"

#------------------------------#
#### ---- Startup Flex ---- ####
#------------------------------#
# neofetch
