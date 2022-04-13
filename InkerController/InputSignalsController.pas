unit InputSignalsController;

interface

uses
  Vcl.ExtCtrls, System.Classes, DriverWrap,Signal;
type
  TInputSignalsController = class(TComponent)
  private
    class var Instance: TInputSignalsController;
  private
    FTimer:TTimer;
    /// <directed>True</directed>
    FDIOCard: TDriverWrap;
    FStoredState: Word;
    FSignals: TArray<TSignal>;
    constructor Create();
    procedure CheckDetectorsState(Sender:TObject);
    procedure SetSignals();
  protected
    { protected declarations }
  public
    property Signals: TArray<TSignal> read FSignals write FSignals;
    class function  GetInstance():TInputSignalsController;  static;
    destructor Destroy(); override;
  end;

implementation


{ TDetectorController }

procedure TInputSignalsController.CheckDetectorsState(Sender:TObject);
var
  inputWord: Word;
begin
  inputWord:=FDIOCard.GetWord();
  if inputWord<>FStoredState then
    begin
      SetSignals();
      FStoredState:=inputWord;
    end;
end;

constructor TInputSignalsController.Create;
begin
  FStoredState:=FDIOCard.GetWord;
  FTimer:=TTimer.Create(self);
  FTimer.OnTimer:=CheckDetectorsState;
  FTimer.Enabled:=true;
end;

destructor TInputSignalsController.Destroy;
begin
  FTimer.Free;
end;

class function TInputSignalsController.GetInstance: TInputSignalsController;
begin
  if instance=nil then instance:= TInputSignalsController.Create;
  result:=instance;
end;

procedure TInputSignalsController.SetSignals;
begin

end;

end.
