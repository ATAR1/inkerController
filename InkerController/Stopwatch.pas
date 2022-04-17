unit Stopwatch;

interface

uses
  System.Generics.Collections, System.SysUtils, Winapi.Windows;
type
  TStopwatch = class(TObject)
  public
    type TMeasurmentFinished = procedure(sec:integer) of object;
  public
    procedure Start;
    procedure Stop;
    procedure RegisterHandler(handler:TStopwatch.TMeasurmentFinished);
    constructor Create;
  private
    FHandlers:TList<TStopwatch.TMeasurmentFinished>;
    procedure RaiseHandlers(totalTicks:integer);
{$IfDef TEST}
  public
{$EndIf}
    FStartTics:integer;
    FTotalTicks:integer;
    FGetTickCount:TFunc<Cardinal>;

  end;
implementation

{ TStopwatch }

constructor TStopwatch.Create;
begin
  FHandlers:=TList<TStopwatch.TMeasurmentFinished>.Create;
  FGetTickCount:=function():cardinal
                    begin
                      result:=GetTickCount;
                    end;
end;

procedure TStopwatch.RaiseHandlers(totalTicks: integer);
var
  handler: TStopWatch.TMeasurmentFinished;
begin
  for handler in FHandlers do
    handler(totalTicks);
end;

procedure TStopwatch.RegisterHandler(
  handler: TStopWatch.TMeasurmentFinished);
begin
  FHandlers.Add(handler);
end;

procedure TStopwatch.Start;
var
  i: Cardinal;
begin
  FStartTics:=FGetTickCount();
end;

procedure TStopwatch.Stop;
begin
  FTotalTicks:=FGetTickCount()-FStartTics;
  RaiseHandlers(FTotalTicks);
end;

end.
