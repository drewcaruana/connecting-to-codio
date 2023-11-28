#!/bin/bash

export PS1="\u \w $ "
export PATH="$PATH:$HOME/workspace/.guides/bashtests"
export BASHDIR=$HOME/workspace/.guides
shopt -s histappend
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
<<<<<<< HEAD
chmod +x "${BASHDIR}/bashtests/workspace-reset.sh"

=======
chmod +x "${BASHDIR}/bashtests/workspace-reset.sh"
>>>>>>> efd3cbac117f04602c79a5b6022229ae3b3d13f2
