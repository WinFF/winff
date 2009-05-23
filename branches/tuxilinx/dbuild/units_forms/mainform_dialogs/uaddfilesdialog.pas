{
   This unit is part of the WinFF project
   Copyright (c) 2006 - 2009 Matthew Weatherford
   http://www.winff.org
   Licensed under the GNU GPL v3

   Little dialog which tells the user that's actually
   happening something when adding large amounts of files
   for batch processing.

   Requires the free Lazarus component TColorProgress
   Available from the svn branch or Lazarus CCR
}

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

