unit FakeDriver;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls,
  Indicator;

const
  NoError               =0;
  TYPE_P16R16 =0;

function  PCI_DriverInit(var wTotalBoards:WORD)       :     WORD;
procedure PCI_DriverClose;
procedure PCI_DO16(wBaseAddr:LongInt; wOutputVal :LongInt)	;
function  PCI_DI16(wPortAddr:LongInt)		      :   LongInt ;
function  PCI_GetConfigAddressSpace(
	         wBoardNo: word; var TypeID: word;
	         var wAddress0: word; var wAddress1: word; var wAddress2: word;
	         var wAddress3: word; var wAddress4: word; var wAddress5: word):word;

type
  TFakeDriverForm = class(TForm)
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    Indicator1: TIndicator;
    Indicator2: TIndicator;
    Indicator3: TIndicator;
    Indicator4: TIndicator;
    procedure CheckBoxClick(Sender: TObject);
    procedure CheckBoxClick1(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FakeDriverForm: TFakeDriverForm;
  Form: TFakeDriverForm;
implementation
var stateByte:word;

function  PCI_DriverInit(var wTotalBoards:WORD):WORD;
begin
  Form:=TFakeDriverForm.Create(nil);
  Form.Show();
  Form.Indicator1.SetOn();
  Result:=NoError;
end;

procedure PCI_DriverClose;
begin
  Form.Close();
end;

function  PCI_DI16(wPortAddr:LongInt)		      :   LongInt ;
begin
  Result := stateByte;
end;

procedure PCI_DO16(wBaseAddr:LongInt; wOutputVal :LongInt)	;
begin
  if(wOutputVal and (1 shl 0))>0 then
    Form.Indicator1.SetOn()
  else
    Form.Indicator1.SetOff();
  if(wOutputVal and (1 shl 1))>0 then
    Form.Indicator2.SetOn()
  else
    Form.Indicator2.SetOff();
  if(wOutputVal and (1 shl 2))>0 then
    Form.Indicator3.SetOn()
  else
    Form.Indicator3.SetOff();
  if(wOutputVal and (1 shl 3))>0 then
    Form.Indicator4.SetOn()
  else
    Form.Indicator4.SetOff();
end;

function  PCI_GetConfigAddressSpace(
	         wBoardNo: word; var TypeID: word;
	         var wAddress0: word; var wAddress1: word; var wAddress2: word;
	         var wAddress3: word; var wAddress4: word; var wAddress5: word):word;
begin

end;


{$R *.dfm}

procedure TFakeDriverForm.CheckBoxClick(Sender: TObject);
var checkBox:TCheckBox;
    num:integer;
begin
  checkBox:= Sender as TCheckBox;
  num := checkBox.Tag;
  if(checkBox.Checked) then
    begin
      checkBox.Caption:='Фотодатчик '+IntToStr(checkBox.Tag)+' открыт';
      stateByte:=stateByte or (1 shl(num-1));
    end
  else
    begin
      checkBox.Caption:='Фотодатчик '+IntToStr(checkBox.Tag)+' закрыт';
      stateByte:=stateByte and not (1 shl(num-1));
    end;

end;

procedure TFakeDriverForm.CheckBoxClick1(Sender: TObject);
var checkBox:TCheckBox;
    num:integer;
begin
  checkBox:= Sender as TCheckBox;
  num := checkBox.Tag;
  if(checkBox.Checked) then
    begin
      checkBox.Caption:='Краскоотметчик '+IntToStr(checkBox.Tag-4)+' вкл';
      stateByte:=stateByte or (1 shl(num-1));
    end
  else
    begin
      checkBox.Caption:='Краскоотметчик '+IntToStr(checkBox.Tag-4)+' откл';
      stateByte:=stateByte and not (1 shl(num-1));
    end;

end;



end.
