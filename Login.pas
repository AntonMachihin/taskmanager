unit Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, MemDS, DBAccess, MyAccess,
  Vcl.StdCtrls;

type
  TFormLogin = class(TForm)
    lbName: TLabel;
    lblPassword: TLabel;
    btnLogin: TButton;
    btnCancel: TButton;
    edName: TEdit;
    edPassword: TEdit;
    MyConnection1: TMyConnection;
    MyQuery1: TMyQuery;
    procedure btnLoginClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    function DelQ(pre:string):string;        //�������� �������, ������ �� SQL-��������
  private
    { Private declarations }
  public
    { Public declarations }
    class function Execute: boolean;
  end;

var
  FormLogin: TFormLogin; UserName:String;

implementation

{$R *.dfm}

uses Oper;

function TFormLogin.DelQ(pre:string):string;
var tmp:string;
begin
  tmp:=stringreplace(pre,chr(39),'',[rfReplaceAll]);
  tmp:=stringreplace(tmp,'"','',[rfReplaceAll]);
  result:=tmp;
end;

class function TFormLogin.Execute: boolean;
begin
  with TFormLogin.Create(nil) do
  try
    result:= ShowModal = mrOk;
  finally
    Free;
  end;
end;

procedure TFormLogin.btnCancelClick(Sender: TObject);
begin
Application.Terminate;
end;

procedure TFormLogin.btnLoginClick(Sender: TObject);
var login, pass:string;
begin
MyConnection1.Disconnect;
MyConnection1.Close;
MyConnection1.ConnectString:='User ID=dbuser;Password=123;Data Source=localhost;Database=zadanie';
MyConnection1.Connect;
MyConnection1.Open;
MyQuery1.Close;
MyQuery1.SQL.Clear;
MyQuery1.SQL.add('SELECT NAME, Password  FROM users where name = '+chr(39)+delq(edName.Text)+chr(39));
MyQuery1.Open;
if MyQuery1.FieldValues['Name']<>Null then
begin
  if MyQuery1.FieldValues['Password'] = delq(edPassword.Text) then
    begin
    ModalResult:= mrOk;
    UserName:= MyQuery1.FieldValues['Name'];
    end
  else
    ModalResult:= mrAbort;
end;
end;

end.
