#!/bin/sh
cd $1 ; (git add -A ; git commit -m 'xargs commit' ; git status ; git push origin master -f ; echo nonstop) ; cd - ; date 




