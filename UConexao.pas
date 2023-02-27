unit UConexao;

interface

uses FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt, FireDAC.VCLUI.Wait,
  FireDAC.Comp.UI, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Phys.FB;

type TConexao = class
  private
    FFDConnection: TFDConnection;
  public
    constructor Create; reintroduce;
    function getDados(SQL: string): IFDDataSetReference;
    function ExecutaComando(SQL: string): Boolean;
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

function TConexao.ExecutaComando(SQL: string): Boolean;
begin

end;

function TConexao.getDados(SQL: string): IFDDataSetReference;
begin

end;

end.
