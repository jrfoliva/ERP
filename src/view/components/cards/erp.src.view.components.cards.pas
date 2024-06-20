unit erp.src.view.components.cards;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Objects, FMX.Effects, FMX.Controls.Presentation,
  FMX.Filter.Effects;

type
  TComponentCard = class(TFrame)
    lytContainer: TLayout;
    Rectangle1: TRectangle;
    lytTitulo: TLayout;
    lytRodape: TLayout;
    Layout3: TLayout;
    Layout4: TLayout;
    ImageTitulo: TImage;
    Layout5: TLayout;
    lblTitulo: TLabel;
    lblSubTitulo: TLabel;
    ShadowEffect1: TShadowEffect;
    Layout2: TLayout;
    Line1: TLine;
    Layout1: TLayout;
    Layout6: TLayout;
    ImageRodape: TImage;
    Layout7: TLayout;
    NormalBlendEffect1: TNormalBlendEffect;
    lblDescricaoRodape: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    class function New(Aowner: TComponent): TComponentCard;
    function Nome(Value: String): TComponentCard;
    function Titulo(Value: String; Color: TAlphaColor=$FFD8B59A): TComponentCard;
    function SubTitulo(Value: String; Color: TAlphaColor=$FF252422): TComponentCard;
    function ImagemTitulo(Value: String; Color: TAlphaColor=$FFFBC658): TComponentCard;
    function ImageDescricao(Value: String; Color: TAlphaColor=$FF66615b): TComponentCard;
    function Descricao(Value: String; Color: TAlphaColor=$FFD8B59A): TComponentCard;
    function Alinhamento(Value: TAlignLayout): TComponentCard;
    function Margem(Bottom, Left, Right, Top: Single): TComponentCard;
    function Build: TFMXObject;
  end;

implementation

{$R *.fmx}

uses erp.src.services.utils;

{ TComponentCard }

function TComponentCard.Alinhamento(Value: TAlignLayout): TComponentCard;
begin
  Result := Self;
  lytContainer.Align := TAlignLayout.None;
  lytContainer.Align := Value;
end;

function TComponentCard.Build: TFMXObject;
begin
  Result := lytContainer;
end;

function TComponentCard.Descricao(Value: String; Color: TAlphaColor=$FFD8B59A): TComponentCard;
begin
  Result := Self;
  lblDescricaoRodape.Text := Value;
  lblDescricaoRodape.TextSettings.FontColor := Color;
end;

function TComponentCard.ImageDescricao(Value: String; Color: TAlphaColor=$FF66615b): TComponentCard;
begin
  Result := Self;
  TUtils.ResourceImage(Value, ImageRodape);
  TUtils.ImageColor(ImageRodape, Color);
end;

function TComponentCard.ImagemTitulo(Value: String; Color: TAlphaColor): TComponentCard;
begin
  Result := Self;
  TUtils.ResourceImage(Value, ImageTitulo);
  TUtils.ImageColor(ImageTitulo, Color);
end;

function TComponentCard.Margem(Bottom, Left, Right, Top: Single): TComponentCard;
begin
  Result := Self;
  lytContainer.Margins.Bottom := Bottom;
  lytContainer.Margins.Left   := Left;
  lytContainer.Margins.Right  := Right;
  lytContainer.Margins.Top    := Top;
end;

class function TComponentCard.New(Aowner: TComponent): TComponentCard;
begin
  Result := Self.Create(AOwner);
end;

function TComponentCard.Nome(Value: String): TComponentCard;
begin
  Result := Self;
  Self.Name := Value;
end;

function TComponentCard.SubTitulo(Value: String; Color: TAlphaColor=$FF252422): TComponentCard;
begin
  Result := Self;
  lblSubTitulo.Text := Value;
  lblSubTitulo.TextSettings.FontColor := Color;
end;

function TComponentCard.Titulo(Value: String; Color: TAlphaColor=$FFD8B59A): TComponentCard;
begin
  Result := Self;
  lblTitulo.Text := Value;
  lblTitulo.TextSettings.FontColor := Color;
end;

end.
