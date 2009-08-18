unit frmIntroWizard;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, Buttons, ComCtrls, StdCtrls, FileCtrl, EditBtn;

type

  { TIntroWizard }

  TIntroWizard = class(TForm)
    BitBtn1: TBitBtn;
    btnBack: TBitBtn;
    btnForward: TBitBtn;
    btnOk: TBitBtn;
    Memo1: TMemo;
    memInfo: TMemo;
    Memo2: TMemo;
    Memo3: TMemo;
    tabWizard: TPageControl;
    pnlTop: TPanel;
    pnlBottom: TPanel;
    pnlMain: TPanel;
    pnlButtons: TPanel;
    tab1Intro: TTabSheet;
    tab2How: TTabSheet;
    tab3Terminology: TTabSheet;
    tab4Summary: TTabSheet;
    procedure btnAddClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure btnForwardClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure DirectoryEdit1Change(Sender: TObject);
    procedure Memo2Change(Sender: TObject);
    procedure pnlTopClick(Sender: TObject);
    procedure tabWizardChange(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  IntroWizard: TIntroWizard;

implementation

{ TIntroWizard }

procedure TIntroWizard.btnBackClick(Sender: TObject);
begin
  if tabwizard.activepageindex > 0 then
  begin
    tabwizard.activepageindex  := tabwizard.ActivePageIndex - 1;
  end;
end;

procedure TIntroWizard.btnAddClick(Sender: TObject);

begin

end;

procedure TIntroWizard.btnForwardClick(Sender: TObject);
begin
  if tabwizard.activepageindex < 3 then
  begin
    tabwizard.activepageindex  := tabwizard.ActivePageIndex + 1;
  end;
end;

procedure TIntroWizard.btnRemoveClick(Sender: TObject);
begin

end;

procedure TIntroWizard.DirectoryEdit1Change(Sender: TObject);
begin

end;

procedure TIntroWizard.Memo2Change(Sender: TObject);
begin

end;

procedure TIntroWizard.pnlTopClick(Sender: TObject);
begin

end;

procedure TIntroWizard.tabWizardChange(Sender: TObject);
begin
  btnOk.Enabled := False;
  if tabWizard.ActivePageIndex > 0 then
  begin
    if tabWizard.ActivePageIndex = 3 then
    begin
      btnForward.Enabled := False;
      btnOk.Enabled := True
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
  {$I frmintrowizard.lrs}

end.

