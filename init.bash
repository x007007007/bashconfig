#!/bin/bash

install_path=$HOME/.bash
platform=`uname |tr A-Z a-z`

function smart_bash_load_conf() {
   for sub_platform in "" "/$platform"; do
       for config_file_path in `find "${install_path}/conf.d${sub_platform}" -name *.bash -type f -print`; do 
           source "${config_file_path}"
       done
   done
}

function smart_bash_load_theme() {
    source ${install_path}/theme.d/default.bash
}

smart_bash_load_conf
smart_bash_load_theme

