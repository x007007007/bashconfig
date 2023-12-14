#!/bin/bash

source ../../../.bash/function/env.sh

if [[ -d /usr/local/opt/llvm/bin ]]; then
  echo 'find llvm and config'
  __appendSearchNotExistPath /usr/local/opt/llvm/bin
  export LDFLAGS="-L/usr/local/opt/llvm/lib $LDFLAGS"
  export CPPFLAGS="-I/usr/local/opt/llvm/include $CPPFLAGS"
fi
