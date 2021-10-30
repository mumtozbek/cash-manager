unit bases;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,db;

type
  Tbaseform = class(TForm)
    Label3: TLabel;
    Label4: TLabel;
    bname: TEdit;
    save: TButton;
    cancel: TButton;
    pass1: TEdit;
    Label1: TLabel;
    pass2: TEdit;
    Label2: TLabel;
    pass: TEdit;
    procedure cancelClick(Sender: TObject);
    procedure bnameKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure pass1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure pass2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure saveClick(Sender: TObject);
    procedure pass1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  baseform: Tbaseform;
  ps:string;

implementation

uses Unit1, baseunit;

{$R *.dfm}

procedure Tbaseform.bnameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
begin
pass1.SetFocus;
end;
end;

procedure Tbaseform.cancelClick(Sender: TObject);
begin
close;
end;

procedure Tbaseform.FormShow(Sender: TObject);
begin
if (openstat=1) and (basesform.baselist.ItemIndex<>-1)  then
begin
bname.Text := basesform.baselist.Selected.SubItems.Strings[0];
pass.Enabled:=true;
mainform.query.SQL.text := 'SELECT * FROM "data/bases.db" WHERE code = "'+basesform.baselist.Selected.Caption+'" ORDER BY Code ASC';
mainform.query.open;
mainform.query.FindFirst;
ps := mainform.query.fields.FieldByName('pass').AsString;
end
else
begin
pass.Enabled:=false;
openstat := 0;
bname.Text := '';
end;
pass.Text := '';
pass1.Text := '';
pass2.Text := '';
bname.SetFocus;
end;

procedure Tbaseform.pass1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
begin
pass2.SetFocus;
end;
end;

procedure Tbaseform.pass1KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9', #8]) then key := #0;
end;

procedure Tbaseform.pass2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
begin
save.SetFocus;
end;
end;

procedure Tbaseform.saveClick(Sender: TObject);
begin
if ((bname.Text='') or (pass1.Text='') or (pass2.Text='')) then
begin
showmessage('Пожалуйста, заполните все поля правильно!');
exit;
end;
if (strlen(pchar(pass1.Text))<6) then
begin
showmessage('Длина пароля должен содержать минимкм 6 цифры!');
exit;
end;
if (pass1.Text<>pass2.Text) then
begin
showmessage('Паролы не совпадают!');
exit;
end;
if (openstat=0) then
begin
mainform.update.InsertSQL.Text := 'INSERT INTO "data/bases.db" (name,pass) VALUES ("'+bname.Text+'","'+pass1.Text+'")';
mainform.update.ExecSQL(ukInsert);
createdir('bases/'+getlastid('bases')+'');
copyfile('data/operations.db',pchar('bases/'+getlastid('bases')+'/operations.db'),false);
copyfile('data/operations.PX',pchar('bases/'+getlastid('bases')+'/operations.PX'),false);
copyfile('data/resource.db',pchar('bases/'+getlastid('bases')+'/resource.db'),false);
copyfile('data/resource.PX',pchar('bases/'+getlastid('bases')+'/resource.PX'),false);
end;
if (openstat=1) then
begin
if ((pass.Text<>ps) or (pass.Text='')) then
begin
showmessage('Старый пароль не верен!');
exit;
end;
mainform.update.ModifySQL.Text := 'UPDATE "data/bases.db" SET name = "'+bname.Text+'", pass = "'+pass1.Text+'" WHERE code = "'+basesform.baselist.Selected.Caption+'"';
mainform.update.ExecSQL(ukModify);
end;
refreshbases;
close;
end;

end.
