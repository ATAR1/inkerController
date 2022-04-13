unit DriverWrap;

interface
type
// Обертка для драйвера платы DIO
TDriverWrap = class(TObject)
private
    baseAdress: Integer;
  { private declarations }
protected
  { protected declarations }
public
    FBoardNum: Word;
  function InitDriver():boolean;
  procedure DriverClose();
  function GetWord():word;
  procedure SendWord(output:word);
published
  { published declarations }
end;

implementation
uses
{$IFDEF DEBUG}
  FakeDriver,
{$ELSE}
  P16r16, 
{$ENDIF}
  Winapi.Windows, System.SysUtils;


{ TDriverWrap }

procedure TDriverWrap.DriverClose;
begin
  PCI_DriverClose();
end;

function TDriverWrap.GetWord: word;
begin
  Result:=PCI_DI16(baseAdress);
end;

function TDriverWrap.InitDriver: boolean;
var
  rtn:word;
  totalBoards:word;
  wCardType: Word;
  CardAddr0: Word;
  CardAddr1: Word;
  CardAddr2: Word;
  CardAddr3: Word;
  CardAddr4: Word;
  CardAddr5: Word;
begin
  rtn := PCI_DriverInit( totalBoards );
  if (rtn<>NOERROR) then raise Exception.Create('Ошибка при попытке открыть драйвер PCI-P16R16!');
  if totalBoards<1 then raise Exception.Create('Не найдено ни одной карты PCI-P16R16!');

  PCI_GetConfigAddressSpace( FBoardNum , wCardType,
                                CardAddr0, CardAddr1, CardAddr2,
                                CardAddr3, CardAddr4, CardAddr5 );
  if wCardType<>TYPE_P16R16 then raise Exception.Create('Указанная карта не является картой PCI-P16R16!');

  baseAdress:= CardAddr2;
end;

procedure TDriverWrap.SendWord(output: word);
begin
  PCI_DO16(baseAdress,output);
end;

end.
