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
    function getDados(SQL: string): String; overload;
    function getDados(SQL: string;Params: array of variant;types: array of TFieldType): String; overload;
    function ExecutaComando(SQL: string): TResult; overload;
    function ExecutaComando(SQL: string; Params: array of variant): TResult; overload;
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

function TConexao.ExecutaComando(SQL: string;
  Params: array of variant): TResult;
begin
 Result.Clear;
  try
    if Length(Params) = 0 then
      Result.RowsAffected := FFDConnection.ExecSQL(SQL)
    else
      Result.RowsAffected := FFDConnection.ExecSQL(SQL,Params);
  except
    on e: exception do
    begin
      Result.Error_Message := e.Message;
      Result.Return_Code := -1;
    end;
  end;
end;

function TConexao.getDados(SQL: string; Params: array of variant;types: array of TFieldType): String;
var FDQuery: TFDQuery;
memTable: TFDMemTable;
begin
  Result := '';
  FDQuery := TFDQuery.Create(nil);
  memTable := TFDMemTable.Create(nil);
  try
    FDQuery.Connection := FFDConnection;
    FDQuery.FetchOptions.Unidirectional := False;

    if Length(Params) = 0 then
      FDQuery.Open(SQL)
    else
      FDQuery.Open(SQL,Params,Types);

    FDQuery.FetchAll;
    memTable.Data := FDQuery.Data;
    Result := memTable.XMLData;
  finally
    FDQuery.DisposeOf;
    memTable.DisposeOf;
  end;

end;

function TConexao.ExecutaComando(SQL: string): TResult;
begin
  Result := ExecutaComando(SQL,[]);
end;

function TConexao.getDados(SQL: string): String;
begin
  Result := getDados(SQL,[],[]);
end;

end.
