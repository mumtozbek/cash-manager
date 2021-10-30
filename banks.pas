unit banks;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Unit1, DB, ComCtrls;

type
  Tbanksform = class(TForm)
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
    fname: TComboBox;
    fcode: TComboBox;
    Label2: TLabel;
    rname: TComboBox;
    perc: TEdit;
    rcode: TComboBox;
    procedure cancelClick(Sender: TObject);
    procedure summKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure noteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dateKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure summKeyPress(Sender: TObject; var Key: Char);
    procedure cnameChange(Sender: TObject);
    procedure fnameChange(Sender: TObject);
    procedure fnameKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure rnameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure percKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure percChange(Sender: TObject);
    procedure summChange(Sender: TObject);
    procedure rnameChange(Sender: TObject);
    procedure cnameKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  banksform: Tbanksform;

implementation

{$R *.dfm}

procedure Tbanksform.cancelClick(Sender: TObject);
begin
close;
end;

procedure Tbanksform.cnameChange(Sender: TObject);
begin
ccode.ItemIndex := cname.ItemIndex;
perc.Text := getnumber(mainform.clientlist.Items.item[cname.itemindex].SubItems[1]);
end;

procedure Tbanksform.cnameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
summ.SetFocus;
end;

procedure Tbanksform.dateKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
cname.SetFocus;
end;

procedure Tbanksform.rnameChange(Sender: TObject);
begin
rcode.ItemIndex := rname.ItemIndex;
end;

procedure Tbanksform.rnameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
save.SetFocus;
end;

procedure Tbanksform.fnameChange(Sender: TObject);
begin
fcode.ItemIndex := fname.ItemIndex;
end;

procedure Tbanksform.fnameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
rname.SetFocus;
end;

procedure Tbanksform.summChange(Sender: TObject);
begin
if summ.Text='' then
begin
summ.Text := '0';
summ.SelectAll;
end;
end;

procedure Tbanksform.summKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
perc
.SetFocus;
end;

procedure Tbanksform.noteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
fname.SetFocus;
end;

procedure Tbanksform.summKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9', #8]) then key := #0;
end;

procedure Tbanksform.percChange(Sender: TObject);
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

procedure Tbanksform.percKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
note.SetFocus;
end;

end.
