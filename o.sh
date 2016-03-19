#!/bin/bash
./gradlew installDebug

if [ $? -eq 0 ]
then    
    PHONES=`adb devices  |grep "device$"|awk '{print $1}'`
    for p in $PHONES
    do
        adb -s $p shell am start -n com.yeungkc.gank.io/.ui.activities.MainActivity
    done
fi

