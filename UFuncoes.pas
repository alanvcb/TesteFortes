unit UFuncoes;

interface

uses
  Vcl.StdCtrls, Vcl.Controls;

function FormataValor(AEdit: TEdit; Decimais: Integer): string;
function TemPropriedade(Controle: TObject; Propriedade: String): Boolean;
function SetPropriedade(Controle: TObject; Propriedade: String; Valor: Variant): Boolean;
procedure Desabilita(Controle: TControl);
procedure Habilita(Controle: TControl);


implementation

uses
  System.SysUtils, System.TypInfo, Vcl.ExtCtrls, Vcl.Graphics;

function FormataValor(AEdit: TEdit;
  Decimais: Integer): string;
var valor: Extended;
begin
  result := '';
  if TryStrToFloat(AEdit.Text,valor) then
    Result := FormatFloat('0.'+string.Create('0',Decimais),valor);
end;

function TemPropriedade(Controle: TObject; Propriedade: String): Boolean;
var
  PropInfo: PPropInfo;
begin
  PropInfo := Nil;
  PropInfo := GetPropInfo(Controle.ClassInfo, Propriedade);
  Result := (PropInfo <> nil);
end;

function SetPropriedade(Controle: TObject; Propriedade: String; Valor: Variant): Boolean;
begin
  Result := True;
  try
    if TemPropriedade(Controle,Propriedade) then
    begin
      SetPropValue(Controle,Propriedade,Valor);
    end
    else
      Result := False;
  except
    Result := False;
  end;
end;

procedure Habilita(Controle: TControl);
var fnt: TFont;
begin
  SetPropriedade(Controle,'Enabled',True);
  SetPropriedade(Controle,'Color',clWindow);

  if (Controle is TButton) or
     (Controle is TImage) then
    SetPropriedade(Controle,'Cursor',crHandPoint)
  else
    SetPropriedade(Controle,'Cursor',crDefault);

  SetPropriedade(Controle,'ReadOnly',False);
  SetPropriedade(Controle,'CharCase',ecUpperCase);
  if TemPropriedade(Controle,'Font') then
  begin
    fnt := (GetObjectProp(Controle,'Font') as TFont);
    fnt.Style := fnt.Style - [fsItalic];
    SetObjectProp(Controle,'Font',fnt);
  end;
end;

procedure Desabilita(Controle: TControl);
var fnt: TFont;
begin
  SetPropriedade(Controle,'Enabled',False);
  SetPropriedade(Controle,'Color',clBtnFace);
  if (Controle is TButton) or
     (Controle is TImage) then
    SetPropriedade(Controle,'Cursor',crNo)
  else
    SetPropriedade(Controle,'Cursor',crArrow);

  SetPropriedade(Controle,'CharCase',ecUpperCase);

  if TemPropriedade(Controle,'Font') then
  begin
    fnt := (GetObjectProp(Controle,'Font') as TFont);
    fnt.Style := fnt.Style + [fsItalic];
    SetObjectProp(Controle,'Font',fnt);
  end;
end;

end.
