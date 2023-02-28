unit UServidor;

interface

uses
  FireDAC.Comp.DataSet,FireDAC.Stan.StorageXML, UTipos.Auxiliares, UAbastecimento;

type
IServidor = interface
  ['{EB172B37-97E1-4313-A656-41157013F5EF}']
  function getBombas: String;
  function setAbastecimento(Abastecimento: TAbastecimento): TResult;
    function getRelatorioAbastecimentos(PeriodoInicial,
  PeriodoFinal: TDate; ID_Bomba, ID_Tanque: Integer): string;
end;


TServidor = class(TInterfacedObject, IServidor)
  published
    function getBombas: String;
    function setAbastecimento(Abastecimento: TAbastecimento): TResult;
    function getRelatorioAbastecimentos(PeriodoInicial,
  PeriodoFinal: TDate; ID_Bomba, ID_Tanque: Integer): string;
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
SQL: string;
begin
  Conexao := TConexao.Create;
  try
    SQL := 'WITH ULT_ABASTECIMENTO_COMBUSTIVEL AS         '+sLineBreak+
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
           '        B.ID_TANQUE,                          '+sLineBreak+
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

function TServidor.getRelatorioAbastecimentos(PeriodoInicial,
  PeriodoFinal: TDate; ID_Bomba, ID_Tanque: Integer): string;
var SQL: string;
params: array of Variant;
Conexao: TConexao;
begin
  Conexao := TConexao.Create;
  try
    SQL := 'SELECT CAST(A.DH_ABASTECIMENTO AS DATE) DT_ABASTECIMENTO, '+sLineBreak+
           '       B.ID_TANQUE, T.ST_COMBUSTIVEL,A.ID_BOMBA,          '+sLineBreak+
           '       SUM(A.VL_TOTAL) VL_ABASTECIMENTO                   '+sLineBreak+
           '  FROM ABASTECIMENTO A                                    '+sLineBreak+
           ' INNER JOIN BOMBA B                                       '+sLineBreak+
           '    ON B.ID = A.ID_BOMBA                                  '+sLineBreak+
           ' INNER JOIN TANQUE T                                      '+sLineBreak+
           '    ON T.ID = B.ID_TANQUE                                 '+sLineBreak+
           ' WHERE A.DH_ABASTECIMENTO BETWEEN :DT_INI AND :DT_FIM     '+sLineBreak;
    params := [PeriodoInicial,PeriodoFInal];

    if ID_Bomba <> -1 then
    begin
      SQL := SQL + 'AND A.ID_BOMBA = :ID_BOMBA'+sLineBreak;
      params := params + [ID_Bomba];
    end;

    if ID_Bomba <> -1 then
    begin
      SQL := SQL + 'AND B.ID_TANQUE = :ID_TANQUE'+sLineBreak;
      params := params + [ID_Tanque];
    end;

    SQL := SQL +' GROUP BY 1,B.ID_TANQUE,T.ST_COMBUSTIVEL, A.ID_BOMBA';
    Result := Conexao.getDados(SQL,params);

  finally
    Conexao.DisposeOf;
  end;
end;


function TServidor.setAbastecimento(Abastecimento: TAbastecimento): TResult;
var SQL: string;
Conexao: TConexao;
begin
  Conexao := TConexao.Create;
  try
    SQL := 'INSERT OR UPDATE INTO ABASTECIMENTO('+
    'ID,ID_BOMBA,DH_ABASTECIMENTO,QT_LITROS,VL_UNITARIO,VL_TOTAL,VL_IMPOSTO) ' +
    'VALUES(:ID,:ID_BOMBA,:DH_ABASTECIMENTO,:QT_LITROS,:VL_UNITARIO,:VL_TOTAL,:VL_IMPOSTO) '+
    'MATCHING (ID)';
    Result := Conexao.ExecutaComando(SQL,
      [Abastecimento.ID,Abastecimento.ID_Bomba,Abastecimento.DataHora,
      Abastecimento.QT_Litros,Abastecimento.VL_Unitario,Abastecimento.VL_Total,
      Abastecimento.VL_Total*0.13]);
  finally
    Conexao.DisposeOf;
  end;
end;

end.
