#!/bin/sh
cd $HOME/git_shell && pwd && chmod 777 *.sh && chown -R $(whoami):$(whoami) *.sh && ls *.sh | grep -v install | xargs -I Link ln -sfv $(pwd)/Link $HOME/ && pwd && echo SUCCESS 

