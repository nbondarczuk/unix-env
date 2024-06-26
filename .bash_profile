#!/bin/bash

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi


test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"


. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
