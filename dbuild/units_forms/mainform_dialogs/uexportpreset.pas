{
   This unit is part of the WinFF project
   Copyright (c) 2006 - 2009 Matthew Weatherford
   http://www.winff.org
   Licensed under the GNU GPL v3

   Export a selected preset to a file
   Eases the distribution of custom presets
}

unit uexportpreset;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, StdCtrls, ComCtrls;

type

  { TExportPresetDialog }

  TExportPresetDialog = class(TForm)
     btnExportSelectedPreset: TButton;
     btnCancel: TButton;
     grpbxPresets: TGroupBox;
     pnlMainSpacer: TPanel;
     trvAvailablePresets: TTreeView;
     procedure btnCancelClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  ExportPresetDialog: TExportPresetDialog;

implementation

{ TExportPresetDialog }

procedure TExportPresetDialog.btnCancelClick(Sender: TObject);
begin
   Close;
end;

initialization
  {$I uexportpreset.lrs}

end.

