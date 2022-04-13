program InkerController;

uses
  Vcl.Forms,
  MainWindowUnit in 'MainWindowUnit.pas' {MainWindow},
  FakeDriver in 'FakeDriver.pas' {FakeDriverForm},
  Indicator in 'Indicator.pas',
  Speedometer in 'Speedometer.pas',
  TimeDelayController in 'TimeDelayController.pas',
  Settings in 'Settings.pas',
  P16r16 in 'P16r16.pas',
  DriverWrap in 'DriverWrap.pas',
  InputSignalsController in 'InputSignalsController.pas',
  Signal in 'Signal.pas',
  DIOCardInput in 'DIOCardInput.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainWindow, MainWindow);
  Application.CreateForm(TFakeDriverForm, FakeDriverForm);
  Application.Run;
end.
