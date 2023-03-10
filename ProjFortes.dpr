program ProjFortes;

uses
  Vcl.Forms,
  UPrincipal in 'UPrincipal.pas' {frmPrincipal},
  UTipos.Auxiliares in 'UTipos.Auxiliares.pas',
  UBomba.Botao in 'UBomba.Botao.pas',
  UFrmAbastecimento in 'UFrmAbastecimento.pas' {frmAbastecimento},
  UConexao in 'UConexao.pas',
  UParametrosConexao in 'UParametrosConexao.pas',
  UConfiguracoes in 'UConfiguracoes.pas' {frmConfiguracoes},
  UServidor in 'UServidor.pas',
  UFuncoes in 'UFuncoes.pas',
  UAbastecimento in 'UAbastecimento.pas',
  URelAbastecimentos in 'URelAbastecimentos.pas' {RelAbastecimentos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
