#!/bin/bash
#
# Kill ssh-agent started by .bashrc
pkill ssh-agent
echo "fired" > ${HOME}/sshagenttest.txt

