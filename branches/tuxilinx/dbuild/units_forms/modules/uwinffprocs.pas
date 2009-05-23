{
   This unit is part of the WinFF project
   Copyright (c) 2006 - 2009 Matthew Weatherford
   http://www.winff.org
   Licensed under the GNU GPL v3

   Platform independent procedures and functions
}

unit uwinffprocs;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, StdCtrls, Laz_XmlCfg, Dom, XmlRead, XmlWrite,
  ComCtrls, Forms, LCLType, uaddfilesdialog,
  {$IFDEF WINDOWS}
     uwinffwin32procs;
  {$ENDIF}
  {$IFDEF UNIX}
     uwinffunixprocs;
  {$ENDIF}

  procedure LaunchURL(const AHandle: THandle; const AURL: String);

  procedure LaunchPdfFile(const AHandle: THandle; const APdfFile: String);

  procedure DisableSystemMenu(const AHandle: THandle);

  procedure FillListViewDialog(const AListView: TListView; const AInputFiles: TStrings);

  procedure FillListView(const AListView: TListView; const AInputFile: String);

  procedure ResetEditField(const AEdit: TEdit; const AOverrideStandardSetting: Boolean; const ANewValue: String);

  procedure Reset;

  function GetDesktopPath(const AHandle: THandle): String;

  function GetMyDocumentsPath(const AHandle: THandle): String;

  function GetApplicationDataPath(const AHandle: THandle): String;

  function ValidateNumericInput(const AEdit: TEdit; const AKey: Char): Boolean;

  function ReplaceParameter(const ACommandLine: String; const AParameter: String;
                            const AReplacement: String): String;

  function GetFileSize(const AInputFile: String): String;

  function FormatFileSizeToMiB(const AFileSize: Integer): String;

  function DisplayErrorMessage(const AErrorMessage: String; const ACaption: String): Boolean;

  function DisplayWarningMessage(const AWarningMessage: String; const ACaption: String): Boolean;

implementation

var
   RefreshValue: Integer = 0;

{
   Operating system independent
   Performs various resetting actions on variables etc.
}
procedure Reset;
begin
   RefreshValue := 0;
end;

{
   Operating system independent
   Local procedure
   Shows an "Adding files" dialog to notify the end user that
   WinFF is not stalled while adding large amounts of files
}
procedure ShowProgressDialog(const AFileCount: Integer);
begin
   if AFileCount > 29 then
   begin
      with AddFilesDialog do
      begin
         prgProgress.MaxValue := AFileCount;
         Show;
         SetFocus;
      end;
      Application.ProcessMessages;
   end
   else
      Exit;
end;

{
   Operating system independent
   Local procedure
   Update the information in the "Adding files" dialog
}
procedure UpdateProgressDialog;
begin
   inc(RefreshValue);
   with AddFilesDialog do
   begin
      prgProgress.Progress := RefreshValue;
      lblProgress.Caption := IntToStr(prgProgress.PercentDone) + '%';
   end;
end;

{
   Operating system independent
   Fill the listview with the selected files
   This procedure is invoked when we're using the OpenDialog
   to select our files for batch processing
}
procedure FillListViewDialog(const AListView: TListView; const AInputFiles: TStrings);
var
   I: Integer;
begin
   ShowProgressDialog(AInputFiles.Count);
   for I := 0 to AInputFiles.Count - 1 do
   begin
      with AListView.Items.Add do
      begin
         Caption := AInputFiles[I];
         SubItems.Add(GetFileSize(Caption));
         SubItems.Add(ExtractFileExt(Caption));
      end;
      UpdateProgressDialog;
   end;
end;

{
   Operating system independent
   Add a single file to the listview
   This procedure is invoked when files are dropped on the form
}
procedure FillListView(const AListView: TListView; const AInputFile: String);
begin
   with AListView.Items.Add do
   begin
      Caption := AInputFile;
      SubItems.Add(GetFileSize(Caption));
      SubItems.Add(ExtractFileExt(Caption));
   end;
end;

end.

