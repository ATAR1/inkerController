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
    Indicator5: TIndicator;
    Indicator6: TIndicator;
    Indicator7: TIndicator;
    Indicator8: TIndicator;
    Indicator9: TIndicator;
    Indicator10: TIndicator;
    Indicator11: TIndicator;
    Indicator12: TIndicator;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

  private
    mainCycleTimer:TTimer;
    _indicators:array [0..11] of TIndicator;
    procedure Cycle(Sender: TObject);
    procedure ShowIndicators(inputByte: Word);

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
uses FakeDriver,Speedometer,TimeDelayController;
{$R *.dfm}
var baseAdress:word;


{ TForm1 }

procedure TForm1.Cycle(Sender: TObject);
var
  inputByte,output: Word;
  temp: Word;

begin
  inputByte:=ISO_InputByte(baseAdress + 0);
  MeasuringSpeed(inputByte);
  output:=HandleWithTimeDelay(inputByte shr 4);
  temp:=inputByte or (output shl 8);
  ShowIndicators(temp);
  Label1.Caption:='—корость по переднему концу = '+IntToStr(Round(speed*1000));
  Label2.Caption:='—корость по заднему концу = '+IntToStr(Round(speed2*1000));
  Label3.Caption:='—редн€€ скорость = '+IntToStr(Round(GetAverageSpeed()*1000));
end;

procedure TForm1.ShowIndicators(inputByte: Word);
var
  i: Integer;
begin
  for i := 0 to 11 do
    if (inputByte and (1 shl i)) <> 0 then
      _indicators[i].SetOn
    else
      _indicators[i].SetOff;
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

  _indicators[0]:=Indicator1;
  _indicators[1]:=Indicator2;
  _indicators[2]:=Indicator3;
  _indicators[3]:=Indicator4;
  _indicators[4]:=Indicator5;
  _indicators[5]:=Indicator6;
  _indicators[6]:=Indicator7;
  _indicators[7]:=Indicator8;
  _indicators[8]:=Indicator9;
  _indicators[9]:=Indicator10;
  _indicators[10]:=Indicator11;
  _indicators[11]:=Indicator12;

  mainCycleTimer:=TTimer.Create(self);
  mainCycleTimer.Interval:=50;
  mainCycleTimer.OnTimer:=Cycle;
  mainCycleTimer.Enabled:=true;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  ISO_DriverClose();
end;


end.
