unit umain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  Menus, ComCtrls, ExtCtrls, Buttons, StdCtrls;

type

  { TMainForm }

  TMainForm = class(TForm)
     btnAdditionalOptions: TBitBtn;
     btnStartConversion: TBitBtn;
     btnPlaySelectedFile: TBitBtn;
     btnClearFileList: TBitBtn;
     btnRemoveFiles: TBitBtn;
     btnAddFiles: TBitBtn;
     ComboBox1: TComboBox;
     grpbxAdditionalOptions: TGroupBox;
     lsvFileBin: TListView;
     MainMenu: TMainMenu;
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
     StatusBar: TStatusBar;
     tbsVideoSettings: TTabSheet;
     tbsAudioSettings: TTabSheet;
     tbsAdditionalCmdLineParams: TTabSheet;
     tbsOutputSettings: TTabSheet;
     procedure FormResize(Sender: TObject);
     procedure mmiAdditionalOptionsClick(Sender: TObject);
     procedure mmiEditPresetsClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  MainForm: TMainForm;

implementation

uses
   upreseteditor;

{ TMainForm }

procedure TMainForm.mmiAdditionalOptionsClick(Sender: TObject);
begin
   pnlAdditionalSettings.Visible := not pnlAdditionalSettings.Visible;
   mmiAdditionalOptions.Checked := not mmiAdditionalOptions.Checked;
   MainForm.Repaint;
end;

procedure TMainForm.mmiEditPresetsClick(Sender: TObject);
begin
   PresetEditorDialog.ShowModal;
end;

procedure TMainForm.FormResize(Sender: TObject);
begin
   MainForm.Repaint;
end;

initialization
  {$I umain.lrs}

end.

