unit UConexao;

interface

uses FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt, FireDAC.VCLUI.Wait,
  FireDAC.Comp.UI, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Phys.FB, UTipos.Auxiliares;

type TConexao = class
  private
    FFDConnection: TFDConnection;
  public
    constructor Create; reintroduce;
    destructor Destroy; override;
    function getDados(SQL: string): String;
    function ExecutaComando(SQL: string): TResult;
end;

implementation

uses
  UParametrosConexao,System.StrUtils, System.SysUtils;

{ TConexao }

constructor TConexao.Create;
begin
  FFDConnection := TFDConnection.Create(nil);
  FFDConnection.DriverName := 'FB';
  FFDConnection.Params.Clear;
  FFDConnection.Params.Add('Database='+ParametrosConexao.Base);
  FFDConnection.Params.Add('User_Name='+IfThen(ParametrosConexao.Usuario <> '',ParametrosConexao.Usuario,'SYSDBA'));

  FFDConnection.Params.Add('Password='+IfThen(ParametrosConexao.Senha <> '',ParametrosConexao.Senha,'masterkey'));
  FFDConnection.Params.Add('Protocol=TCPIP');
  FFDConnection.Params.Add('Server='+ParametrosConexao.Servidor);

  FFDConnection.Params.Add('Port='+IfThen(ParametrosConexao.Porta <> 0,ParametrosConexao.Porta.ToString,'3050'));
  FFDConnection.Params.Add('CharacterSet=WIN1252');
  FFDConnection.Params.Add('DriverID=FB');
  FFDConnection.LoginPrompt := False;
end;

destructor TConexao.Destroy;
begin
  FFDConnection.DisposeOf;
  inherited;
end;

function TConexao.ExecutaComando(SQL: string): TResult;
begin
  Result.Clear;
  try
    Result.RowsAffected := FFDConnection.ExecSQL(SQL);
  except
    on e: exception do
    begin
      Result.Error_Message := e.Message;
      Result.Return_Code := -1;
    end;
  end;
end;

function TConexao.getDados(SQL: string): String;
var FDQuery: TFDQuery;
memTable: TFDMemTable;
begin
  Result := '';
  FDQuery := TFDQuery.Create(nil);
  memTable := TFDMemTable.Create(nil);
  try
    FDQuery.Connection := FFDConnection;
    FDQuery.FetchOptions.Unidirectional := False;
    FDQuery.Open(SQL);
    FDQuery.FetchAll;
    memTable.Data := FDQuery.Data;
    Result := memTable.XMLData;
  finally
    FDQuery.DisposeOf;
    memTable.DisposeOf;
  end;
end;

end.
