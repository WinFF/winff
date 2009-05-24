{
   This unit is part of the WinFF project
   Copyright (c) 2006 - 2009 Matthew Weatherford
   http://www.winff.org
   Licensed under the GNU GPL v3

   Little splash dialog
}

unit usplashdialog;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, StdCtrls;

type

  { TSplashDialog }

  TSplashDialog = class(TForm)
     Label1: TLabel;
     SplashTimer: TTimer;
     procedure SplashTimerTimer(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  SplashDialog: TSplashDialog;

implementation

{ TSplashDialog }

procedure TSplashDialog.SplashTimerTimer(Sender: TObject);
begin
   SplashTimer.Enabled := False;
end;

initialization
  {$I usplashdialog.lrs}

end.

