#!/bin/sh

if [ "$1" != "source" ] && [ "$1" != "target" ]; then
   echo "Usage: $0 [source|target]"
   exit 1
fi

SAVEDIR=/media/backup/check/$1

scan() {
    find $1 -type f | sort >$SAVEDIR/$1.txt
}

if [ "$1" = 'source' ]; then
    cd /
    scan "scratch"

    cd /media
    scan "old-scratch"

    cd /home
    for d in ykk paula taavi; do scan $d; done
else
    cd /media/backup
    for d in scratch old-scratch ykk paula taavi; do scan $d; done
fi
