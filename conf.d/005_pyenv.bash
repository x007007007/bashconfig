#!/bin/bash

export PATH=/usr/local/bin:$PATH

if [[ -e $HOME/.pyenv ]]; then
  if [[ "$(uname)" == "Darwin" ]]; then
    export PYTHON_CONFIGURE_OPTS="--enable-framework"
  else
	  export PYTHON_CONFIGURE_OPTS="--enable-shared"
  fi
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
  export PATH="$(pyenv root)/shims:$PATH"
fi

# Created by `pipx` on 2021-09-28 16:20:51
export PATH="${HOME}/.local/bin:$PATH"
