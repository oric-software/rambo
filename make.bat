@echo off

REM VERSION MAKEFILE 0.0.1 init

SET BINARYFILE=rambo

SET ORICUTRON="..\..\..\oricutron\"

SET ORIGIN_PATH=%CD%

set VERSION="1.0.0"

SET PATH=%PATH%;%CC65%

mkdir build\usr\bin
mkdir build\usr\share\doc\
mkdir build\usr\share\doc\%BINARYFILE%
mkdir build\usr\share\man
copy src\man\%BINARYFILE%.hlp build\usr\share\man

copy README.md build\usr\share\doc\%BINARYFILE%

echo #define VERSION "%VERSION%" > src\version.h
rem  123456789012345678
echo | set /p dummyName=rambo     1.0.0  Rambo music demo   > src\ipkg\%BINARYFILE%.csv

%OSDK%\bin\xa.exe -v src\%BINARYFILE%.asm -o build\usr\bin\%BINARYFILE% -DTARGET_ORIX


IF "%1"=="NORUN" GOTO End

xcopy build\usr\bin\*  %ORICUTRON%\usbdrive\bin /E /Q /Y
xcopy src\man\%BINARYFILE%.hlp  %ORICUTRON%\usbdrive\usr\share\man /E /Q /Y
copy src\ipkg\%BINARYFILE%.csv %ORICUTRON%\usbdrive\usr\share\ipkg\

cd %ORICUTRON%
OricutronV4 -mt
cd %ORIGIN_PATH%
:End


