unit cashouts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Unit1, DB, ComCtrls;

type
  Tcashoutsform = class(TForm)
    summ: TEdit;
    Label3: TLabel;
    note: TEdit;
    Label4: TLabel;
    save: TButton;
    cancel: TButton;
    date: TDateTimePicker;
    Label5: TLabel;
    cname: TComboBox;
    Label6: TLabel;
    ccode: TComboBox;
    Label1: TLabel;
    curs: TEdit;
    procedure FormShow(Sender: TObject);
    procedure cancelClick(Sender: TObject);
    procedure saveClick(Sender: TObject);
    procedure summKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure noteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dateKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cnameKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cnameChange(Sender: TObject);
    procedure rnameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure summChange(Sender: TObject);
    procedure summKeyPress(Sender: TObject; var Key: Char);
    procedure cursKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cursChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  cashoutsform: Tcashoutsform;

implementation

{$R *.dfm}

procedure Tcashoutsform.cancelClick(Sender: TObject);
begin
close;
end;

procedure Tcashoutsform.cnameChange(Sender: TObject);
begin
ccode.ItemIndex := cname.ItemIndex;
end;

procedure Tcashoutsform.cnameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
summ.SetFocus;
end;

procedure Tcashoutsform.cursChange(Sender: TObject);
begin
if curs.Text='' then
begin
curs.Text := '0';
curs.SelectAll;
end;
end;

procedure Tcashoutsform.cursKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
save.SetFocus;
end;

procedure Tcashoutsform.dateKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
cname.SetFocus;
end;

procedure Tcashoutsform.rnameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
save.SetFocus;
end;

procedure Tcashoutsform.FormShow(Sender: TObject);
var
i : integer;
begin
with mainform do
begin
cname.Clear;
ccode.Clear;
for i := 0 to clientlist.Items.Count - 1 do
begin
cname.Items.Add(clientlist.Items.item[i].SubItems[0]);
ccode.Items.Add(clientlist.Items.item[i].caption);
end;
end;
if (openstat=1) and (mainform.cashoutlist.ItemIndex<>-1)  then
begin
date.Date := strtodate(mainform.cashoutlist.Selected.SubItems.Strings[0]);
cname.ItemIndex := ccode.Items.IndexOf(mainform.cashoutlist.Selected.SubItems.Strings[1]);
ccode.ItemIndex := ccode.Items.IndexOf(mainform.cashoutlist.Selected.SubItems.Strings[1]);
summ.Text := getnumber(mainform.cashoutlist.Selected.SubItems.Strings[3]);
note.Text := mainform.cashoutlist.Selected.SubItems.Strings[4];
curs.Text := getnumber(mainform.cashoutlist.Selected.SubItems.Strings[5]);
end
else
begin
openstat := 0;
date.Date := now; 
cname.Text := '';
ccode.Text := '';
summ.Text := '0';
curs.Text := '0';
note.Text := '';
end;
date.SetFocus;
end;

procedure Tcashoutsform.summChange(Sender: TObject);
begin
if summ.Text='' then
begin
summ.Text := '0';
summ.SelectAll;
end;
end;

procedure Tcashoutsform.summKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
note.SetFocus;
end;

procedure Tcashoutsform.summKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9', #8]) then key := #0;
end;

procedure Tcashoutsform.noteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
curs.SetFocus;
end;

procedure Tcashoutsform.saveClick(Sender: TObject);
begin
if (cname.Text='') or (strtofloat(summ.Text)<10000) then
begin
showmessage('Пожалуйста, заполните все поля правильно!');
exit;
end;
if (openstat=0) then
begin
mainform.update.InsertSQL.Text := 'INSERT INTO "bases/'+base+'/operations.db" (data, ccode, cname, price, note, type, dprice, pid) VALUES ("'+datetostr(date.date)+'", "'+ccode.Text+'", "'+cname.Text+'", "'+summ.Text+'", "'+note.Text+'", "4", "'+curs.Text+'", "0")';
mainform.update.ExecSQL(ukInsert);
end;
if (openstat=1) then
begin
mainform.update.ModifySQL.Text := 'UPDATE "bases/'+base+'/operations.db" SET data = "'+datetostr(date.date)+'", ccode = "'+ccode.Text+'", cname = "'+cname.Text+'", price = "'+summ.Text+'", note = "'+note.Text+'", type ="4", dprice = "'+curs.Text+'", pid = "0" WHERE code = "'+mainform.cashoutlist.Selected.Caption+'"';
mainform.update.ExecSQL(ukModify);
end;
refreshcashouts;
close;
end;

end.
