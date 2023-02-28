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
    FDMemTable1: TFDMemTable;
    FDMemTable1ID: TIntegerField;
    FDMemTable1ST_COMBUSTIVEL: TIntegerField;
    FDMemTable1ULT_PRECO: TFloatField;
    Panel2: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure imgCancelarClick(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure edtLitrosExit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure edtVLUnitarioExit(Sender: TObject);
    procedure edtVLTotalExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtLitrosKeyPress(Sender: TObject; var Key: Char);
    procedure edtLitrosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure imgSalvarClick(Sender: TObject);
  private
    FLista: TListaBotao;
    FListaControle: TArray<TControl>;
    FPrecos: TArray<Extended>;
    //variaveis procedure e functions de propertys
    FVendaIniciada: Boolean;
    function getLitros: Extended;
    function getUnitario: Extended;
    function getTotal: Extended;
    procedure setLitros(const Value: Extended);
    procedure setUnitario(const Value: Extended);
    procedure setTotal(const Value: Extended);
    procedure setVendaIniciada(const Value: boolean);

    procedure CalculaPorLitros;
    procedure CalculaPorUnitario;
    procedure CalculaPorTotal;
    procedure setDataHora;
    procedure MontaBombas;
    procedure Clear;
    procedure EscolheBomba(ABomba: TObject);

    procedure Cancelar;
    procedure Salvar;
    procedure Validar;
    property VendaIniciada: boolean read FVendaIniciada write setVendaIniciada;
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
  UTipos.Auxiliares, UServidor, UFuncoes, UAbastecimento;

{$R *.dfm}

procedure TfrmAbastecimento.CalculaPorLitros;
begin
  if VL_Unitario > 0 then
  begin
    VL_Total := Litros * VL_Unitario;
    DestacaComponente(edtVLTotal,True);
  end
  else
  if VL_Total > 0 then
  begin
    VL_Unitario := VL_Total / Litros;
    DestacaComponente(edtVLUnitario,True);
  end;
end;

procedure TfrmAbastecimento.CalculaPorTotal;
begin
  if Litros > 0 then
  begin
    VL_Unitario := VL_Total / Litros;
    DestacaComponente(edtVLUnitario,True);
  end
  else
  if VL_Unitario > 0 then
  begin
    Litros := VL_Total / VL_Unitario;
    DestacaComponente(edtLitros,True);
  end;
end;

procedure TfrmAbastecimento.CalculaPorUnitario;
begin
  if Litros > 0 then
  begin
    VL_Total := Litros * VL_Unitario;
    DestacaComponente(edtVLTotal,True);
  end
  else
  if VL_Total > 0 then
  begin
    Litros := VL_Total / VL_Unitario;
    DestacaComponente(edtLitros,True);
  end;
end;

procedure TfrmAbastecimento.Cancelar;
begin
  if not FVendaIniciada then
    Exit;

  if MessageDlg('Deseja realmente cancelar?',mtConfirmation,[TMsgDlgBtn.mbYes,TMsgDlgBtn.mbNo],0) = mrYes then
    Clear;
end;

procedure TfrmAbastecimento.Clear;
begin
  VendaIniciada := False;
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

procedure TfrmAbastecimento.edtLitrosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
    SelectNext(Sender as TWinControl, True, True);
end;

procedure TfrmAbastecimento.edtLitrosKeyPress(Sender: TObject; var Key: Char);
begin
  if not CharInSet(Key,['0'..'9',FormatSettings.DecimalSeparator,#8]) then
    Key := #0;
end;

procedure TfrmAbastecimento.edtVLTotalExit(Sender: TObject);
begin
  if edtVLTotal.Modified then
  begin
    edtVLTotal.Text := FormataValor(Sender as TEdit,2);
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

  VendaIniciada := True;
  edtLitros.SetFocus;
  setDataHora;
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

procedure TfrmAbastecimento.FormCreate(Sender: TObject);
begin
  MontaBombas;
  FListaControle := [edtDataHora,edtLitros,edtVLUnitario,edtVLTotal,imgCancelar,imgSalvar];
  Clear;
end;

procedure TfrmAbastecimento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ssAlt in Shift then
  begin
    if key in [48..57,96..105] then
    begin
      if key > 57 then
        key := key - 48;
      if Assigned(FLista) then
        FLista.SelecionaPorID(StrToInt(Char(Key)));
      key := 0;
    end;
  end
  else
  if key = VK_ESCAPE then
    Cancelar
  else
  if key = VK_F10 then
    Salvar;
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
  Result := StrToFloatDef(edtVLUnitario.Text,0);
end;

procedure TfrmAbastecimento.imgCancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure TfrmAbastecimento.imgSalvarClick(Sender: TObject);
begin
  Salvar;
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
  FLista.Parent := sbxBombas;
  FLista.OnClick := EscolheBomba;

  mtBombas := TFDMemTable.Create(Self);
  try
    mtBombas.XMLData := Servidor.getBombas;
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

procedure TfrmAbastecimento.Salvar;
var Abastecimento: TAbastecimento;
Result: TResult;
begin
  //a imagem não dispara o onexit
  if ActiveControl is TEdit then
    if Assigned((ActiveControl as TEdit).OnExit) then
      (ActiveControl as TEdit).OnExit(ActiveControl);
      
  Validar;
  
  Abastecimento := TAbastecimento.Create;
  Abastecimento.ID_Bomba := FLista.Selecionado.ID_Bomba;
  Abastecimento.QT_Litros := Litros;
  Abastecimento.VL_Unitario := VL_Unitario;
  Abastecimento.VL_Total := VL_Total;
  Abastecimento.DataHora := StrToDateTimeDef(edtDataHora.Text,Now);

  Result := Servidor.setAbastecimento(Abastecimento);
  
  if Result.Return_Code <> 0 then
    raise Exception.Create('Houve um erro ao gravar : '+Result.Error_Message)
  else
  begin
    FPrecos[FLista.Selecionado.Combustivel.ToInteger] := VL_Unitario; //atualiza o ultimo preço do combustivel;
    Clear;
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

procedure TfrmAbastecimento.setVendaIniciada(const Value: boolean);
var i: integer;
begin
  FVendaIniciada := Value;
  for I := Low(FListaControle) to High(FListaControle) do
    if FVendaIniciada then
      Habilita(FListaControle[i])
    else
      Desabilita(FListaControle[i]);
end;

procedure TfrmAbastecimento.Validar;
begin
  if not FVendaIniciada then
    raise Exception.Create('Não é possivel salvar uma venda não iniciada');
    
  if FLista.Selecionado = nil then
  begin
    DestacaComponente(sbxBombas,False);
    raise Exception.Create('É necessário escolher uma bomba antes de salvar');
  end;

  if Litros = 0 then
  begin
    edtLitros.SetFocus;
    DestacaComponente(edtLitros,False);
    raise Exception.Create('Não é permitido quantidade de litros zerada');
  end;

  if VL_Unitario = 0 then
  begin
    edtVLUnitario.SetFocus;
    DestacaComponente(edtVLUnitario,False);
    raise Exception.Create('Não é permitido valor unitário zerado');
  end;

  if VL_Total = 0 then
  begin
    edtVLTotal.SetFocus;
    DestacaComponente(edtVLTotal,False);
    raise Exception.Create('Não é permitido valor total zerado');
  end;
          
end;

procedure TfrmAbastecimento.setTotal(const Value: Extended);
begin
  edtVLTotal.Text := FormatFloat('0.00',Value);
end;

end.
