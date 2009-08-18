unit frmWizard; 

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, Buttons, ComCtrls, StdCtrls, FileCtrl, EditBtn, TAGraph,dom;

type

  { TAddWizard }

  TAddWizard = class(TForm)
    BitBtn1: TBitBtn;
    btnBack: TBitBtn;
    btnForward: TBitBtn;
    btnOk: TBitBtn;
    cbCategory: TComboBox;
    cbPreset: TComboBox;
    cbSourceFolder: TComboBox;
    cbDestinationFolder: TComboBox;
    flbAddFiles: TFileListBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lbQueue: TListBox;
    Memo1: TMemo;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    btnAdd: TSpeedButton;
    btnUp: TSpeedButton;
    btnDown: TSpeedButton;
    btnRemove: TSpeedButton;
    SelectDirectoryDialog1: TSelectDirectoryDialog;
    SelectDirectoryDialog2: TSelectDirectoryDialog;
    Splitter1: TSplitter;
    tabWizard: TPageControl;
    pnlTop: TPanel;
    pnlBottom: TPanel;
    pnlMain: TPanel;
    pnlButtons: TPanel;
    tab1Info: TTabSheet;
    tab2SelectFiles: TTabSheet;
    tab3Convert: TTabSheet;
    tab4Confirm: TTabSheet;
    procedure btnOkClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure btnChangeDestinationClick(Sender: TObject);
    procedure btnForwardClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure cbCategoryChange(Sender: TObject);
    procedure cbSourceFolderClick(Sender: TObject);
    procedure cbDestinationFolderClick(Sender: TObject);
    procedure DirectoryEdit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure Panel5Click(Sender: TObject);
    procedure pnlTopClick(Sender: TObject);
    procedure tabWizardChange(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
      presets: tdomnode; // this is populated by the parent form1
  end;

var
  AddWizard: TAddWizard;


implementation

{ TAddWizard }

procedure TAddWizard.btnBackClick(Sender: TObject);
begin
  if tabwizard.activepageindex > 0 then
  begin
    tabwizard.activepageindex  := tabwizard.ActivePageIndex - 1;
  end;
end;

procedure TAddWizard.btnChangeDestinationClick(Sender: TObject);
begin

end;

procedure TAddWizard.btnAddClick(Sender: TObject);
var i : integer;
begin
  if flbAddFiles.SelCount > 0 then
  begin
    for i := 0 to flbAddfiles.count -1 do
    begin
      if flbAddFiles.Selected[i] = True then
      begin
        lbQueue.items.add(flbAddFiles.Items[i]);
      end;
    end;
  end;
end;

procedure TAddWizard.btnOkClick(Sender: TObject);
begin

end;

procedure TAddWizard.btnForwardClick(Sender: TObject);
begin
  if tabwizard.activepageindex < 3 then
  begin
    tabwizard.activepageindex  := tabwizard.ActivePageIndex + 1;
  end;
end;

procedure TAddWizard.btnRemoveClick(Sender: TObject);
var i:integer;
begin
  if lbQueue.selcount > 0 then
  begin
    for i := lbQueue.Items.Count -1 downto 0 do
    begin
       if lbQueue.Selected[i] then
       begin
         lbQueue.Items.Delete(i);
       end;
    end;
  end;
end;

procedure TAddWizard.cbCategoryChange(Sender: TObject);
var
i:integer;
node,subnode, catnode,catsubnode : tdomnode;
selectedcategory, category,presetcategory: string;

begin
   selectedcategory:=cbcategory.Text;

   cbpreset.Clear;
   if selectedcategory='------' then
      category:=''
   else
      category:=trim(cbCategory.Text);

  for i:= 0 to presets.ChildNodes.Count -1  do
   begin
      node:= presets.ChildNodes.item[i];
      subnode:= node.FindNode('label');
      try
        catnode:= presets.ChildNodes.item[i];
        catsubnode:= catnode.FindNode('category');
        presetcategory:=catsubnode.FindNode('#text').NodeValue;
      except
        presetcategory:='';
      end;
      if category = '' then
         cbPreset.items.add(subnode.findnode('#text').NodeValue)
      else
         if (presetcategory = category) then
            cbPreset.items.add(subnode.findnode('#text').NodeValue);
   end;
   cbPreset.sorted:=true;
   cbPreset.sorted:=false;
end;

procedure TAddWizard.cbSourceFolderClick(Sender: TObject);
begin
  if SelectDirectoryDialog1.Execute = True then
  begin
      flbAddFiles.Directory := SelectDirectoryDialog1.FileName;
      cbSourceFolder.Text:= SelectDirectoryDialog1.FileName;
  end;
end;

procedure TAddWizard.cbDestinationFolderClick(Sender: TObject);
begin
  if SelectDirectoryDialog2.Execute = True then
  begin
    cbDestinationFolder.Text:= SelectDirectoryDialog2.FileName;
  end;
end;

procedure TAddWizard.DirectoryEdit1Change(Sender: TObject);
begin

end;

procedure TAddWizard.FormCreate(Sender: TObject);
begin
  btnOk.Enabled := False;
  btnBack.Enabled := False;
end;

procedure TAddWizard.Label2Click(Sender: TObject);
begin

end;

procedure TAddWizard.Memo1Change(Sender: TObject);
begin

end;

procedure TAddWizard.Panel5Click(Sender: TObject);
begin

end;

procedure TAddWizard.pnlTopClick(Sender: TObject);
begin

end;

procedure TAddWizard.tabWizardChange(Sender: TObject);
begin
  btnOk.Enabled := False;
  if tabWizard.ActivePageIndex > 0 then
  begin
    if tabWizard.ActivePageIndex >= 2 then
    begin
      btnOk.Enabled := True;
      if tabWizard.ActivePageIndex = 3 then
      begin
        btnForward.Enabled := False;
      end;
    end else
    begin
      btnForward.Enabled := True;
    end;
    btnBack.Enabled := True;
  end else
  begin
    btnBack.Enabled := False;
  end;
end;

initialization
  {$I frmwizard.lrs}

end.

