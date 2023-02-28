unit UAbastecimento;

interface

type TAbastecimento = class
  private
    FVL_Total: Extended;
    FQT_Litros: Extended;
    FDataHora: TDateTime;
    FID_Bomba: Integer;
    FID: Integer;
    FVL_Unitario: Extended;
  public
    constructor Create;
    property ID: Integer read FID write FID;
    property DataHora: TDateTime read FDataHora write FDataHora;
    property QT_Litros: Extended read FQT_Litros write FQT_Litros;
    property VL_Unitario: Extended read FVL_Unitario write FVL_Unitario;
    property VL_Total: Extended read FVL_Total write FVL_Total;
    property ID_Bomba: Integer read FID_Bomba write FID_Bomba;
end;

implementation


{ TAbastecimento }

constructor TAbastecimento.Create;
begin
  FVL_Total := 0;
  FQT_Litros:= 0;
  FID_Bomba := -1;
  FID := -1;
  FVL_Unitario := 0;
end;

end.
