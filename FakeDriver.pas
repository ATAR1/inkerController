unit FakeDriver;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls;

const
  ISO_NoError               =0;

function  ISO_DriverInit(var wTotalBoards:WORD)       :     WORD;
procedure ISO_DriverClose			      		;
function  ISO_InputByte( wPortAddr :word)             :     word;


type
  TForm2 = class(TForm)
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    procedure CheckBoxClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
var stateByte:word;

function  ISO_DriverInit(var wTotalBoards:WORD):WORD;
begin
Form2:=TForm2.Create(nil);
Form2.Show();
Result:=ISO_NoError;
end;

procedure ISO_DriverClose;
begin
  Form2.Close();
end;

function  ISO_InputByte( wPortAddr :word):word;
begin
  Result := stateByte;
end;


{$R *.dfm}

procedure TForm2.CheckBoxClick(Sender: TObject);
var checkBox:TCheckBox;
    num:integer;
begin
  checkBox:= Sender as TCheckBox;
  num := checkBox.Tag;
  if(checkBox.Checked) then
    begin
      checkBox.Caption:='���������� '+IntToStr(checkBox.Tag)+' ������';
      stateByte:=stateByte or (1 shl(num-1));
    end
  else
    begin
      checkBox.Caption:='���������� '+IntToStr(checkBox.Tag)+' ������';
      stateByte:=stateByte and not (1 shl(num-1));
    end;

end;

end.
