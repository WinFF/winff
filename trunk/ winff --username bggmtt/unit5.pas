unit Unit5; 

// WInFF 1.0 Copyright 2006-2009 Matthew Weatherford
// http://winff.org
// Licensed under the GPL v3 or any later version
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
//    You should have received a copy of the GNU General Public License
//    along with this program.  If not, see <http://www.gnu.org/licenses/>.

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ClipBrd,Buttons, gettext, translations, ExtCtrls;

type

  { TForm5 }

  TForm5 = class(TForm)
    btnClip: TButton;
    btnSave: TButton;
    Button1: TButton;
    Memo1: TMemo;
    Panel1: TPanel;
    Panel2: TPanel;
    SaveDialog1: TSaveDialog;
    procedure btnClipClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
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
  rsClip='Clipboard';
  rsClip2='Done';
  rsSave='Save';
implementation

uses unit1;

{ TForm5 }

procedure TForm5.FormCreate(Sender: TObject);
begin
TranslateUnitResourceStrings('unit5', PODirectory + 'winff.%s.po', unit1.Lang, unit1.FallbackLang);
  form5.Caption:=rsform5;
  button1.Caption:=rsbutton1;
  btnClip.Caption:=rsClip;
  btnSave.Caption:=rsSave;



end;

procedure TForm5.Button1Click(Sender: TObject);
begin
  form5.Close;
end;

procedure TForm5.btnClipClick(Sender: TObject);
begin
     Clipboard.AsText:=memo1.text; // can copy just one line, but what if its 2-pass?
     btnClip.Caption := rsClip2;
     application.processmessages;
     sleep(500);
     btnClip.Caption := rsClip;
     application.processmessages;
end;

procedure TForm5.btnSaveClick(Sender: TObject);
begin
  If SaveDialog1.execute then
  begin
       memo1.lines.savetofile(SaveDialog1.FileName);

  end;
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

