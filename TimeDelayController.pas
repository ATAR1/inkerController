unit TimeDelayController;

interface
function HandleWithTimeDelay(inputByte:word):word;
procedure SetDelays(delaysIn:array of integer);
var delays:array [0..3] of integer;

implementation

uses
  System.Generics.Collections, Winapi.Windows;
var
  queuesOn:array [0..3] of TQueue<Longint>;
  queuesOff:array [0..3] of TQueue<Longint>;
  storedState:word;
  output:word;


procedure SetInkerDelay(inkerNum:integer; state:byte);
begin
  if(state>0) then
    begin
      queuesOn[inkerNum].Enqueue(GetTickCount()+delays[inkerNum]);
      storedState:=storedState or (1 shl inkerNum);
    end
  else
    begin
      queuesOff[inkerNum].Enqueue(GetTickCount()+delays[inkerNum]);
      storedState:=storedState and not (1 shl inkerNum);
    end;
end;

procedure SetBit();
var
  currentTick: Cardinal;
  bitNum:integer;
begin
  currentTick:=GetTickCount();
  for bitNum:=0 to 3 do
  begin
    if(queuesOn[bitNum].Count>0) then
      if(queuesOn[bitNum].Peek<=currentTick)then
        begin
          output:=output or (1 shl bitNum);
          queuesOn[bitNum].Dequeue;
        end;
    if(queuesOff[bitNum].Count>0) then
      if(queuesOff[bitNum].Peek<=currentTick)then
        begin
          output:=output and not (1 shl bitNum);
          queuesOff[bitNum].Dequeue;
        end;
  end;
end;

function HandleWithTimeDelay(inputByte:word):word;
var bitNum:integer;
begin
  for bitNum:=0 to 3 do
    if(((storedState xor inputByte) and (1 shl bitNum))>0) then
      begin
        SetInkerDelay(bitNum,(inputByte and (1 shl bitNum)));
      end;
  SetBit();
  Result:=output;
end;

procedure SetDelays(delaysIn:array of integer);
var i:integer;
begin
  for i := 0 to 3 do
    delays[i]:=delaysIn[i];
end;

var i:integer;
initialization
  for i := 0 to 3 do
    begin
      queuesOn[i]:=TQueue<Longint>.Create();
      queuesOff[i]:=TQueue<Longint>.Create();
    end;
end.
