# This alias is for managing dotfiles with a bare git repository
alias config='/usr/bin/git --git-dir=$HOME/src/dotfiles --work-tree=$HOME'

# In some linux distros installing neovim doesnt alias vi and vim to nvim
# To use vim use \vim
alias vim='nvim'
alias vi='nvim'

alias cd..='cd ../' # Go back 1 directory level
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .3='cd ../../../'    # Go back 3 directory levels
alias .4='cd ../../../../' # Go back 4 directory levels
alias .5='cd ../../../../../'   # Go back 5 directory levels
alias .6='cd ../../../../../../'  # Go back 6 directory levels

alias gs='git status '
alias ga='git add '
alias gaa='git add -A'
alias gb='git branch '
alias gbv='git branch -vv'
alias gc='git commit'
alias gcm='git commit -m'
alias gcmS='git commit -S -m'
alias gd='git diff'
alias gco='git checkout '
alias gl='git log --all --graph --decorate --oneline'
alias gll="git log --graph --pretty='%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --all"
alias p='git pull'
alias gp='git push'
alias gm='git merge'
alias gr='git remote'

alias d='docker'
alias kc='kubectl'

alias e="exit"
alias c="clear"
