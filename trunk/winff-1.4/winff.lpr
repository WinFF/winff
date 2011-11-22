program winff;

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

uses
  {$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms
  { add your units here }, Unit1, Unit2, Unit3, Unit4, Unit5,defaulttranslator,
  unit6;
   {$ifdef windows}
   {$R resources.rc}
   {$endif}



//{$IFDEF WINDOWS}{$R winff.rc}{$ENDIF}

{$R *.res}

begin
  Application.Title:='WinFF';
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmEditPresets, frmEditPresets);
  Application.CreateForm(TfrmAbout, frmAbout);
  Application.CreateForm(TfrmPreferences, frmPreferences);
  Application.CreateForm(TfrmScript, frmScript);
  Application.CreateForm(TfrmExport, frmExport);
  Application.Run;
end.
