unit UConfiguracoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, System.ImageList, Vcl.ImgList;

type
  TfrmConfiguracoes = class(TForm)
    pnlTitulo: TPanel;
    Label7: TLabel;
    Image1: TImage;
    Label4: TLabel;
    Label5: TLabel;
    edtServidor: TEdit;
    Label6: TLabel;
    edtPorta: TEdit;
    Label1: TLabel;
    edtUsuario: TEdit;
    Label2: TLabel;
    edtSenha: TEdit;
    edtBase: TButtonedEdit;
    img: TImageList;
    Panel1: TPanel;
    imgSalvar: TImage;
    OpenDlg: TOpenDialog;
    procedure imgSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure edtBaseRightButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    class procedure CriaFormulario(Parent: TWinControl);
    { Public declarations }
  end;

var
  frmConfiguracoes: TfrmConfiguracoes;

implementation

uses
  UParametrosConexao;

{$R *.dfm}

class procedure TfrmConfiguracoes.CriaFormulario(Parent: TWinControl);
begin
  if not Assigned(frmConfiguracoes) then
  begin
    frmConfiguracoes := TfrmConfiguracoes.Create(nil);
    frmConfiguracoes.Parent := Parent;
    frmConfiguracoes.Show;
    if Assigned(Parent) then
      frmConfiguracoes.WindowState := wsMaximized;
  end
  else
    frmConfiguracoes.BringToFront;
end;

procedure TfrmConfiguracoes.edtBaseRightButtonClick(Sender: TObject);
begin
  if OpenDlg.Execute(Self.Handle) then
    edtBase.Text := OpenDlg.FileName;
end;

procedure TfrmConfiguracoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
  frmConfiguracoes := nil;
end;

procedure TfrmConfiguracoes.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
CanClose := MessageDlg('Deseja realmente sair?',mtConfirmation,[TMsgDlgBtn.mbYes,TMsgDlgBtn.mbNo],0) = mrYes;
end;

procedure TfrmConfiguracoes.FormCreate(Sender: TObject);
begin
  edtServidor.Text := ParametrosConexao.Servidor ;
  edtBase.Text := ParametrosConexao.Base;
  edtPorta.Text := ParametrosConexao.Porta.ToString;
  edtUsuario.Text := ParametrosConexao.Usuario;
  edtSenha.Text := ParametrosConexao.Senha;
end;

procedure TfrmConfiguracoes.imgSalvarClick(Sender: TObject);
begin
  ParametrosConexao.Servidor := edtServidor.Text;
  ParametrosConexao.Base := edtBase.Text;
  ParametrosConexao.Porta := StrToIntDef(edtPorta.Text,3050);
  ParametrosConexao.Usuario := edtUsuario.Text;
  ParametrosConexao.Senha := edtSenha.Text;
  ParametrosConexao.SavetoFile('fortes.conf');
  MessageDlg('Configurações salvas com sucesso!',TMsgDlgType.mtConfirmation,[TMsgDlgBtn.mbOK],0);
end;

end.
