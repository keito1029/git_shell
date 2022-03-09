#!/bin/sh
cd ~/git_shell ; chmod 777 *.sh ; chown -R $(whoami):$(whoami) *.sh ; ln -sf *.sh ~/ 
