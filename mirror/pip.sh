#!/bin/bash

function set_aliyun () {
	python3 -m pip config set global.index-url https://mirrors.aliyun.com/pypi/simple
        python3 -m pip config set global.trusted-host mirrors.aliyun.com
}


function set_origin () {
	python3 -m pip config unset global.index-url
        python3 -m pip config unset global.trusted-host
}


while getopts oc flag
do
    case "${flag}" in
        c) set_aliyun;;
        o) set_origin;;
    esac
done
