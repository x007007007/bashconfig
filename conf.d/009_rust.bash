#!/bin/bash
source ${HOME}/.bash/function/env.sh

if [[ -e "$HOME/.cargo/env" ]]; then
    . $HOME/.cargo/env
    __insertSearchNotExistPath $HOME/.cargo/bin
fi
