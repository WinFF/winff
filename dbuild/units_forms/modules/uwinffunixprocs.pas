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
   Classes, SysUtils, Unix, BaseUnix, Dos, Dialogs, Process;


   procedure Unix_LaunchURL(const AURL: String);

   procedure Unix_LaunchPDF(const APdfFile: String);

   //procedure Unix_Init;

   function Unix_GetDesktopPath: String;

   function Unix_GetMyDocumentsPath: String;

   function Unix_GetApplicationDataPath: String;

implementation


{
   Unix specefic
   Executes an URL
}
procedure Unix_LaunchURL(const AURL: String);
var
   ALauncher: TProcess;
   S: String;
begin
    {Exec('/usr/bin/firefox', AURL);
    if DosExitCode <> 0 then
       Exec('/usr/bin/mozilla-firefox', AURL);
    if DosExitCode <> 0 then
       Exec('/usr/bin/konqueror', AURL);
    if DosExitCode <> 0 then
       ShowMessage('More information can be found @ ' + AURL); }
    S := '';
    if FileExists('/usr/bin/konqueror') then
       S := '/usr/bin/konqueror';
    if FileExists('/usr/bin/mozilla-firefox') then
       S := '/usr/bin/mozilla-firefox';
    if FileExists('/usr/bin/firefox') then
       S := '/usr/bin/firefox';
    if FileExists('/usr/bin/sensible-browser') then
       S := '/usr/bin/sensible-browser';
    if FileExists('/usr/bin/epiphany-browser') then
       S := '/usr/bin/epiphany-browser';
    if FileExists('/usr/bin/kazehakase') then
       S := '/usr/bin/kazehakase';
    if S = '' then
    begin
       ShowMessage('More information can be found at ' + AURL);
       Exit;
    end;
    ALauncher := TProcess.Create(nil);
    ALauncher.CommandLine := S + ' ' + AURL;
    ALauncher.Execute;
    ALauncher.Free;
end;

{
   Unix specefic
   Launch a document viewer and show a PDF file
}
procedure Unix_LaunchPDF(const APdfFile: String);
var
   ALauncher: TProcess;
   S: String;
begin
   {Exec('/usr/bin/evince', APdfFile);
   if DosExitCode <> 0 then
      Exec('/usr/bin/kpdf', APdfFile);
   if DosExitCode <> 0 then
      Exec('/usr/bin/xpdf', APdfFile);
   if DosExitCode <> 0 then
      Exec('/usr/bin/acroread', APdfFile);
   if DosExitCode <> 0 then
      ShowMessage('More information can be found @ http://www.winff.org');}
   S := '';
   if FileExists('/usr/bin/evince') then
      S := '/usr/bin/evince';
   if FileExists('/usr/bin/kpdf') then
      S := '/usr/bin/kpdf';
   if FileExists('/usr/bin/xpdf') then
      S := '/usr/bin/xpdf';
   if FileExists('/usr/bin/acroread') then
      S := '/usr/bin/acroread';
   if S = '' then
   begin
      ShowMessage('More information can be found at ' + APdfFile);
      Exit;
   end;
   ALauncher := TProcess.Create(nil);
   ALauncher.CommandLine := S + ' ' + APdfFile;
   ALauncher.Execute;
   ALauncher.Free;
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

{
   Unix specefic
   Get the path to the user's application data path
}
function Unix_GetApplicationDataPath: String;
begin
   Result := GetEnvironmentVariable('HOME');
end;

end.

