unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ButtonGroup, Vcl.Imaging.pngimage,UBomba.Botao,
  Vcl.Imaging.jpeg;

type
  TfrmPrincipal = class(TForm)
    pnlMenu: TPanel;
    btnRelatorio: TButton;
    btnAbastecimento: TButton;
    imgMenu: TImageList;
    pnlConteudo: TPanel;
    btnConfiguracoes: TButton;
    Image1: TImage;
    procedure btnAbastecimentoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnConfiguracoesClick(Sender: TObject);
    procedure btnRelatorioClick(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  UTipos.Auxiliares, UFrmAbastecimento, UConfiguracoes, URelAbastecimentos;

{$R *.dfm}

procedure TfrmPrincipal.btnAbastecimentoClick(Sender: TObject);
begin
  TfrmAbastecimento.CriaFormulario(nil);
end;

procedure TfrmPrincipal.btnConfiguracoesClick(Sender: TObject);
begin
  TfrmConfiguracoes.CriaFormulario(nil);
end;

procedure TfrmPrincipal.btnRelatorioClick(Sender: TObject);
begin
  TRelAbastecimentos.CriaFormulario(nil);
end;

procedure TfrmPrincipal.FormActivate(Sender: TObject);
var Existe: Boolean;
begin
  Existe := FileExists('fortes.conf');
  btnRelatorio.Enabled := Existe;
  btnAbastecimento.Enabled := Existe;
end;

end.
