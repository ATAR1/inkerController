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
    Indicator5: TIndicator;
    Indicator6: TIndicator;
    Indicator7: TIndicator;
    Indicator8: TIndicator;
    Indicator9: TIndicator;
    Indicator10: TIndicator;
    Indicator11: TIndicator;
    Indicator12: TIndicator;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    lblFrontSpeed: TLabel;
    lblRearSpeed: TLabel;
    lblAvgSpeed: TLabel;
    GroupBox5: TGroupBox;
    lblBoardAdress: TLabel;
    lblDistanceDetectors1: TLabel;
    lblDistanceDetectors2: TLabel;
    lblDistanceDetectors3: TLabel;
    lblInkerDistance1: TLabel;
    lblInkerDistance2: TLabel;
    lblInkerDistance3: TLabel;
    lblInkerDistance4: TLabel;
    lblDelay1: TLabel;
    lblDelay2: TLabel;
    lblDelay3: TLabel;
    lblDelay4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

  private
    mainCycleTimer:TTimer;
    _indicators:array [0..11] of TIndicator;
    procedure Cycle(Sender: TObject);
    procedure ShowIndicators(inputByte: Word);
    procedure ShowSettings();
    procedure ShowCalculatedValues;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
uses
{$IFDEF DEBUG}
  FakeDriver,
{$ELSE}
  P16r16,
{$ENDIF}
  Speedometer,TimeDelayController,Settings;
{$R *.dfm}


function CalculateDelay(speed:real; distance:integer):integer;
begin
  if(speed=0) then exit(0);
  Result:=Round(distance/speed);
end;

{ TForm1 }

procedure TForm1.Cycle(Sender: TObject);
var
  inputByte,output: Longint;
  delays:array [0..3] of integer;
  i: Integer;
begin
  inputByte:=PCI_DI16(baseAdress);
  MeasuringSpeed(inputByte);
  for i := 0 to 3 do
    delays[i]:=CalculateDelay(GetAverageSpeed(), basesOfInker[i]);
  SetDelays(delays);
  output:=HandleWithTimeDelay((inputByte shr 4));
  PCI_DO16(baseAdress,output);
  ShowIndicators(inputByte or (output shl 8));
  ShowCalculatedValues();
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

procedure TForm1.ShowSettings;
begin
  lblBoardAdress.Caption:='����� �����: '+IntToStr(baseAdress);
  lblDistanceDetectors1.Caption:='��������� ����� 1-� � 2-� ������������: '+IntToStr(distanceBetweenDetectors[0]);
  lblDistanceDetectors2.Caption:='��������� ����� 2-� � 3-� ������������: '+IntToStr(distanceBetweenDetectors[1]);
  lblDistanceDetectors3.Caption:='��������� ����� 3-� � 4-� ������������: '+IntToStr(distanceBetweenDetectors[2]);
  lblInkerDistance1.Caption:='���������� �� 1-�� ���������������: '+IntToStr(basesOfInker[0]);
  lblInkerDistance2.Caption:='���������� �� 2-�� ���������������: '+IntToStr(basesOfInker[1]);
  lblInkerDistance3.Caption:='���������� �� 3-�� ���������������: '+IntToStr(basesOfInker[2]);
  lblInkerDistance4.Caption:='���������� �� 4-�� ���������������: '+IntToStr(basesOfInker[3]);
end;

procedure TForm1.ShowCalculatedValues;
begin
  lblFrontSpeed.Caption := '�������� �� ��������� ����� = ' + IntToStr(Round(speed * 1000));
  lblRearSpeed.Caption := '�������� �� ������� ����� = ' + IntToStr(Round(speed2 * 1000));
  lblAvgSpeed.Caption := '������� �������� = ' + IntToStr(Round(GetAverageSpeed * 1000));
  lblDelay1.Caption:= '�������� 1-�� ��-��:'+IntToStr(delays[0])+ ' ��.';
  lblDelay2.Caption:= '�������� 2-�� ��-��:'+IntToStr(delays[1])+ ' ��.';
  lblDelay3.Caption:= '�������� 3-�� ��-��:'+IntToStr(delays[2])+ ' ��.';
  lblDelay4.Caption:= '�������� 4-�� ��-��:'+IntToStr(delays[3])+ ' ��.';
end;

procedure TForm1.FormCreate(Sender: TObject);
var rtn:word;
    totalBoards:word;
begin
  baseAdress:=0;
  rtn := PCI_DriverInit( totalBoards );
  if(rtn<>NoError)then
  begin
    ShowMessage('������ ��� ������� ������� �������!');
    exit;
  end;

  ShowSettings();

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
  PCI_DriverClose();
end;

end.
