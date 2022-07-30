:: Script to update the Minecraft server file from Mojang website
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




:: downloading the file from the Mojang website
curl "https://launcher.mojang.com/v1/objects/e00c4052dac1d59a1188b2aa9d5a87113aaf1122/server.jar" --output server_temp.jar

:: calculating the SHA1 hash of the downloaded file and the original file
for /f %%i in ('call check.bat server.jar') do set server_SHA=%%i
for /f %%i in ('call check.bat server_temp.jar') do set server_temp_SHA=%%i

:: if the SHA1 hash of the downloaded file and the original file are same, then the file is not updated elsewise the file is updated
if %server_SHA% == %server_temp_SHA% (
    del server_temp.jar
) else (
    move server_temp.jar server.jar
)
