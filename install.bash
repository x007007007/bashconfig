#!/bin/bash

if [[ ! -e ~/.bashrc ]]; then
    cp ~/.bash/template/bashrc ~/.bashrc
else
    echo exist .bashrc
fi


