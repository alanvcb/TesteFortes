unit URelAbastecimentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  RLReport, RLXLSXFilter, RLFilters, RLPDFFilter;

type
  TRelAbastecimentos = class(TForm)
    pnlTitulo: TPanel;
    Label7: TLabel;
    Image1: TImage;
    Panel1: TPanel;
    imgSalvar: TImage;
    dtpInicio: TDateTimePicker;
    Label2: TLabel;
    dtpFim: TDateTimePicker;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    cbxBombas: TComboBox;
    cbxTanques: TComboBox;
    mtRelatorio: TFDMemTable;
    FRRelatorio: TRLReport;
    rlCabecalho: TRLBand;
    lblTituloRel: TRLLabel;
    lblFone: TRLLabel;
    lblFantasia: TRLLabel;
    RLImage1: TRLImage;
    lblEnderecoCompleto: TRLLabel;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLLabel5: TRLLabel;
    RLDBResult1: TRLDBResult;
    sRelatorio: TDataSource;
    RLBand4: TRLBand;
    lblUlt: TRLSystemInfo;
    RLLabel6: TRLLabel;
    lblNum: TRLSystemInfo;
    RLSystemInfo1: TRLSystemInfo;
    FiltroPDF: TRLPDFFilter;
    FiltroXLSX: TRLXLSXFilter;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure imgSalvarClick(Sender: TObject);
    procedure RLDBText2BeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure RLDBText3BeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure RLDBResult1Compute(Sender: TObject; var Value: Variant;
      var AText: string; var ComputeIt: Boolean);
    procedure RLSystemInfo1BeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure cbxTanquesChange(Sender: TObject);
  private
    mtBombas: TFDMemTable;
    function getValorSelecionado(cbx: TComboBox): Integer;
    procedure MontaBombas(ID_Tanque: Integer);
    procedure Filtrar;

    { Private declarations }
  public
    class procedure CriaFormulario(Parent: TWinControl);
    { Public declarations }
  end;

var
  RelAbastecimentos: TRelAbastecimentos;

implementation

Uses System.DateUtils, UServidor, UTipos.Auxiliares;

{$R *.dfm}

procedure TRelAbastecimentos.cbxTanquesChange(Sender: TObject);
begin
  MontaBombas(getValorSelecionado(cbxTanques));
end;

class procedure TRelAbastecimentos.CriaFormulario(Parent: TWinControl);
begin
  if not Assigned(relAbastecimentos) then
  begin
    relAbastecimentos := TRelAbastecimentos.Create(nil);
    relAbastecimentos.Parent := Parent;
    relAbastecimentos.Show;
    if Assigned(Parent) then
      relAbastecimentos.WindowState := wsMaximized;
  end
  else
    relAbastecimentos.BringToFront;
end;

procedure TRelAbastecimentos.Filtrar;
var ID_Bomba,ID_Tanque: Integer;
begin
  ID_Bomba := getValorSelecionado(cbxBombas);
  ID_Tanque := getValorSelecionado(cbxTanques);
  mtRelatorio.XMLData := Servidor.getRelatorioAbastecimentos(dtpInicio.Date,
   dtpFim.Date,ID_Bomba,ID_Tanque);

 if mtRelatorio.IsEmpty then
   raise Exception.Create('Não há dados para o filtro selecionado');
end;

procedure TRelAbastecimentos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
  RelAbastecimentos := nil;
end;

procedure TRelAbastecimentos.FormCreate(Sender: TObject);
var comb: TCombustivel;
strTanque: string;
begin
  dtpInicio.Date := Today - 30;
  dtpFim.Date := Today;

  cbxTanques.Clear;
  cbxTanques.AddItem('Todos',TInteiro.Create(-1));
  cbxTanques.ItemIndex := 0;

  mtBombas := TFDMemTable.Create(Self);
  mtBombas.XMLData := Servidor.getBombas;
  mtBombas.First;
  while not mtBombas.Eof do
  begin
    Comb := TCombustivel(mtBombas.FieldByName('ST_COMBUSTIVEL').AsInteger);
    strTanque := 'Tanque '+mtBombas.FieldByName('ID_TANQUE').AsString+ ' - '+Comb.ToString;
    if cbxTanques.Items.IndexOf(strTanque) = -1 then
      cbxTanques.AddItem(strTanque,TInteiro.Create(mtBombas.FieldByName('ID_TANQUE').AsInteger));
    mtBombas.Next;
  end;

  MontaBombas(-1);

end;

procedure TRelAbastecimentos.FormDestroy(Sender: TObject);
begin
  mtBombas.DisposeOf;
end;

function TRelAbastecimentos.getValorSelecionado(cbx: TComboBox): Integer;
begin
  Result := (cbx.SelectedObject as TInteiro).Valor;
end;

procedure TRelAbastecimentos.imgSalvarClick(Sender: TObject);
begin
  Filtrar;
  FRRelatorio.Preview(nil);
end;

procedure TRelAbastecimentos.MontaBombas(ID_Tanque: Integer);
var id_bomba: integer;
idx: integer;
begin
  id_bomba := -1;
  if cbxBombas.ItemIndex <> -1 then
    id_bomba := getValorSelecionado(cbxBombas);

  cbxBombas.Clear;
  cbxBombas.AddItem('Todas',TInteiro.Create(-1));
  idx := 0;

  if ID_Tanque <> -1 then
  begin
    mtBombas.Filtered := False;
    mtBombas.Filter := 'ID_TANQUE = '+ID_Tanque.ToString;
    mtBombas.Filtered := True;
  end
  else
    mtBombas.Filtered := False;

  mtBombas.First;
  while not mtBombas.Eof do
  begin
    cbxBombas.AddItem('Bomba '+mtBombas.FieldByName('ID').AsString,TInteiro.Create(mtBombas.FieldByName('ID').AsInteger));
    if mtBombas.FieldByName('ID').AsInteger = id_bomba then
      idx := cbxBombas.Items.Count-1;

    mtBombas.Next;
  end;

  cbxBombas.ItemIndex := idx;
end;

procedure TRelAbastecimentos.RLDBResult1Compute(Sender: TObject;
  var Value: Variant; var AText: string; var ComputeIt: Boolean);
begin
  Value := mtRelatorio.FieldByName('VL_ABASTECIMENTO').AsFloat; //não sei porque não tava somando, mas isso resolveu
  ComputeIt := True;
end;

procedure TRelAbastecimentos.RLDBText2BeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
var comb: TCombustivel;
begin
  comb.FromInteger(mtRelatorio.FieldByName('ST_COMBUSTIVEL').AsInteger);
  AText := 'Tanque '+mtRelatorio.FieldByName('ID_TANQUE').AsString+' - ' +
  comb.ToString;
end;

procedure TRelAbastecimentos.RLDBText3BeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
begin
  AText := 'Bomba '+mtRelatorio.FieldByName('ID_BOMBA').AsString;
end;

procedure TRelAbastecimentos.RLSystemInfo1BeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
begin
  AText := 'Impresso em : '+AText;
end;

end.
