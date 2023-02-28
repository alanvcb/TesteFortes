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

TResult = record
private
  FError_Message: String;
  FReturn_Code: Integer;
  FRowsAffected: Integer;
public
  procedure Clear;
  property Return_Code: Integer read FReturn_Code write FReturn_Code;
  property Error_Message: String read FError_Message write FError_Message;
  property RowsAffected: Integer read FRowsAffected write FRowsAffected;
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

{ TResult }

procedure TResult.Clear;
begin
  FError_Message := '';
  FReturn_Code   := 0;
  FRowsAffected  := 0;
end;


end.
