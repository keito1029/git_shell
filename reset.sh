#!/bin/sh
cd $1 ; (git reset --hard HEAD && git push origin master --force && echo SUCCESS) ; cd -


