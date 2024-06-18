unit erp.src.view.components.button;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  System.Generics.Collections,
  FMX.Types,
  FMX.Graphics,
  FMX.Controls,
  FMX.Forms,
  FMX.Dialogs,
  FMX.StdCtrls,
  FMX.Layouts,
  FMX.Controls.Presentation,
  FMX.Objects;

type
  TComponentButton = class(TFrame)
    lytContainer: TLayout;
    Layout1: TLayout;
    Layout2: TLayout;
    lytImgInfo: TLayout;
    ImgInfo: TImage;
    lytImgMenu: TLayout;
    ImgMenu: TImage;
    lytDescricao: TLayout;
    lblDescricao: TLabel;
    lytSubMenu: TLayout;
    lytButton: TLayout;
    FotoPerfil: TCircle;
    procedure lytButtonResize(Sender: TObject);
    procedure lytButtonClick(Sender: TObject);
  private
    FHeight: Single;
    FComposite: Boolean;
    constructor Create(AOwner: TComponent); override;
    procedure ChamaSubMenu;
    procedure StyleMenu;
  public
    class function New(AOwner: TComponent): TComponentButton;
    function Nome(Value: String): TComponentButton;
    function CompositeButton: TComponentButton;
    function SingleButton: TComponentButton;
    function Perfil(Value: String): TComponentButton;
    function Descricao(Value: String): TComponentButton;
    function ColorDefault(Value: TAlphaColor): TComponentButton;
    function Alinhamento(Value: TAlignLayout): TComponentButton;
    function Image(Value: String): TComponentButton;
    function SubMenu(Value: TObjectList<TFMXObject>): TComponentButton;
    function Component: TFMXObject;
  end;

implementation

uses
  erp.src.services.utils;

{$R *.fmx}
{ TComponentButtonMenu }

{ TComponentButtonMenu }

function TComponentButton.Alinhamento(Value: TAlignLayout): TComponentButton;
begin
  Result := Self;
  lytContainer.Align := TAlignLayout.Bottom;
  lytContainer.Align := Value;
end;

procedure TComponentButton.ChamaSubMenu;
begin
  if not FComposite then
    Layout1.Padding.Right := 0;


  lytSubMenu.Visible := not lytSubMenu.Visible;

  if not lytSubMenu.Visible then
  begin
    lytContainer.AnimateFloat('Height', 60, 0.2, TAnimationType.&In,
      TInterpolationType.Linear);
    ImgMenu.AnimateFloat('RotationAngle', 0, 0.2, TAnimationType.&In,
      TInterpolationType.Linear);
    Exit;
  end;

  lytContainer.AnimateFloat('Height',(lytContainer.Height+FHeight), 0.2, TAnimationType.&In,
    TInterpolationType.Linear);
  ImgMenu.AnimateFloat('RotationAngle', 180, 0.2, TAnimationType.&In,
    TInterpolationType.Linear);
end;

function TComponentButton.ColorDefault(Value: TAlphaColor): TComponentButton;
begin
  Result := Self;
  TUtils.ImageColor(ImgInfo, Value);
  TUtils.ImageColor(ImgMenu, Value);
  lblDescricao.TextSettings.FontColor := Value;
end;

function TComponentButton.Component: TFMXObject;
begin
  Result := lytContainer;
end;

function TComponentButton.CompositeButton: TComponentButton;
begin
  Result := Self;
  FComposite := True;
end;

constructor TComponentButton.Create(AOwner: TComponent);
begin
  inherited;
  TUtils.ResourceImage('setabaixo', ImgMenu);
end;

function TComponentButton.Descricao(Value: String): TComponentButton;
begin
  Result := Self;
  lblDescricao.Text := Value;
end;

function TComponentButton.Image(Value: String): TComponentButton;
begin
  Result := Self;
  TUtils.ResourceImage(Value, ImgInfo);
end;

procedure TComponentButton.lytButtonClick(Sender: TObject);
begin
  ChamaSubMenu;
end;

procedure TComponentButton.lytButtonResize(Sender: TObject);
begin
  StyleMenu;
end;

class function TComponentButton.New(AOwner: TComponent): TComponentButton;
begin
  Result := Self.Create(AOwner);
end;

function TComponentButton.Nome(Value: String): TComponentButton;
begin
  Result := Self;
  Self.Name := Value;
end;

function TComponentButton.Perfil(Value: String): TComponentButton;
begin
  Result := Self;
  TUtils.ResourceImage(Value, FotoPerfil);
  FotoPerfil.Visible := True;
  Layout1.Padding.Left := 10;
end;

function TComponentButton.SingleButton: TComponentButton;
begin
  Result := Self;
  FComposite := False;
end;

procedure TComponentButton.StyleMenu;
begin
  if not (lytContainer.Width > 80) then
  begin
    lytImgMenu.Visible := False;
    Exit;
  end;

  if FComposite then
    lytImgMenu.Visible := True;
end;

function TComponentButton.SubMenu(Value: TObjectList<TFMXObject>): TComponentButton;
begin
  Result := Self;
  for var obj in Value do
  begin
    FHeight := FHeight + TLayout(obj).Height;
    lytSubMenu.AddObject(obj);
  end;
end;

end.
