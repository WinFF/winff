unit Unit2;

// Presets form

// WinFF Copyright 2006-2012 Matthew Weatherford
// WinFF 1.3.2 Copyright 2011 Alexey Osipov <lion-simba@pridelands.ru>
// http://winff.org
// Licensed under the GPL v3 or any later version

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.

{$mode objfpc}{$H+}

interface

uses
    Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs,
    StdCtrls, Buttons, dom, xmlwrite, xmlread, gettext, translations, ExtCtrls,
    XMLConf;

type
    TfrmEditPresets = class(TForm)
        addpresetbtn: TButton;
        CancelBtn: TButton;
        DeleteBtn: TButton;
        Edit1: TEdit;
        Edit2: TEdit;
        Edit3: TEdit;
        Edit4: TEdit;
        Edit5: TEdit;
        export: TButton;
        import: TButton;
        Label1: TLabel;
        Label2: TLabel;
        Label3: TLabel;
        Label4: TLabel;
        Label5: TLabel;
        Label6: TLabel;
        lbCategory: TListBox;
        ListBox1: TListBox;
        OKbtn: TButton;
        OpenDialog1: TOpenDialog;
        pnlRight2: TPanel;
        pnlRight1: TPanel;
        pnlLeft: TPanel;
        pnlSettings: TPanel;
        pnlTop: TPanel;
        pnlBottom: TPanel;
        SaveDialog1: TSaveDialog;
        sbPresets: TScrollBox;
        Splitter1: TSplitter;
        XMLConfig1: TXMLConfig;
        procedure addpresetbtnClick(Sender: TObject);
        procedure CancelBtnClick(Sender: TObject);
        procedure DeleteBtnClick(Sender: TObject);
        procedure FormShow(Sender: TObject);
        procedure exportClick(Sender: TObject);
        procedure importClick(Sender: TObject);
        procedure lbCategoryClick(Sender: TObject);
        procedure ListBox1Click(Sender: TObject);
        procedure OKbtnClick(Sender: TObject);
        procedure ValidateFields(var isOkay : Boolean);
        procedure RefreshPresetsBox;

    private
        { private declarations }
    public
        { public declarations }
    end;

var
    frmEditPresets: TfrmEditPresets;
    pn:string;
    shown: boolean;

resourcestring
    rsimportpresets         = 'Import Presets';
    rsYouMustEnterNmae      = 'You must enter a name.';
    rsYouMustEnterLabel     = 'You must enter a label.';
    rsYouMustEnterExtension = 'You must enter the extension.';
    rsUpdatePreset          = 'Update Preset:';
    rsLabelMustBeUnique     = 'Label must be unique.';
    rsCreatePreset          = 'Create Preset:';
    rsRemovePreset          = 'Remove Preset:';


implementation

uses unit1,unit6;

// get setup
procedure TfrmEditPresets.FormShow(Sender: TObject);
begin
    TranslateUnitResourceStrings('unit2', PODirectory + 'winff.%s.po', unit1.Lang, unit1.FallbackLang);
    lbCategory.Clear;
    lbCategory.Items.AddStrings(frmMain.categorybox.Items);
end;

// Get the selected preset's information
procedure TfrmEditPresets.ListBox1Click(Sender: TObject);
var
    i:integer;
    selectedtext :string;
    node,subnode: tdomnode;

begin
    selectedtext := listbox1.GetSelectedText;
    selectedtext := trim(selectedtext);

    for i:= 0 to presets.childnodes.Count -1 do  // find the preset name
    begin
        node := presets.childnodes.item[i];
        subnode:= node.FindNode('label');
        if selectedtext = subnode.findnode('#text').nodevalue then
            pn := node.nodename;
    end;

    if pn <> '' then     // populate the edit boxes
    begin
        edit1.Text:=pn;
        edit2.Text:= presets.FindNode(pn).FindNode('label').FindNode('#text').NodeValue;

        if presets.FindNode(pn).FindNode('params').HasChildNodes then
            edit3.Text:= presets.FindNode(pn).FindNode('params').FindNode('#text').NodeValue
        else
            edit3.Text:='';

        edit4.Text:= presets.FindNode(pn).FindNode('extension').FindNode('#text').NodeValue;

        if presets.FindNode(pn).FindNode('category').HasChildNodes then
            edit5.Text:= presets.FindNode(pn).FindNode('category').FindNode('#text').NodeValue
        else
            edit5.Text:='';
    end;
end;

// add / update a preset
procedure TfrmEditPresets.addpresetbtnClick(Sender: TObject);
var
    i:integer;
    isOkay : Boolean;
    labeltext: string;
    newnode,labelnode,paramsnode,extensionnode,categorynode,
    textl,textp,texte, textc, node,subnode: tdomnode;

begin
    if pn = '' then
		pn := presets.FirstChild.NodeName;

    // trim everything
    edit1.Text:=trim(edit1.Text);
    edit2.Text:=trim(edit2.Text);
    edit3.Text:=trim(edit3.Text);
    edit4.Text:=trim(edit4.Text);
    edit4.Text:=trim(edit4.Text);

    isOkay := False;
    ValidateFields(isOkay);

    if not (isOkay) then
        exit;

    if presets.FindNode(pn).NodeName = edit1.Text then // update or add
    begin                                       // update preset
        labeltext := presets.findnode(pn).findnode('label').findnode('#text').nodevalue;
        if MessageDlg(rsUpdatePreset + #10#13 + labeltext, mtInformation, mbOKCancel, 0) = mrOk then
        begin
            presets.findnode(pn).FindNode('label').FindNode('#text').NodeValue := edit2.Text;
            if presets.findnode(pn).FindNode('params').HasChildNodes then
                presets.findnode(pn).FindNode('params').FindNode('#text').NodeValue := edit3.Text
            else
            begin
                textp:=presetsfile.CreateTextNode(edit3.Text);
                presets.findnode(pn).FindNode('params').AppendChild(textp);
            end;
            presets.findnode(pn).FindNode('extension').FindNode('#text').NodeValue := edit4.Text;
            presets.findnode(pn).FindNode('category').FindNode('#text').NodeValue := edit5.Text;
        end;
    end
    else
    begin    // add a new preset
        for i:= 0 to presets.ChildNodes.Count -1  do
        begin
            node:= presets.ChildNodes.item[i];   // check if label unique
            subnode:= node.FindNode('label');
            if edit2.Text = subnode.findnode('#text').NodeValue then
            begin
                ShowMessage(rsLabelMustBeUnique);
                exit;
            end;
        end;

        labeltext := edit2.Text;
        if MessageDlg(rsCreatePreset + #10#13 + labeltext, mtInformation, mbOKCancel, 0) = mrOk then
        begin
            newnode:=presetsfile.CreateElement(edit1.Text);  // create the new preset
            presets.AppendChild(newnode);
            labelnode:=presetsfile.CreateElement('label');
            newnode.AppendChild(labelnode);
            paramsnode:=presetsfile.CreateElement('params');
            newnode.AppendChild(paramsnode);
            extensionnode:=presetsfile.CreateElement('extension');
            newnode.AppendChild(extensionnode);
            categorynode:=presetsfile.CreateElement('category');
            newnode.AppendChild(categorynode);

            textl:=presetsfile.CreateTextNode(edit2.Text);
            labelnode.AppendChild(textl);
            textp:=presetsfile.CreateTextNode(edit3.Text);
            paramsnode.AppendChild(textp);
            texte:=presetsfile.CreateTextNode(edit4.Text);
            extensionnode.AppendChild(texte);
            textc:=presetsfile.CreateTextNode(edit5.Text);
            categorynode.AppendChild(textc);
        end;
    end;

    RefreshPresetsBox;
end;

// delete a preset
procedure TfrmEditPresets.DeleteBtnClick(Sender: TObject);
var
    labeltext :string;
    node2delete: tdomnode;
begin
    node2delete:= presets.FindNode(pn);
    labeltext := presets.findnode(pn).findnode('label').findnode('#text').nodevalue;

    if MessageDlg(rsRemovePreset + #10#13 + labeltext, mtInformation, mbOKCancel, 0) = mrOk then
    begin
        listbox1.Clear;
        presets.RemoveChild(node2delete);
    end;

    RefreshPresetsBox;
end;

// import a preset
procedure TfrmEditPresets.importClick(Sender: TObject);
begin
    opendialog1.DefaultExt:='.xml';
    opendialog1.Title:=rsimportpresets;
    opendialog1.Execute;
    frmMain.importPresetFromFile(opendialog1.FileName); // Procedure in Unit1
    RefreshPresetsBox;
end;

procedure TfrmEditPresets.lbCategoryClick(Sender: TObject);
begin
    RefreshPresetsBox;
end;

procedure TfrmEditPresets.RefreshPresetsBox;
var i : integer;
    cat, pre, ocat : string;
    node, subnode : tdomnode;
begin
    if lbCategory.SelCount < 1 then exit;
    try
        listbox1.Clear;
        for i:= 0 to presets.ChildNodes.Count -1  do
        begin
            // reload the listbox
            node:= presets.ChildNodes.item[i];
            subnode:= node.FindNode('category');
            cat := subnode.findnode('#text').NodeValue;

            ocat := lbCategory.Items[lbCategory.ItemIndex];
            if cat = ocat then
            begin
                // filter presets listbox to match category
                subnode:= node.FindNode('label');
                pre := subnode.findnode('#text').NodeValue;
                listbox1.items.add(pre);
            end;
        end;
    except;
    end;
end;

procedure TfrmEditPresets.exportClick(Sender: TObject);

begin
    frmExport.Show;
end;

// save & exit
procedure TfrmEditPresets.OKbtnClick(Sender: TObject);
begin
    writexmlfile(presetsfile, presetspath + 'presets.xml');
    frmMain.populatepresetbox('');
    frmEditPresets.Close;
end;

// just exit
procedure TfrmEditPresets.CancelBtnClick(Sender: TObject);
begin
    frmMain.populatepresetbox('');
    frmEditPresets.Close;
end;

procedure TfrmEditPresets.ValidateFields(var IsOkay: Boolean);
var i : integer;
    s : string;
begin
    isOkay := False;

    if edit1.Text='' then   // make sure no blanks
    begin
        ShowMessage(rsYouMustEnterNmae);
        exit;
    end;

    if edit2.Text='' then
    begin
        ShowMessage(rsYouMustEnterLabel);
        exit;
    end;

    if edit4.Text='' then
    begin
        ShowMessage(rsYouMustEnterExtension);
        exit;
    end;

    s:=edit1.Text;
    for i:=1 to length(s) do
    begin
        // make sure preset name OK
        if  not ((((Ord(s[i])>64) and (Ord(s[i])<91))  or
            ((Ord(s[i])>96) and (Ord(s[i])<123))) or
            (((Ord(s[i])>47) and (Ord(s[i])<58))))
        then
        begin
            ShowMessage(rsNameMustBeAllpha);
            exit;
        end;
    end;

    s:=edit4.Text;

    if pos('.',s) > 0 then  // check for '.' anywhere in extension
    begin
        ShowMessage(rsExtensionnoperiod);
        exit;
    end;

    isOkay := True;
end;

initialization
    {$I unit2.lrs}

end.
