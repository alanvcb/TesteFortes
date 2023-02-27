unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ButtonGroup, Vcl.Imaging.pngimage,UBomba.Botao;

type
  TForm1 = class(TForm)
    pnlMenu: TPanel;
    btnRelatorio: TButton;
    btnAbastecimento: TButton;
    imgMenu: TImageList;
    pnlConteudo: TPanel;
    btnConfiguracoes: TButton;
    procedure btnAbastecimentoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure btnConfiguracoesClick(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  UTipos.Auxiliares, UFrmAbastecimento, UConfiguracoes;

{$R *.dfm}

procedure TForm1.btnAbastecimentoClick(Sender: TObject);
begin
  TfrmAbastecimento.CriaFormulario(nil);
end;

procedure TForm1.btnConfiguracoesClick(Sender: TObject);
begin
  TfrmConfiguracoes.CriaFormulario(nil);
end;

procedure TForm1.FormActivate(Sender: TObject);
var Existe: Boolean;
begin
  Existe := FileExists('fortes.conf');
  btnRelatorio.Enabled := Existe;
  btnAbastecimento.Enabled := Existe;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ssAlt in Shift then
    if key in [48..57,96..105] then
    begin
      if key > 57 then
        key := key - 48;
      showmessage(char(key));
    end;

end;

end.
