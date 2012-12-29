unit Unit3;

// WInFF 1.0 Copyright 2006-2012 Matthew Weatherford
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
    btnOk: TBitBtn;
    imgLogo: TImage;
    lblStoffberg: TLabel;
    lblWinff: TLabel;
    lblGevers: TLabel;
    lblCopyright: TLabel;
    lblWeatherford: TLabel;
    lblURLWinffOrg: TLabel;
    lblFFmeg: TLabel;
    lblBellard: TLabel;
    lblURLffmpeg: TLabel;
    lbThanks: TListBox;
    PageControl1: TPageControl;
    pnlBottom: TPanel;
    pnlLogo: TPanel;
    pnlPresets: TPanel;
    tabWinff: TTabSheet;
    sbWinTab: TScrollBox;
    tabFFmpeg: TTabSheet;
    tabThanks: TTabSheet;
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lblURLzeranoeClick(Sender: TObject);
    procedure lblGeversClick(Sender: TObject);
    procedure lblStoffbergClick(Sender: TObject);
    procedure lblGmaqClick(Sender: TObject);
    procedure lblWeatherfordClick(Sender: TObject);
    procedure lblURLWinffOrgClick(Sender: TObject);
    procedure lblURLffmpegClick(Sender: TObject);

  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  frmAbout: TfrmAbout;

Resourcestring
  rsTranslators =      'Translators:' ;
  rsLaunchpadContrib = 'Launchpad contributors' ;

implementation

uses unit1;
{ TfrmAbout }

procedure TfrmAbout.FormCreate(Sender: TObject);
begin
    // do translations
    TranslateUnitResourceStrings('unit3', PODirectory + 'winff.%s.po', unit1.Lang, unit1.FallbackLang);
    
    // fill thank you memo

    lbThanks.items.Add(rsTranslators);
    lbThanks.items.Add('Nighto');
    lbThanks.items.Add('Simeon Uzunov');
    lbThanks.items.Add('Paul Gevers');
    lbThanks.items.Add('Choplair');
    lbThanks.items.Add('Kai Evers');
    lbThanks.items.Add('Roberto Boriotti');
    lbThanks.items.Add('Marcin Trybus');
    lbThanks.items.Add('Louis Torrao');
    lbThanks.items.Add('Predrag Tomasevic');
    lbThanks.items.Add('Víctor Paesa');
    lbThanks.items.Add('Chung Yu');
    lbThanks.items.Add('İzzet Emre Erkan');
    lbThanks.items.Add('Ellen Rohaan');
    lbThanks.items.Add('Ofir Klinger');
    lbThanks.items.Add('Martin Srebotnjak');
    lbThanks.items.Add('Γεώργιος Γεωργάς');
    lbThanks.items.add('Benny Beat');
    lbThanks.items.add('Göran Hanell');
    lbThanks.items.add('Muhammad Negm');
    lbThanks.items.add('Pablo Ramírez');
    lbThanks.items.add('Miguel Anxo Bouzada');
    lbThanks.items.add('Sponga Tamas');
    lbThanks.items.add('Arlindo Pereira');
    lbThanks.items.add('Américo Monteiro');
    lbThanks.items.add('Joe Black');
    lbThanks.items.add('Göran Hannel');
    lbThanks.items.add('大宝(DaBao)');
    lbThanks.items.add('Alexey Osipov');
    lbThanks.items.add(rsLaunchpadContrib);

    frmAbout.lblWinff.Caption       := StringReplace(frmAbout.lblWinff.Caption, '%s', '1.5.0',[]);
    frmAbout.lblCopyright.Caption   := StringReplace(frmAbout.lblCopyright.Caption, '%s', '2006-2012',[]);
end;


procedure TfrmAbout.lblURLzeranoeClick(Sender: TObject);
begin
  frmMain.LaunchBrowser('http://ffmpeg.zeranoe.com/');
end;

procedure TfrmAbout.lblGeversClick(Sender: TObject);
begin
  frmMain.LaunchBrowser('https://launchpad.net/~paul-climbing/+archive/ppa/');
end;

procedure TfrmAbout.lblStoffbergClick(Sender: TObject);
begin
frmMain.LaunchBrowser('http://istoff.blogspot.com');
end;

procedure TfrmAbout.lblGmaqClick(Sender: TObject);
begin
  frmMain.LaunchBrowser('http://www.bandshed.net/');
end;

procedure TfrmAbout.btnOkClick(Sender: TObject);
begin
  frmAbout.close;
end;

procedure TfrmAbout.lblWeatherfordClick(Sender: TObject);
begin
   frmMain.LaunchBrowser('http://www.biggmatt.com');
end;

procedure TfrmAbout.lblURLWinffOrgClick(Sender: TObject);
begin
  frmMain.LaunchBrowser('http://www.winff.org');
end;

procedure TfrmAbout.lblURLffmpegClick(Sender: TObject);
begin
  frmMain.LaunchBrowser('http://ffmpeg.org/');
end;



initialization
  {$I unit3.lrs}

end.

