unit UServidor;

interface

uses
  FireDAC.Comp.DataSet,FireDAC.Stan.StorageXML, UTipos.Auxiliares, UAbastecimento;

type
IServidor = interface
  ['{EB172B37-97E1-4313-A656-41157013F5EF}']
  function getBombas: String;
  function setAbastecimento(Abastecimento: TAbastecimento): TResult;
end;


TServidor = class(TInterfacedObject, IServidor)
  published
    function getBombas: String;
    function setAbastecimento(Abastecimento: TAbastecimento): TResult;
end;

function Servidor: IServidor;

implementation

uses UConexao;


function Servidor: IServidor;
begin
  Result := TServidor.Create;
end;
{ TServidor }

function TServidor.getBombas: String;
var Conexao: TConexao;
sql: string;
begin
  Conexao := TConexao.Create;
  try
    sql := 'WITH ULT_ABASTECIMENTO_COMBUSTIVEL AS         '+sLineBreak+
           '(SELECT MAX(A.ID) ID_ABASTECIMENTO,           '+sLineBreak+
           '        T.ST_COMBUSTIVEL                      '+sLineBreak+
           '   FROM ABASTECIMENTO A                       '+sLineBreak+
           '  INNER JOIN BOMBA B                          '+sLineBreak+
           '     ON A.ID_BOMBA = B.ID                     '+sLineBreak+
           '  INNER JOIN TANQUE T                         '+sLineBreak+
           '     ON B.ID_TANQUE = T.ID                    '+sLineBreak+
           '  GROUP BY T.ST_COMBUSTIVEL),                 '+sLineBreak+
           ' ULT_ABASTECIMENTO_VALOR AS (                 '+sLineBreak+
           ' SELECT UAC.ST_COMBUSTIVEL,                   '+sLineBreak+
           '        A.VL_UNITARIO                         '+sLineBreak+
           '   FROM ABASTECIMENTO A                       '+sLineBreak+
           '  INNER JOIN ULT_ABASTECIMENTO_COMBUSTIVEL UAC'+sLineBreak+
           '    ON UAC.ID_ABASTECIMENTO = A.ID)           '+sLineBreak+
           ' SELECT B.ID,                                 '+sLineBreak+
           '        T.ST_COMBUSTIVEL,                     '+sLineBreak+
           '        UAV.VL_UNITARIO ULT_PRECO             '+sLineBreak+
           '   FROM BOMBA B                               '+sLineBreak+
           '  INNER JOIN TANQUE T                         '+sLineBreak+
           '     ON T.ID = B.ID_TANQUE                    '+sLineBreak+
           '   LEFT JOIN ULT_ABASTECIMENTO_VALOR UAV      '+sLineBreak+
           '     ON T.ST_COMBUSTIVEL = UAV.ST_COMBUSTIVEL ';

    Result := Conexao.getDados(SQL);

  finally
    Conexao.DisposeOf;
  end;
end;

function TServidor.setAbastecimento(Abastecimento: TAbastecimento): TResult;

begin

end;

end.
