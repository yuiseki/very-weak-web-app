#!/bin/bash

cmd="$@"

echo "Waiting for mysql"
flag=0
while [ "$flag" -eq 0 ]
do
        state=`mysql -h"db" -u"root" -D"memo" -e "select * from memo;"`
        echo $state
        echo "Waiting for mysql"
        if [[ -z $state || $state == ERROR* ]];
        then
                flag=0
        else
                flag=1
        fi
        sleep 1
done

echo "MySQL is up - executing command"
exec $cmd