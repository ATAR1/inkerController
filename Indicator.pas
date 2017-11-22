unit Indicator;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.ExtCtrls;


type
  TIndicatorState = (isNone,isOn,isOff);

  TIndicator = class(TShape)
  private
    FState: TIndicatorState;
    procedure SetState(const Value: TIndicatorState);
    { Private declarations }
  protected
    { Protected declarations }
  public
    constructor Create();
    procedure SetOn();
    procedure SetOff();
    procedure Paint; override;
    property State:TIndicatorState   read FState write SetState;
    { Public declarations }
  published
    { Published declarations }
  end;

procedure Register;

implementation

uses
  Vcl.Graphics;

procedure Register;
begin
  RegisterComponents('Samples', [TIndicator]);
end;

{ TShape1 }

constructor TIndicator.Create;
begin
    Brush.Color:=clGray;
end;

procedure TIndicator.Paint;
begin
  inherited;
  Shape:=stCircle;
  case State of
     isNone:
      Brush.Color:=clGray;
     isOn:
      Brush.Color:=clRed;
     isOff:
      Brush.Color:=clWhite;
  end;

end;

procedure TIndicator.SetOff;
begin
  State:=isOff;

end;

procedure TIndicator.SetOn;
begin
  State:=isOn;

end;

procedure TIndicator.SetState(const Value: TIndicatorState);
begin
  FState := Value;
  Paint;
end;

end.
