#!/bin/bash

BACKUP_DIR=/backup
SOURCE_DIR=/home/shiyanlou
D_TODAY=${DT:-$(date +%Y%m%d)}
D_YESTERDAY=$(date -d "$D_TODAY -1day" +%Y%m%d )

if [ -d "$BACKUP_DIR/$D_YESTERDAY" ] ; then
    sudo rsync -a --link-dest=$BACKUP_DIR/$D_YESTERDAY $SOURCE_DIR $BACKUP_DIR/$D_TODAY
else
    sudo rsync -a $SOURCE_DIR $BACKUP_DIR/$D_TODAY
fi

result=$?

if [ $result -eq 0 ] ; then
    echo "backup done."
else
    echo "backup failed."
fi
