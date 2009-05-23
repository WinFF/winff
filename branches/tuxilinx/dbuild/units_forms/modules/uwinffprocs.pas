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

end.

