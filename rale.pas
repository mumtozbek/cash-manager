unit rale;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Unit1, DB;

type
  Traleform = class(TForm)
    Label2: TLabel;
    price: TEdit;
    Label3: TLabel;
    save: TButton;
    cancel: TButton;
    pname: TComboBox;
    pcode: TComboBox;
    Label1: TLabel;
    gname: TComboBox;
    gcode: TComboBox;
    Label4: TLabel;
    tale: TEdit;
    Label5: TLabel;
    cap: TEdit;
    procedure cancelClick(Sender: TObject);
    procedure saveClick(Sender: TObject);
    procedure priceKeyPress(Sender: TObject; var Key: Char);
    procedure nameKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure priceKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure pnameChange(Sender: TObject);
    procedure pnameKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure gnameKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure taleKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure priceChange(Sender: TObject);
    procedure taleChange(Sender: TObject);
    procedure gnameChange(Sender: TObject);
    procedure capChange(Sender: TObject);
    procedure capKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  raleform: Traleform;
  dprice, dcap : string;

procedure refreshgood;

implementation

uses rales;

{$R *.dfm}

procedure refreshgood;
var
i : integer;
begin
with mainform do
begin
raleform.gname.Clear;
raleform.gcode.Clear;
mainform.query.SQL.text := 'SELECT * FROM "bases/'+base+'/resource.db" WHERE pid = "'+raleform.pcode.Text+'" ORDER BY Code ASC';
query.open;
for i := 0 to query.RecordCount-1 do
begin
raleform.gcode.Items.add(query.Fields.Fields[0].asstring);
raleform.gname.Items.add(query.Fields.Fields[2].asstring);
query.FindNext;
end;
query.Close;
end;
raleform.price.Text := '0';
raleform.cap.Text := '0';
end;

procedure Traleform.cancelClick(Sender: TObject);
begin
close;
end;

procedure Traleform.capChange(Sender: TObject);
begin
if cap.Text='' then
begin
cap.Text := '0';
cap.SelectAll;
end;
end;

procedure Traleform.capKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
save.SetFocus;
end;

procedure Traleform.gnameChange(Sender: TObject);
begin
gcode.ItemIndex := gname.ItemIndex;
mainform.query.SQL.text := 'SELECT * FROM "bases/'+base+'/resource.db" WHERE code = "'+gcode.Text+'"';
mainform.query.open;
mainform.query.FindFirst;
price.Text := mainform.query.FieldByName('price').AsString;
cap.Text := mainform.query.FieldByName('cap').AsString;
dprice := price.Text;
dcap := cap.Text;
mainform.query.Close;
end;

procedure Traleform.gnameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
price.SetFocus;
end;

procedure Traleform.nameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
pname.SetFocus;
end;

procedure Traleform.pnameChange(Sender: TObject);
begin
pcode.ItemIndex := pname.ItemIndex;
refreshgood;
end;

procedure Traleform.pnameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
gname.SetFocus;
end;

procedure Traleform.priceChange(Sender: TObject);
begin
if price.Text='' then
begin
price.Text := '0';
price.SelectAll;
end;
end;

procedure Traleform.priceKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
tale.SetFocus;
end;

procedure Traleform.priceKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9', #8]) then key := #0;
end;

procedure Traleform.saveClick(Sender: TObject);
var
i,id :integer;
begin
id := -1;

if (pname.Text='') or (gname.Text='') or (price.text = '0') or (tale.text = '0') or (strtoint(price.text)=0) or (strtoint(tale.text)=0) then
begin
showmessage('ѕожалуйста, заполните все пол€ правильно!');
exit;
end;

if ((dprice<>price.Text) or (dcap<>cap.Text)) and (MessageDlg('÷ены товара изменились, обновить цены товара  - "'+gname.Text+'" в справочнике ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
begin
mainform.update.ModifySQL.Text := 'UPDATE "bases/'+base+'/resource.db" SET cap = "'+cap.Text+'", price = "'+price.Text+'" WHERE code = "'+gcode.Text+'"';
mainform.update.ExecSQL(ukModify);
dprice := price.Text;
dcap := cap.Text;
end;

//status=1
for i := 0 to ralesform.goodslist.Items.Count - 1 do
begin
if (gopenstat=1) and (ralesform.goodslist.ItemIndex<>-1) and (ralesform.goodslist.Items.Item[i].SubItems.Strings[2]=gcode.Text) and (ralesform.goodslist.Items.Item[i].caption<>ralesform.goodslist.selected.caption) then
id := i;
end;

if (gopenstat=1) and (ralesform.goodslist.ItemIndex<>-1) then
begin
if (id<>-1) and (dprice=price.Text) and (dcap=cap.Text) and (MessageDlg('¬ списке уже есть такой товар хотите что бы добавить этого товара существующую строку ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
with ralesform.goodslist.Items.Item[id] do
begin
subitems[4] := formatstr(inttostr(strtoint(tale.Text)+strtoint(getnumber(subitems[4]))));
subitems[7] := formatstr(inttostr(strtoint(inttostr((strtoint(price.Text)+strtoint(cap.Text))*strtoint(tale.text)))+strtoint(getnumber(subitems[7]))));
ralesform.goodslist.DeleteSelected;
end
else
with ralesform.goodslist.Selected do
begin
subitems[0] := pcode.Text;
subitems[1] := pname.Text;
subitems[2] := gcode.Text;
subitems[3] := gname.Text;
subitems[4] := formatstr(tale.Text);
subitems[5] := formatstr(cap.Text);
subitems[6] := formatstr(price.Text);
subitems[7] := formatstr(inttostr((strtoint(price.Text)+strtoint(cap.Text))*strtoint(tale.text)));
subitems[8] := formatstr(dprice);
subitems[9] := formatstr(dcap);
end;
end;
//status=1

//status=0
for i := 0 to ralesform.goodslist.Items.Count - 1 do
begin
if (gopenstat=0) and (ralesform.goodslist.ItemIndex=-1) and (ralesform.goodslist.Items.Item[i].SubItems.Strings[2]=gcode.Text) then
id := i;
end;

if (gopenstat=0) and (ralesform.goodslist.ItemIndex=-1) then
begin
if (id<>-1) and (dprice=price.Text) and (dcap=cap.Text) and (MessageDlg('¬ списке уже есть такой товар хотите что бы добавить этого товара существующую строку ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes)  then
with ralesform.goodslist.Items.Item[id] do
begin
subitems[4] := formatstr(inttostr(strtoint(tale.Text)+strtoint(getnumber(subitems[4]))));
subitems[7] := formatstr(inttostr(strtoint(inttostr((strtoint(price.Text)+strtoint(cap.Text))*strtoint(tale.text)))+strtoint(getnumber(subitems[7]))));
end
else
with ralesform.goodslist.Items.Add do
begin
subitems.Add(pcode.Text);
subitems.Add(pname.Text);
subitems.Add(gcode.Text);
subitems.Add(gname.Text);
subitems.Add(formatstr(tale.Text));
subitems.Add(formatstr(cap.Text));
subitems.Add(formatstr(price.Text));
subitems.Add(formatstr(inttostr((strtoint(price.Text)+strtoint(cap.Text))*strtoint(tale.text))));
subitems.Add(formatstr(dprice));
subitems.Add(formatstr(dcap));
end;
end;
//status=0

calculate;
close;
end;

procedure Traleform.taleChange(Sender: TObject);
begin
if tale.Text='' then
begin
tale.Text := '0';
tale.SelectAll;
end;
end;

procedure Traleform.taleKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
cap.SetFocus;
end;

end.

