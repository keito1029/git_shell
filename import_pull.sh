#!/bin/sh
cd $1 ; (git pull origin master -f && echo SUCCESS) ; cd - ; date


