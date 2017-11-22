program Project1;

uses
  Vcl.Forms,
  MainWindow in 'MainWindow.pas' {Form1},
  ISO in 'ISO.PAS',
  FakeDriver in 'FakeDriver.pas' {Form2},
  Indicator in 'Indicator.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
