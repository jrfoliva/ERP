program ERP;

{$R *.dres}

uses
  System.StartUpCopy,
  FMX.Forms,
  erp.view.index in 'src\view\erp.view.index.pas' {PageIndex},
  erp.view.router in 'src\view\router\erp.view.router.pas',
  erp.view.pages.home in 'src\view\pages\home\erp.view.pages.home.pas' {PageHome},
  erp.view.pages.layout in 'src\view\pages\layout\erp.view.pages.layout.pas' {PageLayout},
  erp.src.view.components.button in 'src\view\components\buttom\erp.src.view.components.button.pas' {ComponentButton: TFrame},
  erp.src.view.components.sidebar in 'src\view\components\sideBar\erp.src.view.components.sidebar.pas' {ComponentSideBar: TFrame},
  erp.src.services.utils in 'src\services\erp.src.services.utils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TPageIndex, PageIndex);
  Application.Run;
end.