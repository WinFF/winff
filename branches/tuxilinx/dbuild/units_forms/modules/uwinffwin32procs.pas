{
   This unit is part of the WinFF project
   Copyright (c) 2006 - 2009 Matthew Weatherford
   http://www.winff.org
   Licensed under the GNU GPL v3

   Procedures and functions specefic for the Win32 platform
}

unit uwinffwin32procs;

{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils, Windows, ShellApi, Dos;

type
   TOSVersion = (osWin95, osWin98, osWin98SE, osWinME, osWinNT, osWin2000,
                 osWinXP, osWin2003, osWin2008, osWinVista, osUnknown);

   procedure Win32_LaunchURL(const AHandle: THandle; const AURL: String);

   procedure Win32_LaunchPdfFile(const AHandle: THandle; const APdfFile: String);

   procedure Win32_DisableCloseButton(const AHandle: THandle);

   function Win32_GetWin32Version: TOSVersion;

   function Win32_GetDesktopPath(const AHandle: THandle): String;

   function Win32_GetMyDocumentsPath(const AHandle: THandle): String;

   function Win32_GetApplicationDataPath(const AHandle: THandle): String;

implementation

const
   ShFolder = 'ShFolder.dll';
   CSIDL_PERSONAL: LongInt = $0005;
   CSIDL_DESKTOPDIRECTORY: LongInt = $0010;
   CSIDL_APPDATA: LongInt = $001a;


{
   Windows specefic
   Launch the default browser with a given URL
}
procedure Win32_LaunchURL(const AHandle: THandle; const AURL: String);
begin
   ShellExecute(AHandle, 'open', PChar(AURL), nil, nil, SW_SHOWNORMAL);
end;

{
   Windows specefic
   Launch the default pdf document viewer
}
procedure Win32_LaunchPdfFile(const AHandle: THandle; const APdfFile: String);
begin
   ShellExecute(AHandle, 'open', PChar(APdfFile), nil, nil, SW_SHOWNORMAL);
end;

{
   Windows specefic
   Get the operating system version and
   translate it to a enumerated type
}
function Win32_GetWin32Version: TOSVersion;
var
   OsVersionInfo: TOsVersionInfo;
   MajorVersion, MinorVersion: Integer;
begin
   Result := osUnknown;
   OsVersionInfo.dwOSVersionInfoSize := SizeOf(TOsVersionInfo);
   if GetVersionEx(OsVersionInfo) then
   begin
      MajorVersion := OsVersionInfo.dwMajorVersion;
      MinorVersion := OsVersionInfo.dwMinorVersion;
      case OsVersionInfo.dwPlatformId of
         VER_PLATFORM_WIN32_NT:
         begin
            if (MajorVersion <= 4) then
               Result := osWinNT
            else
            if (MajorVersion = 5) and (MinorVersion = 0) then
               Result := osWin2000
            else
            if (MajorVersion = 5) and (MinorVersion = 1) then
               Result := osWinXP
            else
            if (MajorVersion = 5) and (MinorVersion = 2) then
               Result := osWin2003
            else
            if (MajorVersion = 6) and (MinorVersion = 0) then
               Result := osWinVista
            else
               Result := osUnknown;
         end;
         VER_PLATFORM_WIN32_WINDOWS:
         begin
            if (MajorVersion = 4) and (MinorVersion = 0 then
               Result := osWin95
            else
            if (MajorVersion = 4) and (MinorVersion = 10) then
               if (OsVersionInfo.szCSDVersion[1] = 'A') then
                  Result := osWin98SE
               else
                  Result := osWin98
               end
            else
            if (MajorVersion = 4) and (MinorVersion = 90) then
               Result := osWinME
            else
               Result := osUnknown;
         end;
      end;
   end
   else
      Result := osUnknown;
end;

{
   Windows specefic
   Get the path to user's My Documents folder
}
function Win32_GetMyDocumentsPath(const AHandle: THandle): String;
var
   Piil: PItemIdList;
begin
   Piil := nil;
   SHGetSpecialFolderLocation(AHandle, CSIDL_PERSONAL, Piil);
   SetLength(Result, MAX_PATH);
   if not SHGetPathFromIdList(Piil, PChar(Result)) then
      raise Exception.Create('SHGetPathFromIDList failed: invalid pidl'#13#10'Traceback: GetMyDocsPath');
   SetLength(Result, lStrLen(PChar(Result)));
end;

{
   Windows specefic
   Get the path to the user's desktop folder
}
function Win32_GetDesktopPath(const AHandle: THandle): String;
var
   Piil: PItemIdList;
begin
   Piil := nil;
   SHGetSpecialFolderLocation(AHandle, CSIDL_DESKTOPDIRECTORY, Piil);
   SetLength(Result, MAX_PATH);
   if not SHGetPathFromIdList(Piil, PChar(Result)) then
      raise Exception.Create('SHGetPathFromIDList failed: invalid pidl'#13#10'Traceback: GetDesktopPath');
   SetLength(Result, lStrLen(PChar(Result)));
end;

{
   Windows specefic
   Get the path to the user's application data folder
}
function Win32_GetApplicationDataPath(const AHandle: THandle): String;
var
   Piil: PItemIdList;
begin
   Piil := nil;
   SHGetSpecialFolderLocation(AHandle, CSIDL_APPDATA, Piil);
   SetLength(Result, MAX_PATH);
   if not SHGetPathFromIdList(Piil, PChar(Result)) then
      raise Exception.Create('SHGetPathFromIDList failed: invalid pidl'#13#10'Traceback: GetAppDataPath');
   SetLength(Result, lStrLen(PChar(Result)));
end;

{
   Windows specefic
   Disable the close button in the top border of the window
}
procedure Win32_DisableCloseButton(const AHandle: THandle);
var
   Menu: HMENU;
begin
   Menu := GetSystemMenu(AHandle, False);
   EnableMenuItem(Menu, SC_CLOSE, MF_GRAYED);
end;

end.

