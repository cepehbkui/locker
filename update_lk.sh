#!/usr/bin/bash

cat /dev/null > /home/user/logs/log_update_lk.txt
ip1="10.51.13."
for ip in {140..150..2}
do
	if  ping -c 1 ${ip1}${ip} > /dev/null
	then
		adb connect ${ip1}${ip}
		adb connect ${ip1}${ip} 
		if adb install -r /home/user/apk/locker-panel-2.3.9-release.apk > /dev/null
		then
			echo "Success"
			adb shell am start ru.inexdigital.panel
			adb disconnect
			adb disconnect
		else
			echo "Failed install, do again!"
			echo "`date`: Locker Panel ${ip1}${ip} error adb install" >> /home/user/logs/log_update_lk.txt
			adb connect ${ip1}${ip} 
			adb connect ${ip1}${ip} 
			adb install -r /home/user/apk/locker-panel-2.3.9-release.apk
			adb shell am start ru.inexdigital.panel
			adb disconnect
			adb disconnect
		fi
	else
		echo "`date`: Locker Panel ${ip1}${ip} offline" >> /home/user/logs/log_update_lk.txt
	fi
done
cat /home/user/logs/log_update_lk.txt
