unit uaddfilesdialog; 

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, StdCtrls, ColorProgress;

type

  { TAddFilesDialog }

  TAddFilesDialog = class(TForm)
     lblProgress: TLabel;
     prgProgress: TColorProgress;
     lblText0: TLabel;
     pnlMain: TPanel;
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

