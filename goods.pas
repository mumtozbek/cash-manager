unit goods;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Unit1, DB;

type
  Tgoodsform = class(TForm)
    Label1: TLabel;
    name: TEdit;
    Label2: TLabel;
    price: TEdit;
    Label3: TLabel;
    save: TButton;
    cancel: TButton;
    pname: TComboBox;
    pcode: TComboBox;
    Label4: TLabel;
    margin: TEdit;
    Label5: TLabel;
    cap: TEdit;
    Label6: TLabel;
    ostatok: TEdit;
    procedure cancelClick(Sender: TObject);
    procedure priceKeyPress(Sender: TObject; var Key: Char);
    procedure nameKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure priceKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure pnameChange(Sender: TObject);
    procedure pcodeChange(Sender: TObject);
    procedure pnameKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure priceChange(Sender: TObject);
    procedure marginKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure marginChange(Sender: TObject);
    procedure capKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure capChange(Sender: TObject);
    procedure ostatokChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  goodsform: Tgoodsform;

implementation

{$R *.dfm}

procedure Tgoodsform.cancelClick(Sender: TObject);
begin
close;
end;

procedure Tgoodsform.marginChange(Sender: TObject);
begin
if margin.Text='' then
begin
margin.Text := '0';
margin.SelectAll;
end;
end;

procedure Tgoodsform.marginKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
cap.SetFocus;
end;

procedure Tgoodsform.nameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
pname.SetFocus;
end;

procedure Tgoodsform.ostatokChange(Sender: TObject);
begin
if ostatok.Text='' then
begin
ostatok.Text := '0';
ostatok.SelectAll;
end;
end;

procedure Tgoodsform.pcodeChange(Sender: TObject);
begin
pname.ItemIndex := pcode.ItemIndex;
end;

procedure Tgoodsform.pnameChange(Sender: TObject);
begin
pcode.ItemIndex := pname.ItemIndex;
end;

procedure Tgoodsform.pnameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
price.SetFocus;
end;

procedure Tgoodsform.priceChange(Sender: TObject);
begin
if price.Text='' then
begin
price.Text := '0';
price.SelectAll;
end;
end;

procedure Tgoodsform.priceKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
margin.SetFocus;
end;

procedure Tgoodsform.priceKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9', #8]) then key := #0;
end;

procedure Tgoodsform.capChange(Sender: TObject);
begin
if cap.Text='' then
begin
cap.Text := '0';
cap.SelectAll;
end;
end;

procedure Tgoodsform.capKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
save.SetFocus;
end;

end.
