#!/bin/sh
cd $1 ; (git checkout HEAD && git merge origin master && echo SUCCESS) cd -

