#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# update homebrew, homebrew cask, apm, npm, gem
alias update="sh ~/.dotfiles/update.sh"

# curl
alias curlj='curl -H "Accept: application/json" -H "Content-type: application/json"'
