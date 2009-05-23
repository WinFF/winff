{
   This unit is part of the WinFF project
   Copyright (c) 2006 - 2009 Matthew Weatherford
   http://www.winff.org
   Licensed under the GNU GPL v3

   Platform independent procedures and functions
}

unit uwinffprocs;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, StdCtrls, Laz_XmlCfg, Dom, XmlRead, XmlWrite,
  ComCtrls, Forms, LCLType, uaddfilesdialog,
  {$IFDEF WINDOWS}
     uwinffwin32procs;
  {$ENDIF}
  {$IFDEF UNIX}
     uwinffunixprocs;
  {$ENDIF}

implementation

end.

