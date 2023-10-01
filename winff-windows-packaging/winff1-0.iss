; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

[Setup]
ArchitecturesInstallIn64BitMode=x64
ArchitecturesAllowed=x64
AppID=WinFF
AppName=WinFF
AppVerName=WinFF 1.6.2
AppPublisher=WinFF.org
AppPublisherURL=https://github.com/WinFF/winff
AppSupportURL=https://groups.google.com/g/winff
AppUpdatesURL=https://github.com/WinFF/winff/
AppCopyright=Copyright 2006-2023 WinFF.org
DefaultDirName={commonpf}\WinFF
DefaultGroupName=WinFF
VersionInfoVersion=1.6.2
AllowNoIcons=yes
OutputDir=output
OutputBaseFilename=WinFF-setup-1-6-2
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
Name: "brazilianportuguese"; MessagesFile: "compiler:languages\BrazilianPortuguese.isl"
Name: "dutch"; MessagesFile: "compiler:languages\Dutch.isl"
Name: "norwegian"; MessagesFile: "compiler:languages\Norwegian.isl"
Name: "hebrew"; MessagesFile: "compiler:languages\hebrew.isl"
Name: "slovenian"; MessagesFile: "compiler:languages\Slovenian.isl"
Name: "slovak"; MessagesFile: "compiler:languages\Slovak.isl"
Name: "russian"; MessagesFile: "compiler:languages\Russian.isl"
Name: "catalan"; MessagesFile: "compiler:languages\Catalan.isl"
Name: "ukrainian"; MessagesFile: "compiler:languages\Ukrainian.isl"

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
Source: "Docs\*"; DestDir: "{app}\Docs"; Flags: ignoreversion

; language files
Source: "..\winff\languages\*"; DestDir: "{app}\languages"; Flags: ignoreversion

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
Name: "{group}\Docs\Docs - Portuguese"; Filename: "{app}\Docs\WinFF.pt.pdf";
[Run]
Filename: "{app}\winff.exe"; Description: "{cm:LaunchProgram,WinFF}"; Flags: nowait postinstall skipifsilent
