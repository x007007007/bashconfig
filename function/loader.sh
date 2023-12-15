#!/bin/bash

install_path=$HOME/.bash
platform=`uname |tr A-Z a-z`

function smart_bash_load_conf() {
  local load_sub_folder script_path sub_platform config_file_path
  load_sub_folder=${1}
  for sub_platform in "" "/$platform"; do
    script_path=${install_path}/${load_sub_folder}${sub_platform}
    if [[ -e "${script_path}" ]]; then
      find "${script_path}" -name "*.bash" -type f -print | while read -r config_file_path ; do
        source "${config_file_path}"
      done
    fi
  done
}