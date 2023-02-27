unit UParametrosConexao;

interface

type TParametrosConexao = record
  Servidor,Base: string;
  Porta: Integer;
  Usuario,Senha: string;
  procedure LoadFromFile(AFileName: string);
  procedure SavetoFile(AFileName: string);
end;

var ParametrosConexao: TParametrosConexao;

implementation

uses System.IniFiles;

{ TParametrosConexao }

procedure TParametrosConexao.LoadFromFile(AFileName: string);
var Ini: TMemIniFile;
begin
  Ini := TMemIniFile.Create(AFileName);
  try
    Servidor := Ini.ReadString('CONEXAO','SERVIDOR','localhost');
    Base := Ini.ReadString('CONEXAO','BASE','DADOS_FORTES.FDB');
    Porta :=  Ini.ReadInteger('CONEXAO','PORTA',3050);
    Usuario := Ini.ReadString('CONEXAO','USER','SYSDBA');
    Senha  := Ini.ReadString('CONEXAO','PASS','masterkey');
  finally
    Ini.DisposeOf;
  end;
end;

procedure TParametrosConexao.SavetoFile(AFileName: string);
var Ini: TMemIniFile;
begin
  Ini := TMemIniFile.Create(AFileName);
  try
    Ini.WriteString('CONEXAO','SERVIDOR',Servidor);
    Ini.WriteString('CONEXAO','BASE',Base);
    Ini.WriteInteger('CONEXAO','PORTA',Porta);
    Ini.WriteString('CONEXAO','USER',Usuario);
    Ini.WriteString('CONEXAO','PASS',Senha);
    Ini.UpdateFile;
  finally
    Ini.DisposeOf;
  end;
end;

initialization
  ParametrosConexao.LoadFromFile('fortes.conf');

end.
