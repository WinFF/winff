{
   This unit is part of the WinFF project
   Copyright (c) 2006 - 2009 Matthew Weatherford
   http://www.winff.org
   Licensed under the GNU GPL v3

   Shows the command line arguments which will be sent
   to FFmpeg
}

unit ucmdlinedialog;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs; 

type
  TCmdLineDialog = class(TForm)
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  CmdLineDialog: TCmdLineDialog;

implementation

initialization
  {$I ucmdlinedialog.lrs}

end.

