unit erp.src.view.components.button;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Controls.Presentation, FMX.Objects;

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
    procedure lytButtonClick(Sender: TObject);
  private
    FHeight : Single;
    procedure RedimencionaSubMenu;
  public
    constructor Create(AOwner: TComponent); override;
    class function New(AOwner: TComponent): TComponentButton;
    function Component: TFMXObject;
    function SubMenu(Value: TFMXObject): TComponentButton;
  end;

implementation

uses
  erp.src.services.utils;

{$R *.fmx}

{ TComponentButtonMenu }



{ TComponentButtonMenu }

function TComponentButton.Component: TFMXObject;
begin
  Result := lytContainer;
end;

constructor TComponentButton.Create(AOwner: TComponent);
begin
  inherited;
  lytContainer.Height := 60;
  TUtils.ResourceImage('setabaixo', ImgMenu);
end;

procedure TComponentButton.lytButtonClick(Sender: TObject);
begin
 lytContainer.Height := FHeight;
end;

class function TComponentButton.New(AOwner: TComponent): TComponentButton;
begin
  Result := Self.Create(AOwner);
end;

procedure TComponentButton.RedimencionaSubMenu;
begin
  for var i := 0 to Pred(lytSubMenu.ComponentCount) do
    if lytSubMenu.Components[i] is TLayout then
      FHeight := FHeight + TLayout(lytSubMenu.Components[i]).Height;
end;

function TComponentButton.SubMenu(Value: TFMXObject): TComponentButton;
begin
  Result := Self;
  lytSubMenu.AddObject(Value);
end;

end.
