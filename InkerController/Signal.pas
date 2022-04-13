unit Signal;

interface

uses
  System.Generics.Collections;
type
  TSignalChangedHandler = procedure(value:boolean)  of object;
  TSignal = class(TObject)
  private
    FState: boolean;
    FHandlers: TList<TSignalChangedHandler>;
    procedure SetState(const Value: boolean);
    procedure RaiseHandlers(value:boolean);
  public
    property State: boolean read FState write SetState;
    procedure RegisterHandler(handler:TSignalChangedHandler);
  end;
implementation

{ TSignal }

procedure TSignal.RaiseHandlers;
var
  handler: TSignalChangedHandler;
begin
  for handler in FHandlers do
    begin
      handler(value);
    end;

end;

procedure TSignal.RegisterHandler(handler: TSignalChangedHandler);
begin
  FHandlers.Add(handler);
end;

procedure TSignal.SetState(const Value: boolean);
begin
  if FState<>value then
    begin
      RaiseHandlers(Value);
      FState := Value;
    end;
end;

end.
