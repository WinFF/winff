; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

[Setup]
AppID=WinFF
AppName=WinFF
AppVerName=WinFF 1.4.0
AppPublisher=WinFF.org
AppPublisherURL=http://www.winff.org/
AppSupportURL=http://www.winff.org/forums
AppUpdatesURL=http://www.winff.org/
DefaultDirName={pf}\WinFF
DefaultGroupName=WinFF
VersionInfoVersion=1.4.0
AllowNoIcons=yes
LicenseFile=License.txt
OutputDir=output
OutputBaseFilename=setup
Compression=lzma
SolidCompression=yes
SetupIconFile=WinFF.ico
ChangesAssociations=yes

[Registry]
Root: HKCR; Subkey: ".wff"; ValueType: string; ValueName: ""; ValueData: "WinFF"; Flags: uninsdeletevalue
Root: HKCR; Subkey: "WinFF"; ValueType: string; ValueName: ""; ValueData: "WinFF Presets"; Flags: uninsdeletekey
Root: HKCR; Subkey: "WinFF\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\winff.exe,0"
Root: HKCR; Subkey: "WinFF\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\WinFF.EXE"" ""%1"""


[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "german"; MessagesFile: "compiler:languages\German.isl"
Name: "bulgarian"; MessagesFile: "compiler:languages\Bulgarian.isl"
Name: "italian"; MessagesFile: "compiler:languages\Italian.isl"
Name: "turkish"; MessagesFile: "compiler:languages\Turkish.isl"
Name: "polish"; MessagesFile: "compiler:languages\Polish.isl"
Name: "french"; MessagesFile: "compiler:languages\French.isl"
Name: "brazilianportuguese"; MessagesFile: "compiler:languages\brazilianportuguese.isl"
Name: "spanish"; MessagesFile: "compiler:languages\Spanish.isl"
Name: "portuguese"; MessagesFile: "compiler:languages\Portuguese.isl"
Name: "dutch"; MessagesFile: "compiler:languages\Dutch.isl"
Name: "chinesetrad"; MessagesFile: "compiler:languages\chinesetrad.isl"
Name: "serbian"; MessagesFile: "compiler:languages\serbian.isl"
Name: "norwegian"; MessagesFile: "compiler:languages\Norwegian.isl"
Name: "hebrew"; MessagesFile: "compiler:languages\hebrew.isl"
Name: "greek"; MessagesFile: "compiler:languages\greek.isl"
Name: "slovenian"; MessagesFile: "compiler:languages\Slovenian.isl"
Name: "Russian"; MessagesFile: "compiler:languages\Russian.isl"
Name: "Catalan"; MessagesFile: "compiler:languages\Catalan.isl"
Name: "Swedish"; MessagesFile: "compiler:languages\Swedish.isl"
Name: "Arabic"; MessagesFile: "compiler:languages\Arabic.isl"
Name: "Galician"; MessagesFile: "compiler:languages\Galician.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "winff.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "ffmpeg.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "ffplay.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "SDL.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "presets.xml"; DestDir: "{app}"; Flags: ignoreversion
Source: "presets.xml"; DestDir: "{userappdata}\WinFF"; Flags: ignoreversion

; documentation files
Source: "License.txt"; DestDir: "{app}\Docs"; Flags: ignoreversion
Source: "README.txt"; DestDir: "{app}\Docs"; Flags: ignoreversion
Source: "README-FFmpeg.txt"; DestDir: "{app}\Docs"; Flags: ignoreversion
Source: "README-Presets.txt"; DestDir: "{app}\Docs"; Flags: ignoreversion
Source: "ffmpeg-doc.html"; DestDir: "{app}\Docs"; Flags: ignoreversion
Source: "ffplay-doc.html"; DestDir: "{app}\Docs"; Flags: ignoreversion
Source: "changelog.txt"; DestDir: "{app}\Docs"; Flags: ignoreversion
Source: "AUTHORS"; DestDir: "{app}\Docs"; Flags: ignoreversion
Source: "Docs\WinFF.en.pdf"; DestDir: "{app}\Docs"; Flags: ignoreversion
Source: "Docs\WinFF.nl.pdf"; DestDir: "{app}\Docs"; Flags: ignoreversion
Source: "Docs\WinFF.fr.pdf"; DestDir: "{app}\Docs"; Flags: ignoreversion
Source: "Docs\WinFF.es.pdf"; DestDir: "{app}\Docs"; Flags: ignoreversion
Source: "Docs\WinFF.ca.pdf"; DestDir: "{app}\Docs"; Flags: ignoreversion

; language files
Source: "languages\winff.po"; DestDir: "{app}\languages"; Flags: ignoreversion
Source: "languages\winff.de.po"; DestDir: "{app}\languages"; Flags: ignoreversion
Source: "languages\winff.bg.po"; DestDir: "{app}\languages"; Flags: ignoreversion
Source: "languages\winff.it.po"; DestDir: "{app}\languages"; Flags: ignoreversion
Source: "languages\winff.tr.po"; DestDir: "{app}\languages"; Flags: ignoreversion
Source: "languages\winff.es.po"; DestDir: "{app}\languages"; Flags: ignoreversion
Source: "languages\winff.pt.po"; DestDir: "{app}\languages"; Flags: ignoreversion
Source: "languages\winff.pb.po"; DestDir: "{app}\languages"; Flags: ignoreversion
Source: "languages\winff.nl.po"; DestDir: "{app}\languages"; Flags: ignoreversion
Source: "languages\winff.zh.po"; DestDir: "{app}\languages"; Flags: ignoreversion
Source: "languages\winff.fr.po"; DestDir: "{app}\languages"; Flags: ignoreversion
Source: "languages\winff.sr.po"; DestDir: "{app}\languages"; Flags: ignoreversion
Source: "languages\winff.nb.po"; DestDir: "{app}\languages"; Flags: ignoreversion
Source: "languages\winff.el.po"; DestDir: "{app}\languages"; Flags: ignoreversion
Source: "languages\winff.he.po"; DestDir: "{app}\languages"; Flags: ignoreversion
Source: "languages\winff.sl.po"; DestDir: "{app}\languages"; Flags: ignoreversion
Source: "languages\winff.ru.po"; DestDir: "{app}\languages"; Flags: ignoreversion
Source: "languages\winff.ca.po"; DestDir: "{app}\languages"; Flags: ignoreversion
Source: "languages\winff.es_AR.po"; DestDir: "{app}\languages"; Flags: ignoreversion
Source: "languages\winff.es_UY.po"; DestDir: "{app}\languages"; Flags: ignoreversion
Source: "languages\winff.hu.po"; DestDir: "{app}\languages"; Flags: ignoreversion
Source: "languages\winff.ku.po"; DestDir: "{app}\languages"; Flags: ignoreversion
Source: "languages\winff.pl.po"; DestDir: "{app}\languages"; Flags: ignoreversion
Source: "languages\winff.sv.po"; DestDir: "{app}\languages"; Flags: ignoreversion
Source: "languages\winff.zh_CN.po"; DestDir: "{app}\languages"; Flags: ignoreversion
Source: "languages\winff.ar.po"; DestDir: "{app}\languages"; Flags: ignoreversion
Source: "languages\winff.gl.po"; DestDir: "{app}\languages"; Flags: ignoreversion
Source: "languages\winff.cs.po"; DestDir: "{app}\languages"; Flags: ignoreversion
Source: "languages\winff.eu.po"; DestDir: "{app}\languages"; Flags: ignoreversion
Source: "languages\winff.kn.po"; DestDir: "{app}\languages"; Flags: ignoreversion
Source: "languages\winff.ms.po"; DestDir: "{app}\languages"; Flags: ignoreversion
Source: "languages\winff.pt_BR.po"; DestDir: "{app}\languages"; Flags: ignoreversion
Source: "languages\winff.ro.po"; DestDir: "{app}\languages"; Flags: ignoreversion
Source: "languages\winff.sv.po"; DestDir: "{app}\languages"; Flags: ignoreversion
Source: "languages\winff.zh_TW.po"; DestDir: "{app}\languages"; Flags: ignoreversion
Source: "languages\winff.zh.po"; DestDir: "{app}\languages"; Flags: ignoreversion


; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\WinFF"; Filename: "{app}\winff.exe"; WorkingDir: "{app}";
Name: "{group}\{cm:ProgramOnTheWeb,WinFF}"; Filename: "http://www.winff.org/"
Name: "{commondesktop}\WinFF"; Filename: "{app}\winff.exe"; WorkingDir: "{app}"; Tasks: desktopicon
Name: "{group}\{cm:UninstallProgram,WinFF}"; Filename: "{uninstallexe}"

; documentation icons
Name: "{group}\Docs\FFmpeg Documentation"; Filename: "{app}\Docs\ffmpeg-doc.html";
Name: "{group}\Docs\FFPlay Documentation"; Filename: "{app}\Docs\ffplay-doc.html";
Name: "{group}\Docs\Change Log"; Filename: "{app}\Docs\changelog.txt";
Name: "{group}\Docs\README"; Filename: "{app}\Docs\README.txt";
Name: "{group}\Docs\README Presets"; Filename: "{app}\Docs\README-Presets.txt";
Name: "{group}\Docs\README FFmpeg"; Filename: "{app}\Docs\README-FFmpeg.txt";
Name: "{group}\Docs\License"; Filename: "{app}\Docs\License.txt";
Name: "{group}\Docs\Docs - English"; Filename: "{app}\Docs\WinFF.en.pdf";
Name: "{group}\Docs\Docs - Dutch"; Filename: "{app}\Docs\WinFF.nl.pdf";
Name: "{group}\Docs\Docs - French"; Filename: "{app}\Docs\WinFF.fr.pdf";
Name: "{group}\Docs\Docs - Spanish"; Filename: "{app}\Docs\WinFF.es.pdf";
Name: "{group}\Docs\Docs - Catalan"; Filename: "{app}\Docs\WinFF.ca.pdf";
[Run]
Filename: "{app}\winff.exe"; Description: "{cm:LaunchProgram,WinFF}"; Flags: nowait postinstall skipifsilent

