unit Settings;

interface
var distanceBetweenDetectors:array [0..2] of integer;
    baseAdress:word;
    basesOfInker:array [0..3] of integer;


implementation
uses System.IniFiles, System.SysUtils, Vcl.Forms;
var iniFile:TIniFile;
    iniFileName:string;
    i:integer;
initialization
  iniFileName:= ChangeFileExt(Application.ExeName, '.INI');
  if(not FileExists(iniFileName)) then
    begin
      iniFile:=TIniFile.Create(iniFileName);
      for i := 0 to 2 do
        iniFile.WriteInteger('Distance between detectors','distance'+IntToStr(i),0);
      for i := 0 to 3 do
        iniFile.WriteInteger('Distance to inkers','distance'+IntToStr(i),0);
      iniFile.WriteInteger('Board adress','Board adress',0);
      iniFile.UpdateFile;
    end;
  iniFile:=TIniFile.Create(iniFileName);
  for i := 0 to 2 do
    distanceBetweenDetectors[i]:=iniFile.ReadInteger('Distance between detectors','distance'+IntToStr(i),0);
  for i := 0 to 3 do
    basesOfInker[i]:=iniFile.ReadInteger('Distance to inkers','distance'+IntToStr(i),0);
  baseAdress:=iniFile.ReadInteger('Board adress','Board adress',0);

end.
