unit sale;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Unit1, DB;

type
  Tsaleform = class(TForm)
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
    Label6: TLabel;
    margin: TEdit;
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
    procedure marginKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure marginChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  saleform: Tsaleform;
  dprice, dcap : string;

procedure refreshgood;

implementation

uses sales;

{$R *.dfm}

procedure refreshgood;
var
i : integer;
begin
with mainform do
begin
saleform.gname.Clear;
saleform.gcode.Clear;
mainform.query.SQL.text := 'SELECT * FROM "bases/'+base+'/resource.db" WHERE pid = "'+saleform.pcode.Text+'" ORDER BY Code ASC';
query.open;
for i := 0 to query.RecordCount-1 do
begin
saleform.gcode.Items.add(query.Fields.Fields[0].asstring);
saleform.gname.Items.add(query.Fields.Fields[2].asstring);
query.FindNext;
end;
query.Close;
end;
saleform.price.Text := '0';
saleform.cap.Text := '0';
end;

procedure Tsaleform.cancelClick(Sender: TObject);
begin
close;
end;

procedure Tsaleform.capChange(Sender: TObject);
begin
if cap.Text='' then
begin
cap.Text := '0';
cap.SelectAll;
end;
end;

procedure Tsaleform.capKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
save.SetFocus;
end;

procedure Tsaleform.marginChange(Sender: TObject);
begin
if margin.Text='' then
begin
margin.Text := '0';
margin.SelectAll;
end;
end;

procedure Tsaleform.marginKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
tale.SetFocus;
end;

procedure Tsaleform.gnameChange(Sender: TObject);
begin
gcode.ItemIndex := gname.ItemIndex;
mainform.query.SQL.text := 'SELECT * FROM "bases/'+base+'/resource.db" WHERE code = "'+gcode.Text+'"';
mainform.query.open;
mainform.query.FindFirst;
price.Text := inttostr(mainform.query.FieldByName('price').Asinteger+mainform.query.FieldByName('cap').Asinteger);
margin.Text := mainform.query.FieldByName('margin').AsString;
dprice := inttostr(mainform.query.FieldByName('price').Asinteger);
dcap := mainform.query.FieldByName('cap').AsString;
mainform.query.Close;
end;

procedure Tsaleform.gnameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
price.SetFocus;
end;

procedure Tsaleform.nameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
pname.SetFocus;
end;

procedure Tsaleform.pnameChange(Sender: TObject);
begin
pcode.ItemIndex := pname.ItemIndex;
refreshgood;
end;

procedure Tsaleform.pnameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
gname.SetFocus;
end;

procedure Tsaleform.priceChange(Sender: TObject);
begin
if price.Text='' then
begin
price.Text := '0';
price.SelectAll;
end;
end;

procedure Tsaleform.priceKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
margin.SetFocus;
end;

procedure Tsaleform.priceKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9', #8]) then key := #0;
end;

procedure Tsaleform.saveClick(Sender: TObject);
var
i,id :integer;
begin
id := -1;

if (pname.Text='') or (gname.Text='') or (price.text = '0') or (tale.text = '0') or (strtoint(price.text)=0) or (strtoint(tale.text)=0) then
begin
showmessage('ѕожалуйста, заполните все пол€ правильно!');
exit;
end;

{if ((dprice<>inttostr(strtoint(price.Text)-strtoint(cap.text))) or (dcap<>cap.Text)) and (MessageDlg('÷ены товара изменились, обновить цены товара  - "'+gname.Text+'" в справочнике ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
begin
mainform.update.ModifySQL.Text := 'UPDATE "bases/'+base+'/resource.db" SET cap = "'+cap.Text+'", price = "'+inttostr(strtoint(price.Text)-strtoint(cap.text))+'" WHERE code = "'+gcode.Text+'"';
mainform.update.ExecSQL(ukModify);
dprice := inttostr(strtoint(price.Text)-strtoint(cap.text));
dcap := cap.Text;
end;}

//status=1
for i := 0 to salesform.goodslist.Items.Count - 1 do
begin
if (gopenstat=1) and (salesform.goodslist.ItemIndex<>-1) and (salesform.goodslist.Items.Item[i].SubItems.Strings[2]=gcode.Text) and (salesform.goodslist.Items.Item[i].caption<>salesform.goodslist.selected.caption) then
id := i;
end;

if (gopenstat=1) and (salesform.goodslist.ItemIndex<>-1) then
begin
if (id<>-1) and (dprice=price.Text) and (dcap=cap.Text) and (MessageDlg('¬ списке уже есть такой товар хотите что бы добавить этого товара существующую строку ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
with salesform.goodslist.Items.Item[id] do
begin
subitems[4] := formatstr(inttostr(strtoint(tale.Text)+strtoint(getnumber(subitems[4]))));
subitems[7] := formatstr(inttostr(strtoint(inttostr((strtoint(price.Text)+strtoint(cap.Text))*strtoint(tale.text)))+strtoint(getnumber(subitems[7]))));
salesform.goodslist.DeleteSelected;
end
else
with salesform.goodslist.Selected do
begin
subitems[0] := pcode.Text;
subitems[1] := pname.Text;
subitems[2] := gcode.Text;
subitems[3] := gname.Text;
subitems[4] := formatstr(tale.Text);
subitems[5] := formatstr(cap.Text);
subitems[6] := formatstr(inttostr(strtoint(price.Text)+strtoint(margin.Text)));
subitems[7] := formatstr(inttostr((strtoint(price.Text)+strtoint(margin.Text)-strtoint(cap.Text))*strtoint(tale.text)));
subitems[8] := formatstr(dprice);
subitems[9] := formatstr(dcap);
end;
end;
//status=1

//status=0
for i := 0 to salesform.goodslist.Items.Count - 1 do
begin
if (gopenstat=0) and (salesform.goodslist.ItemIndex=-1) and (salesform.goodslist.Items.Item[i].SubItems.Strings[2]=gcode.Text) then
id := i;
end;

if (gopenstat=0) and (salesform.goodslist.ItemIndex=-1) then
begin
if (id<>-1) and (dprice=price.Text) and (dcap=cap.Text) and (MessageDlg('¬ списке уже есть такой товар хотите что бы добавить этого товара существующую строку ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes)  then
with salesform.goodslist.Items.Item[id] do
begin
subitems[4] := formatstr(inttostr(strtoint(tale.Text)+strtoint(getnumber(subitems[4]))));
subitems[7] := formatstr(inttostr(strtoint(inttostr((strtoint(price.Text)+strtoint(margin.Text)-strtoint(cap.Text))*strtoint(tale.text)))+strtoint(getnumber(subitems[7]))));
end
else
with salesform.goodslist.Items.Add do
begin
subitems.Add(pcode.Text);
subitems.Add(pname.Text);
subitems.Add(gcode.Text);
subitems.Add(gname.Text);
subitems.Add(formatstr(tale.Text));
subitems.Add(formatstr(cap.Text));
subitems.Add(formatstr(inttostr(strtoint(price.Text)+strtoint(margin.Text))));
subitems.Add(formatstr(inttostr((strtoint(price.Text)+strtoint(margin.Text)-strtoint(cap.Text))*strtoint(tale.text))));
subitems.Add(formatstr(dprice));
subitems.Add(formatstr(dcap));
end;
end;
//status=0

calculate;
close;
end;

procedure Tsaleform.taleChange(Sender: TObject);
begin
if tale.Text='' then
begin
tale.Text := '0';
tale.SelectAll;
end;
end;

procedure Tsaleform.taleKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
cap.SetFocus;
end;

end.

