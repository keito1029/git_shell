#!/bin/sh
cd ~/git_shell ; pwd ; chmod 777 *.sh ; chown -R $(whoami):$(whoami) *.sh ; ln -sfv $(pwd)/*.sh $HOME/ ;pwd 
