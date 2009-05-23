{
   This unit is part of the WinFF project
   Copyright (c) 2006 - 2009 Matthew Weatherford
   http://www.winff.org
   Licensed under the GNU GPL v3

   The about dialog
}

unit uabout;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls, ComCtrls;

type

  { TAboutDialog }

  TAboutDialog = class(TForm)
     btnOK: TButton;
     pclAboutContent: TPageControl;
     tbsThanks: TTabSheet;
     tbsFFMpeg: TTabSheet;
     tbsWinFF: TTabSheet;
     procedure btnOKClick(Sender: TObject);
     procedure FormShow(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  AboutDialog: TAboutDialog;

implementation

{ TAboutDialog }

procedure TAboutDialog.btnOKClick(Sender: TObject);
begin
   Close;
end;

procedure TAboutDialog.FormShow(Sender: TObject);
begin
   pclAboutContent.ActivePage := tbsWinFF;
end;

initialization
  {$I uabout.lrs}

end.

