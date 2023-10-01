:: Build winff for Windows

@echo on

if not defined LAZDIR (
  set LAZDIR=C:\lazarus
)

set INNO_SETUP="c:\Program Files (x86)\Inno Setup 6\ISCC.exe"

SET BUILD_EXE=..\winff\winff.exe
SET FINAL_EXE=winff.exe

IF EXIST %BUILD_EXE% del %BUILD_EXE%
IF EXIST %FINAL_EXE% del %FINAL_EXE%

%LAZDIR%\lazbuild.exe --lazarusdir=%LAZDIR% ..\winff\winff.lpi
copy %BUILD_EXE% %FINAL_EXE%
%INNO_SETUP% "winff1-0.iss"

IF EXIST %BUILD_EXE% del %BUILD_EXE%
