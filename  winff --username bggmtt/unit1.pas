unit Unit1; 

// WInFF 0.3 Copyright 2006-2008 Matthew Weatherford
// http://winff.org
// Licensed under the GPL v3 or any later version


{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs,
  {$IFDEF WIN32} windows, shellapi, dos,{$endif}
  {$IFDEF unix} baseunix, unix, dos,{$endif}
  laz_xmlcfg, dom, xmlread, xmlwrite, StdCtrls, Buttons, ActnList, Menus, unit2, unit3,
  unit4, unit5, gettext, translations, process
  {$IFDEF TRANSLATESTRING}, DefaultTranslator{$ENDIF}, ExtCtrls, ComCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    AddBtn: TBitBtn;
    Aspectratio: TEdit;
    audbitrate: TEdit;
    audchannels: TEdit;
    audsamplingrate: TEdit;
    categorybox: TComboBox;
    CheckBox2: TCheckBox;
    ChooseFolderBtn: TButton;
    ClearBtn: TBitBtn;
    commandlineparams: TEdit;
    DestFolder: TEdit;
    displaycmdline: TMenuItem;
    filelist: TListBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    mitDocs: TMenuItem;
    mitAbout: TMenuItem;
    MenuItem6: TMenuItem;
    mitWinff: TMenuItem;
    mitForums: TMenuItem;
    MenuItem9: TMenuItem;
    Notebook1: TNotebook;
    OpenDialog2: TOpenDialog;
    optionsbtn: TBitBtn;
    PageControl1: TPageControl;
    Panel1: TPanel;
    Panel2: TPanel;
    pass2: TCheckBox;
    Play: TBitBtn;
    pnlbottom: TPanel;
    pnlbottom2: TPanel;
    pnlMain: TPanel;
    pauseonfinish: TMenuItem;
    PresetBox: TComboBox;
    RemoveBtn: TBitBtn;
    shutdownonfinish: TMenuItem;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    importmenu: TMenuItem;
    showoptions: TMenuItem;
    Options: TMenuItem;
    filemenu: TMenuItem;
    MainMenu1: TMainMenu;
    OpenDialog1: TOpenDialog;
    SelectDirectoryDialog1: TSelectDirectoryDialog;
    StartBtn: TBitBtn;
    tabPage1: TTabSheet;
    tabPage2: TPage;
    tabPage3: TPage;
    tabPage4: TPage;
    Vidbitrate: TEdit;
    Vidframerate: TEdit;
    VidsizeX: TEdit;
    VidsizeY: TEdit;
    procedure AspectratioChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure categoryboxChange(Sender: TObject);
    procedure LaunchBrowser(URL:string);
    procedure LaunchPdf(pdffile:string);
    procedure ChooseFolderBtnClick(Sender: TObject);
    procedure AddBtnClick(Sender: TObject);
    procedure ClearBtnClick(Sender: TObject);
    procedure displaycmdlineClick(Sender: TObject);
    procedure ExitmenuClick(Sender: TObject);
    procedure filelistKeyPress(Sender: TObject; var Key: char);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDropFiles(Sender: TObject; const FileNames: array of String);
    procedure FormResize(Sender: TObject);
    procedure importmenuClick(Sender: TObject);
    procedure mitAboutClick(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure mitDocsClick(Sender: TObject);
    procedure mitForumsClick(Sender: TObject);
    procedure mitWinffClick(Sender: TObject);
    procedure pauseonfinishClick(Sender: TObject);
    procedure PlayClick(Sender: TObject);
    procedure RemoveBtnClick(Sender: TObject);
    function GetDeskTopPath() : string;
    function GetMydocumentsPath() : string ;
    procedure setconfigvalue(key:string;value:string);
    function getconfigvalue(key:string):string;
    procedure populatepresetbox(selectedcategory:string);
    function getcurrentpresetname(currentpreset:string):string;
    function getpresetparams(presetname:string):string;
    function getpresetcategory(presetname:string):string;
    function getpresetextension(presetname:string):string;
    procedure showoptionsClick(Sender: TObject);
    procedure shutdownonfinishClick(Sender: TObject);
    procedure StartBtnClick(Sender: TObject);
    procedure importpresetfromfile(presetfilename: string);
    function GetappdataPath() : string ;
    function replaceparam(commandline:string;param:string;replacement:string):string;
    procedure VidbitrateChange(Sender: TObject);
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
  Form1: TForm1; 
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
  multithreading: string;
  PODirectory, Lang, FallbackLang: String;

  Resourcestring
  // captions
  rsAddBtn='Add';
  rsLabel10='Audio Channels';
  rsdisplaycmdline='Display CMD Line';
  rspauseonfinish='Pause on Finish';
  rsshutdownonfinish='Shutdown on Finish';
  rsoptionsbtn='Options';
  rsclosebtn='Options';
  rsStartBtn='Convert';
  rsPlay='Play';
  rsClearBtn='Clear';
  rsRemoveBtn='Remove';
  rsCheckBox2='Deinterlace';
  rspass2='2 pass';
  rsMenuItem1='Edit';
  rsMenuItem2='About';
  rsMenuItem3='Exit';
  rsMenuItem4='Presets';
  rsMenuItem5='Preferences';
  rsMenuItem6='WinFF Website';
  rsMenuItem7='WinFF Forums';
  rsmitdocs='Documentation';
  rsmitabout='About';
  rsimportmenu='Import Preset';
  rsshowoptions='Additional Options';
  rsOptions='Options';
  rsClose='Close';
  rsfilemenu='File';
  //rsGroupBox2='Additional Command Line Parameters (Advanced)';

  rsLabel5='Video Size';
  rsLabel6='Aspect Ratio';
  rsLabel7='Audio Bitrate';
  rsLabel8='Sample Rate';
  rsLabel4='Frame Rate';
  rsLabel3='Video Bitrate';
  rsGroupBox1='Additional Options';
  rsLabel2='Output Folder';
  rsLabel1='Convert To ...';
  rslabel11='Output Folder';
  rsLabel19='Device Preset';
  tabPage1caption='Output Details';
  tabPage2caption='Video Settings';
  tabPage3caption='Audio Settings';
  tabPage4caption='Additional Command Line Parameters (Advanced)';

  //messages
  rsCouldNotFindPresetFile = 'Could not find presets file.';
  rsCouldNotFindFFmpeg = 'Could not find FFmpeg.';
  rsCouldNotFindFFplay = 'Could not find FFPlay.';
  rsSelectVideoFiles = 'Select Video Files';
  rsSelectPresetFile = 'Select Preset File';
  rsPleaseSelectAPreset = 'Please select a preset';
  rsPleaseAdd1File = 'Please add at least 1 file to convert';
  rsConverting = 'Converting';
  rsPressEnter = 'Press Enter to Continue';
  rsCouldNotFindFile = 'Could Not Find File';
  rsInvalidPreset = 'Invalid Preset File';
  rsPresetAlreadyExist = 'Preset: %s%s%s already exists';
  rsPresetHasNoLabel = 'The preset to import does not have a label';
  rsThePresetHasIllegalChars = 'The preset contains illegal characters';
  rsPresetWithLabelExists = 'Preset with label: %s%s%s already exists';
  rsPresethasnoExt = 'The preset to import does not have an extension';
  rsNameMustBeAllpha = 'Name Must be alphanumeric (a-z,A-Z,0-9)';
  rsExtensionnoperiod = 'Extension can not contain a period';
  rsFileDoesNotExist = 'file does not exist';
  rsPresettoExport = 'Please select a preset to export';
  rsAllCategories = '(All Categories)';
implementation


// Initialize everything
procedure tform1.FormCreate(Sender: TObject);
var
f1,f2:textfile;
ch: char;
i:integer;
formheight,formwidth,formtop,formleft:integer;
sformheight,sformwidth,sformtop,sformleft:string;
importfromcmdline: string;
currentpreset: string;

begin
   ExtrasPath:= ExtractFilePath(ParamStr(0));


               // do translations
   {$ifdef win32}PODirectory := extraspath + '\languages\'{$endif};
   {$ifdef unix}PODirectory := '/usr/share/winff/languages/'{$endif};
   GetLanguageIDs(Lang, FallbackLang); // in unit gettext
   TranslateUnitResourceStrings('unit1', PODirectory + 'winff.%s.po', Lang, FallbackLang);

    AddBtn.Caption:=rsaddbtn;
    Label10.Caption:=rslabel10;
    displaycmdline.Caption:=rsdisplaycmdline;
    pauseonfinish.Caption:=rspauseonfinish;
    shutdownonfinish.Caption:=rsshutdownonfinish;
    optionsbtn.Caption:=rsoptionsbtn;
    StartBtn.Caption:=rsstartbtn;
    Play.Caption:=rsplay;
    ClearBtn.Caption:=rsclearbtn;
    RemoveBtn.Caption:=rsremovebtn;
    CheckBox2.Caption:=rscheckbox2;
    pass2.Caption:=rspass2;
    MenuItem1.Caption:=rsmenuitem1;
    MenuItem2.Caption:=rsmenuitem2;
    MenuItem3.Caption:=rsmenuitem3;
    MenuItem4.Caption:=rsmenuitem4;
    MenuItem5.Caption:=rsmenuitem5;
    mitWinff.Caption := rsmenuitem6;
    mitForums.Caption := rsmenuitem7;
    mitAbout.Caption:= rsmitabout;
    mitdocs.Caption:= rsmitdocs;
    importmenu.Caption:=rsimportmenu;
    showoptions.Caption:=rsshowoptions;
    Options.Caption:=rsoptions;
    filemenu.Caption:=rsfilemenu;
    //GroupBox2.Caption:=rsgroupbox2;
    Label5.Caption:=rslabel5;
    Label6.Caption:=rslabel6;
    Label7.Caption:=rslabel7;
    Label8.Caption:=rslabel8;
    Label4.Caption:=rslabel4;
    Label3.Caption:=rslabel3;
    label11.Caption:=rslabel11;
    Label19.Caption:=rslabel19;
    GroupBox1.Caption:=rsgroupbox1;
    Label1.Caption:=rslabel1;
    Label2.Caption:=rslabel2;
    tabPage1.Caption:=tabPage1caption;
    tabPage2.Caption:=tabPage2caption;
    tabPage3.Caption:=tabPage3caption;
    tabPage4.Caption:=tabPage4caption;


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
  presetbox.Height:=30;
  categorybox.Height:=30;

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
            ffmpeg := '/usr/local/bin/ffplay'
         else
            showmessage(rsCouldNotFindFFPlay);
       setconfigvalue('unix/ffplay',ffplay);
     end;
     
  terminal := getconfigvalue('unix/terminal');
  if terminal = '' then
     begin
       terminal := '/usr/bin/xterm';
       if fileexists('/usr/bin/x-terminal-emulator') then terminal:='/usr/bin/x-terminal-emulator';
       setconfigvalue('unix/terminal',terminal);
     end;
     
  termoptions := getconfigvalue('unix/termoptions');
  if termoptions = '' then
     begin
       termoptions := '-e';
       setconfigvalue('unix/termoptions',termoptions);
     end;
  {$ENDIF}

  destfolder.text := getconfigvalue('general/destfolder');   // get destination folder
  if destfolder.text='' then DestFolder.Text:= getmydocumentspath();
  rememberlast := getconfigvalue('general/rememberlast');
  if rememberlast='' then
    begin
     rememberlast:= 'true';
     setconfigvalue('general/rememberlast',rememberlast);
    end;

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
     form1.close;
     end;

  presetsfile.Create;                         // load the presets file
  try
   ReadXMLFile(presetsfile, presetspath+'presets.xml');
   presets:=presetsfile.DocumentElement;
  except
   showmessage(rsCouldNotFindPresetFile);
   form1.close;
  end;
                                      // import preset from command line
  if paramstr(1) <> '' then
   begin
   importfromcmdline := paramstr(1);
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

  if sformtop <> '' then formtop:=strtoint(sformtop);
  if formtop > 0 then form1.Top := formtop;

  if sformleft <> '' then formleft:=strtoint(sformleft);
  if formleft >0 then form1.Left := formleft;

  if sformheight = '' then formheight:=400
  else formheight := strtoint(sformheight);

  if sformwidth = '' then formwidth:=400
  else formwidth := strtoint(sformwidth);

  if formheight<400 then formheight:=400;
  if formwidth<400 then formheight:=400;
  if showopts='' then showopts:='false';
  if showopts='true' then
        begin
        showoptions.Checked:=true;
        pnlBottom2.Visible :=true;
        form1.height := formheight;
        form1.width := formwidth;
        form1.invalidate;
        end
  else
        begin
        showoptions.Checked:=false;
        pnlBottom2.Visible :=false;
        form1.height := formheight;
        form1.width := formwidth;
        form1.invalidate;
        end;

                                         // check 2 pass encoding
  pass2encoding:=getconfigvalue('general/pass2');
  if pass2encoding='' then pass2.checked:=false;
  if pass2encoding='true' then pass2.checked:=true;
  
                                      // check pause before finished
  pausescript:=getconfigvalue('general/pause');
  if pausescript='' then
    begin
     pausescript:= 'true';
     setconfigvalue('general/pause',pausescript);
    end;
  if pausescript='true' then
     pauseonfinish.Checked:=true
  else
     pauseonfinish.Checked:=false;


                                        // check for multithreading
  multithreading:=getconfigvalue('general/multithreading');


end;


// clean up and shut down
procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var
s:string;
begin
  if rememberlast = 'true' then   // save destination folder
     setconfigvalue('general/destfolder',destfolder.text);

  s := presetbox.text;   // save default preset
  if s <> '' then setconfigvalue('general/currentpreset',s);

  if showoptions.Checked then // save show options
     setconfigvalue('general/showoptions','true')
  else
     setconfigvalue('general/showoptions','false');

  if pauseonfinish.Checked then // save pause on finish
     setconfigvalue('general/pause','true')
  else
     setconfigvalue('general/pause','false');

           
  if pass2.Checked then // save 2 pass
     setconfigvalue('general/pass2','true')
  else
     setconfigvalue('general/pass2','false');

     // save window position and size
  setconfigvalue('window/height',inttostr(form1.height));
  setconfigvalue('window/width',inttostr(form1.width));
  setconfigvalue('window/top',inttostr(form1.Top));
  setconfigvalue('window/left',inttostr(form1.Left));

  presetsfile.Free;           // cleanup

end;

// keep width on resize
procedure TForm1.FormResize(Sender: TObject);
begin
  // Affects Panel Resizing.
  // Changed to use Form Minimum / Height / Width using the GUI Property Settings

end;

// get the params from the preset
function tform1.getpresetparams(presetname:string):string;
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
function tform1.getpresetcategory(presetname:string):string;
var
catnode : tdomnode;
category:string;
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

// get the extension of the preset
function tform1.getpresetextension(presetname:string):string;
begin
   result:=presets.FindNode(presetname).FindNode('extension').FindNode('#text').NodeValue;
end;

// get the name of the selected preset
function tform1.getcurrentpresetname(currentpreset:string):string;
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
procedure tform1.populatepresetbox(selectedcategory:string);
var
i,j:integer;
ispresent: boolean;
node,subnode, catnode,catsubnode : tdomnode;
category,presetcategory: string;
categorylist: tstrings;
begin
   selectedcategory:=trim(selectedcategory);
   categorybox.Clear;
   categorybox.items.add('------');
   for i:= 0 to presets.ChildNodes.Count -1  do
     begin
       node:= presets.ChildNodes.item[i];
       subnode:= node.FindNode('category');
       try
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
         presetbox.items.add(subnode.findnode('#text').NodeValue)
      else
         if (presetcategory = category) then
            presetbox.items.add(subnode.findnode('#text').NodeValue);
   end;
   presetbox.sorted:=true;
   presetbox.sorted:=false;
end;

// change category
procedure TForm1.categoryboxChange(Sender: TObject);
var
i,j:integer;
node,subnode, catnode,catsubnode : tdomnode;
selectedcategory, category,presetcategory: string;
categorylist: tstrings;
begin
   selectedcategory:=categorybox.Text;

   presetbox.Clear;
   if selectedcategory='------' then
      category:=''
   else
      category:=trim(categorybox.Text);

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
         presetbox.items.add(subnode.findnode('#text').NodeValue)
      else
         if (presetcategory = category) then
            presetbox.items.add(subnode.findnode('#text').NodeValue);
   end;
   presetbox.sorted:=true;
   presetbox.sorted:=false;

end;

// launch browser
procedure TForm1.launchbrowser(URL:string);
begin
{$ifdef linux}
  exec('/usr/bin/firefox', URL);
  If Dosexitcode<>0 Then exec('/usr/bin/mozilla-firefox', URL);
  If Dosexitcode<>0 Then exec('/usr/bin/konqueror', URL);
  If Dosexitcode<>0 Then Showmessage('More information can be found at ' + URL);
  {$endif}
  {$ifdef win32}
  ShellExecute(self.Handle,'open',PChar(URL),nil,nil, SW_SHOWNORMAL);
  {$endif}
end;

// launch pdf
procedure TForm1.LaunchPdf(pdffile:string);
begin
  {$ifdef linux}
  exec('/usr/bin/evince', pdffile);
  If Dosexitcode<>0 Then exec('/usr/bin/kpdf', pdffile);
  If Dosexitcode<>0 Then exec('/usr/bin/xpdf', pdffile);
  If Dosexitcode<>0 Then exec('/usr/bin/acroread', pdffile);
  If Dosexitcode<>0 Then Showmessage('More information can be found at http://www.winff.org');
  {$endif}
  {$ifdef win32}
  ShellExecute(self.Handle,'open',PChar(pdffile),nil,nil, SW_SHOWNORMAL);
  {$endif}
end;

// set a value in the config file
procedure TForm1.setconfigvalue(key:string;value:string);
var
cfg: TXMLConfig;
begin
 cfg := TXMLConfig.create(presetspath+'cfg.xml');
 cfg.SetValue(key,value);
 cfg.free;
end;

// get a value from the config file
function TForm1.getconfigvalue(key:string): string;
var
cfg: TXMLConfig;
begin
 cfg := TXMLConfig.create(presetspath+'cfg.xml');
 result := cfg.GetValue(key, '');
 cfg.free;
end;

// get the user's desktop path
function tform1.GetDeskTopPath() : string ;
{$ifdef win32}
var
  ppidl: PItemIdList;
begin
  ppidl := nil;
  SHGetSpecialFolderLocation(Form1.Handle,CSIDL_DESKTOPDIRECTORY , ppidl);
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
function tform1.GetMydocumentsPath() : string ;
{$ifdef win32}
var
  ppidl: PItemIdList;
begin
  ppidl := nil;
  SHGetSpecialFolderLocation(Form1.Handle,CSIDL_PERSONAL , ppidl);
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

// get the user's application data path
function tform1.GetappdataPath() : string ;
{$ifdef win32}
var
  ppidl: PItemIdList;
begin
  ppidl := nil;
  SHGetSpecialFolderLocation(Form1.Handle,CSIDL_APPDATA , ppidl);
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
function tform1.GetWIn32System(): Integer;
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
procedure TForm1.ChooseFolderBtnClick(Sender: TObject);
begin
  SelectDirectoryDialog1.execute;
  DestFolder.Text := SelectDirectoryDialog1.FileName;
end;

procedure TForm1.AspectratioChange(Sender: TObject);
begin

end;


// drop files into list
procedure TForm1.FormDropFiles(Sender: TObject; const FileNames: array of String
  );
var
numfiles, i:integer;
begin
numfiles := high(Filenames);
for i:= 0 to numfiles do
   filelist.Items.add(Filenames[i]);
end;

// add files to the list
procedure tform1.AddBtnClick(Sender: TObject);
begin
   Opendialog1.Title:=rsSelectVideoFiles;
   Opendialog1.InitialDir := getconfigvalue('general/addfilesfolder');
   if OpenDialog1.Execute then
      begin
       setconfigvalue('general/addfilesfolder',opendialog1.InitialDir);
       filelist.items.AddStrings(OpenDialog1.Files);
      end;
end;

// remove a file from the list
procedure tform1.RemoveBtnClick(Sender: TObject);
var
i: integer;
begin
  i:=0;
  while i< filelist.Items.Count do
    if filelist.Selected[i] then
      filelist.Items.Delete(i)
    else
       i+=1;
end;

// clear the file list
procedure tform1.ClearBtnClick(Sender: TObject);
begin
  filelist.Clear;
end;



procedure TForm1.ExitmenuClick(Sender: TObject);
begin

end;

// filelist key press
procedure TForm1.filelistKeyPress(Sender: TObject; var Key: char);
var
i:integer;
begin

  if key = char(8) then
   begin
    i:=0;
   while i< filelist.Items.Count do
    if filelist.Selected[i] then
      filelist.Items.Delete(i)
    else
       i+=1;
   end;

end;

procedure TForm1.FormActivate(Sender: TObject);
begin
end;


// menu: edit the presets
procedure TForm1.MenuItem4Click(Sender: TObject);
begin
  form2.show;
end;

// menu: edit preferences
procedure TForm1.MenuItem5Click(Sender: TObject);
begin
form4.show;
end;

//menu: help documentation
procedure TForm1.mitDocsClick(Sender: TObject);
var s : string;
language: string;
begin
  language:=leftstr(lang,2);
  showmessage(language);
  {$ifdef linux}
  s :='';
  if fileexists('/usr/share/doc/winff/WinFF.' + language + '.pdf.gz') then s:='/usr/share/doc/winff/WinFF.' + language + '.pdf.gz';
  if fileexists('/usr/share/docs/winff/WinFF.' + language + '.pdf') then s:='/usr/share/docs/winff/WinFF.' + language + '.pdf';
  if fileexists('/usr/share/winff/WinFF.' + language + '.pdf') then s:='/usr/share/winff/WinFF.' + language + '.pdf';
  if fileexists('/usr/share/winff/WinFF.' + language + '.pdf.gz') then s:='/usr/share/winff/WinFF.' + language + '.pdf.gz';
  if fileexists('/usr/share/doc/packages/winff/WinFF.' + language + '.pdf.gz') then s:='/usr/share/doc/packages/winff/WinFF.' + language + '.pdf.gz';
  if fileexists('/usr/share/doc/packages/winff/WinFF.' + language + '.pdf') then s:='/usr/share/doc/packages/winff/WinFF.' + language + '.pdf';
  if s='' then
     begin
       s := '/usr/share/doc/winff/WinFF.en.pdf.gz';
       if fileexists('/usr/share/docs/winff/WinFF.en.pdf') then s:='/usr/share/docs/winff/WinFF.en.pdf';
       if fileexists('/usr/share/winff/WinFF.en.pdf') then s:='/usr/share/winff/WinFF.en.pdf';
       if fileexists('/usr/share/winff/WinFF.en.pdf.gz') then s:='/usr/share/winff/WinFF.en.pdf.gz';
       if fileexists('/usr/share/doc/packages/winff/WinFF.en.pdf.gz') then s:='/usr/share/doc/packages/winff/WinFF.en.pdf.gz';
       if fileexists('/usr/share/doc/packages/winff/WinFF.en.pdf') then s:='/usr/share/doc/packages/winff/WinFF.en.pdf';
     end;
  {$endif}
  {$ifdef win32}
  s := extraspath + 'WinFF.' + language + '.pdf';
  if not (fileexists(s)) then s := extraspath + 'WinFF.en.pdf';
  {$endif}
  Launchpdf(s);
end;

//menu: Help Forums
procedure TForm1.mitForumsClick(Sender: TObject);
var s : string;
begin
  launchbrowser('http://www.winff.org/forums/');
end;

//menu: Help Forums
procedure TForm1.mitWinffClick(Sender: TObject);
var s : string;
begin
  launchbrowser('http://www.winff.org/');
end;

// menu: about
procedure TForm1.MenuItem2Click(Sender: TObject);
begin
  form3.show;
end;

// menu: exit the program
procedure TForm1.MenuItem3Click(Sender: TObject);
begin
  form1.close;
end;

// menu: import preset
procedure TForm1.importmenuClick(Sender: TObject);
begin
  OpenDialog2.Title:=rsSelectPresetFile;
  opendialog2.InitialDir:=GetMydocumentsPath();
  if OpenDialog2.Execute then
     importpresetfromfile(opendialog2.FileName);

end;

procedure TForm1.mitAboutClick(Sender: TObject);
begin
  form3.Show;
end;

// menu: show / hide additional options
procedure TForm1.showoptionsClick(Sender: TObject);
 begin
   if not showoptions.Checked then
        begin
        //form1.Height:=461;
        //groupbox1.Top:=264;
        //groupbox1.Visible:=true;
        //groupbox2.top:=376;
        //groupbox2.Visible:=true;
        //
        //tabPage2.Visible:=  true;
        //tabPage3.Visible:=  true;
        //tabPage4.visible := displaycmdline.Checked;
        //pnlbottom.visible := true;
        form1.Height:=form1.Height + pnlBottom.Height ; // This should be fine, not sure if you want to limit height

        if form1.height < 400 then form1.height := 550;

        pnlBottom2.Visible := True;
        showoptions.Checked:=true;
        //form1.invalidate;
        end
  else
        begin
        //form1.Height:=290;
        //groupbox1.Top:=264;
        //groupbox1.Visible:=false;
        //groupbox2.top:=264;
        //groupbox2.Visible:=false;

        if form1.Height - pnlBottom2.Height > 400 then
          begin
            form1.Height:=form1.Height-pnlBottom.Height;
          end
        else
          begin
            form1.Height := 400;/// Ensure they don't make it too small.
          end;
        pnlbottom2.visible := false;
        showoptions.Checked:=false;

        //form1.invalidate;
        vidbitrate.Clear;
        vidframerate.clear;
        aspectratio.Clear;
        audbitrate.Clear;
        audsamplingrate.Clear;
        vidsizex.Clear;
        vidsizey.clear;
        displaycmdline.Checked:=false;
        commandlineparams.Clear;
        end;
  Application.ProcessMessages; // Should repaint the form like invalidate
end;
// menu: shutdown on finish
procedure TForm1.shutdownonfinishClick(Sender: TObject);
begin
   if shutdownonfinish.Checked then
    begin
    shutdownonfinish.checked:=false;
    end
  else
    begin
    pauseonfinish.checked:=false;
    pausescript:='false';
    shutdownonfinish.Checked:=true;
    end;
end;

// menu: pause on finish
procedure TForm1.pauseonfinishClick(Sender: TObject);
begin
  if pauseonfinish.Checked then
    begin
    pauseonfinish.checked:=false;
    pausescript:='false'
    end
  else
    begin
    pauseonfinish.checked:=true;
    pausescript:='true';
    shutdownonfinish.Checked:=false;
    end;
end;

// menu: display commandline
procedure TForm1.displaycmdlineClick(Sender: TObject);
begin
     displaycmdline.Checked:= not displaycmdline.Checked;
end;

// play the selected file
procedure TForm1.PlayClick(Sender: TObject);
var
selecteditem,i : integer;
ffplayfilename,filenametoplay: string;
begin
 {$ifdef win32}ffplayfilename:='"' + ffplay + '"';{$endif}

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
    sysutils.ExecuteProcess(ffplay, '"' + filenametoplay+'"' );

end;

// math for neuros
procedure TForm1.Button1Click(Sender: TObject);
var
vx,vy,vxf,vyf : real;
vxi,vyi:longint;
vxs,vys:string;
begin
   if (vidsizeX.text <>'') and (vidsizey.Text <> '') then
     begin
     try
     vx:=strtofloat(VidsizeX.Text);
     vy:=strtofloat(VidsizeY.Text);
     except
     vx:=0;
     vy:=0;
     end;
     if (vx>0) and (vy>0) then
        begin
        vxf:=sqrt(307200*vx/vy);
        vyf:=sqrt(307200*vy/vx);
        vxf:=round(vxf);
        vyf:=round(vyf);
        vxs:=floattostr(vxf);
        vys:=floattostr(vyf);
        vxs:=trim(vxs);
        vys:=trim(vys);
        vxi:=strtoint(vxs);
        vyi:=strtoint(vys);
        if vxi mod 2 = 1 then vxi-=1;
        if vyi mod 2 = 1 then vyi-=1;
        VidsizeX.Text:=inttostr(vxi);
        VidsizeY.Text:=inttostr(vyi);
        end;
     end;
end;



// Start Conversions
procedure TForm1.StartBtnClick(Sender: TObject);
var
i,j : integer;
pn, extension, params, commandline, command, filename,batfile, passlogfile, basename:string;
qterm, ffmpegfilename, usethreads, deinterlace, nullfile, titlestring, vxs,vys,priority:string;
script: tstringlist;
thetime: tdatetime;
scriptprocess:tprocess;
scriptpriority:tprocesspriority;
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
   {$ifdef win32}ffmpegfilename:='"' + ffmpeg + '"';{$endif}
   {$ifdef unix}ffmpegfilename:=ffmpeg;{$endif}

   {$ifdef win32}nullfile:='"NUL.avi"';{$endif}
   {$ifdef unix}nullfile:='/dev/null';{$endif}

   
   if multithreading='true' then usethreads := ' -threads 2'
    else usethreads:='';
   
   if checkbox2.Checked then deinterlace := ' -deinterlace '
    else deinterlace:='';
   
   if not fileexists(ffmpeg) then
      begin
       showmessage(rsCouldnotFindFFplay);
       exit;
      end;

   pn:=getcurrentpresetname(presetbox.Text);
   if pn='' then
      begin
       showmessage(rsPleaseSelectAPreset);
       exit;
      end;
   if filelist.Items.Count=0 then
      begin
       showmessage(rsPleaseAdd1File);
       exit;
      end;
   params:=getpresetparams(pn);
   extension:=getpresetextension(pn);
   unit5.form5.memo1.lines.Clear;

                                         // trim everything up
   commandlineparams.text := trim(commandlineparams.Text);
   vidbitrate.Text := trim(vidbitrate.Text);
   vidframerate.text := trim(vidframerate.Text);
   VidsizeX.text := trim(VidsizeX.Text);
   VidsizeY.text := trim(VidsizeY.Text);
   aspectratio.Text := trim(aspectratio.text);
   audbitrate.Text := trim(audbitrate.Text);
   audsamplingrate.Text := trim(audsamplingrate.Text);
   audchannels.Text:=trim(audchannels.Text);

                                      // replace preset params if options specified
   commandline := params;
   if vidbitrate.Text <> '' then
           commandline:=replaceparam(commandline,'-b','-b ' + vidbitrate.text+'kb');
   if vidframerate.Text <> '' then
           commandline:=replaceparam(commandline,'-r','-r ' + vidframerate.Text);
   if (VidsizeX.Text <>'') AND (VidsizeY.Text <>'') then
           commandline:=replaceparam(commandline,'-s','-s ' + VidsizeX.Text + 'x' + VidsizeY.Text);
   if aspectratio.Text <> '' then
           commandline:=replaceparam(commandline,'-aspect','-aspect ' + aspectratio.Text);
   if audbitrate.Text <> '' then
           commandline:=replaceparam(commandline,'-ab','-ab ' + audbitrate.Text+'kb');
   if audsamplingrate.Text <> '' then
           commandline:=replaceparam(commandline,'-ar','-ar ' + audsamplingrate.Text);
   if audchannels.Text <> '' then
           commandline:=replaceparam(commandline,'-ac','-ac ' + audchannels.Text);
   if commandlineparams.Text <> '' then
           commandline += ' ' + commandlineparams.text;


                                           // build batch file
   thetime :=now;
   batfile := 'ff' + FormatDateTime('yymmddhhnnss',thetime) +
           {$ifdef win32}'.bat'{$endif}
           {$ifdef unix}'.sh'{$endif} ;

   for i:=0 to filelist.Items.Count - 1 do
     begin
       filename := filelist.items[i];
       basename := extractfilename(filename);
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
       {$ifdef unix}titlestring:='echo -n "\033]0; ' + rsConverting +' ' + extractfilename(filename)+
            ' ('+inttostr(i+1)+'/'+ inttostr(filelist.items.count)+')'+'\007"';{$endif}
       script.Add(titlestring);
       
       passlogfile := destfolder.Text + DirectorySeparator + basename + '.log';

       if pass2.Checked = false then
          begin
           command := ffmpegfilename + usethreads + ' -i "' + filename + '" ' + deinterlace + commandline + ' "' +
                  destfolder.Text + DirectorySeparator + basename +'.' + extension+ '"';
           script.Add(command);
          end
       else if pass2.Checked = true then
          begin
           command := ffmpegfilename + usethreads + ' -i "' + filename + '" ' + deinterlace + commandline + ' -an'
                 + ' -passlogfile "' + passlogfile + '"' + ' -pass 1 ' +  ' -y ' + nullfile ;
           script.Add(command);
           command := ffmpegfilename + usethreads + ' -y -i "' + filename + '" ' + deinterlace + commandline +  ' -passlogfile "'
                 + passlogfile + '"' + ' -pass 2 ' + ' "' + destfolder.Text + DirectorySeparator + basename +'.'
                 + extension+ '"';
           script.add(command);
          end;

     end;
                                                        // finish off commandline

                                         // pausescript
   if pausescript='true' then
       {$ifdef win32}
       script.Add('pause');
       {$endif}
       {$ifdef unix}
       script.Add('read -p "' + rsPressEnter + '" dumbyvar');
       {$endif}

                                               //shutdown when finnshed
   if shutdownonfinish.Checked and (pausescript='false') then
      {$ifdef win32}script.Add('shutdown.exe -s');{$endif}
      {$ifdef unix}script.Add('shutdown now');{$endif}

                                           // remove batch file on completion
   {$ifdef win32}script.Add('del ' + '"' + presetspath + batfile + '"');{$endif}
   {$ifdef unix}script.Add('rm ' + '"' +  presetspath + batfile+ '"');{$endif}


   if not displaycmdline.Checked then
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
      unit5.Form5.Memo1.Lines:=script;
      unit5.Form5.Show;
    end;

    script.Free;
end;

   // replace a paramter from a commandline
function Tform1.replaceparam(commandline:string; param:string; replacement:string):string;
var
i,j,startpos,endpos: integer;
s:string;
begin
 startpos:=pos(param +' ', commandline);
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

procedure TForm1.VidbitrateChange(Sender: TObject);
begin

end;

// import a preset from a file
procedure tform1.importpresetfromfile(presetfilename: string);
var
 importfile: txmldocument;
 importedpreset: tdomelement;
 i,j,reply,boxstyle:integer;
 replaceall: boolean = false;
 removepreset: boolean = false;
 nodeexists:boolean = false;
 newnode,labelnode,paramsnode,extensionnode,categorynode,
  textl,textp,texte,textc, node,subnode: tdomnode;
 nodename,nodelabel,nodeparams,nodeext,nodecat, testchars:string;
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

end; //for j 1 to childnodes-1

writexmlfile(presetsfile, presetspath + 'presets.xml');  // save the imported preset

populatepresetbox('');
end;

initialization
  {$I unit1.lrs}

end.

