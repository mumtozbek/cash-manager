unit clients;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Unit1, DB;

type
  Tclientsform = class(TForm)
    name: TEdit;
    Label1: TLabel;
    perc: TEdit;
    Label2: TLabel;
    account: TEdit;
    Label3: TLabel;
    save: TButton;
    cancel: TButton;
    procedure FormShow(Sender: TObject);
    procedure cancelClick(Sender: TObject);
    procedure saveClick(Sender: TObject);
    procedure nameKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure percKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure accountKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure percChange(Sender: TObject);
    procedure accountChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  clientsform: Tclientsform;

implementation

{$R *.dfm}

procedure Tclientsform.cancelClick(Sender: TObject);
begin
close;
end;

procedure Tclientsform.FormShow(Sender: TObject);
begin
if (openstat=1) and (mainform.clientlist.ItemIndex<>-1)  then
begin
name.Text := mainform.clientlist.Selected.SubItems.Strings[0];
perc.Text := getnumber(mainform.clientlist.Selected.SubItems.Strings[1]);
account.Text := getnumber(mainform.clientlist.Selected.SubItems.Strings[2]);
end
else
begin
openstat := 0; 
name.Text := '';
perc.Text := '100';
account.Text := '0';
end;
name.SetFocus;
end;

procedure Tclientsform.nameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
perc.SetFocus;
end;

procedure Tclientsform.percChange(Sender: TObject);
begin
if perc.Text='' then
begin
perc.Text := '0';
perc.SelectAll;
end;

if strtofloat(perc.Text)> 100 then
begin
perc.Text := copy(perc.Text,0,2);
perc.SelectAll;
end;
end;

procedure Tclientsform.percKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
account.SetFocus;
end;

procedure Tclientsform.accountChange(Sender: TObject);
begin
if account.Text='' then
begin
account.Text := '0';
account.SelectAll;
end;
end;

procedure Tclientsform.accountKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
save.SetFocus;
end;

procedure Tclientsform.saveClick(Sender: TObject);
begin
if (name.Text='') or (perc.Text='') or (strtoint(perc.text)=0) then
begin
showmessage('Пожалуйста, заполните все поля правильно!');
exit;
end;
if (openstat=0) then
begin
mainform.update.InsertSQL.Text := 'INSERT INTO "bases/'+base+'/operations.db" (cname, cap, price, type, pid) VALUES ("'+name.Text+'", "'+perc.Text+'", "'+account.Text+'", "5", "0")';
mainform.update.ExecSQL(ukInsert);
end;
if (openstat=1) then
begin
mainform.update.ModifySQL.Text := 'UPDATE "bases/'+base+'/operations.db" SET cname = "'+name.Text+'", cap = "'+perc.Text+'", price = "'+account.Text+'", type = "5", pid = "0" WHERE code = "'+mainform.clientlist.Selected.Caption+'"';
mainform.update.ExecSQL(ukModify);
end;
refreshclients;
close;
end;

end.
