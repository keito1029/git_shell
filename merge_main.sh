#!/bin/sh
cd $1 ; (git checkout HEAD && git merge origin main && echo SUCCESS) cd -



