certutil -hashfile server.jar SHA1

certutil -hashfile waterfall.jar SHA1

call check.bat server.jar

for /f %%i in ('call check.bat server.jar') do set server_SHA1=%%i
echo The directory is %server_SHA1%

pause