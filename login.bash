#!/bin/bash
echo 'running login loader..'
source "${HOME}/.bash/function/loader.sh"


eval `__smart_bash_load_conf login.d`

