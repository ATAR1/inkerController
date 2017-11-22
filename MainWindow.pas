unit MainWindow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Indicator;

type
  TForm1 = class(TForm)
    Indicator1: TIndicator;
    Indicator2: TIndicator;
    Indicator3: TIndicator;
    Indicator4: TIndicator;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

  private
    mainCycleTimer:TTimer;
    procedure Cycle(Sender: TObject);
    procedure ShowIndicators(inputByte: Word);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
uses FakeDriver;
{$R *.dfm}
var speed,speed2:real;
    baseAdress:word;
    storedState:byte;
    onTime:array [0..3] of longint;
    offTime:array [0..3] of longint;
    distance:array [0..2] of integer;

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
        speed:=GetSpeed(onTime[detectorNum],onTime[detectorNum-1],detectorNum-1);
      storedState:=storedState or (1 shl detectorNum);
    end
  else
    begin
      offTime[detectorNum]:=GetTickCount();
      if(detectorNum>0)then
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



{ TForm1 }

procedure TForm1.Cycle(Sender: TObject);
var
  inputByte: Word;
begin
  inputByte:=ISO_InputByte(baseAdress + 0);
  ShowIndicators(inputByte);
  MeasuringSpeed(inputByte);
  Label1.Caption:='—корость по переднему концу = '+IntToStr(Round(speed*1000));
  Label2.Caption:='—корость по заднему концу = '+IntToStr(Round(speed2*1000));
  Label3.Caption:='—редн€€ скорость = '+IntToStr(Round((speed+speed2)*1000/2));
end;

procedure TForm1.ShowIndicators(inputByte: Word);
begin
  if (inputByte and 1) <> 0 then
    Indicator1.SetOn
  else
    Indicator1.SetOff;
  if (inputByte and 2) <> 0 then
    Indicator2.SetOn
  else
    Indicator2.SetOff;
  if (inputByte and 4) <> 0 then
    Indicator3.SetOn
  else
    Indicator3.SetOff;
  if (inputByte and 8) <> 0 then
    Indicator4.SetOn
  else
    Indicator4.SetOff;
end;

procedure TForm1.FormCreate(Sender: TObject);
var rtn:word;
    totalBoards:word;
begin
  baseAdress:=0;
  rtn := ISO_DriverInit( totalBoards );
  if(rtn<>ISO_NoError)then
  begin
    ShowMessage('ќшибка при попытке открыть драйвер!');
    exit;
  end;

  mainCycleTimer:=TTimer.Create(self);
  mainCycleTimer.Interval:=50;
  mainCycleTimer.OnTimer:=Cycle;
  mainCycleTimer.Enabled:=true;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  ISO_DriverClose();
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
