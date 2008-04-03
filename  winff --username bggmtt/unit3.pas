unit Unit3; 

// WInFF 0.3 Copyright 2006-2008 Matthew Weatherford
// http://winff.org
// Licensed under the GPL v3 or any later version


{$mode objfpc}{$H+}

interface

uses
  {$ifdef win32}
  windows,
  {$endif}
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
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Notebook1: TNotebook;
    Page1: TPage;
    Page2: TPage;
    Page3: TPage;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure Label7Click(Sender: TObject);
    procedure Notebook1ChangeBounds(Sender: TObject);
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
begin
    TranslateUnitResourceStrings('unit3', PODirectory + 'winff.%s.po', unit1.Lang, unit1.FallbackLang);
    button1.caption:=rsButton1;
    page1.caption:=rsPage1;
    page2.caption:=rsPage2;
    page3.caption:=rsPage3;
    form3.caption:=rsform3;
    label8.caption:=rslabel8;

end;

procedure TForm3.Button1Click(Sender: TObject);
begin
  form3.close;
end;

procedure TForm3.Label1Click(Sender: TObject);
begin

end;

procedure TForm3.Label4Click(Sender: TObject);
begin
  {$ifdef win32}
  ShellExecute(form3.handle,'open','http://ffmpeg.mplayerhq.hu/',nil,nil, SW_SHOWNORMAL);
  {$endif}
end;

procedure TForm3.Label5Click(Sender: TObject);
begin
  {$ifdef win32}
  ShellExecute(form3.handle,'open','http://www.biggmatt.com',nil,nil, SW_SHOWNORMAL);
  {$endif}
end;

procedure TForm3.Label7Click(Sender: TObject);
begin
  {$ifdef win32}
  ShellExecute(form3.handle,'open','http://arrozcru.no-ip.org/ffmpeg',nil,nil, SW_SHOWNORMAL);
  {$endif}
end;

procedure TForm3.Notebook1ChangeBounds(Sender: TObject);
begin

end;

initialization
  {$I unit3.lrs}

end.

