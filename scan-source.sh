#!/bin/sh

SAVEDIR=/media/backup/check/source

scan() {
    find $1 -type f | sort >$SAVEDIR/$1.txt
}

cd /
scan "scratch"

cd /media
scan "old-scratch"

cd /home
for d in ykk paula taavi; do scan $d; done
