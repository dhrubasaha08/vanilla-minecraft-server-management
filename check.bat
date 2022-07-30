:: The MIT License (MIT)
::
:: Copyright (c) 2014 Vasil Arnaudov

:: Permission is hereby granted, free of charge, to any person obtaining a copy
:: of this software and associated documentation files (the "Software"), to deal
:: in the Software without restriction, including without limitation the rights
:: to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
:: copies of the Software, and to permit persons to whom the Software is
:: furnished to do so, subject to the following conditions:

:: The above copyright notice and this permission notice shall be included in all
:: copies or substantial portions of the Software.

:: THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
:: IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
:: FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
:: AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
:: LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
:: OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
:: SOFTWARE.



setlocal enableDelayedExpansion
if "%~1" equ "" (
	echo no file passed
	echo pass -help to see the help message
	exit /b 1
)

for %%# in (-h -help /h /help) do (
	if "%~1" equ "%%~#" (
		echo generates SHA1 checksum for a given file
		(echo()
		echo USAGE:
		(echo()
		echo %~nx0 file [variable]
		(echo()
		echo variable string in which the generated checksum will be stored
		(echo()
		exit /b 0
	)
)

if not exist "%~1" (
	echo file %~1 does not exist
	exit /b 2
)

if exist "%~1\" (
	echo %~1 is a directory
	exit /b 3
)

for %%# in (certutil.exe) do (
	if not exist "%%~f$PATH:#" (
		echo no certutil installed
		echo for Windows XP professional and Windows 2003
		echo you need Windows Server 2003 Administration Tools Pack
		echo https://www.microsoft.com/en-us/download/details.aspx?id=3725
		exit /b 4
	)
)

set "SHA1="
for /f "skip=1 tokens=* delims=" %%# in ('certutil -hashfile "%~f1" SHA1') do (
	if not defined SHA1 (
		for %%Z in (%%#) do set "SHA1=!SHA1!%%Z"
	)
)

if "%~2" neq "" (
	endlocal && (
		set "%~2=%SHA1%"
	) 
) else (
	echo %SHA1%
)
endlocal