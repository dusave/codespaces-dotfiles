################################################
# THEME
################################################
ZSH_THEME="powerlevel10k/powerlevel10k"
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


################################################
# ZSH CONFIG
################################################
ZSH_DISABLE_COMPFIX=true
MAILCHECK=0


################################################
# PLUGINS
################################################
plugins=(git zsh-autosuggestions zsh-nvm)
bindkey '^ ' autosuggest-accept


################################################
# ENV VARIABLES
################################################
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
export SSH_KEY_PATH="~/.ssh/dsa_id"
export ZSH=~/.oh-my-zsh

source $ZSH/oh-my-zsh.sh


################################################
# ALIASES
################################################
alias sz='source ~/.zshrc'
alias ez='code ~/.zshrc'
alias fuck='rm -rf node_modules && npm ci'
alias fucky='rm -rf yarn.lock node_modules && yarn install --frozen-lockfile'
alias ll='ls -la'

# Git Aliases
alias gb='git branch'
alias gc='git commit'
alias gl='git pull'
alias gp='git push'
alias gcb='git checkout -b'
alias gla='git lg --all'
alias glo='git lg'
alias grhh='git reset --hard HEAD'
alias grbd='git stash && git checkout develop && git pull origin develop && git checkout - && git rebase develop && git stash pop'
alias grbm='git stash && git checkout main && git pull origin main && git checkout - && git rebase main && git stash pop'
alias gs='git status'
alias gst='git stash'
alias gcl='git clone'
alias grc='git add -A && git rebase --continue'

# git recreate current branch
alias grccb='current_branch="$(git rev-parse --abbrev-ref HEAD)" && git stash && git checkout main && git branch -D "$current_branch" && git checkout -b "$current_branch"'


################################################
# CLI CONFIGURATION
################################################
# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

prompt_context() {}
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

nvm install node

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
