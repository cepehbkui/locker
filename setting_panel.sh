#!/usr/bin/bash

adb install D:\lockers\temp\WiFi_ADB_Debug_Over_Air_v3.0.6_apkpure.com.apk
adb shell am start -n com.ttxapps.wifiadb/.MainActivity
adb shell input tap 652.0 659.0
adb shell input tap 1251.0 52.0
adb shell input tap 1239.0 268.0
adb shell input keyevent 3

adb install D:\lockers\temp\msp_lk\locker-panel-2.3.8.1002-release.apk

adb shell settings put system screen_off_timeout 999999999
adb shell svc power stayon true

adb shell wm overscan 0,0,0,-105

adb shell setprop persist.sys.language ru-RU

adb shell setprop persist.sys.timezone "Europe/Moscow"

adb shell setprop persist.adb.tcp.port 5555

adb shell cmd package set-home-activity ru.inexdigital.panel/.MainActivity

adb shell am start ru.inexdigital.panel

sleep 12

adb reboot

D:\lockers\AndroidTool_Release\AndroidTool_Release\AndroidTool.exe
