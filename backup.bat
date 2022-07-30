for /f "delims=" %%a in ('wmic OS Get localdatetime  ^| find "."') do set dt=%%a
set YYYY=%dt:~0,4%
set MM=%dt:~4,2%
set DD=%dt:~6,2%
set HH=%dt:~8,2%
set Min=%dt:~10,2%
set Sec=%dt:~12,2%

set stamp=%HH%-%Min%-%Sec%_%DD%-%MM%-%YYYY%

set folder_directory=%cd%

"%folder_directory%\resources\7zG.exe" a "%folder_directory%\backup\world_%stamp%.zip" "%folder_directory%\world"

PAUSE