unit Unit1;

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
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs,
  {$IFDEF WIN32} windows, shellapi, dos,{$endif}
  {$IFDEF unix} baseunix, unix, {$endif}
  laz_xmlcfg, dom, xmlread, xmlwrite, StdCtrls, Buttons, ActnList, Menus, unit2, unit3,
  unit4, unit5, gettext, translations, process
  {$IFDEF TRANSLATESTRING}, DefaultTranslator{$ENDIF}, ExtCtrls, ComCtrls, MaskEdit, Spin,
  PoTranslator, types,FileUtil;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    audbitrate: TEdit;
    audchannels: TEdit;
    audsamplingrate: TEdit;
    btnAdd: TBitBtn;
    btnApplyDestination: TButton;
    btnApplyPreset: TButton;
    btnOptions: TBitBtn;
    btnPreview: TBitBtn;
    btnClear: TBitBtn;
    categorybox: TComboBox;
    cbOutputPath: TCheckBox;
    cbx2Pass: TCheckBox;
    cbxDeinterlace: TCheckBox;
    ChooseFolderBtn: TButton;
    commandlineparams: TEdit;
    DestFolder: TEdit;
    edtAspectRatio: TEdit;
    edtAudioSync: TEdit;
    edtCropBottom: TEdit;
    edtCropLeft: TEdit;
    edtCropRight: TEdit;
    edtCropTop: TEdit;
    edtSeekHH: TSpinEdit;
    edtSeekMM: TSpinEdit;
    edtSeekSS: TSpinEdit;
    edtTTRHH: TSpinEdit;
    edtTTRMM: TSpinEdit;
    edtTTRSS: TSpinEdit;
    edtVolume: TEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    label22: TLabel;
    label23: TLabel;
    label24: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lblAspectRatio: TLabel;
    lblCropBottom: TLabel;
    lblCropLeft: TLabel;
    lblCropRight: TLabel;
    //label22: TLabel;
    lblCropRight2: TLabel;
    lblCropTop: TLabel;
    lblFrameRate: TLabel;
    lblVideoBitRate: TLabel;
    lblVideoSize: TLabel;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    mitViewMode: TMenuItem;
//    mitPlaySoundonFinish: TMenuItem;
    mitDisplayCmdline: TMenuItem;
    dlgOpenFile: TOpenDialog;
    filelist: TListBox;
    mitDocs: TMenuItem;
    mitAbout: TMenuItem;
    mnuHelp: TMenuItem;
    mitWinff: TMenuItem;
    mitForums: TMenuItem;
    MenuItem9: TMenuItem;
    dlgOpenPreset: TOpenDialog;
    Panel1: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    Panel2: TPanel;
    Panel20: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    pgSettings: TPageControl;
    pnlbottom: TPanel;
    PopupMenu1: TPopupMenu;
    pnlTop: TPanel;
    btnPlay: TBitBtn;
    pnlAdditionalOptions: TPanel;
    pnlMain: TPanel;
    mitPauseOnFinish: TMenuItem;
    mitPlaySoundOnFinish: TMenuItem;
    btnRemove: TBitBtn;
    mitShutdownOnFinish: TMenuItem;
    mnuEdit: TMenuItem;
    mitExit: TMenuItem;
    mitPresets: TMenuItem;
    mitPreferences: TMenuItem;
    mitImportPreset: TMenuItem;
    mitShowOptions: TMenuItem;
    mnuOptions: TMenuItem;
    mnuFile: TMenuItem;
    MainMenu1: TMainMenu;
    PresetBox: TComboBox;
    //dlgOpenFile: TOpenDialog;
    SelectDirectoryDialog1: TSelectDirectoryDialog;
    btnConvert: TBitBtn;
    StatusBar1: TStatusBar;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    UpDown1: TUpDown;
    UpDown10: TUpDown;
    UpDown2: TUpDown;
    UpDown3: TUpDown;
    UpDown4: TUpDown;
    UpDown6: TUpDown;
    UpDown7: TUpDown;
    Vidbitrate: TEdit;
    Vidframerate: TEdit;
    VidsizeX: TEdit;
    VidsizeY: TEdit;

    procedure btnApplyPresetClick(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure btnApplyDestinationClick(Sender: TObject);
    procedure categoryboxChange(Sender: TObject);
    procedure cbOutputPathChange(Sender: TObject);
    procedure edtCropBottomChange(Sender: TObject);
    procedure edtCropLeftChange(Sender: TObject);
    procedure edtCropRightChange(Sender: TObject);
    procedure edtCropTopChange(Sender: TObject);
    procedure edtSeekMMChange(Sender: TObject);
    procedure filelistClick(Sender: TObject);
    procedure filelistContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure filelistDrawItem(Control: TWinControl; Index: Integer;
      ARect: TRect; State: TOwnerDrawState);
    procedure filelistKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure filelistMeasureItem(Control: TWinControl; Index: Integer;
      var AHeight: Integer);
    procedure filelistMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure filelistShowHint(Sender: TObject; HintInfo: PHintInfo);
    procedure FormDestroy(Sender: TObject);
    procedure grpOutputSettingsClick(Sender: TObject);
    procedure Label11Click(Sender: TObject);
    procedure LaunchBrowser(URL:string);
    procedure LaunchPdf(pdffile:string);
    procedure launchffmpeginfo(vfilename:string);
    procedure ChooseFolderBtnClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure lblCropRight1Click(Sender: TObject);
    procedure edtSeekHHChange(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure mitDisplayCmdlineClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDropFiles(Sender: TObject; const FileNames: array of String);
    procedure mitImportPresetClick(Sender: TObject);
    procedure mitAboutClick(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure mitExitClick(Sender: TObject);
    procedure mitPlaySoundonFinishClick(Sender: TObject);
    procedure mitPresetsClick(Sender: TObject);
    procedure mitPreferencesClick(Sender: TObject);
    procedure mitDocsClick(Sender: TObject);
    procedure mitForumsClick(Sender: TObject);
    procedure mitViewModeClick(Sender: TObject);
    procedure mitWinffClick(Sender: TObject);
    procedure mitPauseOnFinishClick(Sender: TObject);
    procedure btnPlayClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    function GetDeskTopPath() : string;
    function GetMydocumentsPath() : string ;
    procedure Panel14Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure PresetBoxChange(Sender: TObject);
    procedure SelectDirectoryDialog1FolderChange(Sender: TObject);
    procedure setconfigvalue(key:string;value:string);
    function getconfigvalue(key:string):string;
    procedure populatepresetbox(selectedcategory:string);
    function getcurrentpresetname(currentpreset:string):string;
    function getpresetparams(presetname:string):string;
    function getpresetcategory(presetname:string):string;
    function getpresetextension(presetname:string):string;
    procedure mitShowOptionsClick(Sender: TObject);
    procedure mitShutdownOnFinishClick(Sender: TObject);
    procedure btnConvertClick(Sender: TObject);
    procedure importpresetfromfile(presetfilename: string);
    function GetappdataPath() : string ;
    function replaceparam(commandline:string;param:string;replacement:string):string;
    procedure VidbitrateChange(Sender: TObject);
    function GetFileInfo(var filedetails : string) : string;
    {$IFDEF WIN32}function GetWin32System(): Integer;{$endif}

  private
    { private declarations }

  public
    { public declarations }

  end; 


{$IFDEF WIN32}
const
  shfolder = 'ShFolder.dll';
  { win32 custom directory constants }
  CSIDL_PERSONAL: longint = $0005;
  CSIDL_DESKTOPDIRECTORY: longint = $0010;
  CSIDL_APPDATA: longint = $001a;
  { win32 operating system (OS)constants }
  cOsUnknown: Integer = -1;
  cOsWin95:   Integer =  0;
  cOsWin98:   Integer =  1;
  cOsWin98SE: Integer =  2;
  cOsWinME:   Integer =  3;
  cOsWinNT:   Integer =  4;
  cOsWin2000: Integer =  5;
  cOsXP:      Integer =  6;
{$ENDIF}



var
  JobList,PresetList,CategoryList,DestinationList,FileInfoList :TstringList;
  fOldIndex: integer = -1; // used for dynamic hint on the filelist.

  frmMain: TfrmMain;
  {$IFDEF WIN32}
  PIDL : PItemIDList;
  ansicodepage: longint;
  usechcp: string;
  {$ENDIF}
  extraspath: string;
  lastpreset: string;
  presetsfile: Txmldocument;
  presetspath: string;
  configpath: string;
  presets: tdomnode;
  ffmpeg: string;
  ffplay: string;
  terminal: string;
  termoptions: string;
  rememberlast: string;
  insertpoint: string;
  showopts: string;
  rememberpreset: string;
  pass2encoding: string ;
  pausescript: string;
  playscript: string;
  multithreading: string;
  PODirectory, Lang, FallbackLang, POFile: String;
  preview: boolean;

  Resourcestring

  //messages
  rsCouldNotFindPresetFile = 'Could not find presets file.';
  rsCouldNotFindFFmpeg = 'Could not find FFmpeg.';
  rsCouldNotFindFFplay = 'Could not find FFPlay.';
  rsSelectVideoFiles = 'Select Video Files';
  rsSelectPresetFile = 'Select Preset File';
  rsPleaseSelectAPreset = 'Please select a preset';
  rsPleaseAdd1File = 'Please add at least 1 file to convert';
  rsConverting = 'Converting';
  rsAnalysing = 'Analysing';
  rsPressEnter = 'Press Enter to Continue';
  rsCouldNotFindFile = 'Could Not Find File';
  rsInvalidPreset = 'Invalid Preset File';
  rsPresetAlreadyExist = 'Preset: %s%s%s already exists';
  rsPresetHasNoLabel = 'The preset to import does not have a label';
  rsThePresetHasIllegalChars = 'The preset contains illegal characters';
  rsPresetWithLabelExists = 'Preset with label: %s%s%s already exists';
  rsPresethasnoExt	= 'The preset to import does not have an extension';
  rsNameMustBeAllpha	= 'Name Must be alphanumeric (a-z,A-Z,0-9)';
  rsExtensionnoperiod	= 'Extension can not contain a period';
  rsFileDoesNotExist	= 'file does not exist';
  rsPresettoExport	= 'Please select a preset to export';
  rsSelectDirectory	= 'Select Directory';

implementation


// Initialize everything
procedure TfrmMain.FormCreate(Sender: TObject);
var
f1,f2:textfile;
ch: char;
i:integer;
formheight,formwidth,formtop,formleft:integer;
sformheight,sformwidth,sformtop,sformleft:string;
currentpreset, destdir: string;

begin
   JobList := tstringlist.create;
   CategoryList := tstringlist.Create;
   PresetList := tstringlist.Create;
   DestinationList := tstringlist.Create;
   FileInfoList := tstringlist.Create;

   ExtrasPath:= ExtractFilePath(ParamStr(0));

   // do translations
   TranslateUnitResourceStrings('unit1', PODirectory + 'winff.%s.po', Lang, FallbackLang);

                    // start setup
  {$IFDEF WIN32}
  ansicodepage:=getacp();
  presetspath :=GetappdataPath() + '\Winff\';

  if not DirectoryExists(presetspath) then
    createdir(presetspath);
    
  ffmpeg := getconfigvalue('win32/ffmpeg');
  if ffmpeg = '' then
     begin
       ffmpeg := extraspath + 'ffmpeg.exe';
       setconfigvalue('win32/ffmpeg',ffmpeg);
     end;

  ffplay := getconfigvalue('win32/ffplay');
   if ffplay = '' then
     begin
       ffplay := extraspath + 'ffplay.exe';
       setconfigvalue('win32/ffplay',ffplay);
     end;

  if (GetWIn32System >=0) and (GetWIn32System <4)
      then
        terminal:='command.com'
      else
        terminal:='cmd.exe';
  termoptions := '/c';
  
  usechcp:= getconfigvalue('win32/chcp');
  if usechcp = '' then
     begin
       usechcp := 'true';
       setconfigvalue('win32/chcp','true');
     end;

  {$endif}

  {$IFDEF UNIX}
  //presetbox.Height:=30;
  //categorybox.Height:=30;

  extraspath:='/usr/share/winff/';
  if not directoryexists(extraspath) then
     ExtrasPath:= ExtractFilePath(ParamStr(0));
     
  presetspath := GetMydocumentsPath() + '/.winff/';

  if not DirectoryExists(presetspath) then
    createdir(presetspath);
    
  ffmpeg := getconfigvalue('unix/ffmpeg');
  if ffmpeg = '' then
     begin
       ffmpeg := '/usr/bin/ffmpeg';
       if not fileexists(ffmpeg) then
         if fileexists('/usr/local/bin/ffmpeg') then
            ffmpeg := '/usr/local/bin/ffmpeg'
         else
            showmessage(rsCouldNotFindFFmpeg);
       setconfigvalue('unix/ffmpeg',ffmpeg)
     end;
     
  ffplay := getconfigvalue('unix/ffplay');
  if ffplay = '' then
     begin
       ffplay := '/usr/bin/ffplay';
       if not fileexists(ffplay) then
         if fileexists('/usr/local/bin/ffplay') then
            ffplay := '/usr/local/bin/ffplay'
         else
            showmessage(rsCouldNotFindFFPlay);
       setconfigvalue('unix/ffplay',ffplay);
     end;
     
  terminal := getconfigvalue('unix/terminal');
  if terminal = '' then
     begin
       terminal := '/usr/bin/xterm';
       if fileexists('/usr/bin/gnome-terminal') then terminal:='/usr/bin/gnome-terminal';
       if fileexists('/usr/bin/x-terminal-emulator') then terminal:='/usr/bin/x-terminal-emulator';
       setconfigvalue('unix/terminal',terminal);
     end;

  termoptions := getconfigvalue('unix/termoptions');
  if termoptions = '' then
     begin
       termoptions := '-e';
       if terminal = '/usr/bin/gnome-terminal' then termoptions := '-x';
       setconfigvalue('unix/termoptions',termoptions);
     end;
  {$ENDIF}


          // prepare preset

  if (not fileexists(presetspath + 'presets.xml')) and (fileexists(extraspath + directoryseparator +'presets.xml')) then
     begin
      AssignFile(F1, extraspath + directoryseparator +'presets.xml');
      Reset(F1);
      AssignFile(F2, presetspath + 'presets.xml');
      Rewrite(F2);
      while not Eof(F1) do
        begin
          Read(F1, Ch);
          Write(F2, Ch);
        end;
      CloseFile(F2);
      CloseFile(F1);
     end;

  if not fileexists(presetspath + 'presets.xml') then
     begin
     showmessage(rsCouldNotFindPresetFile);
     frmMain.close;
     end;

  presetsfile.Create;                         // load the presets file
  try
   ReadXMLFile(presetsfile, presetspath+'presets.xml');
   presets:=presetsfile.DocumentElement;
  except
   showmessage(rsCouldNotFindPresetFile);
   frmMain.close;
  end;
                                      // import preset from command line
  if upcase(rightstr(paramstr(1),4)) = '.WFF' then
   begin
   importpresetfromfile(paramstr(1));
   end;

                                // fill combobox with presets
  rememberpreset:=getconfigvalue('general/currentpreset');
  currentpreset:=getcurrentpresetname(rememberpreset);
  populatepresetbox(getpresetcategory(currentpreset));
  for i:= 0 to  presetbox.items.Count - 1 do
    begin
     if presetbox.Items[i]=rememberpreset then
        begin
        presetbox.ItemIndex:=i;
        break;
        end;
    end;
                                          // set window size and position
  showopts:=getconfigvalue('general/showoptions');
  sformheight:=getconfigvalue('window/height');
  sformwidth:=getconfigvalue('window/width');
  sformtop:=getconfigvalue('window/top');
  sformleft:=getconfigvalue('window/left');

  formtop := 0;
  if sformtop <> '' then formtop:=strtoint(sformtop);
  if formtop > 0 then frmMain.Top := formtop;

  formleft := 0;
  if sformleft <> '' then formleft:=strtoint(sformleft);
  if formleft >0 then frmMain.Left := formleft;

  if sformheight = '' then formheight:=400
  else formheight := strtoint(sformheight);

  if sformwidth = '' then formwidth:=400
  else formwidth := strtoint(sformwidth);

  if formheight<400 then formheight:=400;
  if formwidth<400 then formheight:=400;
  if showopts='' then showopts:='false';
  if showopts='true' then
        begin
        mitShowOptions.Checked:=true;
{        pnlAdditionalOptions.Visible :=true;
        frmMain.height := formheight;
        frmMain.width := formwidth;
        frmMain.invalidate;}
        for i := 1 to 5 do pgSettings.Page[i].tabvisible := true;
        end
  else
        begin
        mitShowOptions.Checked:=false;
{        pnlAdditionalOptions.Visible :=false;
        frmMain.height := formheight;
        frmMain.width := formwidth;
        frmMain.invalidate;}
        for i := 1 to 5 do pgSettings.Page[i].tabvisible := false;

        end;


  destfolder.text := getconfigvalue('general/destfolder');   // get destination folder
  if destfolder.text='' then DestFolder.Text:= getmydocumentspath();
  rememberlast := getconfigvalue('general/rememberlast');


                                         // check 2 pass encoding
  pass2encoding:=getconfigvalue('general/pass2');
  if pass2encoding='' then cbx2Pass.checked:=false;
  if pass2encoding='true' then cbx2Pass.checked:=true;
  
                                      // check pause before finished
  pausescript:=getconfigvalue('general/pause');
  if pausescript='' then
    begin
     pausescript:= 'true';
     setconfigvalue('general/pause',pausescript);
    end;
  if pausescript='true' then
     mitPauseOnFinish.Checked:=true
  else
     mitPauseOnFinish.Checked:=false;

  playscript:=getconfigvalue('general/playsound');
  if playscript='' then
    begin
     playscript:= 'true';
     setconfigvalue('general/playsound',playscript);
    end;
  if playscript='true' then
     mitplaysoundOnFinish.Checked:=true
  else
     mitplaysoundOnFinish.Checked:=false;



                                        // check for multithreading
  multithreading:=getconfigvalue('general/multithreading');


end;


// clean up and shut down
procedure TfrmMain.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var
s:string;
begin
  if rememberlast = 'true' then   // save destination folder
     setconfigvalue('general/destfolder',destfolder.text);

  s := presetbox.text;   // save default preset
  if s <> '' then setconfigvalue('general/currentpreset',s);

  if mitShowOptions.Checked then // save show mnuOptions
     setconfigvalue('general/showoptions','true')
  else
     setconfigvalue('general/showoptions','false');

  if mitPauseOnFinish.Checked then // save pause on finish
     setconfigvalue('general/pause','true')
  else
     setconfigvalue('general/pause','false');


  if mitPlaySoundOnFinish.Checked then // save pause on finish
     setconfigvalue('general/playsound','true')
  else
     setconfigvalue('general/playsound','false');


  if cbx2Pass.Checked then // save 2 pass
     setconfigvalue('general/pass2','true')
  else
     setconfigvalue('general/pass2','false');

     // save window position and size
  setconfigvalue('window/height',inttostr(frmMain.height));
  setconfigvalue('window/width',inttostr(frmMain.width));
  setconfigvalue('window/top',inttostr(frmMain.Top));
  setconfigvalue('window/left',inttostr(frmMain.Left));

  presetsfile.Free;           // cleanup

end;

// get the params from the preset
function TfrmMain.getpresetparams(presetname:string):string;
var
paramnode : tdomnode;
param:string;
begin
   try
    if presets.FindNode(presetname).FindNode('params').HasChildNodes then
    begin
      paramnode:=presets.FindNode(presetname).FindNode('params').FindNode('#text');
      param:=paramnode.NodeValue;
    end
   except
    param:='';
   end;
   result:=param;
end;

// get the category from the preset
function TfrmMain.getpresetcategory(presetname:string):string;
var
catnode : tdomnode;
category:string;
begin
 result := '';
 if presetname <> '' then
 begin
   try
    if presets.FindNode(presetname).FindNode('category').HasChildNodes then
    begin
      catnode:=presets.FindNode(presetname).FindNode('category').FindNode('#text');
      category:=catnode.NodeValue;
    end
   except
    category:='';
   end;
   result:=category;
 end;
end;

// get the extension of the preset
function TfrmMain.getpresetextension(presetname:string):string;
begin
   result:=presets.FindNode(presetname).FindNode('extension').FindNode('#text').NodeValue;
end;


// get the name of the selected preset
function TfrmMain.getcurrentpresetname(currentpreset:string):string;
var
i:integer;
node,subnode: tdomnode;
begin
   for i:= 0 to presets.childnodes.count -1 do
   begin
     node := presets.childnodes.item[i];
     subnode:= node.FindNode('label');
     if currentpreset = subnode.findnode('#text').nodevalue then
       result := node.nodename;
   end;
end;


// clear and load the preset box with current list
procedure TfrmMain.populatepresetbox(selectedcategory:string);
var
i,j:integer;
ispresent: boolean;
node,subnode, catnode,catsubnode : tdomnode;
category,presetcategory: string;
begin
   selectedcategory:=trim(selectedcategory);
   categorybox.Clear;
   categorybox.items.add('------');
   for i:= 0 to presets.ChildNodes.Count -1  do
     begin
       try
         node:= presets.ChildNodes.item[i];
         subnode:= node.FindNode('category');
         category:=subnode.findnode('#text').NodeValue;
         category:=trim(category)
       except
         category:='';
       end;
       ispresent:=false;
       for j:= 0 to categorybox.Items.Count-1 do
          if categorybox.Items[j]=category then
             ispresent:=true;
       if not ispresent then
          categorybox.Items.Add(category);
     end;



   for I:= 0 to categorybox.Items.Count -1 do
       if categorybox.items[i]=selectedcategory then
          begin
          categorybox.ItemIndex:=i;
          break;
          end;


   presetbox.Clear;
   if selectedcategory='------' then
      category:=''
   else
      category:=trim(categorybox.Text);
      
   for i:= 0 to presets.ChildNodes.Count -1  do
   begin
      try
        node:= presets.ChildNodes.item[i];
        subnode:= node.FindNode('label');
        catnode:= presets.ChildNodes.item[i];
        catsubnode:= catnode.FindNode('category');
        presetcategory:=catsubnode.FindNode('#text').NodeValue;
      except
        presetcategory:='';
      end;
      if category = '' then
         try
         presetbox.items.add(subnode.findnode('#text').NodeValue)
         except
         end
      else
         if (presetcategory = category) then
            try
            presetbox.items.add(subnode.findnode('#text').NodeValue);
            except
            end;
   end;
   presetbox.sorted:=true;
   presetbox.sorted:=false;
end;

// change category
procedure TfrmMain.categoryboxChange(Sender: TObject);
var
i:integer;
node,subnode, catnode,catsubnode : tdomnode;
selectedcategory, category,presetcategory: string;

begin
   selectedcategory:=categorybox.Text;

   presetbox.Clear;
   if selectedcategory='------' then
      category:=''
   else
      category:=trim(categorybox.Text);
  try
    for i:= 0 to presets.ChildNodes.Count -1  do
     begin
        try
        node:= presets.ChildNodes.item[i];
        subnode:= node.FindNode('label');

        catnode:= presets.ChildNodes.item[i];
        catsubnode:= catnode.FindNode('category');
        presetcategory:=catsubnode.FindNode('#text').NodeValue;
        except
        presetcategory:='';
        end;
        try
          if category = '' then
             presetbox.items.add(subnode.findnode('#text').NodeValue)
          else
             if (presetcategory = category) then
                presetbox.items.add(subnode.findnode('#text').NodeValue);
        except
        end;
     end;
  finally
  end;
  presetbox.sorted:=true;
  presetbox.sorted:=false;
end;

procedure TfrmMain.cbOutputPathChange(Sender: TObject);
begin
  // coded by Ian Stoffberg - Issue 125
  // begin change
  // if Use Source path is checked, the output folder is ignored
  destfolder.Enabled := not(cbOutputPath.Checked);
  application.processmessages;
  // end Changed
end;

// cropbootom change
procedure TfrmMain.edtCropBottomChange(Sender: TObject);
var
i:integer;
begin
 try
 i:=strtoint(edtcropbottom.text);
 except
 edtcropbottom.text:='0';
 end;
 i:=i;
end;

// cropleft change
procedure TfrmMain.edtCropLeftChange(Sender: TObject);
var
i:integer;
begin
 try
 i:=strtoint(edtcropleft.text);
 except
 edtcropleft.text:='0';
 end;
 i:=i;
end;

// cropright change
procedure TfrmMain.edtCropRightChange(Sender: TObject);
var
i:integer;
begin
 try
 i:=strtoint(edtcropright.text);
 except
 edtcropright.text:='0';
 end;
 i:=i;
end;

// croptop change
procedure TfrmMain.edtCropTopChange(Sender: TObject);
var
i:integer;
begin
 try
 i:=strtoint(edtcroptop.text);
 except
 edtcroptop.text:='0';
 end;
 i:=i;
end;

procedure TfrmMain.edtSeekMMChange(Sender: TObject);
begin
end;

procedure TfrmMain.filelistClick(Sender: TObject);
var i,j : integer;
begin
// Held over for next release.  Enhanced Queues
{
if filelist.SelCount = 1 then
   begin
     for j := 0 to filelist.Count -1 do
       begin
         if filelist.Selected[j] then i := j;
       end;
     categorybox.Text:= CategoryList.Strings[i];
     categoryboxChange(self);
     PresetBox.Text:= PresetList.Strings[i];
     DestFolder.Text:= DestinationList.Strings[i];
     Application.ProcessMessages;
   end;
}
end;

procedure TfrmMain.filelistContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin
end;

procedure TfrmMain.filelistDrawItem(Control: TWinControl; Index: Integer;
  ARect: TRect; State: TOwnerDrawState);
begin
// This function draws the an enhanced row list
// Not suitable for 1.4
{  with (control as tlistbox).Canvas do
  begin
    FillRect(ARect) ;
    Font.Color := clBlack;
    TextOut(ARect.Left, ARect.Top, filelist.items[Index] + ' (' + joblist.Strings[index] + ' )');
    Font.Color := clBlue;
    Font.Size  := 8;
    Font.Style := [fsItalic];
    TextOut(ARect.Left + 15, ARect.Top + 14, destinationlist.Strings[index] + ' - Convert to ' + Presetlist.Strings[index]);
  end;}

end;

procedure TfrmMain.btnApplyDestinationClick(Sender: TObject);
var i : integer;
begin
     for i := 0 to filelist.Count -1 do
       begin
         if filelist.Selected[i] = true then
           begin
                DestinationList.Strings[i] := DestFolder.Text;
           end;
       end;
     Application.ProcessMessages;
end;

// preview button clicked
procedure TfrmMain.btnPreviewClick(Sender: TObject);
begin
  preview := true;
  btnConvertClick(Self);
end;

procedure TfrmMain.btnApplyPresetClick(Sender: TObject);
var i : integer;
begin
     for i := 0 to filelist.Count -1 do
       begin
         if filelist.Selected[i] = true then
           begin
                CategoryList.Strings[i] := categorybox.Text;
                PresetList.Strings[i] := PresetBox.Text;
           end;
       end;
     Application.ProcessMessages;
end;

// change preset
procedure TfrmMain.PresetBoxChange(Sender: TObject);
var
destdir: string;
currentpreset:string;
begin
currentpreset := getcurrentpresetname(presetbox.Text);
   destdir := '' ;
//  destdir:= getpresetdestdir(currentpreset);     // get dest folder from preset
if destdir <> '' then destfolder.text:= destdir;
if destfolder.Text='' then destfolder.text := getconfigvalue('general/destfolder');
if destfolder.text='' then DestFolder.Text:= getmydocumentspath();
end;

procedure TfrmMain.SelectDirectoryDialog1FolderChange(Sender: TObject);
begin
end;


// launch browser
procedure TfrmMain.launchbrowser(URL:string);
{$IFDEF linux}
var
launcher:tprocess;
s:string;
{$endif}
begin
  {$ifdef linux}
  s:='';
  if fileexists('/usr/bin/konqueror') then s:='/usr/bin/konqueror';
  if fileexists('/usr/bin/mozilla-firefox') then s:='/usr/bin/mozilla-firefox';
  if fileexists('/usr/bin/firefox') then s:='/usr/bin/firefox';
  if fileexists('/usr/bin/sensible-browser') then s:='/usr/bin/sensible-browser';
  if s='' then
     begin
     Showmessage('More information can be found at ' + URL);
     exit;
     end;

  launcher := tprocess.Create(nil);
  launcher.CommandLine:= s + ' ' + URL;
  launcher.Execute;
  launcher.free;
  {$endif}

  {$ifdef win32}
  ShellExecute(self.Handle,'open',PChar(URL),nil,nil, SW_SHOWNORMAL);
  {$endif}
end;

// launch ffmpeg ifno
procedure TfrmMain.launchffmpeginfo(vfilename:string);
var
i,j : integer;
cb,ct,cl,cr:integer;
pn, extension, params, commandline, command, filename,batfile, passlogfile, basename:string;
qterm, ffmpegfilename,ffplayfilename, usethreads, numthreads, deinterlace, nullfile, titlestring, priority:string;
script: tstringlist;
thetime: tdatetime;
scriptprocess:tprocess;
scriptpriority:tprocesspriority;
ignorepreview:boolean;
resmod : integer;
begin                                     // get setup
   scriptprocess:= TProcess.Create(nil);

   priority := getconfigvalue('general/priority');
   if priority= unit4.rspriorityhigh then scriptpriority:=pphigh
     else if priority= unit4.rsprioritynormal then scriptpriority:=ppnormal
     else if priority= unit4.rspriorityidle then scriptpriority:=ppidle
     else scriptpriority:=ppnormal;
   scriptprocess.Priority:= scriptpriority;


   script:= TStringList.Create;
   {$ifdef win32}script.Add('@echo off');{$endif}
   {$ifdef win32}if usechcp = 'true' then script.Add('chcp ' + inttostr(ansicodepage));{$endif}
   {$ifdef unix}script.Add('#!/bin/sh');{$endif}

   {$ifdef win32}ffmpegfilename:='"' + ffmpeg + '"';{$endif}
   {$ifdef unix}ffmpegfilename:=ffmpeg;{$endif}
   {$ifdef win32}ffplayfilename:='"' + ffplay + '"';{$endif}
   {$ifdef unix}ffplayfilename:=ffplay;{$endif}
   {$ifdef win32}nullfile:='"NUL.avi"';{$endif}
   {$ifdef unix}nullfile:='/dev/null';{$endif}



   if not fileexists(ffmpeg) then
      begin
       showmessage(rsCouldnotFindFFplay);
       exit;
      end;

   frmScript.memo1.lines.Clear;

                                         // trim everything up


                                      // replace preset params if mnuOptions specified
   commandline := '';

                                           // build batch file
   thetime :=now;
   batfile := 'ff' + FormatDateTime('yymmddhhnnss',thetime) +
           {$ifdef win32}'.bat'{$endif}
           {$ifdef unix}'.sh'{$endif} ;

   filename := vfilename;
   basename := extractfilename(filename);

       // resolve issues with embedded quote marks in filename to be converted.  issue 38
       {$ifdef unix}
       filename := StringReplace(filename,'"','\"',[rfReplaceAll]);
       basename := StringReplace(basename,'"','\"',[rfReplaceAll]);
       {$endif}

       for j:= length(basename) downto 1  do
         begin
           if basename[j] = #46 then
              begin
                basename := leftstr(basename,j-1);
                break;
              end;
         end;

       command := '';
       {$ifdef win32}titlestring:='title ' + rsAnalysing + ' ' + extractfilename(filename) +
            ' ('+inttostr(i+1)+'/'+ inttostr(filelist.items.count)+')';{$endif}
       {$ifdef unix}titlestring:='echo -n "\033]0; ' + rsAnalysing +' ' + basename +
            ' ('+inttostr(i+1)+'/'+ inttostr(filelist.items.count)+')'+'\007"';{$endif}
       script.Add(titlestring);
       //destfolder.text := extractfilepath(filename);
        command := ffmpegfilename +  '  -i "' + filename + '" 2>' + presetspath + 'output.txt';

        script.Add(command);

        // remove batch file on completion
//   {$ifdef win32}script.Add('del ' + '"' + presetspath + batfile + '"');{$endif}
   {$ifdef unix}script.Add('rm ' + '"' +  presetspath + batfile+ '"');{$endif}


     script.SaveToFile(presetspath+batfile);
     {$ifdef unix}
     fpchmod(presetspath + batfile,&777);
     {$endif}

     {$ifdef win32}
     qterm := '"' + terminal + '"';
     {$endif}

     {$ifdef unix}qterm := terminal;{$endif}
     scriptprocess.ShowWindow := swoNone;
                                                        // do it
     {$ifdef win32}scriptprocess.commandline:= qterm + ' ' + termoptions + ' "' + presetspath + batfile + '"';{$endif}
     {$ifdef unix}scriptprocess.commandline:= qterm + ' ' +  termoptions + ' ' + presetspath + batfile + ' &'; {$endif}
     scriptprocess.execute;
    script.Free;
    sleep(1000) ; // need to wait for this to finish before continuing;
    {$ifdef win32}
    try
      DeleteFileUTF8(presetspath + batfile);
    except;
           // Could Not Delete Generated Batch File
    end;
    {$endif}
end;



// launch pdf
procedure TfrmMain.LaunchPdf(pdffile:string);
{$IFDEF linux}
var
launcher:tprocess;
s:string;
{$endif}
begin
  {$ifdef linux}
  s:='';
  if fileexists('/usr/bin/evince') then s:='/usr/bin/evince';
  if fileexists('/usr/bin/kpdf') then s:='/usr/bin/kpdf';
  if fileexists('/usr/bin/xpdf') then s:='/usr/bin/xpdf';
  if fileexists('/usr/bin/acroread') then s:='/usr/bin/acroread';
  if s='' then
     begin
     Showmessage('More information can be found at ' + pdffile);
     exit;
     end;

  launcher := tprocess.Create(nil);
  launcher.CommandLine:= s + ' ' + pdffile;
  launcher.Execute;
  launcher.free;
  {$endif}

  {$ifdef win32}
  ShellExecute(self.Handle,'open',PChar(pdffile),nil,nil, SW_SHOWNORMAL);
  {$endif}
end;

// set a value in the config file
procedure TfrmMain.setconfigvalue(key:string;value:string);
var
cfg: TXMLConfig;
begin
 cfg := TXMLConfig.create(presetspath+'cfg.xml');
 cfg.SetValue(key,value);
 cfg.free;
end;

// get a value from the config file
function TfrmMain.getconfigvalue(key:string): string;
var
cfg: TXMLConfig;
begin
 cfg := TXMLConfig.create(presetspath+'cfg.xml');
 result := cfg.GetValue(key, '');
 cfg.free;
end;

// get the user's desktop path
function TfrmMain.GetDeskTopPath() : string ;
{$ifdef win32}
var
  ppidl: PItemIdList;
begin
  ppidl := nil;
  SHGetSpecialFolderLocation(frmMain.Handle,CSIDL_DESKTOPDIRECTORY , ppidl);
  SetLength(Result, MAX_PATH);
   if not SHGetPathFromIDList(ppidl, PChar(Result)) then
        raise exception.create('SHGetPathFromIDList failed : invalid pidl');
   SetLength(Result, lStrLen(PChar(Result)));
end;
{$endif}
{$ifdef unix}
begin
 result := GetEnvironmentVariable('HOME') + DirectorySeparator  + 'Desktop';
end;
{$endif}

// get the user's document's path
function TfrmMain.GetMydocumentsPath() : string ;
{$ifdef win32}
var
  ppidl: PItemIdList;
begin
  ppidl := nil;
  SHGetSpecialFolderLocation(frmMain.Handle,CSIDL_PERSONAL , ppidl);
  SetLength(Result, MAX_PATH);
   if not SHGetPathFromIDList(ppidl, PChar(Result)) then
        raise exception.create('SHGetPathFromIDList failed : invalid pidl');
   SetLength(Result, lStrLen(PChar(Result)));
end;

{$endif}
{$ifdef unix}
begin
 result := GetEnvironmentVariable('HOME') ;
end;
{$endif}

procedure TfrmMain.Panel14Click(Sender: TObject);
begin

end;

procedure TfrmMain.PopupMenu1Popup(Sender: TObject);
begin
    if filelist.selcount > 0 then
    begin
      PopupMenu1.Items.Enabled:=True;
    end else
    begin
      PopupMenu1.Items.Enabled:=False;
    end;
end;



// get the user's application data path
function TfrmMain.GetappdataPath() : string ;
{$ifdef win32}
var
  ppidl: PItemIdList;
begin
  ppidl := nil;
  SHGetSpecialFolderLocation(frmMain.Handle,CSIDL_APPDATA , ppidl);
  SetLength(Result, MAX_PATH);
   if not SHGetPathFromIDList(ppidl, PChar(Result)) then
        raise exception.create('SHGetPathFromIDList failed : invalid pidl');
   SetLength(Result, lStrLen(PChar(Result)));
end;
{$endif}
{$ifdef unix}
begin
 result := GetEnvironmentVariable('HOME') ;
end;
{$endif}

// get windows version
{$ifdef win32}
function TfrmMain.GetWIn32System(): Integer;
var
  osVerInfo: TOSVersionInfo;
  majorVer, minorVer: Integer;
begin
  Result := cOsUnknown;
  { set operating system type flag }
  osVerInfo.dwOSVersionInfoSize := SizeOf(TOSVersionInfo);
  if GetVersionEx(osVerInfo) then
  begin
    majorVer := osVerInfo.dwMajorVersion;
    minorVer := osVerInfo.dwMinorVersion;
    case osVerInfo.dwPlatformId of
      VER_PLATFORM_WIN32_NT: { Windows NT/2000 }
        begin
          if majorVer <= 4 then
            Result := cOsWinNT
          else if (majorVer = 5) and (minorVer = 0) then
            Result := cOsWin2000
          else if (majorVer = 5) and (minorVer = 1) then
            Result := cOsXP
          else
            Result := cOsUnknown;
        end;
      VER_PLATFORM_WIN32_WINDOWS:  { Windows 9x/ME }
        begin
          if (majorVer = 4) and (minorVer = 0) then
            Result := cOsWin95
          else if (majorVer = 4) and (minorVer = 10) then
          begin
            if osVerInfo.szCSDVersion[1] = 'A' then
              Result := cOsWin98SE
            else
              Result := cOsWin98;
          end
          else if (majorVer = 4) and (minorVer = 90) then
            Result := cOsWinME
          else
            Result := cOsUnknown;
        end;
      else
        Result := cOsUnknown;
    end;
  end
  else
    Result := cOsUnknown;
end;
{$endif}

// choose a folder
procedure TfrmMain.ChooseFolderBtnClick(Sender: TObject);
begin
  selectdirectorydialog1.Title:= rsSelectDirectory;
  if SelectDirectoryDialog1.execute then
     DestFolder.Text := SelectDirectoryDialog1.FileName;
end;


// drop files into list
procedure TfrmMain.FormDropFiles(Sender: TObject; const FileNames: array of String
  );
var
numfiles, i:integer;
s,t,u : string;
begin
numfiles := high(Filenames);
for i:= 0 to numfiles do
   s :=filelist.items[i];
   u := s;
   t := GetFileInfo(u);
   filelist.items.Add(s);
   DestinationList.Add(DestFolder.text);
   CategoryList.add(categorybox.Text);
   PresetList.add(PresetBox.Text);
   JobList.add(t);
   FileInfoList.add(u);
end;

// add files to the list
procedure TfrmMain.btnAddClick(Sender: TObject);
var
  vFileInfo : string;
  i : integer;
  s,t,u : string;
begin
   dlgOpenFile.Title:=rsSelectVideoFiles;
   dlgOpenFile.InitialDir := getconfigvalue('general/addfilesfolder');
   if dlgOpenFile.Execute then
      begin
        setconfigvalue('general/addfilesfolder',dlgOpenFile.InitialDir);
        for i := 0 to dlgOpenFile.files.Count -1 do
          begin
            DestinationList.Add(DestFolder.text);
            try
              CategoryList.add(categorybox.Text);
            except
              CategoryList.add('');
            end;
            PresetList.add(PresetBox.Text);

            s := dlgOpenFile.files[i];
            u := s;
            t := '';//1.5 GetFileInfo(u);
            filelist.items.Add(s);
            JobList.add(t);
            FileInfoList.add(u);
          end;
          //filelist.items.AddStrings(dlgOpenFile.Files);
      end;
   sleep(1000);
end;

// remove a file from the list
procedure TfrmMain.btnRemoveClick(Sender: TObject);
var
i: integer;
begin


i:=0;
  while i< filelist.Items.Count do
    if filelist.Selected[i] then
      begin
        filelist.Items.Delete(i);
        joblist.Delete(i);
        categorylist.Delete(i);
        presetlist.Delete(i);
        destinationlist.Delete(i);
        fileinfolist.Delete(i);
      end
    else
       i+=1;

end;

// clear the file list
procedure TfrmMain.btnClearClick(Sender: TObject);
var i : integer;
begin
  filelist.Clear;
  destinationlist.clear;
  presetlist.clear;
  categorylist.clear;
  joblist.clear;
  fileinfolist.Clear;
end;

procedure TfrmMain.lblCropRight1Click(Sender: TObject);
begin

end;

procedure TfrmMain.edtSeekHHChange(Sender: TObject);
begin

end;

procedure TfrmMain.MenuItem1Click(Sender: TObject);
begin
     btnApplyPreset.Click;
end;

// filelist on key up
procedure TfrmMain.filelistKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
i:integer;
begin
  // delete
  if (key = 46) then
   begin
    i:=0;
   while i< filelist.Items.Count do
    if filelist.Selected[i] then
     begin
          filelist.Items.Delete(i);
          joblist.Delete(i);
          CategoryList.delete(i);
          DestinationList.delete(i);
          PresetList.delete(i);
          fileinfolist.Delete(i);
     end
    else
       i+=1;
   end;

end;

procedure TfrmMain.filelistMeasureItem(Control: TWinControl; Index: Integer;
  var AHeight: Integer);
begin
  //  AHeight := (Index+1)*28;
  //  Removed for 1.4 // Not using Enhanced Job Queue
end;

procedure TfrmMain.filelistMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var lstIndex : Integer ;
begin
(* // Not for version 1.4 - works on Windows & QT, buggy on GTK.
   //  Enhanced job queue not in this release.
 {$ifdef win32}
   with filelist do
   begin
    lstIndex:=SendMessage(Handle, LB_ITEMFROMPOINT, 0, MakeLParam(x,y)) ;

    // this should do the trick..
    if fOldIndex <> lstIndex then
      Application.CancelHint;
    fOldIndex := lstIndex;

    if (lstIndex >= 0) and (lstIndex <= Items.Count) then
      Hint := FileInfoList.Strings[lstIndex]
    else
      Hint := ''
    end;
 {$endif}
 *)
end;

procedure TfrmMain.filelistShowHint(Sender: TObject; HintInfo: PHintInfo);
begin
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
   JobList.Free;
   CategoryList.Free;
   PresetList.Free;
   DestinationList.Free;
   FileInfoList.Free;
end;

procedure TfrmMain.grpOutputSettingsClick(Sender: TObject);
begin

end;

procedure TfrmMain.Label11Click(Sender: TObject);
begin

end;




// menu: edit the presets
procedure TfrmMain.mitPresetsClick(Sender: TObject);
begin
  frmEditPresets.show;
end;

// menu: edit preferences
procedure TfrmMain.mitPreferencesClick(Sender: TObject);
begin
frmPreferences.show;
end;

//menu: help documentation
procedure TfrmMain.mitDocsClick(Sender: TObject);
var s : string;
language: string;
begin
  language:=leftstr(lang,2);
  {$ifdef linux}
  s :='';
  if fileexists('/usr/share/doc/winff/WinFF.' + language + '.pdf.gz') then s:='/usr/share/doc/winff/WinFF.' + language + '.pdf.gz';
  if fileexists('/usr/share/doc/winff/WinFF.' + language + '.pdf') then s:='/usr/share/doc/winff/WinFF.' + language + '.pdf';
  if fileexists('/usr/share/winff/WinFF.' + language + '.pdf') then s:='/usr/share/winff/WinFF.' + language + '.pdf';
  if fileexists('/usr/share/winff/WinFF.' + language + '.pdf.gz') then s:='/usr/share/winff/WinFF.' + language + '.pdf.gz';
  if fileexists('/usr/share/doc/packages/winff/WinFF.' + language + '.pdf.gz') then s:='/usr/share/doc/packages/winff/WinFF.' + language + '.pdf.gz';
  if fileexists('/usr/share/doc/packages/winff/WinFF.' + language + '.pdf') then s:='/usr/share/doc/packages/winff/WinFF.' + language + '.pdf';
  if s='' then
     begin
       s := '/usr/share/doc/winff/WinFF.en.pdf.gz';
       if fileexists('/usr/share/doc/winff/WinFF.en.pdf') then s:='/usr/share/doc/winff/WinFF.en.pdf';
       if fileexists('/usr/share/winff/WinFF.en.pdf') then s:='/usr/share/winff/WinFF.en.pdf';
       if fileexists('/usr/share/winff/WinFF.en.pdf.gz') then s:='/usr/share/winff/WinFF.en.pdf.gz';
       if fileexists('/usr/share/doc/packages/winff/WinFF.en.pdf.gz') then s:='/usr/share/doc/packages/winff/WinFF.en.pdf.gz';
       if fileexists('/usr/share/doc/packages/winff/WinFF.en.pdf') then s:='/usr/share/doc/packages/winff/WinFF.en.pdf';
     end;
  {$endif}
  {$ifdef win32}
  s := extraspath + 'Docs\WinFF.' + language + '.pdf';
  if not (fileexists(s)) then s := extraspath + 'Docs\WinFF.en.pdf';
  {$endif}
  Launchpdf(s);
end;

//menu: Help Forums
procedure TfrmMain.mitForumsClick(Sender: TObject);

begin
  launchbrowser('http://www.winff.org/forums/');
end;

procedure TfrmMain.mitViewModeClick(Sender: TObject);
begin
  if mitViewMode.Checked = True then
   begin
     filelist.style := lbOwnerDrawFixed;;
   end else
   begin
     filelist.style := lbStandard;
   end;
end;

//menu: Help Forums
procedure TfrmMain.mitWinffClick(Sender: TObject);

begin
  launchbrowser('http://www.winff.org/');
end;

// menu: about
procedure TfrmMain.MenuItem2Click(Sender: TObject);
begin
     btnApplyDestination.Click;
     Application.ProcessMessages;
end;

// menu: exit the program
procedure TfrmMain.mitExitClick(Sender: TObject);
begin
  frmMain.close;
end;

procedure TfrmMain.mitPlaySoundonFinishClick(Sender: TObject);
begin
  if mitplaysoundOnFinish.Checked then
    begin
    mitplaysoundOnFinish.checked:=false;
    playscript:='false'
    end
  else
    begin
    mitplaysoundOnFinish.checked:=true;
    playscript:='true';
    end;
end;

// menu: import preset
procedure TfrmMain.mitImportPresetClick(Sender: TObject);
begin
  dlgOpenPreset.Title:=rsSelectPresetFile;
  dlgOpenPreset.InitialDir:=GetMydocumentsPath();
  if dlgOpenPreset.Execute then
     importpresetfromfile(dlgOpenPreset.FileName);

end;

// menu: about
procedure TfrmMain.mitAboutClick(Sender: TObject);
begin
  frmAbout.Show;
end;

// menu: show / hide additional mnuOptions
procedure TfrmMain.mitShowOptionsClick(Sender: TObject);
 begin
{   if not mitShowOptions.Checked then
        begin
        //frmMain.Height := frmMain.Height + pnlAdditionalOptions.Height;
        pnlAdditionalOptions.Visible := True;
        //Constraints.MinHeight := Constraints.MinHeight + pnlAdditionalOptions.Height;

        mitShowOptions.Checked:=true;
        end
  else
        begin
        //Constraints.MinHeight := Constraints.MinHeight - pnlAdditionalOptions.Height;
        pnlAdditionalOptions.visible := false;
        //frmMain.Height := frmMain.Height - pnlAdditionalOptions.Height;

        mitShowOptions.Checked:=false;

        vidbitrate.Clear;
        vidframerate.clear;
        edtAspectRatio.Clear;
        audbitrate.Clear;
        audsamplingrate.Clear;
        vidsizex.Clear;
        vidsizey.clear;
        mitDisplayCmdline.Checked:=false;
        commandlineparams.Clear;
        end;
}
 if not mitShowOptions.Checked then
 begin
      pgSettings.Pages[1].TabVisible:= True;
      sleep(50); application.processmessages;
      pgSettings.Pages[2].TabVisible:=True;
      sleep(50); application.processmessages;
      pgSettings.Pages[3].TabVisible:=True;
      sleep(50); application.processmessages;
      pgSettings.Pages[4].TabVisible:=True;
      sleep(50); application.processmessages;
      pgSettings.Pages[5].TabVisible:=True;
      mitShowOptions.Checked:=true;
 end else
 begin
   pgSettings.Pages[5].TabVisible:=False;
   sleep(50); application.processmessages;
   pgSettings.Pages[4].TabVisible:=False;
   sleep(50); application.processmessages;
   pgSettings.Pages[3].TabVisible:=False;
   sleep(50); application.processmessages;
   pgSettings.Pages[2].TabVisible:=False;
   sleep(50); application.processmessages;
   pgSettings.Pages[1].TabVisible:=False;
   sleep(50); application.processmessages;
   mitShowOptions.Checked:=False;
 end;

 Application.ProcessMessages; // Should repaint the form like invalidate
  //Invalidate; //Why not use Invalidate itself?
  AdjustSize;
// end;
end;

// menu: shutdown on finish
procedure TfrmMain.mitShutdownOnFinishClick(Sender: TObject);
begin
   if mitShutdownOnFinish.Checked then
    begin
    mitShutdownOnFinish.checked:=false;
    end
  else
    begin
    mitPauseOnFinish.checked:=false;
    pausescript:='false';
    mitShutdownOnFinish.Checked:=true;
    end;
end;

// menu: pause on finish
procedure TfrmMain.mitPauseOnFinishClick(Sender: TObject);
begin
  if mitPauseOnFinish.Checked then
    begin
    mitPauseOnFinish.checked:=false;
    pausescript:='false'
    end
  else
    begin
    mitPauseOnFinish.checked:=true;
    pausescript:='true';
    mitShutdownOnFinish.Checked:=false;
    end;
end;

// menu: display commandline
procedure TfrmMain.mitDisplayCmdlineClick(Sender: TObject);
begin
     mitDisplayCmdline.Checked:= not mitDisplayCmdline.Checked;
end;

// btnPlay the selected file
procedure TfrmMain.btnPlayClick(Sender: TObject);
var
i : integer;
filenametoplay: string;
PlayProcess: TProcess;
begin

 playprocess:= TProcess.Create(nil);

 if not fileexists(ffplay) then
   begin
    showmessage(rsCouldNotFindFFplay);
    exit;
   end;

 if filelist.Items.Count = 1 then
    filelist.Selected[0]:=true;

 i:=0;
 while i< filelist.Items.Count do
    if filelist.Selected[i] then
      begin
      filenametoplay:=filelist.Items[i];
      break;
      end
    else i+=1;

 if filenametoplay <>'' then
    begin
    PlayProcess.CommandLine:=ffplay + ' "' + filenametoplay+'"' ;
    playProcess.Execute;
    end;

 playprocess.free;
end;

// Start Conversions
procedure TfrmMain.btnConvertClick(Sender: TObject);
var
i,j : integer;
cb,ct,cl,cr:integer;
pn, extension, params, commandline, command, filename,batfile, passlogfile, basename:string;
qterm, ffmpegfilename,ffplayfilename, usethreads, numthreads, deinterlace, nullfile, titlestring, priority:string;
script: tstringlist;
thetime: tdatetime;
scriptprocess:tprocess;
scriptpriority:tprocesspriority;
ignorepreview:boolean;
resmod : integer;
begin                                     // get setup
   scriptprocess:= TProcess.Create(nil);

   priority := getconfigvalue('general/priority');
   if priority= unit4.rspriorityhigh then scriptpriority:=pphigh
     else if priority= unit4.rsprioritynormal then scriptpriority:=ppnormal
     else if priority= unit4.rspriorityidle then scriptpriority:=ppidle
     else scriptpriority:=ppnormal;
   scriptprocess.Priority:= scriptpriority;


   script:= TStringList.Create;
   {$ifdef win32}if usechcp = 'true' then script.Add('chcp ' + inttostr(ansicodepage));{$endif}
   {$ifdef unix}script.Add('#!/bin/sh');{$endif}

   {$ifdef win32}ffmpegfilename:='"' + ffmpeg + '"';{$endif}
   {$ifdef unix}ffmpegfilename:=ffmpeg;{$endif}
   {$ifdef win32}ffplayfilename:='"' + ffplay + '"';{$endif}
   {$ifdef unix}ffplayfilename:=ffplay;{$endif}
   {$ifdef win32}nullfile:='"NUL.avi"';{$endif}
   {$ifdef unix}nullfile:='/dev/null';{$endif}

   
   if multithreading='true' then
      begin
        numthreads := trim(getconfigvalue('general/numberofthreads'));
        if numthreads = '' then numthreads := '2';
        usethreads := ' -threads ' + numthreads + ' ';
      end
   else usethreads:='';
   
   if cbxDeinterlace.Checked then deinterlace := ' -deinterlace '
    else deinterlace:='';
   
   if not fileexists(ffmpeg) then
      begin
       showmessage(rsCouldnotFindFFplay);
       exit;
      end;

   if filelist.Items.Count=0 then
      begin
       showmessage(rsPleaseAdd1File);
       exit;
      end;

   pn:=getcurrentpresetname(presetbox.Text);
   if pn='' then
      begin
       showmessage(rsPleaseSelectAPreset);
       exit;
      end;

   // this marks the start of the block that is moving inside the loop!!


   // *end of block that is moving inside loop.  block ended before this line
   //
                                           // build batch file
   thetime :=now;
   batfile := 'ff' + FormatDateTime('yymmddhhnnss',thetime) +
           {$ifdef win32}'.bat'{$endif}
           {$ifdef unix}'.sh'{$endif} ;



   for i:=0 to filelist.Items.Count - 1 do
     begin
// MAJOR CHANGE - WARNING - POSSIBLY MAJOR HEADACHES AHEAD
// Because we can have different conversions per Job Item
// We need to recreate the params of the ffmpeg command lines for each job in the queue.
// I am moving a huge chunk of code inside the loop


//1.5       presetbox.text := presetlist.strings[i];
//1.5       categorybox.text := CategoryList.strings[i];
//1.5       DestFolder.Text:=DestinationList.strings[i];

       pn:=getcurrentpresetname(presetbox.Text);
       params:=getpresetparams(pn);
       extension:=getpresetextension(pn);
       frmScript.memo1.lines.Clear;

                                             // trim everything up
       commandlineparams.text := trim(commandlineparams.Text);
       vidbitrate.Text := trim(vidbitrate.Text);
       vidframerate.text := trim(vidframerate.Text);
       VidsizeX.text := trim(VidsizeX.Text);
       VidsizeY.text := trim(VidsizeY.Text);
       edtAspectRatio.Text := trim(edtAspectRatio.text);
       audbitrate.Text := trim(audbitrate.Text);
       audsamplingrate.Text := trim(audsamplingrate.Text);
       audchannels.Text:=trim(audchannels.Text);
       edtCropBottom.Text:=trim(edtCropbottom.text);
       edtCropTop.Text:=trim(edtCropTop.text);
       edtCropleft.Text:=trim(edtCropleft.text);
       edtCropright.Text:=trim(edtCropright.text);
       edtVolume.Text:=trim(edtVolume.Text);
       edtAudioSync.Text:=trim(edtAudioSync.Text);

                                          // replace preset params if mnuOptions specified
       commandline := params;
       if vidbitrate.Text <> '' then
               commandline:=replaceparam(commandline,'-b','-b ' + vidbitrate.text+'k');
       if vidframerate.Text <> '' then
               commandline:=replaceparam(commandline,'-r','-r ' + vidframerate.Text);

    // Inserting Crop Routine here as per Issue 77 on code.google.com
    // Changed by Ian V1.3

    // cropping
       if edtCropBottom.Text <> '' then
          begin
           cb:=strtoint(edtcropbottom.text);
           if cb mod 2 = 1 then cb := cb-1;
           edtcropbottom.text := inttostr(cb);
          end
       else
           edtCropBottom.Text := '0';
    
       if edtCropTop.Text <> '' then
         begin
           ct:=strtoint(edtcroptop.text);
           if ct mod 2 = 1 then ct := ct-1;
           edtcroptop.text := inttostr(ct);
         end
       else
           edtCropTop.Text := '0';
    
       if edtCropLeft.Text <> '' then
         begin
           cl:=strtoint(edtcropleft.text);
           if cl mod 2 = 1 then cl := cl-1;
           edtcropleft.text := inttostr(cl);
         end
       else
           edtCropLeft.Text := '0';
    
       if edtCropRight.Text <> '' then
         begin
           cr:=strtoint(edtcropright.text);
           if cr mod 2 = 1 then cr := cr-1;
           edtcropright.text := inttostr(cr);
         end
       else
           edtCropRight.Text := '0';
    
       // As per libavcodec soname 53 the cropping changed to a filter option with compacted syntax
       // Paul
       if (edtCropTop.Text <> '0') OR (edtCropBottom.Text <> '0') OR (edtCropLeft.Text <> '0') OR (edtCropRight.Text <> '0') then
         begin
              commandline += ' -vf crop=' ;
              commandline += 'iw-' + edtCropLeft.Text + '-' + edtCropRight.Text + ':' ;
              commandline += 'ih-' + edtCropTop.Text + '-' + edtCropBottom.Text + ':' ;
              commandline += edtCropLeft.Text + ':' ;
              commandline += edtCropTop.Text ;
         end;



       if (VidsizeX.Text <>'') AND (VidsizeY.Text <>'') then
       begin
            // 1.2
            //commandline:=replaceparam(commandline,'-s','-s ' + VidsizeX.Text + 'x' + VidsizeY.Text);
            //1.3
            commandline:=replaceparam(commandline,'-s','');
            commandline += ' -s ' + VidsizeX.Text + 'x' + VidsizeY.Text + ' ';

       end;

       if edtAspectRatio.Text <> '' then
               commandline:=replaceparam(commandline,'-aspect','-aspect ' + edtAspectRatio.Text);
       if audbitrate.Text <> '' then
               commandline:=replaceparam(commandline,'-ab','-ab ' + audbitrate.Text+'k');
       if audsamplingrate.Text <> '' then
               commandline:=replaceparam(commandline,'-ar','-ar ' + audsamplingrate.Text);
       if audchannels.Text <> '' then
               commandline:=replaceparam(commandline,'-ac','-ac ' + audchannels.Text);

       // changes for winff 1.3
       //
       ignorepreview := false;
       if edtVolume.Text <> '' then
               commandline:=replaceparam(commandline,'-vol','-vol ' + edtVolume.Text);
       if edtAudioSync.Text <> '' then
               commandline:=replaceparam(commandline,'-async','-async ' + edtAudioSync.Text);

       if edtSeekHH.Value + edtSeekMM.Value + edtSeekSS.Value > 0 then
       begin
         ignorepreview := true;
         if (edtSeekMM.Value < 10) and (length(edtSeekMM.Text)<2) then edtSeekMM.Text := '0' + edtSeekMM.Text;
         if (edtSeekSS.Value < 10) and (length(edtSeekSS.Text)<2) then edtSeekSS.Text := '0' + edtSeekSS.Text;

         commandline:=replaceparam(commandline,'-ss','-ss ' + edtSeekHH.Text + ':' + edtSeekMM.Text + ':' + edtSeekSS.Text);
       end;

       if edtTTRHH.Value + edtTTRMM.Value + edtTTRSS.Value > 0 then
       begin
         ignorepreview := true;
         if (edtTTRMM.Value < 10) and (length(edtTTRMM.Text)<2)  then edtTTRMM.Text := '0' + edtTTRMM.Text;
         if (edtTTRSS.Value < 10) and (length(edtTTRSS.Text)<2)  then edtTTRSS.Text := '0' + edtTTRSS.Text;

         commandline:=replaceparam(commandline,'-t','-t ' + edtTTRHH.Text + ':' + edtTTRMM.Text + ':' + edtTTRSS.Text);
       end;


       if commandlineparams.Text <> '' then
               commandline += ' ' + commandlineparams.text;

       // preview
       // if -ss and -t are already set, ignore the following parameter.
       if (preview = true) and (ignorepreview = false) then
       begin
         commandline += ' -ss 00:01:00 -t 00:00:30';
       end;

// inserted block ends here



       filename := filelist.items[i];
       basename := extractfilename(filename);

       if preview = true then
       begin
         basename := 'tmp_' + inttostr(random(10000000)) ;
       end;	

       // resolve issues with embedded quote marks in filename to be converted.  issue 38
       {$ifdef unix}
       filename := StringReplace(filename,'"','\"',[rfReplaceAll]);
       basename := StringReplace(basename,'"','\"',[rfReplaceAll]);
       {$endif}

       for j:= length(basename) downto 1  do
         begin
           if basename[j] = #46 then
              begin
                basename := leftstr(basename,j-1);
                break;
              end;
         end;

       command := '';
       {$ifdef win32}titlestring:='title ' + rsConverting + ' ' + extractfilename(filename) +
            ' ('+inttostr(i+1)+'/'+ inttostr(filelist.items.count)+')';{$endif}
       {$ifdef unix}titlestring:='echo -n "\033]0; ' + rsConverting +' ' + basename +
            ' ('+inttostr(i+1)+'/'+ inttostr(filelist.items.count)+')'+'\007"';{$endif}
       script.Add(titlestring);
       // coded by Ian Stoffberg - Issue 125
       // begin change
       if cbOutputPath.checked = true then
       begin
         destfolder.text := extractfilepath(filename);
       end else
       begin
         destfolder.text := DestinationList.Strings[i];
       end;
       if RightStr(destfolder.text,1) = DirectorySeparator then // trim extra \'s
        begin
          destfolder.text := copy(DestFolder.text,1,length(DestFolder.text) -1);
        end;
       // End Change

       passlogfile := destfolder.Text + DirectorySeparator + basename + '.log';

       if lowercase((ExtractFileName(filename))) =  lowercase(basename + '.' + extension) then
       begin
               basename :=  'o_' + basename;
       end;

       if cbx2Pass.Checked = false then
          begin
           command := ffmpegfilename + usethreads + ' -y -i "' + filename + '" ' + deinterlace + commandline + ' "' +
                destfolder.Text + DirectorySeparator + basename +'.' + extension+ '"';

           script.Add(command);
          end
       else if cbx2Pass.Checked = true then
          begin
           command := ffmpegfilename + usethreads + ' -i "' + filename + '" ' + deinterlace + commandline + ' -an'
                 + ' -passlogfile "' + passlogfile + '"' + ' -pass 1 ' +  ' -y ' + nullfile ;
           script.Add(command);
           command := ffmpegfilename + usethreads + ' -y -i "' + filename + '" ' + deinterlace + commandline +  ' -passlogfile "'
                 + passlogfile + '"' + ' -pass 2 ' + ' "' + destfolder.Text + DirectorySeparator + basename +'.'
                 + extension+ '"';
           script.add(command);
          end;
       if preview then
         begin
         script.add(ffplayfilename + ' "' + destfolder.Text + DirectorySeparator + basename +'.'+ extension+ '"');
         break;
         end;
     end;
                                       // finish off command

                                         // pausescript
   if (pausescript='true') and (preview=false) then
       begin
       {$ifdef win32}
       script.Add('pause');
       {$endif}
       {$ifdef unix}
       script.Add('read -p "' + rsPressEnter + '" dumbyvar');
       {$endif}
       end;
                                               //shutdown when finnshed
   if mitShutdownOnFinish.Checked and (pausescript='false') then
      {$ifdef win32}script.Add('shutdown.exe -s');{$endif}
      {$ifdef unix}script.Add('shutdown now');{$endif}

                                           // remove preview file if exists
   if preview then
      begin
        {$ifdef win32}script.add('del ' + '"' + destfolder.Text + DirectorySeparator + basename +'.'+ extension+ '"');{$endif}
        {$ifdef unix}script.add('rm ' + '"' + destfolder.Text + DirectorySeparator + basename +'.'+ extension+ '"');{$endif}
        preview:=false;
      end;
                                           // remove batch file on completion
   {$ifdef win32}script.Add('del ' + '"' + presetspath + batfile + '"');{$endif}
   {$ifdef unix}script.Add('rm ' + '"' +  presetspath + batfile+ '"');{$endif}


   if not mitDisplayCmdline.Checked then
    begin
     script.SaveToFile(presetspath+batfile);
     {$ifdef unix}
     fpchmod(presetspath + batfile,&777);
     {$endif}

     {$ifdef win32}
     qterm := '"' + terminal + '"';
     {$endif}

     {$ifdef unix}qterm := terminal;{$endif}
                                                        // do it
     {$ifdef win32}scriptprocess.commandline:= qterm + ' ' + termoptions + ' "' + presetspath + batfile + '"';{$endif}
     {$ifdef unix}scriptprocess.commandline:= qterm + ' ' +  termoptions + ' ' + presetspath + batfile + ' &'; {$endif}

     scriptprocess.execute;
    end
   else
   begin
      // if continue pressed, attempt to execute user modified script;
      frmScript.Memo1.Lines:=script;
      frmScript.scriptfilename:= presetspath + batfile;
      resmod := frmScript.ShowModal;
      if resmod = 1 then     // Continue Clicked;
      begin


       {$ifdef unix}
       fpchmod(presetspath + batfile,&777);
       {$endif}

       {$ifdef win32}
       qterm := '"' + terminal + '"';
       {$endif}

       {$ifdef unix}qterm := terminal;{$endif}
                                                        // do it
       {$ifdef win32}scriptprocess.commandline:= qterm + ' ' + termoptions + ' "' + presetspath + batfile + '"';{$endif}
       {$ifdef unix}scriptprocess.commandline:= qterm + ' ' +  termoptions + ' ' + presetspath + batfile + ' &'; {$endif}

       scriptprocess.execute;

      end;

   end;

    script.Free;
    // try                            // to set dest directory in preset
    //   setpresetdestdir(pn,destfolder.text);
    // finally
    // end;
end;

   // replace a paramter from a commandline
function TfrmMain.replaceparam(commandline:string; param:string; replacement:string):string;
var
i,startpos,endpos: integer;

begin
 startpos:=pos(param +' ', commandline);
 endpos:=length(commandline)+1;
 if startpos <> 0 then
   begin
     for I:=startpos+1 to length(commandline)-1 do
         if commandline[i]='-' then
            begin
            endpos:=i-1;
            break;
            end;
     delete(commandline,startpos,endpos-startpos);
     commandline:=leftstr(commandline,startpos)+replacement+' '+rightstr(commandline,length(commandline)-startpos);
   end
 else
     commandline+= ' ' + replacement;
     result:=commandline;
end;

procedure TfrmMain.VidbitrateChange(Sender: TObject);
begin

end;

// import a preset from a file
procedure TfrmMain.importpresetfromfile(presetfilename: string);
var
 importfile: txmldocument;
 importedpreset: tdomelement;
 i,j,reply:integer;
 replaceall: boolean = false;
 removepreset: boolean = false;
 nodeexists:boolean = false;
 newnode,labelnode,paramsnode,extensionnode,categorynode,
  textl,textp,texte,textc, node: tdomnode;
 nodename,nodelabel,nodeext,testchars:string;
begin
 if not fileexists(presetfilename) then
    begin
      showmessage(rsCouldNotFindFile);
      exit;
    end;

 try
  importfile := TXMLdocument.Create;
 except
 end;

 try
   ReadXMLFile(importfile, presetFileName);
   importedpreset:=importfile.DocumentElement;
 except
  showmessage(rsInvalidPreset);
  exit;
 end;

 if importedpreset.ChildNodes.Count = 0 then exit;

 for j:= 0 to importedpreset.ChildNodes.Count -1 do
 begin

   node:= importedpreset.ChildNodes.Item[j];

   nodename:= node.NodeName;

   removepreset:=false;
   nodeexists:=false;
   for i:= 0 to presets.ChildNodes.Count -1 do
     if presets.ChildNodes.Item[i].NodeName = nodename then nodeexists := true;

   if nodeexists then
     begin
       if replaceall=false then reply :=  MessageDlg ('Replace Preset', Format(rsPresetAlreadyExist, ['"', nodename, '"']),
                                            mtConfirmation, [mbYes, mbNo, mbAll, mbCancel],0);
       if reply=mrCancel then exit;
       if reply=mrNo then continue;
       if reply=mrAll then replaceall := true;
       if (reply=mrYes) or (reply = mrAll) or (replaceall = true) then removepreset:=true;
       if removepreset then presets.RemoveChild(presets.FindNode(nodename));
     end;

   try
     nodelabel := node.FindNode('label').FindNode('#text').NodeValue;
   except
     begin
       showmessage(rsPresethasnolabel);
       exit;
     end;
   end;

   try
     testchars := node.FindNode('params').FindNode('#text').NodeValue;
   except
   end;
   for i:= 0 to length(testchars)-1 do
     begin
       if (testchars[i] = #124) or (testchars[i] = #60) or (testchars[i] = #62) or
          (testchars[i] = #59) or (testchars[i] = #38) then
         begin
          showmessage(rsThePresetHasIllegalChars);
          exit;
         end;
     end;

   for i:= 0 to presets.ChildNodes.Count -1 do
     if presets.ChildNodes.Item[i].findnode('label').FindNode('#text').NodeValue = nodelabel then
        begin
         showmessage(Format(rsPresetWithLabelExists, ['"', nodelabel, '"']));
         exit;
        end;


   try
     nodeext := node.FindNode('extension').FindNode('#text').NodeValue;
   except
     begin
       showmessage(rsPresetHasNoExt);
       exit;
     end;
   end;

   newnode:=presetsfile.CreateElement(nodename);
   presets.AppendChild(newnode);
   labelnode:=presetsfile.CreateElement('label');
   newnode.AppendChild(labelnode);
   paramsnode:=presetsfile.CreateElement('params');
   newnode.AppendChild(paramsnode);
   extensionnode:=presetsfile.CreateElement('extension');
   newnode.AppendChild(extensionnode);
   categorynode:=presetsfile.CreateElement('category');
   newnode.AppendChild(categorynode);

   textl:=presetsfile.CreateTextNode(nodelabel);
   labelnode.AppendChild(textl);


   try
     textp:=presetsfile.CreateTextNode(node.FindNode('params').FindNode('#text').NodeValue);
   except
     textp:=presetsfile.CreateTextNode('');
   end;
   paramsnode.AppendChild(textp);

   texte:=presetsfile.CreateTextNode(nodeext);
   extensionnode.AppendChild(texte);

   try
     textc:=presetsfile.CreateTextNode(node.FindNode('category').FindNode('#text').NodeValue);
   except
     textc:=presetsfile.CreateTextNode('');
   end;
   categorynode.AppendChild(textc);

 end; //for j = 1 to childnodes-1

writexmlfile(presetsfile, presetspath + 'presets.xml');  // save the imported preset
populatepresetbox('');
end;

function TfrmMain.GetFileInfo(var fileDetails : string) : string;
var ts : tmemo;
    i,j,k : integer;
    s,t,u : string;
begin
//

  ts := tmemo.Create(self);
  ts.Lines.Clear;
  launchffmpeginfo(filedetails);
  t := presetspath + 'output.txt';
  ts.lines.LoadFromFile(t);
  result := '';
  fileDetails := '';
  for i := 0 to ts.lines.count -1 do
    begin
      s := ts.lines[i];
      if pos('duration',lowercase(s)) > 0 then
        begin
           result := result + s;
        end;
       if pos('stream #',lowercase(s)) > 0 then
        begin
           fileDetails := fileDetails + '  ' + s;
        end;
    end;
  try
    DeleteFileUTF8(t);
  except
  end;
  ts.free;

end;

initialization
  {$I unit1.lrs}
  {$ifdef win32}PODirectory := extraspath + '\languages\'{$endif};
  {$ifdef unix}PODirectory := '/usr/share/winff/languages/'{$endif};
  GetLanguageIDs(Lang, FallbackLang); // in unit gettext


  POFile := PODirectory + 'winff.' + Lang + '.po';
  if not FileExists(POFile) then
     POFile := PODirectory + 'winff.' + FallbackLang + '.po';

  if FileExists(POFile) then
  begin
    try
      LRSTranslator := TPoTranslator.Create(POFile);
    except
    end;
  end
  else
    POFile := '';



end.

