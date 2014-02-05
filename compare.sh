#!/bin/sh

DIR=/media/backup/check/source
cd $DIR

for f in *.txt; do diff -u $f ../target/$f; done
