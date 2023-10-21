#!/bin/sh
cd $1 ; (git reset --hard HEAD && git push origin main --force && echo SUCCESS) ; cd -


