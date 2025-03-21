# =====================
# ZSH CONFIG
# =====================

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git git-auto-fetch zsh-autosuggestions zsh-syntax-highlighting alias-tips z docker npm node fzf)
source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# =====================
# ALIASES
# =====================

alias vim="nvim"
alias python="python3"
alias pip="pip3"
alias zshrc="code ~/.zshrc"
alias c="clear"
alias zs="source ~/.zshrc"
alias gclean='git fetch origin --prune && git branch -r | awk "{print \$1}" | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk "{print \$1}" | xargs git branch -D'
alias gcleanu='git fetch upstream --prune && git branch -r | awk "{print \$1}" | egrep -v -f /dev/fd/0 <(git branch -vv | grep upstream) | awk "{print \$1}" | xargs git branch -D'
alias dclean='docker rmi $(docker images --filter "dangling=true" -q --no-trunc)'
alias brewup="brew update; brew upgrade; brew cleanup; brew doctor"
alias copyssh="pbcopy < ~/.ssh/id_ed25519.pub"
alias .='pwd'
alias ..='cd ..'
alias ,,='cd ..'
alias 2..='cd ../..'
alias 3..='cd ../../..'
alias 4..='cd ../../../..'
alias 5..='cd ../../../../..'
alias q='exit'
alias :q='exit'
alias mv="mv -iv"
alias cp="cp -iv"
alias lsd="ls -ltr" # List files/folders by the most recently changed.
alias ni="npm install"
alias npmi='npm i'
alias npmif='npm i --force'
alias p="pnpm"
alias orglist="sfdx force:org:list"

projects() {
  cd "$HOME/projects/$1"
}

# =====================
# OTHER SETUP
# =====================

# fnm
export PATH="/Users/nicolaskeil/Library/Application Support/fnm:$PATH"
eval "`fnm env`"

# Angular CLI autocompletion
source <(ng completion script)

# bun
[ -s "/Users/nicolaskeil/.bun/_bun" ] && source "/Users/nicolaskeil/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/nicolaskeil/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
