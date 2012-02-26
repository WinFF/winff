unit Unit3; 

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
  Buttons, ExtCtrls, gettext,translations, ComCtrls;

type

  { TfrmAbout }

  TfrmAbout = class(TForm)
    Button1: TButton;
    Image1: TImage;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ListBox1: TListBox;
    PageControl1: TPageControl;
    Panel1: TPanel;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label10Click(Sender: TObject);
    procedure Label11Click(Sender: TObject);
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
  frmAbout: TfrmAbout;

implementation

uses unit1;
{ TfrmAbout }

procedure TfrmAbout.FormCreate(Sender: TObject);
begin
    // do translations
    TranslateUnitResourceStrings('unit3', PODirectory + 'winff.%s.po', unit1.Lang, unit1.FallbackLang);
    
    // fill thank you memo

    listbox1.items.Add('Translators:');
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
    listbox1.items.Add('İzzet Emre Erkan');
    listbox1.items.Add('Ellen Rohaan');
    listbox1.items.Add('Ofir Klinger');
    listbox1.items.Add('Martin Srebotnjak');
    listbox1.items.Add('Γεώργιος Γεωργάς');
    listbox1.items.add('Benny Beat');
    listbox1.items.add('Göran Hanell');
    listbox1.items.add('Muhammad Negm');
    listbox1.items.add('Pablo Ramírez');
    listbox1.items.add('Miguel Anxo Bouzada');
    listbox1.items.add('Sponga Tamas');
    listbox1.items.add('Arlindo Pereira');
    listbox1.items.add('Américo Monteiro');
    listbox1.items.add('Joe Black');
    listbox1.items.add('Göran Hannel');
    listbox1.items.add('大宝(DaBao)');
    listbox1.items.add('Alexey Osipov');
    listbox1.items.add('Launchpad contributors');

    frmAbout.Label1.Caption := StringReplace(frmAbout.Label1.Caption, '%s', '1.4.2',[]);
    frmAbout.Label2.Caption := StringReplace(frmAbout.Label2.Caption, '%s', '2006-2012',[]);

end;


procedure TfrmAbout.Label10Click(Sender: TObject);
begin
  frmMain.LaunchBrowser('http://ffmpeg.zeranoe.com/');
end;

procedure TfrmAbout.Label11Click(Sender: TObject);
begin
  frmMain.LaunchBrowser('https://launchpad.net/~paul-climbing/+archive/ppa/');
end;

procedure TfrmAbout.Label12Click(Sender: TObject);
begin
frmMain.LaunchBrowser('http://istoff.blogspot.com');
end;

procedure TfrmAbout.Label13Click(Sender: TObject);
begin
  frmMain.LaunchBrowser('http://www.bandshed.net/');
end;


procedure TfrmAbout.Button1Click(Sender: TObject);
begin
  frmAbout.close;
end;

procedure TfrmAbout.Label1Click(Sender: TObject);
begin

end;

procedure TfrmAbout.Label3Click(Sender: TObject);
begin
   frmMain.LaunchBrowser('http://www.biggmatt.com');
end;

procedure TfrmAbout.Label4Click(Sender: TObject);
begin
  frmMain.LaunchBrowser('http://www.winff.org');
end;

procedure TfrmAbout.Label5Click(Sender: TObject);
begin
end;

procedure TfrmAbout.Label7Click(Sender: TObject);
begin
  frmMain.LaunchBrowser('http://ffmpeg.org/');
end;



initialization
  {$I unit3.lrs}

end.

