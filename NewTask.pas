unit NewTask;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, DBAccess,
  MyAccess, MemDS, Vcl.ComCtrls;

type
  TformNewTask = class(TForm)
    Label1: TLabel;
    edZaglav: TEdit;
    Label2: TLabel;
    cmbMaster: TComboBox;
    MyConnection1: TMyConnection;
    MyQuery1: TMyQuery;
    MyDataSource1: TMyDataSource;
    dtVupol: TDateTimePicker;
    Label3: TLabel;
    btnOK: TButton;
    btnCancel: TButton;
    Label4: TLabel;
    memTask: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formNewTask: TformNewTask;

implementation

{$R *.dfm}

uses Oper, Login;

procedure TformNewTask.btnOKClick(Sender: TObject);
Var S:String; ID:integer;
begin
MyQuery1.Close;
MyQuery1.SQL.Clear;
S:= 'Insert into zadachi(Zaglav, Operator, Mast, Task, Data_sozd, Data_vyp, Stat) Values ('+
chr(39)+formlogin.DelQ(edZaglav.Text)+chr(39)+', ' +chr(39)+UserName+chr(39)+', '+
chr(39)+cmbMaster.Text+chr(39)+', '+chr(39)+formlogin.DelQ(memTask.Lines.Text)+chr(39)+', '+
chr(39)+formatdatetime('yyy-mm-dd',Date)+chr(39)+', '+
chr(39)+formatdatetime('yyy-mm-dd',dtVupol.Date)+chr(39)+', '+
chr(39)+'????????? ? ??? ?? ??????????'+chr(39)+');';
MyQuery1.SQL.Add(S);
MyQuery1.ExecSQL;
MyQuery1.Close;
//??????? ????
MyQuery1.SQL.Clear;
S:='Select * from zadachi where (Zaglav ='+chr(39)+formlogin.DelQ(edZaglav.Text)+chr(39)+
') and (Operator = '+chr(39)+UserName+chr(39)+') and (Mast = '+chr(39)+cmbMaster.Text+chr(39)+
') and (Task = '+chr(39)+formlogin.DelQ(memTask.Lines.Text)+chr(39)+
') and (Data_vyp = '+chr(39)+formatdatetime('yyy-mm-dd',dtVupol.Date)+chr(39)+
') and (Stat = ''????????? ? ??? ?? ??????????'')';
MyQuery1.SQL.Add(S);
MyQuery1.Open;
ID:=MyQuery1.FieldValues['ID'];
S:= 'Insert into log(idtask, Name, Zapis, Vrem) Values ('+inttostr(ID)+
', '+chr(39)+UserName+chr(39)+', '+chr(39)+'?????? ?????????: '
+formlogin.DelQ(edZaglav.Text)+'; ????????????: '+formlogin.DelQ(memTask.Lines.Text)+'; ????????? ??: '+
cmbMaster.Text+'; ???? ??????: '+formatdatetime('yyy-mm-dd',Date)+'; ???? ??????????: '+
formatdatetime('yyy-mm-dd',dtVupol.Date)+chr(39)+', NOW());';
//Edit1.Text:=S;
MyQuery1.Close;
MyQuery1.SQL.Clear;
MyQuery1.SQL.Add(S);
MyQuery1.ExecSQL;

formNewTask.Hide;
formOper.MyQuery1.Close;
formOper.MyQuery1.SQL.Clear;
if OperRole then formOper.MyQuery1.SQL.add('SELECT id as ''?'', Stat as ''??????'', Zaglav as ''?????????'', Mast as ''???????????'', Task as ''??????'', Data_sozd as ''???? ????????'', Data_vyp as ''???? ??????.'', Comment as ''???????????'' FROM zadachi WHERE Operator = '+chr(39)+UserName+chr(39));
formOper.MyQuery1.Open;

formOper.SetDBGrid();

end;

procedure TformNewTask.btnCancelClick(Sender: TObject);
begin
formNewTask.Hide;
end;

procedure TformNewTask.FormCreate(Sender: TObject);
var I:Integer;
begin
cmbMaster.Items.Clear;
MyQuery1.Close;
MyQuery1.SQL.Clear;
MyQuery1.SQL.Add('SELECT users.NAME FROM users INNER JOIN roles ON users.roleID=roles.code WHERE roles.MastMenu = 1');
MyQuery1.Open;
MyQuery1.First;
for I := 0 to MyQuery1.RecordCount-1 do
  begin
  cmbMaster.Items.Add(MyQuery1.FieldByName('Name').AsString);
  MyQuery1.Next;
  end;
MyQuery1.Close;
end;

end.
