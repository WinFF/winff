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
  Classes, SysUtils, StdCtrls, ComCtrls, Forms, LCLType,
  uaddfilesdialog,
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

{
   Operating system independent
   Launcth the default browser with a given URL
}
procedure LaunchURL(const AHandle: THandle; const AURL: String);
begin
   {$IFDEF UNIX}
      uwinffunixprocs.Unix_LaunchURL(AURL);
   {$ENDIF}
   {$IFDEF WINDOWS}
      uwinffwi32procs.Win32_LaunchURL(AHandle, AURL);
   {$ENDIF}
end;

{
   Operating system independent
   Launch the default document viewer and display a PDF file
}
procedure LaunchPdfFile(const AHandle: THandle; const APdfFile: String);
begin
   {$IFDEF UNIX}
      uwinffunixprocs.Unix_LaunchPDF(APdfFile);
   {$ENDIF}
   {$IFDEF WINDOWS}
      uwinffwin32procs.Win32_LaunchPDF(AHandle, APdfFile);
   {$ENDIF}
end;

{
   Operating system independent
   Reset a TEdit's text property
}
procedure ResetEditField(const AEdit: TEdit; const AOverrideStandardSetting: Boolean; const ANewValue: String);
begin
   if AOverrideStandardSetting then
   begin
      if (AEdit.Text = '') then
         AEdit.Text := ANewValue;
   end
   else
   begin
      if (AEdit.Text = '') then
         AEdit.Text := '0';
   end;
end;

{
   Operating system independent
   Disable the close button in the system menu area
}
procedure DisableSystemMenu(const AHandle: THandle);
begin
   {$IFDEF UNIX}
      {
         TODO
         We need to find a equivalent for unix here
      }
   {$ENDIF}
   {$IFDEF WINDOWS}
      uwinffwin32procs.Win32_DisableCloseButton(AHandle);
   {$ENDIF}
end;

{
   Operating system independent
   Get the path to the user's desktop folder
}
function GetDesktopPath(const AHandle: THandle): String;
begin
   {$IFDEF UNIX}
      Result := uwinffunixprocs.Unix_GetDesktopPath;
   {$ENDIF}
   {$IFDEF WINDOWS}
      Result := uwinffwin32procs.Win32_GetDesktopPath(AHandle);
   {$ENDIF}
end;

{
   Operating system independent
   Get the path to the user's documents folder
}
function GetMyDocumentsPath(const AHandle: THandle): String;
begin
   {$IFDEF UNIX}
      Result := uwinffunixprocs.Unix_GetMyDocumentsPath;
   {$ENDIF}
   {$IFDEF WINDOWS}
      Result := uwinffwin32procs.Win32_GetMyDocumentsPath;
   {$ENDIF}
end;

{
   Operating system independent
   Get the path to the user's application data path
}
function GetApplicationDataPath(const AHandle: THandle): String;
begin
   {$IFDEF UNIX}
      Result := uwinffunixprocs.Unix_GetApplicationDataPath;
   {$ENDIF}
   {$IFDEF WINDOWS}
      Result := uwinffwin32procs.Win32_GetApplicationDataPath(AHandle);
   {$ENDIF}
end;

{
   Operating system independent
   Validate the numeric input in the selected TEdit field
}
function ValidateNumericInput(const AEdit: TEdit; const AKey: Char): Boolean;
begin
   Result := False;
   if AKey in [#8, '0'..'9'] then
      Result := True;
   if (AKey = '-') and (AEdit.SelStart = 0) and (Pos('-', AEdit.Text) = 0) then
      Result := True;
end;

{
   Operating system independent
   Replace a parameter in a string
}
function ReplaceParameter(const ACommandLine: String; const AParameter: String; const AReplacement: String): String;
var
   I, J, StartPos, EndPos: Integer;
   CmdLine: String;
begin
   Result := '';
   CmdLine := ACommandLine;
   StartPos := Pos(AParameter + ' ', CmdLine);
   if StartPos <> 0 then
   begin
      for I := StartPos + 1 to Length(CmdLine) - 1 do
      begin
         if CmdLine[I] = '=' then
         begin
            EndPos := I - 1;
            Break;
         end;
         Delete(CmdLine, StartPos, EndPos - StartPos);
         Result := LeftStr(CmdLine, StartPos) + AReplacement + ' ' + LeftStr(CmdLine, Length(CmdLine) - StartPos);
      end;
   end
   else
   begin
      CmdLine := CmdLine + ' ' + AReplacement;
   end;
end;

{
   Operating system independent
   Format the input file size to MiB
}
function FormatFileSizeToMiB(const AFileSize: Integer): String;
begin
   Result := FormatFloat('#.##0.00', (AFileSize / (1024 * 1024))) + ' MiB'
end;

{
   Operating system independent
   Get the file size in MiB
}
function GetFileSize(const AInputFile: String): String;
var
   ASr: TSearchRec;
begin
   if FindFirst(AInputFile, faAnyFile, ASr) = 0 then
      Result := FormatFileSizeToMiB(ASr.Size)
   else
      Result := '0 MiB';
   FindClose(ASr);
end;

{
   Operating system independent
   Display an error message dialog
}
function DisplayErrorMessage(const AErrorMessage: String; const ACaption: String): Boolean;
var
   Answer: Integer;
begin
   Result := False;
   Answer := Application.MessageBox(PChar(AErrorMessage), PChar(ACaption), MB_ICONERROR + MB_YESNO);
   if Answer = idYes then
      Result := True
   else
      Result := False;
end;

{
   Operating system independent
   Display a warning message dialog
}
function DisplayWarningMessage(const AWarningMessage: String; const ACaption: String): Boolean;
var
   Answer: Integer;
begin
   Result := False;
   Answer := Application.MessageBox(PChar(AWarningMessage), PChar(ACaption), MB_ICONQUESTION + MB_YESNO);
   if Answer = idYes then
      Result := True
   else
      Result := False;
end;

end.

