#!/bin/bash

PORT=`grep PORT .env | sed 's/PORT=//'`

ps -ef | grep python3 | grep ${PORT}

PID=`ps -ef | grep python3 | grep ${PORT} | awk '{print $2}'`

echo " PID |${PID}|"

if [ ! -z "${PID}" ] ; then
    PGID=`ps -o pgid= ${PID}`
    echo "PGID |${PGID}|"

    if [ ! -z "${PGID}" ] ; then
        CMD="kill -9 -- -${PGID}"
        echo " CMD |${CMD}|"
        eval "${CMD}"
    fi
fi

