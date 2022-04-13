program InkerController;

uses
  Vcl.Forms,
  MainWindowUnit in 'MainWindowUnit.pas' {MainWindow},
  FakeDriver in 'FakeDriver.pas' {Form2},
  Indicator in 'Indicator.pas',
  Speedometer in 'Speedometer.pas',
  TimeDelayController in 'TimeDelayController.pas',
  Settings in 'Settings.pas',
  P16r16 in 'P16r16.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainWindow, MainWindow);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
