unit  ISO;          { ISO.dll interface unit }

interface

const
  ISO_NoError               =0;
  ISO_DriverOpenError       =1;
  ISO_DriverNoOpen          =2;
  ISO_GetDriverVersionError =3;
  ISO_InstallIrqError       =4;
  ISO_ClearIntCountError    =5;
  ISO_GetIntCountError      =6;
  ISO_ResetError            =7;  
  ISO_RemoveIrqError        =8;

  ISO_GetTotalBoardError    =9;
  ISO_CardNotFound          =10;
  ISO_GetConfigError        =11;
  ISO_ExceedBoardNumber     =12;

// The test functions
function  ISO_ShortSub2(nA : smallint; nB : smallint) : Smallint; StdCall;
function  ISO_FloatSub2(fA :   single; fB : single)   :   Single; StdCall;
function  ISO_GetDllVersion                           :     WORD; StdCall;
function  ISO_GetDriverVersion(var wDriverVer: word)  :     WORD; StdCall;

// The Driver functions
function  ISO_DriverInit(var wTotalBoards:WORD)       :     WORD; StdCall;
procedure ISO_DriverClose			      		; StdCall;
function  ISO_GetConfigAddress( 
		var wAddrBase:WORD; var wCurrentBoard:WORD):WORD; StdCall;
function  ISO_ActiveBoard( wBoardNo:WORD )            :     WORD; StdCall;

// The DIO functions
procedure ISO_OutputByte(wPortAddr : word; bOutputVal :byte);     StdCall;
procedure ISO_OutputWord(wPortAddr : word; wOutputVal :word);     StdCall;
function  ISO_InputByte( wPortAddr :word)             :     word; StdCall;
function  ISO_InputWord( wPortAddr :word)             :     word; StdCall;

// The Interrupt functions
function  ISO_IntInstall(var hEvent:LongInt):WORD; StdCall;
function  ISO_IntGetCount(var wIntCount:LongInt):WORD; StdCall;
function  ISO_IntRemove:WORD; StdCall;


implementation

// The test functions
function  ISO_ShortSub2;     	external 'ISO.DLL'  name 'ISO_ShortSub2';
function  ISO_FloatSub2;     	external 'ISO.DLL'  name 'ISO_FloatSub2';
function  ISO_GetDllVersion; 	external 'ISO.DLL'  name 'ISO_GetDllVersion';
function  ISO_GetDriverVersion; external 'ISO.DLL'  name 'ISO_GetDriverVersion';

// The Driver functions
function  ISO_DriverInit;    	external 'ISO.DLL'  name 'ISO_DriverInit';
procedure ISO_DriverClose;   	external 'ISO.DLL'  name 'ISO_DriverClose';
function  ISO_GetConfigAddress;	external 'ISO.DLL'  name 'ISO_GetConfigAddress';
function  ISO_ActiveBoard;   	external 'ISO.DLL'  name 'ISO_ActiveBoard';

// The DIO functions
procedure ISO_OutputByte;    	external 'ISO.DLL'  name 'ISO_OutputByte';
procedure ISO_OutputWord;    	external 'ISO.DLL'  name 'ISO_OutputWord';
function  ISO_InputByte;     	external 'ISO.DLL'  name 'ISO_InputByte';
function  ISO_InputWord;     	external 'ISO.DLL'  name 'ISO_InputWord';

// The Interrupt functions
function  ISO_IntInstall; 	external 'ISO.DLL'  name 'ISO_IntInstall';
function  ISO_IntGetCount;     	external 'ISO.DLL'  name 'ISO_IntGetCount';
function  ISO_IntRemove;	external 'ISO.DLL'  name 'ISO_IntRemove';

end.
