
source "${HOME}/.bash/function/env.sh"


if [[ -e "$HOME/.rvm/bin" ]]; then
#    export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
  __appendSearchNotExistPath "$HOME/.rvm/bin"
fi
