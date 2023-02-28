unit UFuncoes;

interface

uses
  Vcl.StdCtrls, Vcl.Controls,System.UITypes;

function FormataValor(AEdit: TEdit; Decimais: Integer): string;
function TemPropriedade(Controle: TObject; Propriedade: String): Boolean;
function SetPropriedade(Controle: TObject; Propriedade: String; Valor: Variant): Boolean;
procedure Desabilita(Controle: TControl);
procedure Habilita(Controle: TControl);
procedure LimparHandle(pHandle: THandle);
procedure DestacarHandle(pHandle: THandle;Cor: TColor);
procedure DestacaComponente(Componente: TWinControl;Curto:Boolean);

implementation

uses
  System.SysUtils, System.TypInfo, Vcl.ExtCtrls, Vcl.Graphics, Winapi.Windows,
  System.Classes;

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

procedure LimparHandle(pHandle: THandle);
begin
  RedrawWindow(pHandle , nil, 0, RDW_INVALIDATE or RDW_ERASE);
end;

procedure DestacarHandle(pHandle: THandle;Cor: TColor);
var
  lRect: TRect;
  lHdc: HDC;
  lPen: HPEN;
begin
  Winapi.Windows.GetClientRect(pHandle,lRect);

  lHdc := GetDC(pHandle);

  lPen := CreatePen(PS_SOLID, 1, ColorToRGB(Cor));
  try
    lPen := SelectObject(lHdc, lPen);
    Winapi.Windows.MoveToEx(lHdc, lRect.Left, lRect.Top, nil);
    Winapi.Windows.LineTo(lHdc, lRect.Right-1, lRect.Top);
    Winapi.Windows.LineTo(lHdc, lRect.Right-1, lRect.Bottom-1);
    Winapi.Windows.LineTo(lHdc, lRect.Left, lRect.Bottom-1);
    Winapi.Windows.LineTo(lHdc, lRect.Left, lRect.Top);
  finally
    DeleteObject(lPen); //delete our pen
  end;
end;

procedure DestacaComponente(Componente: TWinControl;Curto:Boolean);
var Tempo,Intervalo, Max,Passo: Integer;
thread: tthread;
cor: TColor;
begin
  Tempo := 0;
  if Curto then
  begin
    Passo := 250;
    Max := 1000;
    Intervalo := 125;
    cor := clBlue;
  end
  else
  begin
    Passo := 500;
    Max := 3000;
    Intervalo := 250;
    cor := clRed;
  end;


  thread := TThread.CreateAnonymousThread(procedure
  begin
    repeat
      if Tempo mod Passo <> 0 then
        TThread.Synchronize(thread,procedure begin DestacarHandle(Componente.Handle,cor) end)
      else
        TThread.Synchronize(thread,procedure begin  LimparHandle(Componente.Handle) end);

      Tempo := Tempo +  Intervalo;

      TThread.Sleep(Intervalo);
    until Tempo > Max ;
    TThread.Synchronize(thread,procedure begin  LimparHandle(Componente.Handle) end);
  end);

  thread.FreeOnTerminate := True;
  thread.Start;

end;


end.
