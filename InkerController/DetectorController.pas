unit DetectorController;

interface

uses
  Vcl.ExtCtrls, System.Classes;
type
  TDetectorController = class(TComponent)
  private
    class var Instance:TDetectorController;
    FTimer:TTimer;
    constructor Create();
    procedure CheckDetectorsState(Sender:TObject);
  protected
    { protected declarations }
  public
    { public declarations }
    class function  GetInstance():TDetectorController;  static;
    destructor Destroy(); virtual;
  published
    { published declarations }
  end;

implementation

{ TDetectorController }

procedure TDetectorController.CheckDetectorsState(Sender:TObject);
begin

end;

constructor TDetectorController.Create;
begin
  FTimer:=TTimer.Create(self);
  FTimer.OnTimer:=CheckDetectorsState;
end;

destructor TDetectorController.Destroy;
begin
  FTimer.Free;
end;

class function TDetectorController.GetInstance: TDetectorController;
begin
  if instance=nil then instance:= TDetectorController.Create;
  result:=instance;
end;

end.
