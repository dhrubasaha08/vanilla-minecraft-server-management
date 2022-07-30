@echo off

java ^
-Xms512M ^
-Xmx512M ^
-XX:+UseG1GC ^
-XX:G1HeapRegionSize=4M ^
-XX:+UnlockExperimentalVMOptions ^
-XX:+ParallelRefProcEnabled ^
-XX:+AlwaysPreTouch ^
-jar ^
waterfall.jar

pause