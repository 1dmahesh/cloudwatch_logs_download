#!/usr/bin/env bash

LOG_GROUP_NAME=""
LOG_STREAM_NAME=""
START_TIME="" # please add the time in Unix time -ex= `( date +%s -d (current_date))`` to get the date in Unix format
END_TIME="" # please add the time in Unix time.
LIMIT=""
REGION=""
OUT="json"
OUTPUT_FILE="$(date +"%Y%m%d").json"

 aws logs get-log-events \
    --start-time=${START_TIME}\
    --end-time=${END_TIME}\
    --log-group-name=${LOG_GROUP_NAME} \
    --log-stream-name=${LOG_STREAM_NAME} \
    --limit=${LIMIT}\
    --region=${REGION}\
    --output=${OUT} >> ${OUTPUT_FILE}

nextToken=$(cat ${OUTPUT_FILE} | grep nextForwardToken | awk '{print $4}' )

while [ -n "$nextToken" ]; do
    echo ${nextToken}
    sleep 5
    aws logs get-log-events \
        --start-from-head\
        --end-time=${END_TIME}\
        --log-group-name=${LOG_GROUP_NAME} \
        --log-stream-name=${LOG_STREAM_NAME} \
        --limit=${LIMIT}\
        --region=${REGION}\
        --next-token ${nextToken} >> ${OUTPUT_FILE}
 done
exit 1