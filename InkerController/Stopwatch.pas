unit Stopwatch;

interface

uses
  System.Generics.Collections;
type
  TGetTickWrap = class
    public
      type TGetTickCount = function():integer;
      FGetTickCount:TGetTickWrap.TGetTickCount;
  end;

  TStopwatch = class(TObject)
  public
    type TMeasurmentFinished = procedure(sec:integer);
    procedure Start;
    procedure Stop;
    procedure RegisterHandler(handler:TStopwatch.TMeasurmentFinished);
    constructor Create;
  private
    FHandlers:TList<TStopwatch.TMeasurmentFinished>;
  end;
implementation

{ TStopwatch }

constructor TStopwatch.Create;
begin
  FHandlers:=TList<TStopwatch.TMeasurmentFinished>.Create;
end;

procedure TStopwatch.RegisterHandler(
  handler: TStopWatch.TMeasurmentFinished);
begin
  FHandlers.Add(handler);
end;

procedure TStopwatch.Start;
begin

end;

procedure TStopwatch.Stop;
begin

end;

end.
