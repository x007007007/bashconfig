#!/bin/bash

if [[ -e $HOME/.pyenv ]]; then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi
