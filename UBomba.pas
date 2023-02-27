unit UBomba;

interface

uses UTipos.Auxiliares, System.Generics.Collections;

type TBomba = class
  private
    FID: Integer;
    FID_Tanque: Integer;
    FCombustivel: TCombustivel;
  public
    property ID: Integer read FID write FID;
    property ID_Tanque: Integer read FID_Tanque write FID_Tanque;
    property Combustivel: TCombustivel read FCombustivel write FCombustivel;
end;

TListaBombas = TObjectList<TBomba>;

implementation

end.
