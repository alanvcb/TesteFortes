unit URelAbastecimentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

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
    procedure FormCreate(Sender: TObject);
  private
    procedure Filtrar;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RelAbastecimentos: TRelAbastecimentos;

implementation

Uses System.DateUtils, UServidor, UTipos.Auxiliares;

{$R *.dfm}

procedure TRelAbastecimentos.Filtrar;
var ID_Bomba,ID_Tanque: Integer;
begin
  ID_Bomba := (cbxBombas.SelectedObject as TInteiro).Valor;
  ID_Tanque := (cbxTanques.SelectedObject as TInteiro).Valor;
  mtRelatorio.XMLData := Servidor.getRelatorioAbastecimentos(dtpInicio.Date,
   dtpFim.Date,ID_Bomba,ID_Tanque);
end;

procedure TRelAbastecimentos.FormCreate(Sender: TObject);
var mtBombas: TFDMemTable;
comb: TCombustivel;
strTanque: string;
begin
  dtpInicio.Date := Today - 30;
  dtpFim.Date := Today;
  cbxBombas.Clear;
  cbxBombas.AddItem('Todas',TInteiro.Create(-1));
  cbxBombas.ItemIndex := 0;

  cbxTanques.Clear;
  cbxTanques.AddItem('Todos',TInteiro.Create(-1));
  cbxTanques.ItemIndex := 0;

  mtBombas := TFDMemTable.Create(Self);
  try
    mtBombas.XMLData := Servidor.getBombas;
    mtBombas.First;
    while not mtBombas.Eof do
    begin
      Comb := TCombustivel(mtBombas.FieldByName('ST_COMBUSTIVEL').AsInteger);
      cbxBombas.AddItem('Bomba '+mtBombas.FieldByName('ID').AsString+ ' - '+Comb.ToString,TInteiro.Create(mtBombas.FieldByName('ID').AsInteger));
      strTanque := 'Tanque '+mtBombas.FieldByName('ID_TANQUE').AsString+ ' - '+Comb.ToString;
      if cbxTanques.Items.IndexOf(strTanque) = -1 then
        cbxTanques.AddItem(strTanque,TInteiro.Create(mtBombas.FieldByName('ID_TANQUE').AsInteger));
      mtBombas.Next;
    end;
  finally
    mtBombas.DisposeOf;
  end;
end;

end.
