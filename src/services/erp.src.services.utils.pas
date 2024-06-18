unit erp.src.services.utils;

interface

uses
  FMX.Objects,
  FMX.Types,
  System.UITypes;

type
  TUtils = class
  private
  public
    class procedure ResourceImage(Resource: String; Image: TImage); overload;
    class procedure ResourceImage(Resource: String; Image: TFMXObject); overload;
    class function UpperCaseCamelCase(Value: String): String;
    class procedure ImageColor(Image: TImage; Color: TAlphaColor);
  end;

implementation

uses
  System.Classes,
  System.Types,
  System.SysUtils;

{ TUtils }

class procedure TUtils.ResourceImage(Resource: String; Image: TImage);
begin
  var
  lResources := TResourceStream.Create(HInstance, Resource, RT_RCDATA);
  try
    Image.Bitmap.LoadFromStream(lResources);
  finally
    lResources.Free;
  end;
end;

class procedure TUtils.ImageColor(Image: TImage; Color: TAlphaColor);
begin
  Image.Bitmap.ReplaceOpaqueColor(Color);
end;

class procedure TUtils.ResourceImage(Resource: String; Image: TFMXObject);
begin
var
  lResources := TResourceStream.Create(HInstance, Resource, RT_RCDATA);
  try
    TShape(Image).Fill.Bitmap.Bitmap.LoadFromStream(lResources);
  finally
    lResources.Free;
  end;
end;

class function TUtils.UpperCaseCamelCase(Value: String): String;
begin
  Result := UpperCase(Copy(Value,1,1)) + LowerCase(Copy(Value,2,Length(Value)));
end;

end.
