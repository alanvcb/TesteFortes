unit UTipos.Auxiliares;

interface

Type

TCombustivel = (cGasolina,cDiesel);

TCombustivelHelper = record helper for TCombustivel
  public
    function ToInteger: Integer;
    function ToString: string;
    procedure FromInteger(Value: Integer);
end;

implementation

{ TCombustivelHelper }



procedure TCombustivelHelper.FromInteger(Value: Integer);
begin
  Self := TCombustivel(Value);
end;

function TCombustivelHelper.ToInteger: Integer;
begin
  Result := Integer(Self);
end;

function TCombustivelHelper.ToString: string;
begin
  case Self of
    cGasolina: Result := 'Gasolina';
    cDiesel: Result := 'Diesel';
  end;
end;

end.
