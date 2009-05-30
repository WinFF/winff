{
   This unit is part of the WinFF project
   Copyright (c) 2006 - 2009 Matthew Weatherford
   http://www.winff.org
   Licensed under the GNU GPL v3

   MainForm, the main user interface
}

unit umain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  Menus, ComCtrls, ExtCtrls, Buttons, StdCtrls;

type

  { TMainForm }

  TMainForm = class(TForm)
     Bevel1: TBevel;
     btnAdditionalOptions: TBitBtn;
     btnStartConversion: TBitBtn;
     btnPlaySelectedFile: TBitBtn;
     btnClearFileList: TBitBtn;
     btnRemoveFiles: TBitBtn;
     btnAddFiles: TBitBtn;
     btnSelectOutputFolder: TButton;
     cbx2PassEncoding: TCheckBox;
     cbxDeinterlance: TCheckBox;
     cobxConvertTo: TComboBox;
     cobxDevicePreset: TComboBox;
     edtVideoAspectRatio: TEdit;
     edtVideoSizeHeight: TEdit;
     edtVideoSizeWidth: TEdit;
     edtVideoFramerate: TEdit;
     edtVideoBitrate: TEdit;
     edtAudioChannels: TEdit;
     edtAudioSampleRate: TEdit;
     edtAudioBitrate: TEdit;
     edtExtraCommandLine: TEdit;
     edtOutputFolder: TEdit;
     grpbxAdditionalOptions: TGroupBox;
     lblText16: TLabel;
     lblText15: TLabel;
     lblText14: TLabel;
     lblText13: TLabel;
     lblText12: TLabel;
     lblText11: TLabel;
     lblText10: TLabel;
     lblText9: TLabel;
     lblText8: TLabel;
     lblText7: TLabel;
     lblText6: TLabel;
     lblText5: TLabel;
     lblText4: TLabel;
     lblText3: TLabel;
     lblText1: TLabel;
     lblText0: TLabel;
     lblText2: TLabel;
     lsvFileBin: TListView;
     MainMenu: TMainMenu;
     pumDeleteAllFiles: TMenuItem;
     pumSpacer0: TMenuItem;
     pumDeleteSelectedFile: TMenuItem;
     mmiAbout: TMenuItem;
     mmiSpacer0: TMenuItem;
     mmiForums: TMenuItem;
     mmiWinffWebsite: TMenuItem;
     mmiShutdownOnFinish: TMenuItem;
     mmiPauseOnFinish: TMenuItem;
     mmiDisplayCmdLine: TMenuItem;
     mmiPreferences: TMenuItem;
     mmiEdit: TMenuItem;
     mmiOptions: TMenuItem;
     mmiHelp: TMenuItem;
     mmiEditPresets: TMenuItem;
     mmiAdditionalOptions: TMenuItem;
     mmiDocumentation: TMenuItem;
     mmiQuit: TMenuItem;
     mmiFile: TMenuItem;
     pclAdditionalOptions: TPageControl;
     pclOutputSettings: TPageControl;
     pnlOutputSettings: TPanel;
     pnlFileContainer: TPanel;
     pnlMiddleSpacer: TPanel;
     pnlAdditionalSettings: TPanel;
     pnlMainSpacer: TPanel;
     pnlTopToolbar: TPanel;
     pumFileBin: TPopupMenu;
     SelectDirectoryDialog: TSelectDirectoryDialog;
     StatusBar: TStatusBar;
     tbsVideoSettings: TTabSheet;
     tbsAudioSettings: TTabSheet;
     tbsAdditionalCmdLineParams: TTabSheet;
     tbsOutputSettings: TTabSheet;
     procedure btnAdditionalOptionsClick(Sender: TObject);
     procedure btnSelectOutputFolderClick(Sender: TObject);
     procedure edtAudioBitrateChange(Sender: TObject);
     procedure edtAudioBitrateKeyPress(Sender: TObject; var Key: char);
     procedure edtAudioChannelsChange(Sender: TObject);
     procedure edtAudioChannelsKeyPress(Sender: TObject; var Key: char);
     procedure edtAudioSampleRateChange(Sender: TObject);
     procedure edtAudioSampleRateKeyPress(Sender: TObject; var Key: char);
     procedure edtVideoAspectRatioChange(Sender: TObject);
     procedure edtVideoAspectRatioKeyPress(Sender: TObject; var Key: char);
     procedure edtVideoBitrateChange(Sender: TObject);
     procedure edtVideoBitrateKeyPress(Sender: TObject; var Key: char);
     procedure edtVideoFramerateChange(Sender: TObject);
     procedure edtVideoFramerateKeyPress(Sender: TObject; var Key: char);
     procedure edtVideoSizeHeightChange(Sender: TObject);
     procedure edtVideoSizeHeightKeyPress(Sender: TObject; var Key: char);
     procedure edtVideoSizeWidthChange(Sender: TObject);
     procedure edtVideoSizeWidthKeyPress(Sender: TObject; var Key: char);
     procedure FormCreate(Sender: TObject);
     procedure FormDropFiles(Sender: TObject; const FileNames: array of String);
     procedure FormResize(Sender: TObject);
     procedure mmiAboutClick(Sender: TObject);
     procedure mmiAdditionalOptionsClick(Sender: TObject);
     procedure mmiDisplayCmdLineClick(Sender: TObject);
     procedure mmiEditPresetsClick(Sender: TObject);
     procedure mmiForumsClick(Sender: TObject);
     procedure mmiPauseOnFinishClick(Sender: TObject);
     procedure mmiPreferencesClick(Sender: TObject);
     procedure mmiQuitClick(Sender: TObject);
     procedure mmiShutdownOnFinishClick(Sender: TObject);
     procedure mmiWinffWebsiteClick(Sender: TObject);
     procedure pumDeleteAllFilesClick(Sender: TObject);
     procedure pumDeleteSelectedFileClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  MainForm: TMainForm;

implementation

uses
   upreseteditor, uabout, upreferences, uwinffprocs;

{ TMainForm }

procedure TMainForm.mmiAdditionalOptionsClick(Sender: TObject);
begin
   pnlAdditionalSettings.Visible := not pnlAdditionalSettings.Visible;
   mmiAdditionalOptions.Checked := not mmiAdditionalOptions.Checked;
   MainForm.Repaint;
end;

procedure TMainForm.mmiDisplayCmdLineClick(Sender: TObject);
begin
   mmiDisplayCmdLine.Checked := not mmiDisplayCmdLine.Checked;
end;

procedure TMainForm.mmiEditPresetsClick(Sender: TObject);
begin
   PresetEditorDialog.ShowModal;
end;

procedure TMainForm.mmiForumsClick(Sender: TObject);
begin
   uwinffprocs.LaunchURL(Self.Handle, 'http://www.winff.org/forums/');
end;

procedure TMainForm.mmiPauseOnFinishClick(Sender: TObject);
begin
   mmiPauseOnFinish.Checked := not mmiPauseOnFinish.Checked;
end;

procedure TMainForm.mmiPreferencesClick(Sender: TObject);
begin
   PreferencesDialog.ShowModal;
end;

procedure TMainForm.mmiQuitClick(Sender: TObject);
begin
   Close;
end;

procedure TMainForm.mmiShutdownOnFinishClick(Sender: TObject);
begin
   mmiShutdownOnFinish.Checked := not mmiShutdownOnFinish.Checked;
end;

procedure TMainForm.mmiWinffWebsiteClick(Sender: TObject);
begin
   uwinffprocs.LaunchURL(Self.Handle, 'http://www.winff.org');
end;

procedure TMainForm.pumDeleteAllFilesClick(Sender: TObject);
begin
   if (lsvFileBin.Selected = nil) then
      Exit
   else
   begin
      if uwinffprocs.DisplayWarningMessage('Do you want to delete ' + IntToStr(lsvFileBin.Items.Count) + ' files from the list?', 'Are you sure?') then
         lsvFileBin.Items.Clear;
      StatusBar.Panels[0].Text := 'Total files: ' + IntToStr(lsvFileBin.Items.Count);
   end;
end;

procedure TMainForm.pumDeleteSelectedFileClick(Sender: TObject);
begin
   if (lsvFileBin.Selected = nil) then
      Exit
   else
   begin
      if uwinffprocs.DisplayWarningMessage('Do you want to delete: ' + ExtractFileName(lsvFileBin.Selected.Caption) + ' from the list?', 'Are you sure?') then
         lsvFileBin.Selected.Delete;
      StatusBar.Panels[0].Text := 'Total files: ' + IntToStr(lsvFileBin.Items.Count);
   end;
end;

procedure TMainForm.FormResize(Sender: TObject);
begin
   MainForm.Repaint;
end;

procedure TMainForm.mmiAboutClick(Sender: TObject);
begin
   AboutDialog.Caption := 'About ' + MainForm.Caption;
   AboutDialog.ShowModal;
end;

procedure TMainForm.btnAdditionalOptionsClick(Sender: TObject);
begin
   mmiAdditionalOptions.Click;
end;

procedure TMainForm.btnSelectOutputFolderClick(Sender: TObject);
begin
   if SelectDirectoryDialog.Execute then
   begin
      edtOutputFolder.Text := SelectDirectoryDialog.FileName;
   end;
end;

procedure TMainForm.edtAudioBitrateChange(Sender: TObject);
begin
   uwinffprocs.ResetEditField(edtAudioBitrate, False, '');
end;

procedure TMainForm.edtAudioBitrateKeyPress(Sender: TObject; var Key: char);
begin
   if not uwinffprocs.ValidateNumericInput(edtAudioBitrate, Key) then
      Key := #0;
end;

procedure TMainForm.edtAudioChannelsChange(Sender: TObject);
begin
   uwinffprocs.ResetEditField(edtAudioChannels, False, '');
end;

procedure TMainForm.edtAudioChannelsKeyPress(Sender: TObject; var Key: char);
begin
   if not uwinffprocs.ValidateNumericInput(edtAudioChannels, Key) then
      Key := #0;
end;

procedure TMainForm.edtAudioSampleRateChange(Sender: TObject);
begin
   uwinffprocs.ResetEditField(edtAudioSampleRate, False, '');
end;

procedure TMainForm.edtAudioSampleRateKeyPress(Sender: TObject; var Key: char);
begin
   if not uwinffprocs.ValidateNumericInput(edtAudioSampleRate, Key) then
      Key := #0;
end;

procedure TMainForm.edtVideoAspectRatioChange(Sender: TObject);
begin
   uwinffprocs.ResetEditField(edtVideoAspectRatio, False, '');
end;

procedure TMainForm.edtVideoAspectRatioKeyPress(Sender: TObject; var Key: char);
begin
   if not uwinffprocs.ValidateNumericInput(edtVideoAspectRatio, Key) then
      Key := #0;
end;

procedure TMainForm.edtVideoBitrateChange(Sender: TObject);
begin
   uwinffprocs.ResetEditField(edtVideoBitrate, False, '');
end;

procedure TMainForm.edtVideoBitrateKeyPress(Sender: TObject; var Key: char);
begin
   if not uwinffprocs.ValidateNumericInput(edtVideoBitrate, Key) then
      Key := #0;
end;

procedure TMainForm.edtVideoFramerateChange(Sender: TObject);
begin
   uwinffprocs.ResetEditField(edtVideoFramerate, False, '');
end;

procedure TMainForm.edtVideoFramerateKeyPress(Sender: TObject; var Key: char);
begin
   if not uwinffprocs.ValidateNumericInput(edtVideoFramerate, Key) then
      Key := #0;
end;

procedure TMainForm.edtVideoSizeHeightChange(Sender: TObject);
begin
   uwinffprocs.ResetEditField(edtVideoSizeHeight, False, '');
end;

procedure TMainForm.edtVideoSizeHeightKeyPress(Sender: TObject; var Key: char);
begin
   if not uwinffprocs.ValidateNumericInput(edtVideoSizeHeight, Key) then
      Key := #0;
end;

procedure TMainForm.edtVideoSizeWidthChange(Sender: TObject);
begin
   uwinffprocs.ResetEditField(edtVideoSizeWidth, False, '');
end;

procedure TMainForm.edtVideoSizeWidthKeyPress(Sender: TObject; var Key: char);
begin
   if not uwinffprocs.ValidateNumericInput(edtVideoSizeWidth, Key) then
      Key := #0;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
   SelectDirectoryDialog.InitialDir := uwinffprocs.GetMyDocumentsPath(Self.Handle);
end;

procedure TMainForm.FormDropFiles(Sender: TObject; const FileNames: array of String);
var
   NumFiles, I: Integer;
begin
   NumFiles := High(FileNames);
   for I := 0 to NumFiles do
   begin
      {
         TODO
         Perform a check here if the dropped filetype
         is actually supported by ffmpeg
      }
      uwinffprocs.FillListView(lsvFileBin, FileNames[I]);
   end;
   StatusBar.Panels[0].Text := 'Total files: ' + IntToStr(lsvFileBin.Items.Count);
end;

initialization
  {$I umain.lrs}

end.

