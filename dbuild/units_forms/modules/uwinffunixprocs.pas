{
   This unit is part of the WinFF project
   Copyright (c) 2006 - 2009 Matthew Weatherford
   http://www.winff.org
   Licensed under the GNU GPL v3

   Procedures and functions specefic for the Unix/Linux platform
}

unit uwinffunixprocs;

{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils, Unix, BaseUnix, Dos, Dialogs;


   procedure Unix_LaunchURL(const AURL: String);

   procedure Unix_LaunchPDF(const APdfFile: String);

   //procedure Unix_Init;

   function Unix_GetDesktopPath: String;

   function Unix_GetMyDocumentsPath: String;

implementation


{
   Unix specefic
   Executes an URL
}
procedure Unix_LaunchURL(const AURL: String);
begin
    Exec('/usr/bin/firefox', AURL);
    if DosExitCode <> 0 then
       Exec('/usr/bin/mozilla-firefox', AURL);
    if DosExitCode <> 0 then
       Exec('/usr/bin/konqueror', AURL);
    if DosExitCode <> 0 then
       ShowMessage('More information can be found @ ' + AURL);
end;

{
   Unix specefic
   Launch a document viewer and show a PDF file
}
procedure Unix_LaunchPDF(const APdfFile: String);
begin
   Exec('/usr/bin/evince', APdfFile);
   if DosExitCode <> 0 then
      Exec('/usr/bin/kpdf', APdfFile);
   if DosExitCode <> 0 then
      Exec('/usr/bin/xpdf', APdfFile);
   if DosExitCode <> 0 then
      Exec('/usr/bin/acroread', APdfFile);
   if DosExitCode <> 0 then
      ShowMessage('More information can be found @ http://www.winff.org');
end;

{
   Unix specefic
   Get the user's desktop path
}
function Unix_GetDesktopPath: String;
begin
   Result := GetEnvironmentVariable('HOME') + DirectorySeparator + 'Desktop';
end;

{
   Unix specefic
   Get the user's home folder path
}
function Unix_GetMyDocumentsPath: String;
begin
   Result := GetEnvironmentVariable('HOME');
end;

end.

