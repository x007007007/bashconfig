#!/bin/bash

if [[ -e $HOME/.pyenv ]]; then
    if [[ "`uname`" == "Darwin" ]]; then 
    	export PYTHON_CONFIGURE_OPTS="--enable-framework"
    else
	export PYTHON_CONFIGURE_OPTS="--enable-shared"
    fi
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi
