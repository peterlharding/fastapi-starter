#!/bin/bash
#
# -----------------------------------------------------------------------------

if [ $# -eq 1 ] ; then
    KILL=1
else
    KILL=0
fi

PORT=`grep PORT .env | sed 's/.*=//'`

echo
echo ">>>  Looking for app running on port ${PORT}"

netstat -anp | grep ${PORT}

RC=`netstat -anp | grep ${PORT}`

if [ -n "${RC}" ] ; then

        PID=`echo ${RC} | awk '{print $7}' | sed 's/.python3//'`

        echo
        echo ">>>  Found App running on port ${PORT} with PID |${PID}|"
        echo

        if [ ! -z "${PID}" ] ; then
            ps -ef | grep -v grep | grep ${PID}

            NPROC=`ps -ef | grep -v grep | grep ${PID} | wc -l`

            echo
            echo ">>>  Found ${NPROC} processes"

            PIDS=`ps -ef | grep -v grep | grep ${PID} | awk '{ print $2 }' | tr '\n' ' '`

            echo ">>>  Targeting processes -  ${PIDS}"

            if [ ! -z "${PIDS}" ] ; then
                 if [ ${KILL} -eq 1 ] ; then
                     echo ">>>  Killing  processes - ${PIDS}"
                     kill -9 ${PIDS}
                 fi
            fi
        fi
else
    echo ">>>  Nothing found running on port ${PORT}"
fi
