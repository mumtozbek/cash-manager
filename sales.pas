unit sales;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Unit1, DB, ComCtrls, ExtCtrls;

type
  Tsalesform = class(TForm)
    Panel1: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    note: TEdit;
    date: TDateTimePicker;
    cname: TComboBox;
    ccode: TComboBox;
    Panel2: TPanel;
    Panel3: TPanel;
    Label6: TLabel;
    Label3: TLabel;
    save: TButton;
    cancel: TButton;
    goodslist: TListView;
    Label1: TLabel;
    cap: TEdit;
    summ: TEdit;
    procedure cancelClick(Sender: TObject);
    procedure noteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dateKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cnameKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cnameChange(Sender: TObject);
    procedure goodslistDblClick(Sender: TObject);
    procedure goodslistKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  salesform: Tsalesform;
  gopenstat : integer = 0;
  asum : integer;

procedure refreshsale;
procedure calculate;

implementation

uses sale;

{$R *.dfm}

procedure refreshsale;

begin


end;

procedure calculate;
var i,ssum, csum : integer;
begin
asum:=0;
ssum:=0;
csum:=0;
for i := 0 to salesform.goodslist.Items.Count - 1 do
begin
csum:=csum+strtoint(getnumber(salesform.goodslist.Items.Item[i].SubItems.Strings[5]))*strtoint(getnumber(salesform.goodslist.Items.Item[i].SubItems.Strings[4]));
asum:=asum+(strtoint(getnumber(salesform.goodslist.Items.Item[i].SubItems.Strings[6]))-(strtoint(getnumber(salesform.goodslist.Items.Item[i].SubItems.Strings[8]))+strtoint(getnumber(salesform.goodslist.Items.Item[i].SubItems.Strings[9]))))*strtoint(getnumber(salesform.goodslist.Items.Item[i].SubItems.Strings[4]));
ssum:=ssum+(strtoint(getnumber(salesform.goodslist.Items.Item[i].SubItems.Strings[6]))-strtoint(getnumber(salesform.goodslist.Items.Item[i].SubItems.Strings[5])))*strtoint(getnumber(salesform.goodslist.Items.Item[i].SubItems.Strings[4]));
end;
salesform.cap.Text := formatstr(inttostr(csum));
salesform.summ.Text := formatstr(inttostr(ssum));
end;

procedure Tsalesform.cancelClick(Sender: TObject);
begin
close;
end;

procedure Tsalesform.cnameChange(Sender: TObject);
begin
ccode.ItemIndex := cname.ItemIndex;
end;

procedure Tsalesform.cnameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
note.SetFocus;
end;

procedure Tsalesform.dateKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
cname.SetFocus;
end;

procedure Tsalesform.goodslistDblClick(Sender: TObject);
begin
gopenstat := 1;
saleform.showmodal;
end;

procedure Tsalesform.goodslistKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=vk_return) then
begin
gopenstat := 1;
saleform.showmodal;
end;

if key=vk_insert then
begin
gopenstat := 0;
saleform.showmodal;
end;

if (key=vk_delete) and (goodslist.ItemIndex<>-1) and (MessageDlg('Удалить выделенные записи ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
begin
goodslist.Selected.Delete;
calculate;
end;

end;

procedure Tsalesform.noteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
begin
if goodslist.Items.Count>0 then
begin
goodslist.SetFocus;
goodslist.ItemIndex := 0;
end
else
begin
gopenstat := 0;
saleform.showmodal;
end;
end;
end;

end.

