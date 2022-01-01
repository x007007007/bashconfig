#!/bin/bash

if [[ ! -e ~/.bashrc ]]; then
    cp ~/.bash/template/bashrc ~/.bashrc
else
    echo exist .bashrc
fi


if [[ ! -e ~/.bash_profile ]]; then
    cp ~/.bash/template/bash_profile.ubuntu  ~/.bash_profile
else
    echo exist .bash_profile
fi

