#!/bin/bash
#
# Kill ssh-agent started by .bashrc
command -v keychain && keychain -k all
pkill ssh-agent

