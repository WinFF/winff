unit uexportpreset; 

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs; 

type
  TExportPresetDialog = class(TForm)
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  ExportPresetDialog: TExportPresetDialog;

implementation

initialization
  {$I uexportpreset.lrs}

end.

