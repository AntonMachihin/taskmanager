program dbsample;

uses
  Vcl.Forms,
  Oper in 'Oper.pas' {formOper},
  NewTask in 'NewTask.pas' {formNewTask},
  RedTask in 'RedTask.pas' {formRedTask},
  FilterOper in 'FilterOper.pas' {formFilterOper},
  Login in 'Login.pas' {FormLogin};

{$R *.res}

begin
if TFormLogin.Execute then
  begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TformOper, formOper);
  Application.CreateForm(TformNewTask, formNewTask);
  Application.CreateForm(TformRedTask, formRedTask);
  Application.CreateForm(TformFilterOper, formFilterOper);
  Application.Run;
  end
  else
  begin
  Application.MessageBox('У Вас нет прав на использование этой ' +
                'программы.', 'Защита паролем');
  end;
end.
