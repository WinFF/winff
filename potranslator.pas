unit PoTranslator;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LResources, typinfo, Translations;

type

 { TPoTranslator }

 TPoTranslator=class(TAbstractTranslator)
 private
  FPOFile:TPOFile;
 public
  constructor Create(POFileName:string);
  destructor Destroy;override;
  procedure TranslateStringProperty(Sender:TObject;
    const Instance: TPersistent; PropInfo: PPropInfo; var Content:string);override;
 end;

implementation

{ TPoTranslator }

constructor TPoTranslator.Create(POFileName: string);
begin
  inherited Create;
  FPOFile:=TPOFile.Create(POFileName);
end;

destructor TPoTranslator.Destroy;
begin
  FPOFile.Free;
  inherited Destroy;
end;

procedure TPoTranslator.TranslateStringProperty(Sender: TObject;
  const Instance: TPersistent; PropInfo: PPropInfo; var Content: string);
var
  s: String;
begin
  if not Assigned(FPOFile) then exit;
  if not Assigned(PropInfo) then exit;
{DO we really need this?}
  if Instance is TComponent then
   if csDesigning in (Instance as TComponent).ComponentState then exit;
{End DO :)}
  if (AnsiUpperCase(PropInfo^.PropType^.Name)<>'TTRANSLATESTRING') then exit;
  s:=FPOFile.Translate(Content, Content);
  if s<>'' then Content:=s;
end;

end.

