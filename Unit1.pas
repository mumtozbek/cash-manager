unit Unit1;

interface

uses
  Windows, Messages, Variants, Classes, Controls, Forms, Dialogs, ComCtrls,
  XPMan, DB, DBTables, StdCtrls, SysUtils, ExtCtrls, dateutils, printers, graphics;

type
  Tmainform = class(TForm)
    main: TPageControl;
    infobases: TTabSheet;
    documents: TTabSheet;
    infopages: TPageControl;
    clientspages: TTabSheet;
    clientlist: TListView;
    manifest: TXPManifest;
    query: TQuery;
    update: TUpdateSQL;
    docpages: TPageControl;
    cashpages: TTabSheet;
    Panel2: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    cdate1: TDateTimePicker;
    cdate2: TDateTimePicker;
    showinc: TButton;
    cashinlist: TListView;
    cashopages: TTabSheet;
    cashoutlist: TListView;
    Panel3: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    odate1: TDateTimePicker;
    odate2: TDateTimePicker;
    showout: TButton;
    results: TTabSheet;
    respages: TPageControl;
    res1: TTabSheet;
    res1list: TListView;
    Panel6: TPanel;
    Label10: TLabel;
    rcname: TComboBox;
    rccode: TComboBox;
    rdate: TDateTimePicker;
    showres1: TButton;
    TabSheet1: TTabSheet;
    Panel10: TPanel;
    rcdate2: TDateTimePicker;
    Button3: TButton;
    res3list: TListView;
    Label15: TLabel;
    TabSheet2: TTabSheet;
    Panel9: TPanel;
    Label14: TLabel;
    res4cname: TComboBox;
    res4ccode: TComboBox;
    res4date2: TDateTimePicker;
    showres4: TButton;
    res4list: TListView;
    res4date1: TDateTimePicker;
    Label16: TLabel;
    Label17: TLabel;
    procedure rcnameChange(Sender: TObject);
    procedure goodlistDblClick(Sender: TObject);
    procedure clientlistKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure clientlistDblClick(Sender: TObject);
    procedure firmlistDblClick(Sender: TObject);
    procedure plantlistDblClick(Sender: TObject);
    procedure showbankClick(Sender: TObject);
    procedure banklistDblClick(Sender: TObject);
    procedure cashinlistKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cashinlistDblClick(Sender: TObject);
    procedure cashoutlistKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cashoutlistDblClick(Sender: TObject);
    procedure cdate1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cdate2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure odate1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure odate2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ralelistDblClick(Sender: TObject);
    procedure salelistDblClick(Sender: TObject);
    procedure showres1Click(Sender: TObject);
    procedure showoutClick(Sender: TObject);
    procedure showincClick(Sender: TObject);
    procedure showgoodsinClick(Sender: TObject);
    procedure showgoodsoutClick(Sender: TObject);
    procedure rdateKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button3Click(Sender: TObject);
    procedure res4cnameChange(Sender: TObject);
    procedure showres4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  mainform: Tmainform;
  openstat: integer = 0;
  title : string = 'Расчет 1.0 [iMumtoz]';
  base : string;

const
  separator1 = '.';
  separator2 = ',';

function GetLastID(table:string): string;
function formatstr(str:string): string;
function getnumber(str:string): string;
procedure refreshbases;
procedure refreshplants;
procedure refreshgoods;
procedure refreshclients;
procedure refreshfirms;
procedure refreshbanks;
procedure refreshcashins;
procedure refreshcashouts;
procedure refreshgoodsin;
procedure refreshgoodsout;

implementation

uses goods, clients, banks, udialog, cashins, cashouts, sales, rales, uplants,
  PassWord, bases, baseunit;

{$R *.dfm}

function GetLastID(table:string): string;
begin
with mainform do
begin
try
    if table <> 'bases' then
    Query.SQL.text := 'SELECT * FROM "bases/'+base+'/'+table+'" ORDER BY Code DESC';
    if table = 'bases' then
    Query.SQL.text := 'SELECT * FROM "data/'+table+'" ORDER BY Code DESC';
    Query.Active := True;
    Query.First;
    result := Query.Fields.Fields[0].Asstring;
finally
    Query.Active := False;
    Query.SQL.clear;
end;
end;
end;

function formatstr(str:string): string;
var
s,v,f:string;
c:integer;
b,h:extended;
begin
if (str='') or (str='0') then
begin
result := '0'+separator1+'00';
end;
if strtoint(str)>0 then
begin
f := '';
end;
if strtoint(str)<0 then
begin
f := '-';
str := copy(str,2,strlen(pchar(str)));
end;
if str<>'0' then
begin
b := int(strlen(pchar(str))/3);
h := strlen(pchar(str))-b*3;
c:=strtoint(floattostr(h))+1;
s := copy(str,0,strtoint(floattostr((strlen(pchar(str)))-((int(((strlen(pchar(str)))/3)))*3))));
while (c<(strlen(pchar(str)))) do
begin
v:=''; if s<>'' then v:=separator2;
s := s+v+copy(str,c,3);
c := c+3;
end;
s := f+s+separator1+'00';
result := s;
end;

end;

function getnumber(str:string): string;
begin
str := copy(str,0,pos(separator1,str)-1);
result := stringreplace(str,separator2,'',[rfReplaceAll, rfIgnoreCase]);
end;

procedure refreshbases;
var i:integer;
begin

with mainform do
begin
basesform.baselist.Clear;
query.SQL.text := 'SELECT * FROM "data/bases.db" ORDER BY Code ASC';
query.open;
for i := 0 to query.RecordCount-1 do
begin
with basesform.baselist.Items.Add do
begin
caption := query.Fields.Fields[0].asstring;
subitems.Add(query.Fields.Fields[1].asstring);
end;
query.FindNext;
end;
query.Close;
end;

end;

procedure refreshplants;

begin


end;

procedure refreshgoods;

begin

end;

procedure refreshclients;
var
i : integer;
begin
with mainform do
begin
clientlist.Clear;
rcname.Clear;
rccode.Clear;
res4cname.Clear;
res4ccode.Clear;
query.SQL.text := 'SELECT * FROM "bases/'+base+'/operations.db" WHERE type = "5" ORDER BY Code ASC';
query.open;
for i := 0 to query.RecordCount-1 do
begin
rcname.Items.Add(query.Fields.Fields[4].asstring);
rccode.Items.Add(query.Fields.Fields[0].asstring);
res4cname.Items.Add(query.Fields.Fields[4].asstring);
res4ccode.Items.Add(query.Fields.Fields[0].asstring);
with clientlist.Items.add do
begin
Caption := query.Fields.Fields[0].asstring;
subitems.add(query.Fields.Fields[4].asstring);
subitems.add(formatstr(query.Fields.Fields[10].asstring));
subitems.add(formatstr(query.Fields.Fields[11].asstring));
end;
query.FindNext;
end;
query.Close;
end;
end;

procedure refreshfirms;

begin

end;

procedure refreshbanks;
begin

end;

procedure refreshcashins;
var
i: integer;
begin
with mainform do
begin
cashinlist.Clear;
query.SQL.text := 'SELECT * FROM "bases/'+base+'/operations.db" WHERE type = "3" AND data >= "'+datetostr(cdate1.date)+'" AND data <= "'+datetostr(cdate2.date)+'" ORDER BY data ASC';
query.open;
for i := 0 to query.RecordCount-1 do
begin
with cashinlist.Items.add do
begin
Caption := query.Fields.Fields[0].asstring;
subitems.add(query.Fields.Fields[2].asstring);
subitems.add(query.Fields.Fields[3].asstring);
subitems.add(query.Fields.Fields[4].asstring);
subitems.add(formatstr(query.Fields.Fields[11].asstring));
subitems.add(query.Fields.Fields[12].asstring);
subitems.add(formatstr(query.Fields.Fields[14].asstring));
end;
query.FindNext;
end;
query.Close;
end;
end;

procedure refreshcashouts;
var
i: integer;
begin
with mainform do
begin
cashoutlist.Clear;
query.SQL.text := 'SELECT * FROM "bases/'+base+'/operations.db" WHERE type = "4" AND data >= "'+datetostr(odate1.date)+'" AND data <= "'+datetostr(odate2.date)+'" ORDER BY data ASC';
query.open;
for i := 0 to query.RecordCount-1 do
begin
with cashoutlist.Items.add do
begin
Caption := query.Fields.Fields[0].asstring;
subitems.add(query.Fields.Fields[2].asstring);
subitems.add(query.Fields.Fields[3].asstring);
subitems.add(query.Fields.Fields[4].asstring);
subitems.add(formatstr(query.Fields.Fields[11].asstring));
subitems.add(query.Fields.Fields[12].asstring);
subitems.add(formatstr(query.Fields.Fields[14].asstring));
end;
query.FindNext;
end;
query.Close;
end;
end;

procedure refreshgoodsin;

begin

end;

procedure refreshgoodsout;

begin

end;

procedure Tmainform.banklistDblClick(Sender: TObject);
begin
openstat := 1;
banksform.ShowModal;
end;

procedure Tmainform.Button3Click(Sender: TObject);
var
i, b:integer;
summa : extended;
clnt :string;
begin
res3list.Clear;
for b := 0 to clientlist.Items.Count - 1 do
begin
clnt := clientlist.Items.Item[b].Caption;

summa := 0;
query.SQL.text := 'SELECT * FROM "bases/'+base+'/operations.db" WHERE type = "0" AND data <= "'+datetostr(rcdate2.date)+'" AND ccode = "'+clnt+'" ORDER BY data ASC';
query.open;
for i := 0 to query.RecordCount-1 do
begin
summa := summa+(query.FieldByName('price').AsInteger*(query.FieldByName('cap').AsInteger/100));
query.FindNext;
end;

query.SQL.text := 'SELECT * FROM "bases/'+base+'/operations.db" WHERE type = "0" AND data <= "'+datetostr(rcdate2.date)+'" AND gcode = "'+clnt+'" ORDER BY data ASC';
query.open;
for i := 0 to query.RecordCount-1 do
begin
summa := summa-query.FieldByName('price').AsInteger;
query.FindNext;
end;

query.SQL.text := 'SELECT * FROM "bases/'+base+'/operations.db" WHERE type = "3" AND data <= "'+datetostr(rcdate2.date)+'" AND ccode = "'+clnt+'" ORDER BY data ASC';
query.open;
for i := 0 to query.RecordCount-1 do
begin
summa := summa+query.FieldByName('price').AsInteger;
query.FindNext;
end;

query.SQL.text := 'SELECT * FROM "bases/'+base+'/operations.db" WHERE type = "4" AND data <= "'+datetostr(rcdate2.date)+'" AND ccode = "'+clnt+'" ORDER BY data ASC';
query.open;
for i := 0 to query.RecordCount-1 do
begin
summa := summa-query.FieldByName('price').AsInteger;
query.FindNext;
end;

query.SQL.text := 'SELECT * FROM "bases/'+base+'/operations.db" WHERE pid = "0" AND type = "1" AND data <= "'+datetostr(rcdate2.date)+'" AND ccode = "'+clnt+'" ORDER BY data ASC';
query.open;
for i := 0 to query.RecordCount-1 do
begin
summa := summa+query.FieldByName('price').AsInteger;
query.FindNext;
end;

query.SQL.text := 'SELECT * FROM "bases/'+base+'/operations.db" WHERE pid = "0" AND type = "2" AND data <= "'+datetostr(rcdate2.date)+'" AND ccode = "'+clnt+'" ORDER BY data ASC';
query.open;
for i := 0 to query.RecordCount-1 do
begin
summa := summa-query.FieldByName('price').AsInteger;
query.FindNext;
end;

summa:=summa+strtofloat(getnumber(clientlist.Items.Item[b].SubItems.Strings[2]));

with res3list.Items.Add do
begin
Caption:=clientlist.Items.Item[b].SubItems.Strings[0];
if summa>0 then
begin
Subitems.Add(formatstr(floattostr(summa)));
Subitems.Add('0.0');
end;
if summa<0 then
begin
Subitems.Add('0.0');
Subitems.Add(formatstr(floattostr(summa)));
end;
if summa=0 then
begin
Subitems.Add('0.0');
Subitems.Add('0.0');
end;
end;

end;
end;

procedure Tmainform.cashinlistDblClick(Sender: TObject);
begin
openstat := 1;
cashinsform.ShowModal;
end;

procedure Tmainform.cashinlistKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
begin
openstat := 1;
cashinsform.ShowModal;
end;

if key=vk_insert then
begin
openstat := 0;
cashinsform.ShowModal;
end;

if (key=vk_delete) and (cashinlist.ItemIndex<>-1) and (MessageDlg('Удалить выделенные записи ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
begin
update.DeleteSQL.Text := 'DELETE FROM "bases/'+base+'/operations.db" WHERE code = "'+cashinlist.Selected.Caption+'"';
update.ExecSQL(ukDelete);
refreshcashins;
end;
end;

procedure Tmainform.cashoutlistDblClick(Sender: TObject);
begin
openstat := 1;
cashoutsform.ShowModal;
end;

procedure Tmainform.cashoutlistKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
begin
openstat := 1;
cashoutsform.ShowModal;
end;

if key=vk_insert then
begin
openstat := 0;
cashoutsform.ShowModal;
end;

if (key=vk_delete) and (cashoutlist.ItemIndex<>-1) and (MessageDlg('Удалить выделенные записи ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
begin
update.DeleteSQL.Text := 'DELETE FROM "bases/'+base+'/operations.db" WHERE code = "'+cashoutlist.Selected.Caption+'"';
update.ExecSQL(ukDelete);
refreshcashouts;
end;
end;

procedure Tmainform.cdate1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
cdate2.SetFocus;
end;

procedure Tmainform.cdate2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
showinc.SetFocus;
end;

procedure Tmainform.clientlistDblClick(Sender: TObject);
begin
openstat := 1;
clientsform.ShowModal;
end;

procedure Tmainform.clientlistKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
begin
openstat := 1;
clientsform.ShowModal;
end;

if key=vk_insert then
begin
openstat := 0;
clientsform.ShowModal;
end;

if (key=vk_delete) and (clientlist.ItemIndex<>-1) and (MessageDlg('Удалить выделенные записи ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
begin
update.DeleteSQL.Text := 'DELETE FROM "bases/'+base+'/operations.db" WHERE code = "'+clientlist.Selected.Caption+'"';
update.ExecSQL(ukDelete);
refreshclients;
end;
end;

procedure Tmainform.firmlistDblClick(Sender: TObject);
begin
openstat := 1;
firmsform.ShowModal;
end;

procedure Tmainform.FormClose(Sender: TObject; var Action: TCloseAction);
begin
loginform.Close;
end;

procedure Tmainform.FormShow(Sender: TObject);
begin
caption := caption+' - '+loginform.bbase.Text;
refreshbases;
refreshclients;
refreshcashins;
refreshcashouts;
rdate.DateTime := now();
rcdate2.DateTime := now();
cdate1.DateTime := StartOfTheMonth(now());
cdate2.DateTime := EndOfTheMonth(now());
odate1.DateTime := StartOfTheMonth(now());
odate2.DateTime := EndOfTheMonth(now());
res4date1.DateTime := StartOfTheMonth(now());
res4date2.DateTime := EndOfTheMonth(now());
end;

procedure Tmainform.goodlistDblClick(Sender: TObject);
begin
openstat := 1;
goodsform.ShowModal;
end;

procedure Tmainform.odate1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
odate2.SetFocus;
end;

procedure Tmainform.odate2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
showout.SetFocus;
end;

procedure Tmainform.plantlistDblClick(Sender: TObject);
begin
openstat := 1;
fplants.ShowModal;
end;

procedure Tmainform.ralelistDblClick(Sender: TObject);
begin
openstat := 1;
ralesform.ShowModal;
end;

procedure Tmainform.rcnameChange(Sender: TObject);
begin
rccode.ItemIndex := rcname.ItemIndex;
end;

procedure Tmainform.rdateKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
showres1.SetFocus;
end;

procedure Tmainform.res4cnameChange(Sender: TObject);
begin
res4ccode.ItemIndex := res4cname.ItemIndex;
end;

procedure Tmainform.salelistDblClick(Sender: TObject);
begin
openstat := 1;
salesform.ShowModal;
end;

procedure Tmainform.showbankClick(Sender: TObject);
begin
refreshbanks;
end;

procedure Tmainform.showgoodsinClick(Sender: TObject);
begin
refreshgoodsin;
end;

procedure Tmainform.showgoodsoutClick(Sender: TObject);
begin
refreshgoodsout;
end;

procedure Tmainform.showincClick(Sender: TObject);
begin
refreshcashins;
end;

procedure Tmainform.showoutClick(Sender: TObject);
begin
refreshcashouts;
end;

procedure Tmainform.showres1Click(Sender: TObject);
var
i:integer;
summa, debt, rest, vest : extended;
begin
if rcname.ItemIndex<>-1 then
begin
with mainform do
begin
res1list.Clear;

summa := 0;
query.SQL.text := 'SELECT * FROM "bases/'+base+'/operations.db" WHERE type = "3" AND data <= "'+datetostr(rdate.date)+'" AND ccode = "'+rccode.Text+'" ORDER BY data ASC';
query.open;
for i := 0 to query.RecordCount-1 do
begin
summa := summa+query.FieldByName('price').AsInteger;
query.FindNext;
end;
with res1list.Items.Add do
begin
Caption:='Наличные приходы:';
Subitems.Add(formatstr(floattostr(summa)));
end;

summa := 0;
query.SQL.text := 'SELECT * FROM "bases/'+base+'/operations.db" WHERE type = "4" AND data <= "'+datetostr(rdate.date)+'" AND ccode = "'+rccode.Text+'" ORDER BY data ASC';
query.open;
for i := 0 to query.RecordCount-1 do
begin
summa := summa+query.FieldByName('price').AsInteger;
query.FindNext;
end;
with res1list.Items.Add do
begin
Caption:='Наличные расходы:';
Subitems.Add(formatstr(floattostr(summa)));
end;

with res1list.Items.Add do
begin
Caption:='Начальная сальдо:';
Subitems.Add(clientlist.Items.Item[rccode.ItemIndex].SubItems.Strings[2]);
end;

with res1list.Items.Add do
begin
debt := strtoint(getnumber(res1list.Items.Item[0].SubItems[0]));
rest := strtoint(getnumber(res1list.Items.Item[1].SubItems[0]));
vest := (debt-rest)+strtoint(getnumber(res1list.Items.Item[2].SubItems[0]));
Caption:='Сальдо:';
Subitems.Add(formatstr(floattostr(vest)));
end;

end;
end;
end;

procedure Tmainform.showres4Click(Sender: TObject);
var i, ssum, pcsum, psum, shsum : integer;
begin
if res4ccode.Text='' then
exit;

res4list.clear;

query.SQL.text := 'SELECT * FROM "bases/'+base+'/operations.db" WHERE pid = "0" AND data >= "'+datetostr(res4date1.date)+'" AND data <= "'+datetostr(res4date2.date)+'" AND ccode = "'+res4ccode.Text+'" ORDER BY data ASC';
query.open;
for i := 0 to query.RecordCount-1 do
begin
with res4list.Items.Add do
begin
caption:=query.FieldByName('data').AsString;

if (query.FieldByName('type').AsString='0') then
begin
subitems.Add('Перечислил денег в банк');
subitems.Add(formatstr(query.FieldByName('price').AsString));
subitems.Add(formatstr(floattostr((query.FieldByName('price').AsInteger*(query.FieldByName('cap').AsInteger))/100)));
subitems.Add(formatstr(floattostr((query.FieldByName('price').AsInteger*(100-query.FieldByName('cap').AsInteger))/100)));
subitems.Add('0.00');
end;

if (query.FieldByName('type').AsString='1') then
begin
subitems.Add('Приход товара');
subitems.Add(formatstr(inttostr(query.FieldByName('price').AsInteger-query.FieldByName('cap').AsInteger)));
subitems.Add(formatstr(query.FieldByName('price').AsString));
subitems.Add('0.00');
subitems.Add(formatstr(query.FieldByName('cap').AsString));
end;

if (query.FieldByName('type').AsString='2') then
begin
subitems.Add('Расход товара');
subitems.Add(formatstr(query.FieldByName('price').AsString));
subitems.Add(formatstr(inttostr(query.FieldByName('price').AsInteger+query.FieldByName('cap').AsInteger)));
subitems.Add(formatstr(query.FieldByName('dprice').AsString));
subitems.Add(formatstr(query.FieldByName('cap').AsString));
end;

if (query.FieldByName('type').AsString='3') then
begin
subitems.Add('Приход денег с налич.');
subitems.Add(formatstr(query.FieldByName('price').AsString));
subitems.Add(formatstr(query.FieldByName('price').AsString));
subitems.Add('0.00');
subitems.Add('0.00');
end;

if (query.FieldByName('type').AsString='4') then
begin
subitems.Add('Расход денег с налич.');
subitems.Add(formatstr(query.FieldByName('price').AsString));
subitems.Add(formatstr(query.FieldByName('price').AsString));
subitems.Add('0.00');
subitems.Add('0.00');
end;

end;
query.FindNext;
end;
with res4list.Items.Add do
begin
caption:='Всего:';
subitems.Add('');

ssum := 0;
psum := 0;
pcsum := 0;
shsum := 0;
for i := 0 to query.RecordCount-1 do
begin
ssum := ssum + strtoint(getnumber(res4list.Items.Item[i].SubItems[1]));
pcsum := pcsum + strtoint(getnumber(res4list.Items.Item[i].SubItems[2]));
psum := psum + strtoint(getnumber(res4list.Items.Item[i].SubItems[3]));
shsum := shsum + strtoint(getnumber(res4list.Items.Item[i].SubItems[4]));
end;
subitems.Add(formatstr(inttostr(ssum)));
subitems.Add(formatstr(inttostr(pcsum)));
subitems.Add(formatstr(inttostr(psum)));
subitems.Add(formatstr(inttostr(shsum)));

end;

end;

end.

