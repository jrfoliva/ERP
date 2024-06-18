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
    Layout4: TLayout;
    lytMenu: TLayout;
    Rectangle1: TRectangle;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ConstruirMenu;
    class function New(AOwner: TComponent): TComponentSideBar;
    function Component: TFMXObject;
  end;

implementation

{$R *.fmx}

uses erp.src.view.components.button;

{ TComponentSideBar }

function TComponentSideBar.Component: TFMXObject;
begin
  ConstruirMenu;
  Result := lytContainer;
end;

procedure TComponentSideBar.ConstruirMenu;
begin
  lytMenu.AddObject(TComponentButton.New(Self).Component);
end;

class function TComponentSideBar.New(AOwner: TComponent): TComponentSideBar;
begin
  Result := Self.Create(AOwner);
end;

end.
