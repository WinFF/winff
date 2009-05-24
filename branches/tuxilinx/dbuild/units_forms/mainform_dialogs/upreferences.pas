{
   This unit is part of the WinFF project
   Copyright (c) 2006 - 2009 Matthew Weatherford
   http://www.winff.org
   Licensed under the GNU GPL v3

   The preferences dialog, configures the behavior of WinFF
}

unit upreferences;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls;

type

  { TPreferencesDialog }

  TPreferencesDialog = class(TForm)
     Bevel1: TBevel;
     Bevel2: TBevel;
     Bevel3: TBevel;
     btnSelectDefaultOutputDirectory: TButton;
     btnSelectWinFFmpegExe: TButton;
     btnSelectWinFFplayExe: TButton;
     btnLinSelectFFmpegExe: TButton;
     btnLinSelectFFplayExe: TButton;
     btnOK: TButton;
     btnCancel: TButton;
     cbxRememberLastUsedDirectory: TCheckBox;
     cbxEnableMultithreading: TCheckBox;
     cbxUseChcp: TCheckBox;
     cobxPriority: TComboBox;
     edtLinFFmpegExe: TEdit;
     edtLinFFplayExe: TEdit;
     edtLinTerminalToRunFFmpeg: TEdit;
     edtLinTerminalOptions: TEdit;
     edtWinFFmpegExe: TEdit;
     edtWinFFplayExe: TEdit;
     edtDefaultDestinationDirectory: TEdit;
     lblText7: TLabel;
     lblText6: TLabel;
     lblText5: TLabel;
     lblText4: TLabel;
     lblText3: TLabel;
     lblText2: TLabel;
     lblText1: TLabel;
     lblText0: TLabel;
     OpenDialog: TOpenDialog;
     pclPreferences: TPageControl;
     SelectDirectoryDialog: TSelectDirectoryDialog;
     tbsMsWindows: TTabSheet;
     tbsLinux: TTabSheet;
     tbsGeneral: TTabSheet;
     procedure btnCancelClick(Sender: TObject);
     procedure btnLinSelectFFmpegExeClick(Sender: TObject);
     procedure btnLinSelectFFplayExeClick(Sender: TObject);
     procedure btnSelectDefaultOutputDirectoryClick(Sender: TObject);
     procedure btnSelectWinFFmpegExeClick(Sender: TObject);
     procedure btnSelectWinFFplayExeClick(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormShow(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  PreferencesDialog: TPreferencesDialog;

implementation

uses
   uwinffprocs;

{ TPreferencesDialog }

procedure TPreferencesDialog.btnCancelClick(Sender: TObject);
begin
   Close;
end;

procedure TPreferencesDialog.btnLinSelectFFmpegExeClick(Sender: TObject);
begin
   if OpenDialog.Execute then
   begin
      edtLinFFmpegExe.Text := OpenDialog.FileName;
   end;
end;

procedure TPreferencesDialog.btnLinSelectFFplayExeClick(Sender: TObject);
begin
   if OpenDialog.Execute then
   begin
      edtLinFFplayExe.Text := OpenDialog.FileName;
   end;
end;

procedure TPreferencesDialog.btnSelectDefaultOutputDirectoryClick(
   Sender: TObject);
begin
   if SelectDirectoryDialog.Execute then
   begin
      edtDefaultDestinationDirectory.Text := SelectDirectoryDialog.FileName;
   end;
end;

procedure TPreferencesDialog.btnSelectWinFFmpegExeClick(Sender: TObject);
begin
   if OpenDialog.Execute then
   begin
      edtWinFFmpegExe.Text := OpenDialog.FileName;
   end;
end;

procedure TPreferencesDialog.btnSelectWinFFplayExeClick(Sender: TObject);
begin
   if OpenDialog.Execute then
   begin
      edtWinFFplayExe.Text := OpenDialog.FileName;
   end;
end;

procedure TPreferencesDialog.FormCreate(Sender: TObject);
begin
   SelectDirectoryDialog.InitialDir := uwinffprocs.GetMyDocumentsPath(Self.Handle);
   OpenDialog.InitialDir := uwinffprocs.GetMyDocumentsPath(Self.Handle);
end;

procedure TPreferencesDialog.FormShow(Sender: TObject);
begin
   pclPreferences.ActivePage := tbsGeneral;
end;

initialization
  {$I upreferences.lrs}

end.

