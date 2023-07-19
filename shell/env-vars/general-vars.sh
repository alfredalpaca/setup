export SOURCEDIR=$HOME/src
export PATH=$HOME/bin/:$PATH
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin

# project vars
export DOCKER_NETWORK_NAME="alpaca_dev"

#only used for homebrew on macOS
export PATH=/opt/homebrew/bin:$PATH
export PATH=/usr/local/opt/inetutils/libexec/gnubin:$PATH

#intellij path for macOS
export PATH=/Applications/IntelliJ\ IDEA.app/Contents/MacOS:$PATH

# fix for duplicating text in zsh on tab autocomplete
# https://stackoverflow.com/questions/11916064/zsh-tab-completion-duplicating-command-name/24509199#24509199
export LC_ALL=en_US.UTF-8
