@echo off

java ^
-Xmx8G ^
-Xms2G ^
-XX:SoftMaxHeapSize=2G ^
-jar ^
server.jar ^
--bonusChest ^
--eraseCache ^
--forceUpgrade ^
--safeMode ^
--nogui ^

call backup.bat

pause