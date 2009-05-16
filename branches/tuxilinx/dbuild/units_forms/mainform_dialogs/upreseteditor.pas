unit upreseteditor; 

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, Buttons, StdCtrls, ComCtrls;

type

  { TPresetEditorDialog }

  TPresetEditorDialog = class(TForm)
     btnSave: TBitBtn;
     btnCancel: TBitBtn;
     btnExport: TBitBtn;
     btnImport: TBitBtn;
     btnAddUpdate: TButton;
     btnDelete: TButton;
     edtOutputExtension: TEdit;
     edtPresetLabel: TEdit;
     edtPresetCategory: TEdit;
     edtPresetCommandLine: TEdit;
     edtPresetName: TEdit;
     grpbxPresetEditor: TGroupBox;
     lblText2: TLabel;
     lblText1: TLabel;
     lblText3: TLabel;
     lblText4: TLabel;
     lblText0: TLabel;
     pnlMiddleSpacer: TPanel;
     pnlBottom: TPanel;
     pnlTopToolbar: TPanel;
     trvAvailablePresets: TTreeView;
     procedure btnCancelClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  PresetEditorDialog: TPresetEditorDialog;

implementation

uses
   uexportpreset;

{ TPresetEditorDialog }

procedure TPresetEditorDialog.btnCancelClick(Sender: TObject);
begin
   Close;
end;

initialization
  {$I upreseteditor.lrs}

end.

