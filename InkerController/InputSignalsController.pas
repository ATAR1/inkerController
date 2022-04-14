unit InputSignalsController;

interface

uses
  Vcl.ExtCtrls, System.Classes,Signal, DIOCardInput;
type
  TInputSignalsController = class(TComponent)
  private
    FDIOCard: IDIOCardInput;
    FStoredState: Word;
    FSignals: TArray<TSignal>;
    procedure SetSignals();
  public
    property Signals: TArray<TSignal> read FSignals write FSignals;
    procedure CheckDetectorsState(Sender:TObject);
    constructor Create(DIOCard: IDIOCardInput);
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

constructor TInputSignalsController.Create(DIOCard: IDIOCardInput);
begin
  FStoredState:=FDIOCard.GetWord;
end;



procedure TInputSignalsController.SetSignals;
begin

end;

end.
