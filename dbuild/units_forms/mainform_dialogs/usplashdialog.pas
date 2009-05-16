unit usplashdialog;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  ExtCtrls;

type

  { TSplashDialog }

  TSplashDialog = class(TForm)
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

