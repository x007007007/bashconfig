#!/bin/bash
echo load login initial ...
install_path=$HOME/.bash
platform=`uname |tr A-Z a-z`

function __smart_bash_load_login_config() {
  local script_path sub_platform config_file_path
  for sub_platform in "" "/$platform" ; do
    script_path=${install_path}/login.d${sub_platform}
    if [[ -e "${script_path}" ]]; then
      find "${script_path}" -name "*.bash" -type f -print |while read -r config_file_path; do
        source "${config_file_path}"
      done
    fi
  done
}

__smart_bash_load_login_config

