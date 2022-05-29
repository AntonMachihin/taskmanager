unit RedTask;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Data.DB,
  DBAccess, MyAccess, MemDS;

type
  TformRedTask = class(TForm)
    memTask: TMemo;
    edID: TEdit;
    Label5: TLabel;
    MyDataSource1: TMyDataSource;
    MyQuery1: TMyQuery;
    MyConnection1: TMyConnection;
    btnCancel: TButton;
    btnOK: TButton;
    edZaglav: TEdit;
    Label4: TLabel;
    Label3: TLabel;
    lbDes: TLabel;
    Label1: TLabel;
    edMaster: TEdit;
    dtVupol: TDateTimePicker;
    memComment: TMemo;
    Label6: TLabel;
    btnResend: TButton;
    edStatus: TEdit;
    Label7: TLabel;
    btnAccept: TButton;
    btnReject: TButton;
    btnComplete: TButton;
    procedure btnCancelClick(Sender: TObject);
    procedure btnResendClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnAcceptClick(Sender: TObject);
    procedure btnRejectClick(Sender: TObject);
    procedure btnCompleteClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formRedTask: TformRedTask;

implementation

{$R *.dfm}
uses Oper, Login;

procedure TformRedTask.btnAcceptClick(Sender: TObject);
var S:string;
begin
MyQuery1.Close;
MyQuery1.SQL.Clear;
S:= 'UPDATE zadachi Set Stat = ''������� � ������'', '+
' Comment = '+chr(39)+formlogin.DelQ(memComment.Lines.Text)+chr(39)+' WHERE ID = '+ chr(39)+edID.Text+chr(39);
MyQuery1.SQL.Add(S);
MyQuery1.ExecSQL;
MyQuery1.Close;
MyQuery1.SQL.Clear;
//��������� ����
MyQuery1.SQL.Add('Select Data_sozd from zadachi where ID ='+ chr(39)+edID.Text+chr(39));
MyQuery1.Open;
//������� ����
S:= 'Insert into log(idtask, Name, Zapis, Vrem) Values ('+ chr(39)+edID.Text+chr(39)+
', '+chr(39)+UserName+chr(39)+', '+chr(39)+'������ ������� � ������: '
+formlogin.DelQ(edZaglav.Text)+'; ������������: '+formlogin.DelQ(memTask.Lines.Text)+'; �����������: '+
edMaster.Text+'; ���� ������: '+formatdatetime('yyy-mm-dd',MyQuery1.FieldValues['Data_sozd'])+'; ���� ����������: '+
formatdatetime('yyy-mm-dd',dtVupol.Date)+'; �����������: '+formlogin.DelQ(memComment.Lines.Text)+chr(39)+', NOW());';
MyQuery1.Close;
MyQuery1.SQL.Clear;
MyQuery1.SQL.Add(S);
MyQuery1.ExecSQL;
MyQuery1.Close;
MyQuery1.SQL.Clear;

formRedTask.Hide;
formOper.MyQuery1.Close;
formOper.MyQuery1.SQL.Clear;
if MasterRole then formOper.MyQuery1.SQL.add('SELECT id as ''�'', Stat as ''������'', Zaglav as ''���������'', Operator as ''�����������'', Task as ''������'', Data_sozd as ''���� ��������'', Data_vyp as ''���� ������.'', Comment as ''�����������'' FROM zadachi WHERE Mast = '+chr(39)+UserName+chr(39));
formOper.MyQuery1.Open;
formOper.SetDBGrid();
end;

procedure TformRedTask.btnCancelClick(Sender: TObject);
begin
formRedTask.Hide;
end;

procedure TformRedTask.btnCompleteClick(Sender: TObject);
Var S:String;
begin
MyQuery1.Close;
MyQuery1.SQL.Clear;
S:= 'UPDATE zadachi Set Stat = ''������ ��������� ��������� ��������'', '+
' Comment = '+chr(39)+formlogin.DelQ(memComment.Lines.Text)+chr(39)+' WHERE ID = '+ chr(39)+edID.Text+chr(39);
MyQuery1.SQL.Add(S);
MyQuery1.ExecSQL;
MyQuery1.Close;
MyQuery1.SQL.Clear;
//��������� ����
MyQuery1.SQL.Add('Select Data_sozd from zadachi where ID ='+ chr(39)+edID.Text+chr(39));
MyQuery1.Open;
//������� ����
S:= 'Insert into log(idtask, Name, Zapis, Vrem) Values ('+ chr(39)+edID.Text+chr(39)+
', '+chr(39)+UserName+chr(39)+', '+chr(39)+'������ ���������, ��������� ��������: '
+formlogin.DelQ(edZaglav.Text)+'; ������������: '+formlogin.DelQ(memTask.Lines.Text)+'; �����������: '+
edMaster.Text+'; ���� ������: '+formatdatetime('yyy-mm-dd',MyQuery1.FieldValues['Data_sozd'])+'; ���� ����������: '+
formatdatetime('yyy-mm-dd',dtVupol.Date)+'; �����������: '+formlogin.DelQ(memComment.Lines.Text)+chr(39)+', NOW());';
MyQuery1.Close;
MyQuery1.SQL.Clear;
MyQuery1.SQL.Add(S);
MyQuery1.ExecSQL;
MyQuery1.Close;
MyQuery1.SQL.Clear;

formRedTask.Hide;
formOper.MyQuery1.Close;
formOper.MyQuery1.SQL.Clear;
if MasterRole then formOper.MyQuery1.SQL.add('SELECT id as ''�'', Stat as ''������'', Zaglav as ''���������'', Operator as ''�����������'', Task as ''������'', Data_sozd as ''���� ��������'', Data_vyp as ''���� ������.'', Comment as ''�����������'' FROM zadachi WHERE Mast = '+chr(39)+UserName+chr(39));
formOper.MyQuery1.Open;
formOper.SetDBGrid();
end;

procedure TformRedTask.btnOKClick(Sender: TObject);
Var S:String;
begin
MyQuery1.Close;
MyQuery1.SQL.Clear;
S:= 'UPDATE zadachi Set Stat = ''���������'', '+
' Comment = '+chr(39)+formlogin.DelQ(memComment.Lines.Text)+chr(39)+' WHERE ID = '+ chr(39)+edID.Text+chr(39);
MyQuery1.SQL.Add(S);
MyQuery1.ExecSQL;
MyQuery1.Close;
MyQuery1.SQL.Clear;
//��������� ����
MyQuery1.SQL.Add('Select Data_sozd from zadachi where ID ='+ chr(39)+edID.Text+chr(39));
MyQuery1.Open;
//������� ����
S:= 'Insert into log(idtask, Name, Zapis, Vrem) Values ('+ chr(39)+edID.Text+chr(39)+
', '+chr(39)+UserName+chr(39)+', '+chr(39)+'������ ���������: '
+edZaglav.Text+'; ������������: '+formlogin.DelQ(memTask.Lines.Text)+'; ��������� ��: '+
edMaster.Text+'; ���� ������: '+formatdatetime('yyy-mm-dd',MyQuery1.FieldValues['Data_sozd'])+'; ���� ����������: '+
formatdatetime('yyy-mm-dd',dtVupol.Date)+'; �����������: '+formlogin.DelQ(memComment.Lines.Text)+chr(39)+', NOW());';
MyQuery1.Close;
MyQuery1.SQL.Clear;
MyQuery1.SQL.Add(S);
MyQuery1.ExecSQL;
MyQuery1.Close;
MyQuery1.SQL.Clear;

formRedTask.Hide;
formOper.MyQuery1.Close;
formOper.MyQuery1.SQL.Clear;
if OperRole then formOper.MyQuery1.SQL.add('SELECT id as ''�'', Stat as ''������'', Zaglav as ''���������'', Mast as ''�����������'', Task as ''������'', Data_sozd as ''���� ��������'', Data_vyp as ''���� ������.'', Comment as ''�����������'' FROM zadachi WHERE Operator = '+chr(39)+UserName+chr(39));
formOper.MyQuery1.Open;
formOper.SetDBGrid();
end;

procedure TformRedTask.btnRejectClick(Sender: TObject);
Var S:String;
begin
MyQuery1.Close;
MyQuery1.SQL.Clear;
S:= 'UPDATE zadachi Set Stat = ''���������� �� ���������'', '+
' Comment = '+chr(39)+formlogin.DelQ(memComment.Lines.Text)+chr(39)+' WHERE ID = '+ chr(39)+edID.Text+chr(39);
MyQuery1.SQL.Add(S);
MyQuery1.ExecSQL;
MyQuery1.Close;
MyQuery1.SQL.Clear;
//��������� ����
MyQuery1.SQL.Add('Select Data_sozd from zadachi where ID ='+ chr(39)+edID.Text+chr(39));
MyQuery1.Open;
//������� ����
S:= 'Insert into log(idtask, Name, Zapis, Vrem) Values ('+ chr(39)+edID.Text+chr(39)+
', '+chr(39)+UserName+chr(39)+', '+chr(39)+'������ ���������� �� ���������: '
+edZaglav.Text+'; ������������: '+formlogin.DelQ(memTask.Lines.Text)+'; �����������: '+
edMaster.Text+'; ���� ������: '+formatdatetime('yyy-mm-dd',MyQuery1.FieldValues['Data_sozd'])+'; ���� ����������: '+
formatdatetime('yyy-mm-dd',dtVupol.Date)+'; �����������: '+formlogin.DelQ(memComment.Lines.Text)+chr(39)+', NOW());';
MyQuery1.Close;
MyQuery1.SQL.Clear;
MyQuery1.SQL.Add(S);
MyQuery1.ExecSQL;
MyQuery1.Close;
MyQuery1.SQL.Clear;

formOper.MyQuery1.Close;
formOper.MyQuery1.SQL.Clear;
if MasterRole then formOper.MyQuery1.SQL.add('SELECT id as ''�'', Stat as ''������'', Zaglav as ''���������'', Operator as ''�����������'', Task as ''������'', Data_sozd as ''���� ��������'', Data_vyp as ''���� ������.'', Comment as ''�����������'' FROM zadachi WHERE Mast = '+chr(39)+UserName+chr(39));
formOper.MyQuery1.Open;
formOper.SetDBGrid();
formRedTask.Hide;
end;

procedure TformRedTask.btnResendClick(Sender: TObject);
Var S:String;
begin
MyQuery1.Close;
MyQuery1.SQL.Clear;
S:= 'UPDATE zadachi Set Zaglav = '+chr(39)+edZaglav.Text+chr(39)+', '+
' Task = '+chr(39)+formlogin.DelQ(memTask.Lines.Text)+chr(39)+', '+
' Data_vyp = '+chr(39)+formatdatetime('yyy-mm-dd',dtVupol.Date)+chr(39)+', '+
' Stat = ''��������� � ��� �� ����������'', '+
' Comment = '''' WHERE ID = '+ chr(39)+edID.Text+chr(39);
MyQuery1.SQL.Add(S);
MyQuery1.ExecSQL;
MyQuery1.Close;
MyQuery1.SQL.Clear;
//��������� ����
MyQuery1.SQL.Add('Select Data_sozd from zadachi where ID ='+ chr(39)+edID.Text+chr(39));
MyQuery1.Open;
//������� ����
S:= 'Insert into log(idtask, Name, Zapis, Vrem) Values ('+ chr(39)+edID.Text+chr(39)+
', '+chr(39)+UserName+chr(39)+', '+chr(39)+'������ ��������� ��������: '
+edZaglav.Text+'; ������������: '+formlogin.DelQ(memTask.Lines.Text)+'; ��������� ��: '+
edMaster.Text+'; ���� ������: '+formatdatetime('yyy-mm-dd',MyQuery1.FieldValues['Data_sozd'])+'; ���� ����������: '+
formatdatetime('yyy-mm-dd',dtVupol.Date)+'; �����������: '+formlogin.DelQ(memComment.Lines.Text)+chr(39)+', NOW());';
MyQuery1.Close;
MyQuery1.SQL.Clear;
MyQuery1.SQL.Add(S);
MyQuery1.ExecSQL;
MyQuery1.Close;
MyQuery1.SQL.Clear;

formRedTask.Hide;
formOper.MyQuery1.Close;
formOper.MyQuery1.SQL.Clear;
if OperRole then formOper.MyQuery1.SQL.add('SELECT id as ''�'', Stat as ''������'', Zaglav as ''���������'', Mast as ''�����������'', Task as ''������'', Data_sozd as ''���� ��������'', Data_vyp as ''���� ������.'', Comment as ''�����������'' FROM zadachi WHERE Operator = '+chr(39)+UserName+chr(39));
formOper.MyQuery1.Open;
formOper.SetDBGrid();
end;

procedure TformRedTask.FormShow(Sender: TObject);
begin
if OperRole then
  begin
  btnResend.Visible:=True;
  btnOK.Visible:=true;
  btnAccept.Visible:=false;
  btnReject.Visible:=false;
  btnComplete.Visible:=false;
  end;

if MasterRole then
  begin                        //��� ������ ������:
  btnResend.Visible:=False;               //��������� ������
  btnOK.Visible:=False;                   //����������� ����������
  btnAccept.Visible:=True;                //������� � ������
  btnReject.Visible:=True;                //���������
  btnComplete.Visible:=True;              //�������� � ����������
  memTask.Enabled:=false;      //�� ������ ������������� ������ ��������
  end;
     //�������              ��� ����� �������:
//��������� � ��� �� ����������  => ������� /���������
//������� � ������               => �������� � ����������
//���������� �� ���������        => ��������� ������
//������ ��������� ��������� ��������  => ����������� ����������/ ��������� ������
//���������

if edStatus.Text='��������� � ��� �� ����������' then
  begin
  btnAccept.Enabled:=True;
  btnReject.Enabled:=True;
  btnResend.Enabled:=False;
  btnOK.Enabled:=False;
  btnComplete.Enabled:=False;
  end;

if edStatus.Text='������� � ������' then
  begin
  btnAccept.Enabled:=False;
  btnReject.Enabled:=False;
  btnResend.Enabled:=False;
  btnOK.Enabled:=False;
  btnComplete.Enabled:=True;
  end;

if edStatus.Text='���������� �� ���������' then
  begin
  btnAccept.Enabled:=False;
  btnReject.Enabled:=False;
  btnResend.Enabled:=True;
  btnOK.Enabled:=False;
  btnComplete.Enabled:=False;
  end;

if edStatus.Text='������ ��������� ��������� ��������' then
  begin
  btnAccept.Enabled:=False;
  btnReject.Enabled:=False;
  btnResend.Enabled:=True;
  btnOK.Enabled:=True;
  btnComplete.Enabled:=False;
  end;

if edStatus.Text='���������' then
  begin
  btnAccept.Enabled:=False;
  btnReject.Enabled:=False;
  btnResend.Enabled:=False;
  btnOK.Enabled:=False;
  btnComplete.Enabled:=False;
  end;

end;

end.