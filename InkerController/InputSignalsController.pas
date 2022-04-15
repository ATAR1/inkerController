unit InputSignalsController;

interface

uses
  Vcl.ExtCtrls, System.Classes,Signal, DIOCardInput,
  System.Generics.Collections;
type
  TInputSignalsController = class
  private
  {$IfDef TEST}
  public
  {$EndIf}
    FDIOCard: IDIOCardInput;
    FStoredState: Word;
    FSignals: TList<TSignal>;
    procedure SetSignals(inputWord:word);
  public
    property Signals: TList<TSignal> read FSignals;
    procedure CheckDetectorsState(Sender:TObject=nil);
    constructor Create(DIOCard: IDIOCardInput);
  end;

implementation


{ TDetectorController }

procedure TInputSignalsController.CheckDetectorsState(Sender:TObject=nil);
var
  inputWord: Word;
begin
  inputWord:=FDIOCard.GetWord();
  if inputWord<>FStoredState then
    begin
      SetSignals(inputWord);
      FStoredState:=inputWord;
    end;
end;

constructor TInputSignalsController.Create(DIOCard: IDIOCardInput);
begin
  FSignals:=TList<TSignal>.Create;
  FDIOCard:=DIOCard;
  FStoredState:=FDIOCard.GetWord;
end;



procedure TInputSignalsController.SetSignals(inputWord:word);
var i:integer;
begin
  for i := 0 to Signals.Count-1 do
    Signals[i].State:=((inputWord shr i) and 1) >0;
end;

end.
