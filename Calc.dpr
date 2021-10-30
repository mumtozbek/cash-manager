program Calc;

uses
  Forms,
  Windows,
  Dialogs,
  Unit1 in 'Unit1.pas' {mainform},
  clients in 'clients.pas' {clientsform},
  cashins in 'cashins.pas' {cashinsform},
  cashouts in 'cashouts.pas' {cashoutsform},
  udialog in 'udialog.pas' {firmsform},
  PassWord in 'PassWord.pas' {loginform},
  bases in 'bases.pas' {baseform},
  baseunit in 'baseunit.pas' {basesform};

{$R *.res}

begin
  if findwindow(nil,'Расчет 1.0 [iMumtoz]')>0 then
  begin
  //showmessage('Программа Расчет 1.0 [iMumtoz] уже открыто!');
  //Application.Terminate;
  end;
  Application.Title := 'Расчет 1.0 [iMumtoz]';
  Application.Initialize;
  Application.CreateForm(Tloginform, loginform);
  Application.CreateForm(Tclientsform, clientsform);
  Application.CreateForm(Tcashinsform, cashinsform);
  Application.CreateForm(Tcashoutsform, cashoutsform);
  Application.CreateForm(Tfirmsform, firmsform);
  Application.CreateForm(Tbaseform, baseform);
  Application.CreateForm(Tbasesform, basesform);
  Application.Run;
end.
