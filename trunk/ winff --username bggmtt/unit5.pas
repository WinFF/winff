unit Unit5; 

// WInFF 1.0 Copyright 2006-2009 Matthew Weatherford
// WinFF 1.3.2 Copyright 2011 Alexey Osipov <lion-simba@pridelands.ru>
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
  ClipBrd,Buttons, gettext, ExtCtrls;

type

  { TfrmScript }

  TfrmScript = class(TForm)
    btnClip: TButton;
    btnClose: TButton;
    btnRun: TButton;
    btnSave: TButton;
    Memo1: TMemo;
    Panel1: TPanel;
    SaveDialog1: TSaveDialog;
    procedure btnClipClick(Sender: TObject);
    procedure btnRunClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
    scriptfilename : string;
  end; 

var
  frmScript: TfrmScript;

implementation

uses unit1;

{ TfrmScript }

procedure TfrmScript.FormCreate(Sender: TObject);
begin

end;

procedure TfrmScript.btnCloseClick(Sender: TObject);
begin
  frmScript.Close;
end;

procedure TfrmScript.btnClipClick(Sender: TObject);
begin
     Clipboard.AsText:=memo1.text; // can copy just one line, but what if its 2-pass?
     {
     application.processmessages;
     sleep(500);
     application.processmessages;
     }
end;

procedure TfrmScript.btnRunClick(Sender: TObject);
begin
  Memo1.lines.SaveToFile(ScriptFilename);
end;

procedure TfrmScript.btnSaveClick(Sender: TObject);
begin
  If SaveDialog1.execute then
  begin
       memo1.lines.savetofile(SaveDialog1.FileName);

  end;
end;

procedure TfrmScript.FormResize(Sender: TObject);
begin
  if frmScript.Width < 100 then frmScript.width:=100;
  if frmScript.height < 150 then frmScript.height:=150;
  memo1.Height:= frmScript.Height -56;
  memo1.width:= frmScript.width -20;
  // btnClose position determined by panels
  // btnClose.Left:=frmScript.Width div 2 - 36;
  // btnClose.top:=frmScript.Height-40;
end;

initialization
  {$I unit5.lrs}

end.

