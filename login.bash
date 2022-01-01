#!/bin/bash
echo load login initial ...
install_path=$HOME/.bash
platform=`uname |tr A-Z a-z`

function smart_bash_load_login_config() {
   for sub_platform in "" "/$platform"; do
       for config_file_path in `find "${install_path}/login.d${sub_platform}" -name *.bash -type f -print`; do 
           source "${config_file_path}"
       done
   done
}

smart_bash_load_login_config

