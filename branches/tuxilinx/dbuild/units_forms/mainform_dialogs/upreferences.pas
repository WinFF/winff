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
     edtLinFFmpegExe: TEdit;
     edtLinFFplayExe: TEdit;
     edtLinTerminalToRunFFmpeg: TEdit;
     edtLinTerminalOptions: TEdit;
     edtWinFFmpegExe: TEdit;
     edtWinFFplayExe: TEdit;
     edtDefaultDestinationDirectory: TEdit;
     lblText6: TLabel;
     lblText5: TLabel;
     lblText4: TLabel;
     lblText3: TLabel;
     lblText2: TLabel;
     lblText1: TLabel;
     lblText0: TLabel;
     pclPreferences: TPageControl;
     tbsMsWindows: TTabSheet;
     tbsLinux: TTabSheet;
     tbsGeneral: TTabSheet;
     procedure btnCancelClick(Sender: TObject);
     procedure FormShow(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  PreferencesDialog: TPreferencesDialog;

implementation

{ TPreferencesDialog }

procedure TPreferencesDialog.btnCancelClick(Sender: TObject);
begin
   Close;
end;

procedure TPreferencesDialog.FormShow(Sender: TObject);
begin
   pclPreferences.ActivePage := tbsGeneral;
end;

initialization
  {$I upreferences.lrs}

end.

