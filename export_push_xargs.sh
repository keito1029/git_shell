#!/bin/sh
cd $1 ; pwd ; (git add -A ; git commit -m 'xargs commit' ; git status ; git push origin master -f ; echo nonstop) ; cd - ; date 




