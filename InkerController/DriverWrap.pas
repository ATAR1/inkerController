unit DriverWrap;

interface
type
// ������� ��� �������� ����� DIO
TDriverWrap = class(TObject)
private
  { private declarations }
protected
  { protected declarations }
public
  { public declarations }

published
  { published declarations }
end;

implementation
uses
{$IFDEF DEBUG}
  FakeDriver,
{$ELSE}
  P16r16
{$ENDIF}
  ;


end.
