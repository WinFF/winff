unit unit6;

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
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls, dom, xmlwrite, gettext, translations;

type

  { TForm6 }

  TForm6 = class(TForm)
    cancelbtn: TButton;
    exportbtn: TButton;
    Label1: TLabel;
    ListBox1: TListBox;
    savedialog1: TSavedialog;
    procedure cancelbtnClick(Sender: TObject);
    procedure exportbtnClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  Form6: TForm6; 

Resourcestring
    rsform6='Export Presets';
    rsexportbtn='Export';
    rscancelbtn='Cancel';
    rslabel1='Choose presets to export';

implementation

uses unit1;

{ TForm6 }

procedure TForm6.FormShow(Sender: TObject);
var
i:integer;
node,subnode: tdomnode;
begin

   TranslateUnitResourceStrings('unit6', PODirectory + 'winff.%s.po', unit1.Lang, unit1.FallbackLang);

   form6.caption:=rsform6;
   exportbtn.Caption:=rsexportbtn;
   cancelbtn.Caption:=rscancelbtn;
   label1.Caption:=rslabel1;

   for i:= 0 to presets.ChildNodes.Count -1  do
   begin
    node:= presets.ChildNodes.item[i];
    subnode:= node.FindNode('label');
    listbox1.items.add(subnode.findnode('#text').NodeValue);
   end;
end;

procedure TForm6.FormResize(Sender: TObject);
begin
  exportbtn.Top:=form6.Height-40;
  exportbtn.Left:=form6.Width-179;
  cancelbtn.Top:=form6.Height-40;
  cancelbtn.Left:=form6.Width-91;
  listbox1.Width:=form6.Width-37;
  listbox1.Height:=form6.Height-88;
end;

procedure TForm6.cancelbtnClick(Sender: TObject);
begin
  form6.close;
end;

procedure TForm6.exportbtnClick(Sender: TObject);
var
exportfile: txmldocument;
exportpreset: tdomelement;
node,subnode,newnode: tdomnode;
exlabel,exparams,exext,excat: string;
i,j:integer;
pn,selectedtext:string;
begin

exportfile := txmldocument.Create;
exportpreset:= exportfile.CreateElement('presets');
exportfile.AppendChild(exportpreset);

for i := 0 to listbox1.Count-1 do
  begin

   if listbox1.Selected[i] then
     begin

      selectedtext:= listbox1.Items[i];
      for j:= 0 to presets.childnodes.count -1 do  // find the preset name
        begin
          node := presets.childnodes.item[j];
          subnode:= node.FindNode('label');
          if selectedtext = subnode.findnode('#text').nodevalue then
          pn := node.nodename;
        end;

      if pn = '' then
       begin
         showmessage(rsPresettoExport);
         exit;
       end;

      exlabel := presets.FindNode(pn).FindNode('label').FindNode('#text').NodeValue;
      exparams := presets.FindNode(pn).FindNode('params').FindNode('#text').NodeValue;
      exext := presets.FindNode(pn).FindNode('extension').FindNode('#text').NodeValue;
      excat := presets.FindNode(pn).FindNode('category').FindNode('#text').NodeValue;

      newnode := exportfile.CreateElement(pn);
      exportpreset.AppendChild(newnode);

      newnode := exportfile.CreateElement('label');
      exportpreset.FindNode(pn).AppendChild(newnode);
      newnode := exportfile.CreateElement('params');
      exportpreset.FindNode(pn).AppendChild(newnode);
      newnode := exportfile.CreateElement('extension');
      exportpreset.FindNode(pn).AppendChild(newnode);
      newnode := exportfile.CreateElement('category');
      exportpreset.FindNode(pn).AppendChild(newnode);

      newnode := exportfile.CreateTextNode(exlabel);
      exportpreset.FindNode(pn).FindNode('label').AppendChild(newnode);
      newnode := exportfile.CreateTextNode(exparams);
      exportpreset.FindNode(pn).FindNode('params').AppendChild(newnode);
      newnode := exportfile.CreateTextNode(exext);
      exportpreset.FindNode(pn).FindNode('extension').AppendChild(newnode);
      newnode := exportfile.CreateTextNode(excat);
      exportpreset.FindNode(pn).FindNode('category').AppendChild(newnode);

     end;

   end;

  savedialog1.FileName:=pn + '.wff';
  if not savedialog1.Execute then
      exit;

  writexmlfile(exportfile,savedialog1.FileName);

  form6.close;

end;

initialization
  {$I unit6.lrs}

end.

