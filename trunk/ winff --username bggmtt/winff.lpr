program winff;

// WInFF 0.3 Copyright 2006-2008 Matthew Weatherford
// http://winff.org
// Licensed under the GPL v3 or any later version

{$mode objfpc}{$H+}

uses
  {$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms
  { add your units here }, Unit1, Unit2, Unit3, Unit4, Unit5,defaulttranslator;
   {$ifdef win32}
   {$R resources.rc}
   {$endif}



begin
  Application.Title:='WinFF';
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.

