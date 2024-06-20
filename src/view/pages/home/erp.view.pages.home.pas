unit erp.view.pages.home;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Layouts,
  Router4D.Interfaces;

type
  TPageHome = class(TForm, iRouter4DComponent)
    lytContainer: TLayout;
    LytCards: TLayout;
    Layout2: TLayout;
    lytCardLeft: TLayout;
    lytCardRight: TLayout;
    procedure LytCardsResize(Sender: TObject);
    procedure lytCardLeftResize(Sender: TObject);
    procedure lytCardRightResize(Sender: TObject);
  private
    { Private declarations }
     procedure CarregaCards;
     procedure ResponsiveLayout(Layout: TLayout; Count: Single);
  public
    { Public declarations }
    function Render: TFMXObject;
    procedure UnRender;
  end;

implementation

{$R *.fmx}

uses erp.src.view.components.cards;

{ TPageHome }

procedure TPageHome.CarregaCards;
begin
  lytCardLeft.AddObject(
    TComponentCard.New(Self)
    .Nome('capacity')
    .Titulo('Capacity')
    .SubTitulo('150GB')
    .ImagemTitulo('PngGlobo')
    .ImageDescricao('PngRefresh')
    .Descricao('Update Now')
    .Alinhamento(TAlignLayout.Left)
    .Build
  );

  lytCardLeft.AddObject(
    TComponentCard.New(Self)
    .Nome('revenue')
    .Titulo('Revenue')
    .SubTitulo('R$ 100,00')
    .ImagemTitulo('PngGlobo')
    .ImageDescricao('PngRefresh')
    .Descricao('Último Dia')
    .Alinhamento(TAlignLayout.Left)
    .Build
  );

  lytCardRight.AddObject(
    TComponentCard.New(Self)
    .Nome('errors')
    .Titulo('Errors')
    .SubTitulo('23')
    .ImagemTitulo('PngGlobo')
    .ImageDescricao('PngRefresh')
    .Descricao('Última hora')
    .Alinhamento(TAlignLayout.Left)
    .Build
  );

  lytCardRight.AddObject(
    TComponentCard.New(Self)
    .Nome('Followers')
    .Titulo('Followers')
    .SubTitulo('+45K')
    .ImagemTitulo('PngGlobo')
    .ImageDescricao('PngRefresh')
    .Descricao('Update Now')
    .Alinhamento(TAlignLayout.Left)
    .Build
  );
end;

procedure TPageHome.lytCardLeftResize(Sender: TObject);
begin
  ResponsiveLayout(lytCardLeft, 2);
end;

procedure TPageHome.lytCardRightResize(Sender: TObject);
begin
  ResponsiveLayout(lytCardRight, 2);
end;

procedure TPageHome.LytCardsResize(Sender: TObject);
begin
  lytCardLeft.width := Round((lytContainer.width-40)/2)
end;

function TPageHome.Render: TFMXObject;
begin
  CarregaCards;
  Result := lytContainer;
end;

procedure TPageHome.ResponsiveLayout(Layout: TLayout; Count: Single);
begin
   for var I:= 0 to Pred(Layout.ChildrenCount) do
    if Layout.Children.Items[I] is TLayout then
      TLayout(Layout.Children.Items[I]).Width := Round(Layout.Width/Count);
end;

procedure TPageHome.UnRender;
begin

end;

end.
