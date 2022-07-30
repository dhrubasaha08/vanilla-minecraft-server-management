@echo off

java ^
-Xmx2G ^
-Xms2G ^
-XX:SoftMaxHeapSize=4M ^
-jar ^
server.jar ^
--bonusChest ^
--eraseCache ^
--forceUpgrade ^
--safeMode ^
--nogui ^

pause
