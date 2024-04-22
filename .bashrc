#!/bin/bash

UNAME=$(uname | tr '[:upper:]' '[:lower:]')

if [ -f ~/.bashrc_${UNAME} ]; then
    . ~/.bashrc_${UNAME}
fi

if [ -f ~/.bashrc_aliases ]; then
    . ~/.bashrc_aliases
fi

if [ -f ~/.bashrc_local ]; then
    . ~/.bashrc_local
fi

if [ -f ~/.bashrc_git ]; then
    . ~/.bashrc_git
fi

if [ -f ~/.bashrc_hosts ]; then
    . ~/.bashrc_hosts
fi

if [ -f ~/.bashrc_oracle ]; then
    . ~/.bashrc_oracle
fi

if [ -f .iterm2_shell_integration.bash ]; then
    . ~/.iterm2_shell_integration.bash
fi
