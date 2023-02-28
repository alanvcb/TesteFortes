unit UTipos.Auxiliares;

interface

uses Vcl.StdCtrls;

Type

TCombustivel = (cGasolina,cDiesel);
TCombustiveis = set of TCombustivel;

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

TValor<T> = class
  private
    FValor: T;
  public
    constructor Create(AValue: T);
    property Valor: T read FValor write FValor;

end;

TInteiro = TValor<Integer>;

TComboBoxHelper = class helper for TComboBox
  public
    function SelectedText: string;
    function SelectedObject: TObject;

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


{ TValor<T> }

constructor TValor<T>.Create(AValue: T);
begin
  FValor := AValue;
end;

{ TComboBoxHelper }

function TComboBoxHelper.SelectedObject: TObject;
begin
  Result := Self.Items.Objects[Self.ItemIndex];
end;

function TComboBoxHelper.SelectedText: string;
begin
  Result := Self.Items[Self.ItemIndex];
end;

end.
