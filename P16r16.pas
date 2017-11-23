unit  P16r16;	       { p16r16.dll interface unit }

interface

const
  TYPE_P16R16 =0;
  TYPE_P8R8   =1;
//  TYPE_TMC12  =2;
//  TYPE_DA16   =3;
//  TYPE_DA8    =4;
  
function  PCI_ShortSub2(nA : smallint; nB : smallint) : smallint; StdCall;
function  PCI_FloatSub2(fA :   single; fB : single)   :   single; StdCall;
function  PCI_GetDllVersion			                  :     word; StdCall;
function  PCI_DriverInit(var wTotalBoard: word)       :     word; StdCall;
procedure PCI_DriverClose			      		                   ; StdCall;
function  PCI_GetDriverVersion(var wDriverVer: word)  :     word; StdCall;
function  PCI_GetConfigAddressSpace(
	         wBoardNo: word; var TypeID: word;
	         var wAddress0: word; var wAddress1: word; var wAddress2: word;
	         var wAddress3: word; var wAddress4: word; var wAddress5: word):word; StdCall;
	   
procedure PCI_DO16(wBaseAddr:LongInt; wOutputVal :LongInt)	; StdCall;
function  PCI_DI16(wPortAddr:LongInt)		      :   LongInt ; StdCall;
procedure PCI_DO8(wBaseAddr :LongInt; wOutputVal :word)		; StdCall;
function  PCI_DI8(wPortAddr :LongInt)		      :   word    ; StdCall;

// The following functions are reserved now!
//procedure P16R16_DO(wBaseAddr: word; wOutputVal :word)		; StdCall;
//function  P16R16_DI(wPortAddr:word)		      :     word; StdCall;
//procedure P8R8_DO(wBaseAddr: word; wOutputVal :word)		; StdCall;
//function  P8R8_DI(wPortAddr:word)		      :     byte; StdCall;

implementation

function  PCI_ShortSub2;	          external 'p16r16.dll'  name 'PCI_ShortSub2';
function  PCI_FloatSub2;	          external 'p16r16.dll'  name 'PCI_FloatSub2';
function  PCI_GetDllVersion;	       external 'p16r16.dll'  name 'PCI_GetDllVersion';
function  PCI_DriverInit;	          external 'p16r16.dll'  name 'PCI_DriverInit';
procedure PCI_DriverClose;	          external 'p16r16.dll'  name 'PCI_DriverClose';
function  PCI_GetDriverVersion;      external 'p16r16.dll'  name 'PCI_GetDriverVersion';
function  PCI_GetConfigAddressSpace; external 'p16r16.dll'  name 'PCI_GetConfigAddressSpace';

procedure PCI_DO16;		     external 'p16r16.dll'  name 'PCI_DO16';
function  PCI_DI16;		     external 'p16r16.dll'  name 'PCI_DI16';
procedure PCI_DO8;		     external 'p16r16.dll'  name 'PCI_DO8';
function  PCI_DI8;		     external 'p16r16.dll'  name 'PCI_DI8';

// The following functions are reserved now! 
//procedure P16R16_DO;		  external 'p16r16.dll'  name 'P16R16_DO';
//function  P16R16_DI;		  external 'p16r16.dll'  name 'P16R16_DI';
//procedure P8R8_DO;		     external 'p16r16.dll'  name 'P8R8_DO';
//function  P8R8_DI;		     external 'p16r16.dll'  name 'P8R8_DI';
end.

