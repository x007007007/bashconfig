#!/bin/bash
cat <<EOF |xargs -i brew install {}
pipx
pyenv
EOF

pipx ensurepath
