:: Script makle a backup of the world folder using 7zip v1.0
:: Copyright (C) 2022  Dhruba Saha

:: This program is free software: you can redistribute it and/or modify
:: it under the terms of the GNU Affero General Public License as published by
:: the Free Software Foundation, either version 3 of the License, or
:: (at your option) any later version.

:: This program is distributed in the hope that it will be useful,
:: but WITHOUT ANY WARRANTY; without even the implied warranty of
:: MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
:: GNU Affero General Public License for more details.

:: You should have received a copy of the GNU Affero General Public License
:: along with this program.  If not, see <http://www.gnu.org/licenses/>.

@echo off
title Backup Tool
color 73

for /f "delims=" %%a in ('wmic OS Get localdatetime  ^| find "."') do set dt=%%a
set YYYY=%dt:~0,4%
set MM=%dt:~4,2%
set DD=%dt:~6,2%
set HH=%dt:~8,2%
set Min=%dt:~10,2%
set Sec=%dt:~12,2%

set stamp=%HH%-%Min%-%Sec%_%DD%-%MM%-%YYYY%

set folder_directory=%cd%

7zG.exe a "%folder_directory%\backup\world_%stamp%.zip" "%folder_directory%\world"

echo backup complete, closing cmd window...
timeout /T 2
exit