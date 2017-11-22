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
uses FakeDriver,Speedometer;
{$R *.dfm}
var baseAdress:word;


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
  Label3.Caption:='—редн€€ скорость = '+IntToStr(Round(GetAverageSpeed()*1000));
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


end.
