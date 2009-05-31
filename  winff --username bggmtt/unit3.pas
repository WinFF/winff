unit Unit3; 

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
  Buttons, ExtCtrls, gettext,translations;

type

  { TForm3 }

  TForm3 = class(TForm)
    Button1: TButton;
    Image1: TImage;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ListBox1: TListBox;
    Notebook1: TNotebook;
    Page1: TPage;
    Page2: TPage;
    Page3: TPage;
    Panel1: TPanel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label10Click(Sender: TObject);
    procedure Label12Click(Sender: TObject);
    procedure Label13Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure Label7Click(Sender: TObject);

  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  Form3: TForm3; 

Resourcestring
    rsButton1='OK';
    rsPage1='WinFF';
    rsPage2='FFmpeg';
    rsPage3='Thanks';
    rsform3='About WinFF';
    rslabel8='FFmpeg builds by';

implementation

uses unit1;
{ TForm3 }

procedure TForm3.FormCreate(Sender: TObject);
begin                  // do translations
    TranslateUnitResourceStrings('unit3', PODirectory + 'winff.%s.po', unit1.Lang, unit1.FallbackLang);
    button1.caption:=rsButton1;
    page1.caption:=rsPage1;
    page2.caption:=rsPage2;
    page3.caption:=rsPage3;
    form3.caption:=rsform3;
    label8.caption:=rslabel8;
    
                     // fill thank you memo

    listbox1.items.Add('Translators');
    listbox1.items.Add('Nighto');
    listbox1.items.Add('Simeon Uzunov');
    listbox1.items.Add('Paul Gevers');
    listbox1.items.Add('Choplair');
    listbox1.items.Add('Kai Evers');
    listbox1.items.Add('Roberto Boriotti');
    listbox1.items.Add('Marcin Trybus');
    listbox1.items.Add('Louis Torrao');
    listbox1.items.Add('Predrag Tomasevic');
    listbox1.items.Add('Víctor Paesa');
    listbox1.items.Add('Chung Yu');
    listbox1.items.Add('Emre Erkan');
    listbox1.items.Add('Ellen Rohaan');
    listbox1.items.Add('Ofir Klinger');
    listbox1.items.Add('Γεώργιος Γεωργάς');
    listbox1.items.Add('Martin Srebotnjak');

    listbox1.items.Add('');
    listbox1.items.Add('Iconsdesigns.com for their NeuvoXT 2 GPL Icons');
    listbox1.items.Add('');
    listbox1.items.Add('Thanks to all the users');


end;

procedure TForm3.Label10Click(Sender: TObject);
begin
  form1.LaunchBrowser('http://ffmpeg.arrozcru.org/');
end;

procedure TForm3.Label12Click(Sender: TObject);
begin
form1.LaunchBrowser('http://www.stoffberg.com');
end;

procedure TForm3.Label13Click(Sender: TObject);
begin
  form1.LaunchBrowser('http://www.bandshed.net/');
end;


procedure TForm3.Button1Click(Sender: TObject);
begin
  form3.close;
end;

procedure TForm3.Label1Click(Sender: TObject);
begin

end;

procedure TForm3.Label3Click(Sender: TObject);
begin
   form1.LaunchBrowser('http://www.biggmatt.com');
end;

procedure TForm3.Label4Click(Sender: TObject);
begin
  form1.LaunchBrowser('http://www.winff.org');
end;

procedure TForm3.Label5Click(Sender: TObject);
begin
end;

procedure TForm3.Label7Click(Sender: TObject);
begin
  form1.LaunchBrowser('http://ffmpeg.org/');
end;



initialization
  {$I unit3.lrs}

end.

