unit rales;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Unit1, DB, ComCtrls, ExtCtrls;

type
  Tralesform = class(TForm)
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
  ralesform: Tralesform;
  gopenstat: integer = 0;

procedure refreshrale;
procedure calculate;

implementation

uses rale;

{$R *.dfm}

procedure refreshrale;

begin

end;

procedure calculate;
var i,ssum, csum : integer;
begin
ssum:=0;
csum:=0;
for i := 0 to ralesform.goodslist.Items.Count - 1 do
begin
csum:=csum+strtoint(getnumber(ralesform.goodslist.Items.Item[i].SubItems.Strings[5]))*strtoint(getnumber(ralesform.goodslist.Items.Item[i].SubItems.Strings[4]));
ssum:=ssum+(strtoint(getnumber(ralesform.goodslist.Items.Item[i].SubItems.Strings[5]))+strtoint(getnumber(ralesform.goodslist.Items.Item[i].SubItems.Strings[6])))*strtoint(getnumber(ralesform.goodslist.Items.Item[i].SubItems.Strings[4]));
end;
ralesform.cap.Text := formatstr(inttostr(csum));
ralesform.summ.Text := formatstr(inttostr(ssum));
end;

procedure Tralesform.cancelClick(Sender: TObject);
begin
close;
end;

procedure Tralesform.cnameChange(Sender: TObject);
begin
ccode.ItemIndex := cname.ItemIndex;
end;

procedure Tralesform.cnameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
note.SetFocus;
end;

procedure Tralesform.dateKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
cname.SetFocus;
end;

procedure Tralesform.goodslistDblClick(Sender: TObject);
begin
gopenstat := 1;
raleform.showmodal;
end;

procedure Tralesform.goodslistKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=vk_return) then
begin
gopenstat := 1;
raleform.showmodal;
end;

if key=vk_insert then
begin
gopenstat := 0;
raleform.showmodal;
end;

if (key=vk_delete) and (goodslist.ItemIndex<>-1) and (MessageDlg('Удалить выделенные записи ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
begin
goodslist.Selected.Delete;
calculate;
end;

end;

procedure Tralesform.noteKeyDown(Sender: TObject; var Key: Word;
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
raleform.showmodal;
end;
end;
end;

end.

