unit UParametrosConexao;

interface

type TParametrosConexao = record
  Servidor,Base: string;
  Porta: Integer;
  Usuario,Senha: string;
  procedure LoadFromFile(AFileName: string);
  procedure SavetoFile(AFileName: string);
end;

function CriptografiaSimples(str: string): string;


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
    Usuario := CriptografiaSimples(Ini.ReadString('CONEXAO','USER','HBHWYZ'));
    Senha  := CriptografiaSimples(Ini.ReadString('CONEXAO','PASS','nzhgvipvb'));
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
    Ini.WriteString('CONEXAO','USER',CriptografiaSimples(Usuario));
    Ini.WriteString('CONEXAO','PASS',CriptografiaSimples(Senha));
    Ini.UpdateFile;
  finally
    Ini.DisposeOf;
  end;
end;

function CriptografiaSimples(str: string): string;
var
  i: integer;
  c: char;
begin
  Result := '';
  for i := 1 to Length(str) do
  begin
    c := str[i];
    if (c >= 'A') and (c <= 'Z') then // maiúscula
      Result := Result + Chr(Ord('Z') - Ord(c) + Ord('A'))
    else if (c >= 'a') and (c <= 'z') then // minúscula
      Result := Result + Chr(Ord('z') - Ord(c) + Ord('a'))
    else if (c >= '0') and (c <= '9') then // número
      Result := Result + Chr(Ord('9') - Ord(c) + Ord('0'))
    else // outros caracteres
      Result := Result + c;
  end;
end;

initialization
  ParametrosConexao.LoadFromFile('fortes.conf');

end.
