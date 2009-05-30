{
   This unit is part of the WinFF project
   Copyright (c) 2006 - 2009 Matthew Weatherford
   http://www.winff.org
   Licensed under the GNU GPL v3

   Implements the WinFF Preset manager object and
   WinFF configuration manager object
}

unit uwinffxmlmanager;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Laz_XmlCfg, Dom, XmlRead, XmlWrite,;

type
   TWinFFConfig = class(TObject)
   private
      FConfigFile: String;
      FXMLConfig: TXMLConfig;
   public
      constructor Create(const AConfigFile: String);
      destructor Destroy;
      procedure WriteConfigValue(const AKey: String; const AValue: String);
      function ReadConfigValue(const AKey: String): String;
   published
   end;

   TWinFFPreset = class(TObject)
   private
   public
   published
   end;

implementation

{
   ********** TWinFFConfig implementation start **********
}


{
   Constructor
   Creates our object and sets the config file name
   The parameter expects the full path + filename.ext
}
constructor TWinFFConfig.Create(const AConfigFile: String);
begin
   inherited Create;
   FConfigFile := AConfigFile;
end;

{
   Destructor
   Destroys out object and frees used objects
}
destructor TWinFFConfig.Destroy;
begin
   inherited Destroy;
   if Assigned(FXMLConfig) then
      FXMLConfig.Free;
end;

{
   Procedure
   Writes the specified value to config file
}
procedure TWinFFConfig.WriteConfigValue(const AKey: String; const AValue: String);
begin
   FXMLConfig := TXMLConfig.Create(nil);
   FXMLConfig.Filename := FConfigFile;
   FXMLConfig.SetValue(AKey, AValue);
   FXMLConfig.Free;
end;

{
   Function
   Reads the value from a specified key
}
function TWinFFConfig.ReadConfigValue(const AKey: String): String;
begin
   FXMLConfig := TXMLConfig.Create(nil);
   FXMLConfig.Filename := FConfigFile;
   Result := FXMLConfig.GetValue(AKey, '');
   FXMLConfig.Free;
end;

{
   ********** TWinFFConfig implementation end **********
}

end.

