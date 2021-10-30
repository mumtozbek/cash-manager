unit PASSWORD;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, dialogs;

type
  Tloginform = class(TForm)
    Label1: TLabel;
    bbase: TComboBox;
    code: TComboBox;
    pass: TEdit;
    OKBtn: TButton;
    CancelBtn: TButton;
    Label3: TLabel;
    createbtn: TButton;
    procedure CancelBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
    procedure bbaseChange(Sender: TObject);
    procedure createbtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  loginform: Tloginform;

const
  dissize = 196370333696;

implementation

uses unit1, baseunit;

{$R *.dfm}

procedure Tloginform.bbaseChange(Sender: TObject);
begin
code.ItemIndex := bbase.ItemIndex;
end;

procedure Tloginform.CancelBtnClick(Sender: TObject);
begin
close;
end;

procedure Tloginform.createbtnClick(Sender: TObject);
begin
basesform.ShowModal;
end;

procedure Tloginform.FormShow(Sender: TObject);
var
i : integer;
disks : Array[3..10] of string;
begin
disks[3] := 'C:';
disks[4] := 'D:';
disks[5] := 'E:';
disks[6] := 'F:';
disks[7] := 'G:';
disks[8] := 'H:';
disks[9] := 'I:';
disks[10] := 'J:';

for i := 3 to 10 do
begin
if (disks[i]=ExtractFileDrive(application.ExeName)) then
//showmessage(inttostr(disksize(i)));
end;

for i := 3 to 10 do
begin
if (disks[i]=ExtractFileDrive(application.ExeName)) then
begin
if disksize(i)<>dissize then
begin
//showmessage('Программа стоит в неправильном диске!');
//application.Terminate;
end;
end;
end;

Application.CreateForm(Tmainform, mainform);

with mainform do
begin
bbase.Clear;
query.SQL.text := 'SELECT * FROM "data/bases.db" ORDER BY Code ASC';
query.open;
for i := 0 to query.RecordCount-1 do
begin
bbase.Items.Add(query.Fields.Fields[1].asstring);
code.Items.Add(query.Fields.Fields[0].asstring);
query.FindNext;
end;
query.Close;
bbase.itemindex := 0;
code.itemindex := 0;
end;

if bbase.ItemIndex>-1 then
okbtn.Enabled:=true
else
okbtn.Enabled:=false;
end;

procedure Tloginform.OKBtnClick(Sender: TObject);
begin
with mainform do
begin
query.SQL.text := 'SELECT * FROM "data/bases.db" WHERE code = "'+code.Text+'" ORDER BY Code ASC';
query.open;
query.FindFirst;
if (pass.Text = query.Fields.FieldByName('pass').AsString) then
begin
loginform.Visible := false;
base := code.text;
mainform.Show;
end
else
begin
showmessage('Вы ввели неправильный логин или пароль!');
pass.Text := '';
end;
query.Close;
end;

end;

end.
 
