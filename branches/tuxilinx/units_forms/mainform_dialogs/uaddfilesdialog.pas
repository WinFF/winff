unit uaddfilesdialog; 

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs; 

type
  TAddFilesDialog = class(TForm)
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  AddFilesDialog: TAddFilesDialog;

implementation

initialization
  {$I uaddfilesdialog.lrs}

end.

