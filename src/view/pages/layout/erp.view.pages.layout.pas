unit erp.view.pages.layout;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Objects, FMX.Controls.Presentation, FMX.MultiView, Router4D.Interfaces,
  FMX.StdCtrls;

type
  TPageLayout = class(TForm, iRouter4DComponent)
    lytContainer: TLayout;
    MultiView1: TMultiView;
    Layout1: TLayout;
    lytMain: TLayout;
    lytNavBar: TLayout;
    lytBody: TLayout;
    recBackground: TRectangle;
    Button1: TButton;
  private
    procedure RenderSideBar;

  public
    { Public declarations }
    function Render : TFMXObject;
    procedure UnRender;
  end;

implementation

{$R *.fmx}

uses erp.src.view.components.sidebar;

{ TPageLayout }

function TPageLayout.Render: TFMXObject;
begin
  RenderSideBar;
  Result := lytContainer;
end;

procedure TPageLayout.RenderSideBar;
begin
  Layout1.AddObject(TComponentSideBar.New(Self).Component);
end;

procedure TPageLayout.UnRender;
begin

end;

end.
