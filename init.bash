#!/bin/bash
echo 'initial ...'
source "${HOME}/.bash/function/loader.sh"
source "${HOME}/.bash/function/env.sh"
source "${install_path}/changecheck.sh"

__smart_bash_load_conf conf.d
__smart_bash_load_conf theme.d

__cleanSearchPath