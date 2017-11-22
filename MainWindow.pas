unit MainWindow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Indicator;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Shape1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);

  private
    mainCycleTimer:TTimer;
    procedure Cycle(Sender: TObject);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
uses FakeDriver;
{$R *.dfm}
var speed:integer;
    baseAdress:word;
{ TForm1 }

procedure TForm1.Cycle(Sender: TObject);
var
  inputByte: Word;
begin
  inputByte:=ISO_InputByte(baseAdress + 0);
  Label1.Caption := IntToHex(inputByte,2);
  if(inputByte and 1) <> 0    then
    Indicator1.SetOn()
  else
    Indicator1.SetOff();

end;

procedure TForm1.FormCreate(Sender: TObject);
var rtn:word;
    totalBoards:word;
begin
  baseAdress:=0;
  rtn := ISO_DriverInit( totalBoards );
  if(rtn<>ISO_NoError)then
  begin
    ShowMessage('Ошибка при попытке открыть драйвер!');
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
