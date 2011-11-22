unit Unit4; 

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
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs, Buttons,
  ExtCtrls, StdCtrls, gettext, translations;

type

  { TfrmPreferences }

  TfrmPreferences = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    edtThreads: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Notebook1: TNotebook;
    OpenDialog1: TOpenDialog;
    Page1: TPage;
    Page2: TPage;
    Page3: TPage;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    pnlBottom: TPanel;
    prioritybox: TComboBox;
    SelectDirectoryDialog1: TSelectDirectoryDialog;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure edtThreadsChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  frmPreferences: TfrmPreferences;

resourcestring
    rspriorityhigh='High';
    rsprioritynormal='Normal';
    rspriorityidle='Idle';

implementation

uses unit1;
{ TfrmPreferences }

// load preferences
procedure TfrmPreferences.FormCreate(Sender: TObject);

begin
    TranslateUnitResourceStrings('unit4', PODirectory + 'winff.%s.po', unit1.Lang, unit1.FallbackLang);
    prioritybox.Items.Add(rspriorityhigh);
    prioritybox.Items.Add(rsprioritynormal);
    prioritybox.Items.Add(rspriorityidle);
  {$ifdef win32}
   edit2.Text:= frmMain.getconfigvalue('win32/ffmpeg');
   edit3.Text:= frmMain.getconfigvalue('win32/ffplay');
   if frmMain.getconfigvalue('win32/chcp') = 'true' then
     checkbox2.Checked := true
  else
     checkbox2.Checked := false;
  {$endif}
  {$ifdef unix}

   edit4.Text:= frmMain.getconfigvalue('unix/ffmpeg');
   edit5.Text:= frmMain.getconfigvalue('unix/ffplay');
   edit6.Text:= frmMain.getconfigvalue('unix/terminal');
   edit7.Text:= frmMain.getconfigvalue('unix/termoptions');
  {$endif}

  edit1.Text:= frmMain.getconfigvalue('general/destfolder');


  if frmMain.getconfigvalue('general/rememberlast') = 'true' then
     checkbox1.Checked := true
  else
     checkbox1.Checked := false;

  if frmMain.getconfigvalue('general/multithreading') = 'true' then
     checkbox3.Checked := true
  else
     checkbox3.Checked := false;
  edtthreads.Text:= frmMain.getconfigvalue('general/numberofthreads');

  prioritybox.Text := frmMain.getconfigvalue('general/priority');
end;

// save preference
procedure TfrmPreferences.Button1Click(Sender: TObject);

begin
  frmMain.setconfigvalue('general/destfolder',edit1.text);
  frmMain.DestFolder.Text := edit1.text;
  
  if checkbox1.Checked then
   begin
    frmMain.setconfigvalue('general/rememberlast','true');
    unit1.rememberlast:='true';
   end
  else
   begin
    frmMain.setconfigvalue('general/rememberlast','false');
    unit1.rememberlast:='false';
   end;

  if checkbox3.Checked then
   begin
    frmMain.setconfigvalue('general/multithreading','true');
    unit1.multithreading:='true';
   end
  else
   begin
    frmMain.setconfigvalue('general/multithreading','false');
    unit1.multithreading:='false';
   end;
  edtthreads.Text:=trim(edtthreads.Text);
  frmMain.setconfigvalue('general/numberofthreads', edtthreads.Text);

  frmMain.setconfigvalue('general/priority', prioritybox.Text);

  edit1.Text := trim(edit1.Text);
  edit2.Text := trim(edit2.Text);
  edit3.Text := trim(edit3.Text);
  edit4.Text := trim(edit4.Text);
  edit5.Text := trim(edit5.Text);
  edit6.Text := trim(edit6.Text);
  edit7.Text := trim(edit7.Text);

  {$ifdef win32}
  if edit2.Text ='' then
   edit2.Text := unit1.extrasPath + 'ffmpeg.exe';
  if edit3.Text ='' then
   edit3.Text := unit1.extrasPath + 'ffplay.exe';

  unit1.ffmpeg := edit2.text;
  unit1.ffplay := edit3.text;
  frmMain.setconfigvalue('win32/ffmpeg',edit2.text);
  frmMain.setconfigvalue('win32/ffplay',edit3.text);
  
  if checkbox2.Checked then
   begin
    frmMain.setconfigvalue('win32/chcp','true');
    unit1.usechcp:='true';
   end
  else
   begin
    frmMain.setconfigvalue('win32/chcp','false');
    unit1.usechcp:='false';
   end;
  {$endif}

  {$ifdef unix}
  if edit4.Text ='' then
   edit4.Text := '/usr/bin/ffmpeg';
  if edit5.Text ='' then
   edit5.Text := '/usr/bin/ffplay';
  if edit6.Text ='' then
   edit6.Text := '/usr/bin/xterm';

  unit1.ffmpeg := edit4.text;
  unit1.ffplay := edit5.text;
  unit1.terminal :=edit6.text;
  unit1.termoptions := edit7.text;
  frmMain.setconfigvalue('unix/ffmpeg',edit4.text);
  frmMain.setconfigvalue('unix/ffplay',edit5.text);
  frmMain.setconfigvalue('unix/terminal',edit6.text);
  frmMain.setconfigvalue('unix/termoptions',edit7.text);
  {$endif}
  

  frmPreferences.close;

end;

procedure TfrmPreferences.Button3Click(Sender: TObject);
begin
 if selectdirectorydialog1.Execute then
    edit1.Text := selectdirectorydialog1.FileName;
end;

procedure TfrmPreferences.Button2Click(Sender: TObject);
begin
  frmPreferences.close;
end;

procedure TfrmPreferences.Button4Click(Sender: TObject);
begin
  if opendialog1.Execute then
    edit2.Text := opendialog1.FileName;
end;

procedure TfrmPreferences.Button5Click(Sender: TObject);
begin
   if opendialog1.Execute then
    edit3.Text := opendialog1.FileName;
end;

procedure TfrmPreferences.Button6Click(Sender: TObject);
begin
  if opendialog1.Execute then
    edit4.Text := opendialog1.FileName;
end;

procedure TfrmPreferences.Button7Click(Sender: TObject);
begin
  if opendialog1.Execute then
    edit5.Text := opendialog1.FileName;
end;

procedure TfrmPreferences.Button8Click(Sender: TObject);
begin
   if opendialog1.Execute then
    edit6.Text := opendialog1.FileName;
end;

procedure TfrmPreferences.edtThreadsChange(Sender: TObject);
begin

end;


initialization
  {$I unit4.lrs}

end.

