unit FilterOper;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, DBAccess,
  MyAccess, MemDS, Vcl.ComCtrls;

type
  TformFilterOper = class(TForm)
    Label3: TLabel;
    dtSozFrom: TDateTimePicker;
    cmbDateNazn: TComboBox;
    dtSozTo: TDateTimePicker;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    cmbDateOkon: TComboBox;
    dtEndFrom: TDateTimePicker;
    dtEndTo: TDateTimePicker;
    Label8: TLabel;
    Label9: TLabel;
    edMaster: TEdit;
    Label1: TLabel;
    btnApply: TButton;
    btnClear: TButton;
    procedure cmbDateNaznChange(Sender: TObject);
    procedure cmbDateOkonChange(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formFilterOper: TformFilterOper;

implementation

{$R *.dfm}

uses Oper, Login;

procedure TformFilterOper.btnClearClick(Sender: TObject);
begin
edMaster.Text:='';
cmbDateNazn.ItemIndex:=0;
cmbDateOkon.ItemIndex:=0;
dtSozFrom.Visible:=False;
dtSozTo.Visible:=False;
dtEndFrom.Visible:=False;
dtEndTo.Visible:=False;
end;

procedure TformFilterOper.btnApplyClick(Sender: TObject);
var S,res, sdtNazn, sdtEnd:String; s1:TStringList; l:pchar; i,n:integer;
begin
if ((edMaster.Text = '')and(cmbDateNazn.Text ='?????')and(cmbDateOkon.Text ='?????')) then
  begin
  formOper.MyQuery1.Close;
  formOper.MyQuery1.SQL.Clear;
  if OperRole then formOper.MyQuery1.SQL.add('SELECT id as ''?'', Stat as ''??????'', Zaglav as ''?????????'', Mast as ''???????????'', Task as ''??????'', Data_sozd as ''???? ????????'', Data_vyp as ''???? ??????.'', Comment as ''???????????'' FROM zadachi WHERE Operator = '+chr(39)+UserName+chr(39));
  if MasterRole then formOper.MyQuery1.SQL.add('SELECT id as ''?'', Stat as ''??????'', Zaglav as ''?????????'', Operator as ''???????????'', Task as ''??????'', Data_sozd as ''???? ????????'', Data_vyp as ''???? ??????.'', Comment as ''???????????'' FROM zadachi WHERE Mast = '+chr(39)+UserName+chr(39));
  formOper.MyQuery1.Open;

formOper.SetDBGrid();
  formFilterOper.Hide;
  end
else
  begin
  if (edMaster.Text <> '') then
    begin
    s1:=TStringList.Create;
    l:=pchar(edMaster.Text);
      try
      n:=ExtractStrings([';', ','], [' '], l, s1);
      res:='(';
      for i := 0 to (n-1) do
        begin
        if i>0 then res:=res+' OR ';
        if OperRole then res:=res+'(Mast = '+chr(39)+s1[i]+chr(39)+')';
        if MasterRole then res:=res+'(Operator = '+chr(39)+s1[i]+chr(39)+')';
        end;
      finally
      s1.Free;
      end;
      res:=res+')';
    end;
  if cmbDateNazn.Text = '???????' then
    begin
    if (edMaster.Text <> '') then sdtNazn:=' AND ';
    sdtNazn:=sdtNazn+' (Data_sozd between '+chr(39)+formatdatetime('yyy-mm-dd',dtSozFrom.Date)+chr(39)+' AND '+chr(39)+formatdatetime('yyy-mm-dd',dtSozTo.Date)+chr(39)+')';
    end;
  if cmbDateOkon.Text = '???????' then
    begin
    if (edMaster.Text <> '')or(cmbDateNazn.Text = '???????') then sdtEnd:=' AND ';
    sdtEnd:=sdtEnd+' (Data_vyp between '+chr(39)+formatdatetime('yyy-mm-dd',dtEndFrom.Date)+chr(39)+' AND '+chr(39)+formatdatetime('yyy-mm-dd',dtEndTo.Date)+chr(39)+')';
    end;
  if OperRole then S:='SELECT id as ''?'', Stat as ''??????'', Zaglav as ''?????????'', Mast as ''???????????'', Task as ''??????'', Data_sozd as ''???? ????????'', Data_vyp as ''???? ??????.'', Comment as ''???????????'' FROM zadachi WHERE (Operator = '+chr(39)+UserName+chr(39)+') AND '+res+sdtNazn+sdtEnd;
  if MasterRole then S:='SELECT id as ''?'', Stat as ''??????'', Zaglav as ''?????????'', Operator as ''???????????'', Task as ''??????'', Data_sozd as ''???? ????????'', Data_vyp as ''???? ??????.'', Comment as ''???????????'' FROM zadachi WHERE (Mast = '+chr(39)+UserName+chr(39)+') AND '+res+sdtNazn+sdtEnd;

  formOper.MyQuery1.Close;
  formOper.MyQuery1.SQL.Clear;
  formOper.MyQuery1.SQL.add(S);
  formOper.MyQuery1.Open;
  formOper.SetDBGrid();
  formFilterOper.Hide;
  end;
end;

procedure TformFilterOper.cmbDateNaznChange(Sender: TObject);
begin
if cmbDateNazn.Text = '???????' then
  begin
  dtSozFrom.Visible:=True;
  dtSozTo.Visible:=True;
  end
else
  begin
  dtSozFrom.Visible:=False;
  dtSozTo.Visible:=False;
  end;
end;

procedure TformFilterOper.cmbDateOkonChange(Sender: TObject);
begin
if cmbDateOkon.Text = '???????' then
  begin
  dtEndFrom.Visible:=True;
  dtEndTo.Visible:=True;
  end
else
  begin
  dtEndFrom.Visible:=False;
  dtEndTo.Visible:=False;
  end;
end;

procedure TformFilterOper.FormShow(Sender: TObject);
begin
if MasterRole then label1.Caption:='???????????';
end;

end.
