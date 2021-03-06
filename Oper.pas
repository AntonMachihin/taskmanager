unit Oper;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Data.DB,
  DBAccess, MyAccess, MemDS, Vcl.StdCtrls, ComObj;

type
  TformOper = class(TForm)
    MyConnection1: TMyConnection;
    MyQuery1: TMyQuery;
    MyDataSource1: TMyDataSource;
    DBGrid1: TDBGrid;
    btnAddTask: TButton;
    Label1: TLabel;
    btnFilter: TButton;
    btnExport: TButton;
    btnRefresh: TButton;
    procedure btnRefreshClick(Sender: TObject);
    procedure btnAddTaskClick(Sender: TObject);
    procedure DBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure btnFilterClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure SetDBGrid();
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formOper: TformOper;
  OperRole:boolean;
  MasterRole:boolean;
  TaskBtnVis:boolean;


implementation

{$R *.dfm}

uses NewTask, RedTask, FilterOper, Login;

const
  xlDiagonalDown = 5;
  xlDiagonalUp = 6;
  xlEdgeBottom = 9;
  xlEdgeLeft = 7;
  xlEdgeRight = 10;
  xlEdgeTop = 8;
  xlInsideHorizontal = 12;
  xlInsideVertical = 11;
  xlContinuous = 1;
  xlDouble = -4119;
  xlAlignCenter=-4108;

procedure TformOper.SetDBGrid();                //??????????? ???????? ????????
begin
DBGrid1.Columns[0].Width:=35;     //??
DBGrid1.Columns[1].Width:=trunc((DBGrid1.Width-345)/4)-10;     //??????
DBGrid1.Columns[2].Width:=trunc((DBGrid1.Width-345)/4)-10;    //?????????
DBGrid1.Columns[3].Width:=70;     //???????? ??? ??????
DBGrid1.Columns[4].Width:=trunc((DBGrid1.Width-345)/4)-10;    // ??????
DBGrid1.Columns[5].Width:=120;    // ???? ????????
DBGrid1.Columns[6].Width:=120;    // ???? ??????????
DBGrid1.Columns[7].Width:=trunc((DBGrid1.Width-345)/4)-10;    // ??????????
end;

procedure TformOper.btnAddTaskClick(Sender: TObject);
begin
FormNewTask.Show;
end;

procedure TformOper.btnExportClick(Sender: TObject);
var a,b: Integer;
ExApp, WB, WS: Variant;
MyRange: OLEVariant;
S,S1:String;
begin
a:=3;
ExApp:=CreateOleObject('Excel.Application');
WB:=ExApp.WorkBooks.Add;
WS := ExApp.Workbooks[1].WorkSheets[1];
with DBGrid1 do
begin
 DataSource.DataSet.First;
  for b := 0 to Columns.Count-1 do
    begin;
    WS.Cells[a,b+1].Borders[xlEdgeRight].LineStyle:=xlContinuous;
    WS.Cells[a, b+1].Value := DBGrid1.Columns[b].Title.Caption;
    end;
 while not DataSource.DataSet.Eof do
 begin
   for b:=0 to (Columns.Count-1) do
   begin
     WS.Cells[a+1, b+1].Value:=Columns[b].Field.AsString;
     if Columns[b].Field.AsString='????????? ? ??? ?? ??????????' then WS.Cells[a+1, b+1].Interior.Color:=RGB(0,255,255);
     if Columns[b].Field.AsString='?????? ????????? ????????? ????????' then WS.Cells[a+1, b+1].Interior.Color:=RGB(255,255,0);
     if Columns[b].Field.AsString='?????????? ?? ?????????' then WS.Cells[a+1, b+1].Interior.Color:=RGB(255,0,0);
     if Columns[b].Field.AsString='?????????' then WS.Cells[a+1, b+1].Interior.Color:=RGB(192,192,192);
     if Columns[b].Field.AsString='??????? ? ??????' then WS.Cells[a+1, b+1].Interior.Color:=RGB(0,255,0);
     WS.Cells[a+1,b+1].Borders[xlEdgeRight].LineStyle:=xlContinuous;
   end;
   DataSource.DataSet.Next;
   Inc(a);
 end;
 DataSource.DataSet.EnableControls;
 WS.Columns.Autofit;
 WS.UsedRange.Borders[xlEdgeBottom].LineStyle:=xlContinuous;

 // ????? ????? - 1 ???????
 WS.Range['A1:H1'].MergeCells:=True;
 if OperRole then S:='????? ? ???????, ??????????? ?????????? '+UserName;
 if MasterRole then S:='????? ? ???????, ?????????? ???????????? '+UserName;
 WS.Cells[1,1].Value:=S;
 WS.Cells[1,1].HorizontalAlignment:=xlAlignCenter;
 // 2 ???????
 WS.Range['A2:H2'].MergeCells:=True;
 S1:='';

 if (formFilterOper.edMaster.Text='') and (formFilterOper.cmbDateNazn.Text='?????') and (formFilterOper.cmbDateOkon.Text='?????') then S1:='?? ??? ?????';
 if OperRole then if (formFilterOper.edMaster.Text<>'') then S1:='?? ???????????(??) '+formFilterOper.edMaster.Text+'; ';
 if MasterRole then if (formFilterOper.edMaster.Text<>'') then S1:='?? ?????????(??) '+formFilterOper.edMaster.Text+'; ';
 if (formFilterOper.cmbDateNazn.Text='???????') then S1:=S1+' ??????????? ? ?????? ?? '+formatdatetime('yyy-mm-dd',formFilterOper.dtSozFrom.Date)+' ?? '+formatdatetime('yyy-mm-dd',formFilterOper.dtSozTo.Date);
 if (formFilterOper.cmbDateOkon.Text='???????') then S1:=S1+' ? ????? ?????????? ?? '+formatdatetime('yyy-mm-dd',formFilterOper.dtEndFrom.Date)+' ?? '+formatdatetime('yyy-mm-dd',formFilterOper.dtEndTo.Date);

 WS.Cells[2,1].Value:=S1;
 WS.Cells[2,1].HorizontalAlignment:=xlAlignCenter;
 WS.Range['A2:H2'].Borders[xlEdgeBottom].LineStyle:=xlContinuous;
 WS.Range['A3:H3'].Borders[xlEdgeBottom].LineStyle:=xlContinuous;

 ExApp.Visible:=true;
end;
end;

procedure TformOper.btnFilterClick(Sender: TObject);
begin
FormFilterOper.Show;
end;

procedure TformOper.btnRefreshClick(Sender: TObject);
begin
MyConnection1.Disconnect;
MyConnection1.Close;
MyConnection1.ConnectString:='User ID=dbuser;Password=123;Data Source=localhost;Database=zadanie';
MyConnection1.Connect;
MyConnection1.Open;
MyQuery1.Close;
MyQuery1.SQL.Clear;
if OperRole then MyQuery1.SQL.add('SELECT id as ''?'', Stat as ''??????'', Zaglav as ''?????????'', Mast as ''???????????'', Task as ''??????'', Data_sozd as ''???? ????????'', Data_vyp as ''???? ??????.'', Comment as ''???????????'' FROM zadachi WHERE Operator = '+chr(39)+UserName+chr(39));
if MasterRole then MyQuery1.SQL.add('SELECT id as ''?'', Stat as ''??????'', Zaglav as ''?????????'', Operator as ''???????????'', Task as ''??????'', Data_sozd as ''???? ????????'', Data_vyp as ''???? ??????.'', Comment as ''???????????'' FROM zadachi WHERE Mast = '+chr(39)+UserName+chr(39));
MyQuery1.Open;

SetDbgrid();
end;

procedure TformOper.DBGrid1CellClick(Column: TColumn);
begin
formRedTask.edID.Text:=Dbgrid1.DataSource.DataSet.FieldValues['?'];
formRedTask.edZaglav.Text:=Dbgrid1.DataSource.DataSet.FieldValues['?????????'];
if OperRole then formRedTask.edMaster.Text:=Dbgrid1.DataSource.DataSet.FieldValues['???????????'];
if MasterRole then
  begin
  formRedTask.edMaster.Text:=Dbgrid1.DataSource.DataSet.FieldValues['???????????'];
  formRedTask.lbDes.Caption:='???????????';
  end;
formRedTask.memTask.Lines.Text:=Dbgrid1.DataSource.DataSet.FieldValues['??????'];
formRedTask.memComment.Lines.Text:=Dbgrid1.DataSource.DataSet.FieldValues['???????????'];
formRedTask.edStatus.Text:=Dbgrid1.DataSource.DataSet.FieldValues['??????'];
formRedTask.dtVupol.Date:=strtodate(Dbgrid1.DataSource.DataSet.FieldValues['???? ??????.']);
formRedTask.Show;
end;

procedure TformOper.DBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
  Field: TField; State: TGridDrawState);
begin
with DBGrid1.Canvas do
  begin
  if (Field.AsString='????????? ? ??? ?? ??????????') then Brush.Color:=clAqua;
  if (Field.AsString='??????? ? ??????') then Brush.Color:=clGreen;
  if (Field.AsString='?????? ????????? ????????? ????????') then Brush.Color:=clYellow;
  if (Field.AsString='?????????') then Brush.Color:=clSilver;
  if (Field.AsString='?????????? ?? ?????????') then Brush.Color:=clRed;
  end;
  DBGrid1.DefaultDrawDataCell(Rect, Field, State);
end;

procedure TformOper.FormCreate(Sender: TObject);
begin
MyConnection1.Disconnect;
MyConnection1.Close;
MyConnection1.ConnectString:='User ID=dbuser;Password=123;Data Source=localhost;Database=zadanie';
MyConnection1.Connect;
MyConnection1.Open;

MyQuery1.Close;
MyQuery1.SQL.Clear;
MyQuery1.SQL.add('SELECT users.NAME, users.Password, roles.OperMenu, roles.MastMenu, roles.AddTask FROM users INNER JOIN roles ON users.roleID=roles.code WHERE Name = '+chr(39)+UserName+chr(39));
MyQuery1.Open;
OperRole:=MyQuery1.FieldValues['OperMenu'];
MasterRole:=MyQuery1.FieldValues['MastMenu'];
TaskBtnVis:=MyQuery1.FieldValues['AddTask'];
if TaskBtnVis then btnAddTask.Visible:=true;


MyQuery1.Close;
MyQuery1.SQL.Clear;
if OperRole then MyQuery1.SQL.add('SELECT id as ''?'', Stat as ''??????'', Zaglav as ''?????????'', Mast as ''???????????'', Task as ''??????'', Data_sozd as ''???? ????????'', Data_vyp as ''???? ??????.'', Comment as ''???????????'' FROM zadachi WHERE Operator = '+chr(39)+UserName+chr(39));
if MasterRole then MyQuery1.SQL.add('SELECT id as ''?'', Stat as ''??????'', Zaglav as ''?????????'', Operator as ''???????????'', Task as ''??????'', Data_sozd as ''???? ????????'', Data_vyp as ''???? ??????.'', Comment as ''???????????'' FROM zadachi WHERE Mast = '+chr(39)+UserName+chr(39));
MyQuery1.Open;


SetDbgrid();

if MasterRole then
  begin
  btnFilter.Left:=159;
  btnExport.Left:=294;
  end;

end;

procedure TformOper.FormResize(Sender: TObject);
begin
DBGrid1.Width:=formOper.Width-60;
DBGrid1.Height:=formOper.Height-170;

SetDbgrid();
end;

end.
