#!/bin/sh

BACKUP=/media/backup/check

TARGET=$BACKUP/target-md5sum.txt

cd /media/backup
find old-scratch paula scratch taavi ykk -type f -print0 |xargs -0 md5sum >$TARGET

SOURCE=$BACKUP/source-md5sum.txt

cd /media
find old-scratch -type f -print0 |xargs -0 md5sum >$SOURCE
cd /home
find paula taavi ykk -type f -print0 |xargs -0 md5sum >>$SOURCE
cd /
find scratch -type f -print0 |xargs -0 md5sum >>$SOURCE

sort $TARGET >$TARGET.sorted
sort $SOURCE >$SOURCE.sorted
diff -u $SOURCE.sorted $TARGET.sorted
