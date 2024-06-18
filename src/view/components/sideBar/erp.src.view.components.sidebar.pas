unit erp.src.view.components.sidebar;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Objects, FMX.Controls.Presentation;

type
  TComponentSideBar = class(TFrame)
    lytContainer: TLayout;
    Layout1: TLayout;
    Layout2: TLayout;
    Layout3: TLayout;
    Line1: TLine;
    Line2: TLine;
    lytProfile: TLayout;
    lytMenu: TLayout;
    Rectangle1: TRectangle;
  private
    { Private declarations }
    procedure ConstruirMenu;
    procedure ConstruirPerfil;
  public
    { Public declarations }

    class function New(AOwner: TComponent): TComponentSideBar;
    function Component: TFMXObject;
  end;

implementation

{$R *.fmx}

uses
  System.Generics.Collections,
  erp.src.view.components.button;

{ TComponentSideBar }

function TComponentSideBar.Component: TFMXObject;
begin
  ConstruirMenu;
  ConstruirPerfil;
  Result := lytContainer;
end;

procedure TComponentSideBar.ConstruirMenu;
begin
  var lListaBotoes := TObjectList<TFMXObject>.Create;

  lListaBotoes.Add(
    TComponentButton.New(Self)
      .Nome('pessoa')
      .SingleButton
      .Descricao('Pessoas')
      .Image('PngPessoa')
      .ColorDefault($FFFFFFFF)
      .Component);

  lytMenu.AddObject(TComponentButton.New(Self)
    .Nome('dashboard')
    .SingleButton
    .Descricao('Dashboard')
    .Image('PngDashboard')
    .ColorDefault($FFFFFFFF)
    .Alinhamento(TAlignLayout.Top)
    .Component);

  lytMenu.AddObject(
    TComponentButton.New(Self)
      .Nome('cadastros')
      .CompositeButton
      .SubMenu(lListaBotoes)
      .Descricao('Cadastros')
      .Image('PngCadastros')
      .ColorDefault($FFFFFFFF)
      .Alinhamento(TAlignLayout.Top)
      .Component);

end;

procedure TComponentSideBar.ConstruirPerfil;
begin
  lytProfile.AddObject(
    TComponentButton.New(Self)
      .Nome('perfil')
      .Perfil('JpgEu')
      .Descricao('Junior Oliva')
      .ColorDefault($FFFFFFFF)
      .Component);
end;

class function TComponentSideBar.New(AOwner: TComponent): TComponentSideBar;
begin
  Result := Self.Create(AOwner);
end;

end.
