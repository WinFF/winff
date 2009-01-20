unit Unit5; 

// WInFF 0.3 Copyright 2006-2008 Matthew Weatherford
// http://winff.org
// Licensed under the GPL v3 or any later version

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Buttons, gettext, translations;

type

  { TForm5 }

  TForm5 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  Form5: TForm5; 

Resourcestring
  rsform5='FFmpeg Command Line';
  rsbutton1='OK';
  
implementation

uses unit1;

{ TForm5 }

procedure TForm5.FormCreate(Sender: TObject);
begin
TranslateUnitResourceStrings('unit5', PODirectory + 'winff.%s.po', unit1.Lang, unit1.FallbackLang);
  form5.Caption:=rsform5;
  button1.Caption:=rsbutton1;


end;

procedure TForm5.Button1Click(Sender: TObject);
begin
  form5.Close;
end;

procedure TForm5.FormResize(Sender: TObject);
begin
  if form5.Width < 100 then form5.width:=100;
  if form5.height < 150 then form5.height:=150;
  memo1.Height:= form5.Height -56;
  memo1.width:= form5.width -20;
  button1.Left:=form5.Width div 2 - 36;
  button1.top:=form5.Height-40;
end;

initialization
  {$I unit5.lrs}

end.

