unit UBomba.Botao;

interface

uses
  System.Classes, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Controls,UTipos.Auxiliares,
  System.Generics.Collections ;


type TBotaoBomba = class
  strict private
    const CorSelecionado = $0040FF00;
          CorDeselecionado = $008080FF;
  private
    pnlBomba: TPanel;
    imgBomba: TImage;
    lblNome: TLabel;
    pnlCombustivel: TPanel;
    FSelecionado: Boolean;
    FID_Bomba: Integer;
    FCombustivel: TCombustivel;
    FOnClick: TNotifyEvent;
    FImages: TImageList;
    function getParent: TWinControl;
    procedure setCombustivel(const Value: TCombustivel);
    procedure SetID_Bomba(const Value: Integer);
    procedure setParent(const Value: TWinControl);
    procedure setSelecionado(const Value: Boolean);
    procedure FInternalClick(Sender: TObject);
  public
    constructor Create; reintroduce;
    destructor Destroy; override;
    property Parent: TWinControl read getParent write setParent;
    property ID_Bomba: Integer read FID_Bomba write SetID_Bomba;
    property Selecionado: Boolean read FSelecionado write setSelecionado;
    property Combustivel: TCombustivel read FCombustivel write setCombustivel;
    property OnClick: TNotifyEvent read FOnClick write FOnClick;
    property Images: TImageList read FImages write FImages;
end;

TListaBotao = class
  private
    FParent: TWinControl;
    FSelecionado: TBotaoBomba;
    FLista: TObjectList<TBotaoBomba>;
    FImages: TImageList;
    FOnClick: TNotifyEvent;
    procedure myClick(Sender: TObject);
  public
    constructor Create; reintroduce;
    destructor Destroy; override;
    property Selecionado: TBotaoBomba read FSelecionado;
    property Parent: TWinControl read FParent write FParent;
    property Images: TImageList read FImages write FImages;
    property OnClick: TNotifyEvent read FOnClick write FOnClick;
    procedure AddBotao(AID: Integer; ACombustivel: TCombustivel);
    procedure SelecionaPorID(AID: Integer);
end;

implementation

uses
  Vcl.Graphics, System.SysUtils,System.Math;


{ TBotaoBomba }

constructor TBotaoBomba.Create;
begin
  inherited;
  pnlBomba := TPanel.Create(nil);
  imgBomba := TImage.Create(nil);
  lblNome := TLabel.Create(nil);
  pnlCombustivel := TPanel.Create(nil);
  FOnClick := nil;

  pnlBomba.Name := 'pnlBomba';
  pnlBomba.Width := 89;
  pnlBomba.Height := 89;
  pnlBomba.TabOrder := 1;
  pnlBomba.ShowCaption := False;
  pnlBomba.OnClick := FInternalClick;
  pnlBomba.Align := alLeft;
  pnlBomba.Cursor := crHandPoint;

  imgBomba.Name := 'imgBomba';
  imgBomba.Parent := pnlBomba;
  imgBomba.Width := 87;
  imgBomba.Height := 58;
  imgBomba.Align := alClient;
  imgBomba.Center := True;
  imgBomba.OnClick := FInternalClick;
  imgBomba.Cursor := crHandPoint;

  lblNome.Name := 'lblNome';
  lblNome.Parent := pnlBomba;
  lblNome.Left := 1;
  lblNome.Top := 59;
  lblNome.Width := 87;
  lblNome.Height := 13;
  lblNome.Align := alBottom;
  lblNome.Alignment := taCenter;
  lblNome.Caption := '';
  lblNome.Font.Height := -11;
  lblNome.Font.Name := 'Tahoma';
  lblNome.Font.Style := [fsBold];
  lblNome.ParentFont := False;
  lblNome.OnClick := FInternalClick;
  lblNome.Cursor := crHandPoint;

  pnlCombustivel.Name := 'pnlCombustivel';
  pnlCombustivel.Parent := pnlBomba;
  pnlCombustivel.Left := 1;
  pnlCombustivel.Top := 72;
  pnlCombustivel.Width := 87;
  pnlCombustivel.Height := 16;
  pnlCombustivel.Align := alBottom;
  pnlCombustivel.BevelOuter := bvLowered;
  pnlCombustivel.Color := CorDeselecionado;
  pnlCombustivel.ParentBackground := False;
  pnlCombustivel.TabOrder := 0;
  pnlCombustivel.OnClick := FInternalClick;
  pnlCombustivel.Cursor := crHandPoint;

end;

destructor TBotaoBomba.Destroy;
begin
  pnlBomba.DisposeOf;
  imgBomba.DisposeOf;
  lblNome.DisposeOf;
  pnlCombustivel.DisposeOf;
  inherited;
end;

function TBotaoBomba.getParent: TWinControl;
begin
  Result := pnlBomba.Parent;
end;

procedure TBotaoBomba.FInternalClick(Sender: TObject);
begin
  if not FSelecionado then
  begin
    Selecionado := True;
    if Assigned(FOnClick) then
      FOnClick(Self);
  end;
end;

procedure TBotaoBomba.setCombustivel(const Value: TCombustivel);
begin
  FCombustivel := Value;
  pnlCombustivel.Caption := Value.ToString;
  imgBomba.Picture.Icon:= nil;
  if Assigned(FImages) then
    FImages.GetIcon(Value.ToInteger, imgBomba.Picture.Icon);
end;

procedure TBotaoBomba.SetID_Bomba(const Value: Integer);
begin
  FID_Bomba := Value;
  lblNome.Caption := 'Bomba '+Value.ToString;
end;

procedure TBotaoBomba.setParent(const Value: TWinControl);
var maxLeft: Integer;
  I: Integer;
begin
  pnlBomba.Parent := Value;
  //aqui ele fica na ordem invertida. preciso que ele fique na ordem que foi adicionada
  maxLeft:= -1;
  for I := 0 to parent.ControlCount-1 do
    if Parent.Controls[i] is TPanel then
      maxLeft := Max(maxLeft,Parent.Controls[i].Left);
  pnlBomba.Left := maxLeft + 1;
end;

procedure TBotaoBomba.setSelecionado(const Value: Boolean);
begin
  FSelecionado := Value;
  if Value then
    pnlCombustivel.Color := CorSelecionado
  else
    pnlCombustivel.Color := CorDeselecionado;
end;

{ TListaBotao }

procedure TListaBotao.AddBotao(AID: Integer; ACombustivel: TCombustivel);
var botao: TBotaoBomba;
anterior: Integer;
begin
  if FParent = nil then
    raise Exception.Create('Escolha um parent antes de criar um botão');

  anterior := FLista.Count-1;
  botao := TBotaoBomba.Create;
  botao.Parent := FParent;
  botao.ID_Bomba := AID;
  botao.Images := FImages;
  botao.Combustivel := ACombustivel;
  botao.OnClick := myClick;

  FLista.Add(botao);
end;

constructor TListaBotao.Create;
begin
  inherited;
  FParent := nil;
  FLista := TObjectList<TBotaoBomba>.Create(True);
end;

destructor TListaBotao.Destroy;
begin
  FLista.Destroy;
  inherited;
end;

procedure TListaBotao.myClick(Sender: TObject);
var botao: TBotaoBomba;
begin
  FSelecionado := Sender as TBotaoBomba;
  for botao in FLista do
    if botao.ID_Bomba <> FSelecionado.ID_Bomba then
      botao.Selecionado := False;
  if Assigned(FOnClick) then
    FOnClick(Sender);
end;

procedure TListaBotao.SelecionaPorID(AID: Integer);
var botao: TBotaoBomba;
begin
  FSelecionado := nil;
  for botao in FLista do
  begin
    botao.Selecionado := botao.ID_Bomba = AID;
    if botao.Selecionado then
      FSelecionado := botao;
  end;
  if Assigned(FOnClick) then
    FOnClick(FSelecionado);
end;

end.
