program InkerControllerTests;
{

  Delphi DUnit Test Project
  -------------------------
  This project contains the DUnit test framework and the GUI/Console test runners.
  Add "CONSOLE_TESTRUNNER" to the conditional defines entry in the project options
  to use the console test runner.  Otherwise the GUI test runner will be used by
  default.

}

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  DUnitTestRunner,
  InputSignalsController in '..\inkercontroller\InputSignalsController.pas',
  Signal in '..\InkerController\Signal.pas',
  DIOCardInput in '..\InkerController\DIOCardInput.pas',
  TestInputSignalsController in 'TestInputSignalsController.pas',
  TestSignal in 'TestSignal.pas',
  TestStopwatch in 'TestStopwatch.pas',
  Stopwatch in '..\InkerController\Stopwatch.pas';

{R *.RES}

begin
  DUnitTestRunner.RunRegisteredTests;
end.

