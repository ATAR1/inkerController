unit Speedometer;

interface
var speed,speed2:real;
procedure MeasuringSpeed(inputByte:word);
function GetAverageSpeed():real;

implementation

uses
  Winapi.Windows;
var storedState:byte;
    onTime:array [0..3] of longint;
    offTime:array [0..3] of longint;
    distance:array [0..2] of integer;

function GetAverageSpeed():real;
begin
  if(speed2<>0) then
    Result:=(speed+speed2)/2
  else
    Result:=speed;
end;

function GetSpeed(time1:longint;time2:longint;intervalNum:integer):real;
begin
  if((time1<0) or (time2<0) or (time1=time2) ) then exit(-1);
  Result:=distance[intervalNum]/(time1-time2);
end;

procedure SetDetector(detectorNum:integer; state:byte);
begin
  if(state>0) then
    begin
      onTime[detectorNum]:= GetTickCount();
      if(detectorNum>0)then
        if(onTime[detectorNum-1]>0)then
          speed:=GetSpeed(onTime[detectorNum],onTime[detectorNum-1],detectorNum-1);
      storedState:=storedState or (1 shl detectorNum);
    end
  else
    begin
      offTime[detectorNum]:=GetTickCount();
      if(detectorNum>0)then
        if(offTime[detectorNum-1]>0)then
          speed2:=GetSpeed(offTime[detectorNum],offTime[detectorNum-1], detectorNum-1);
      storedState:=storedState and not (1 shl detectorNum);
    end;

end;


procedure MeasuringSpeed(inputByte:word);
var i:integer;
begin
  for i := 0 to 3 do
    if(((storedState xor inputByte) and (1 shl i))>0) then
      begin
        SetDetector(i,(inputByte and (1 shl i)));
      end;
end;


var i:integer;
initialization
  for i := 0 to 2 do
    distance[i]:=100;

  for i := 0 to 3 do
    begin
      onTime[i]:=-1;
      offTime[i]:=-1;
    end;
end.
