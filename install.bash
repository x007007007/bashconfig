#!/bin/bash

if [[ ! -e ~/.bashrc ]]; then
    cp ~/.bash/template/bashrc ~/.bashrc
    eval $SHELL
else
    echo exist .bashrc
fi


