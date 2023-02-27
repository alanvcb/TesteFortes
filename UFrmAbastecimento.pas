unit UFrmAbastecimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,UBomba.Botao;

type
  TfrmAbastecimento = class(TForm)
    imgCombustivel: TImageList;
    pnlTitulo: TPanel;
    sbxBombas: TScrollBox;
    pnlTituloBombas: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtDataHora: TEdit;
    edtLitros: TEdit;
    edtVLUnitario: TEdit;
    edtVLTotal: TEdit;
    Label7: TLabel;
    Panel1: TPanel;
    imgSalvar: TImage;
    imgCancelar: TImage;
    Image4: TImage;
    Image1: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure imgCancelarClick(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure edtLitrosExit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure edtVLUnitarioExit(Sender: TObject);
    procedure edtVLTotalExit(Sender: TObject);
  private
    FLista: TListaBotao;
    FPrecos: TArray<Extended>;
    FVendaIniciada: Boolean;
    function getLitros: Extended;
    function getUnitario: Extended;
    function getTotal: Extended;
    function FormataValor(AEdit: TEdit; Decimais: Integer): string;
    procedure CalculaPorLitros;
    procedure CalculaPorUnitario;
    procedure CalculaPorTotal;
    procedure setDataHora;
    procedure MontaBombas;
    procedure Clear;
    procedure EscolheBomba(ABomba: TObject);
    procedure setLitros(const Value: Extended);
    procedure setUnitario(const Value: Extended);
    procedure setTotal(const Value: Extended);
    property Litros: Extended read getLitros write setLitros;
    property VL_Unitario: Extended read getUnitario write setUnitario;
    property VL_Total: Extended read getTotal write setTotal;
  public
    class procedure CriaFormulario(Parent: TWinControl);
    { Public declarations }
  end;

var
  frmAbastecimento: TfrmAbastecimento;

implementation

uses
  UTipos.Auxiliares;

{$R *.dfm}

procedure TfrmAbastecimento.CalculaPorLitros;
begin
  if VL_Unitario > 0 then
    VL_Total := Litros * VL_Unitario
  else
  if VL_Total > 0 then
    VL_Unitario := VL_Total / Litros;
end;

procedure TfrmAbastecimento.CalculaPorTotal;
begin
  if Litros > 0 then
    VL_Unitario := VL_Total / Litros
  else
  if VL_Unitario > 0 then
    Litros := VL_Total / VL_Unitario;
end;

procedure TfrmAbastecimento.CalculaPorUnitario;
begin
  if Litros > 0 then
    VL_Total := Litros * VL_Unitario
  else
  if VL_Total > 0 then
    Litros := VL_Total / VL_Unitario;
end;

procedure TfrmAbastecimento.Clear;
begin
  FVendaIniciada := False;
  FLista.SelecionaPorID(-1);
  edtDataHora.Clear;
  edtVLUnitario.Clear;
  edtLitros.Clear;
  edtVLTotal.Clear;
end;

class procedure TfrmAbastecimento.CriaFormulario(Parent: TWinControl);
begin
  if not Assigned(frmAbastecimento) then
  begin
    frmAbastecimento := TfrmAbastecimento.Create(nil);
    frmAbastecimento.Parent := Parent;
    frmAbastecimento.Show;
    if Assigned(Parent) then
      frmAbastecimento.WindowState := wsMaximized;
  end
  else
    frmAbastecimento.BringToFront;
end;

procedure TfrmAbastecimento.edtLitrosExit(Sender: TObject);
begin
  if edtLitros.Modified then
  begin
    edtLitros.Text := FormataValor(Sender as TEdit,4);
    CalculaPorLitros;
  end;
end;

procedure TfrmAbastecimento.edtVLTotalExit(Sender: TObject);
begin
  if edtVLUnitario.Modified then
  begin
    edtVLUnitario.Text := FormataValor(Sender as TEdit,3);
    CalculaPorTotal;
  end;
end;

procedure TfrmAbastecimento.edtVLUnitarioExit(Sender: TObject);
begin
  if edtVLUnitario.Modified then
  begin
    edtVLUnitario.Text := FormataValor(Sender as TEdit,3);
    CalculaPorUnitario;
  end;
end;

procedure TfrmAbastecimento.EscolheBomba(ABomba: TObject);
var bomba: TBotaoBomba;
unitario: Extended;
begin
  if not Assigned(ABomba) then
    Exit;

  bomba := (ABomba as TBotaoBomba);
  unitario := FPrecos[bomba.Combustivel.ToInteger];
  if unitario > 0 then
    VL_Unitario := unitario;

  FVendaIniciada := True;
  setDataHora;
end;

function TfrmAbastecimento.FormataValor(AEdit: TEdit;
  Decimais: Integer): string;
var valor: Extended;
begin
  result := '';
  if TryStrToFloat(AEdit.Text,valor) then
    Result := FormatFloat('0.'+string.Create('0',Decimais),valor);
end;

procedure TfrmAbastecimento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
  frmAbastecimento := nil;
end;

procedure TfrmAbastecimento.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := MessageDlg('Deseja realmente sair?',mtConfirmation,[TMsgDlgBtn.mbYes,TMsgDlgBtn.mbNo],0) = mrYes;
end;

function TfrmAbastecimento.getLitros: Extended;
begin
  Result := StrToFloatDef(edtLitros.Text,0);
end;

function TfrmAbastecimento.getTotal: Extended;
begin
  Result := StrToFloatDef(edtVLTotal.Text,0);
end;

function TfrmAbastecimento.getUnitario: Extended;
begin
  Result := StrToFloatDef(edtVLTotal.Text,0);
end;

procedure TfrmAbastecimento.imgCancelarClick(Sender: TObject);
begin
  if not FVendaIniciada then
    Exit;

  if MessageDlg('Deseja realmente cancelar?',mtConfirmation,[TMsgDlgBtn.mbYes,TMsgDlgBtn.mbNo],0) = mrYes then
    Clear;
end;

procedure TfrmAbastecimento.Image4Click(Sender: TObject);
begin
  setDataHora;
end;

procedure TfrmAbastecimento.MontaBombas;
var mtBombas: TFDMemTable;
    Comb: TCombustivel;
begin
  if Assigned(FLista) then
    FLista.DisposeOf;

  FLista := TListaBotao.Create;
  FLista.Images := imgCombustivel;
  FLista.OnClick := EscolheBomba;

  mtBombas := TFDMemTable.Create(nil);
  try
    //mtBombas.Data := Servidor.getBombas;
    mtBombas.First;
    while not mtBombas.Eof do
    begin
      Comb := TCombustivel(mtBombas.FieldByName('ST_COMBUSTIVEL').AsInteger);
      if High(Fprecos) < Comb.ToInteger then
        SetLength(FPrecos,Comb.ToInteger+1);
      FPrecos[Comb.ToInteger] := mtBombas.FieldByName('ULT_PRECO').AsFloat;
      FLista.AddBotao(mtBombas.FieldByName('ID').AsInteger,Comb);
      mtBombas.Next;
    end;
  finally
    mtBombas.DisposeOf;
  end;

end;

procedure TfrmAbastecimento.setDataHora;
begin
  edtDataHora.Text := FormatDateTime(FormatSettings.ShortDateFormat+' '+FormatSettings.LongTimeFormat,Now);
end;

procedure TfrmAbastecimento.setLitros(const Value: Extended);
begin
  edtLitros.Text := FormatFloat('0.0000',Value);
end;

procedure TfrmAbastecimento.setUnitario(const Value: Extended);
begin
  edtVLUnitario.Text := FormatFloat('0.000',Value);
end;

procedure TfrmAbastecimento.setTotal(const Value: Extended);
begin
  edtVLTotal.Text := FormatFloat('0.00',Value);
end;

end.
