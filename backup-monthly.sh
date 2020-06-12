#!/bin/bash

# set cron (automation)
# 10 0 /bin/bash (backup-monthly.sh) >

# run command 
# /bin/bash backup-monthly.sh | tee `date +%Y%m%d%H%M%S`.log  2>&1

TARGET_DATE=$(date -v-1m  +%Y-%m)

TARGET_BASE_PATH='/Users/whitecarrot/Documents/projects/bash-utils/test-backup-monthly'
TARGET_DIRS=("target-dir-2" "target-dir-3")
DESTINATION_PATH='/Users/whitecarrot/Documents/projects/bash-utils/test-backup-monthly/destination'

echo [$(date '+%Y/%m/%d %H:%M:%S')] "start ======================"

for t in "${TARGET_DIRS[@]}"
do
    dest=${DESTINATION_PATH}/${t}-${TARGET_DATE}.tar.gz
    target=${TARGET_BASE_PATH}/${t}/${TARGET_DATE}"-*"
    cd ${TARGET_BASE_PATH}/${t} 
    echo [$(date '+%Y/%m/%d %H:%M:%S')] "archiving ----------------------"
    echo " target:" ${target}
    echo " destination:" ${dest}
    # `tar -czpf ${dest} ${TARGET_DATE}-*`
    echo [$(date '+%Y/%m/%d %H:%M:%S')] "deleting ----------------------"
    echo " target:" ${target}
    # rm -rf ${target}
done

echo [$(date '+%Y/%m/%d %H:%M:%S')] "end ======================"
