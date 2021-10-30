unit baseunit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, DBTables;

type
  Tbasesform = class(TForm)
    baselist: TListView;
    procedure baselistDblClick(Sender: TObject);
    procedure baselistKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  basesform: Tbasesform;

implementation

uses bases, unit1, PassWord;

{$R *.dfm}

procedure Tbasesform.baselistDblClick(Sender: TObject);
begin
openstat := 1;
baseform.ShowModal;
end;

procedure Tbasesform.baselistKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
with mainform do
begin

if key=vk_return then
begin
openstat := 1;
baseform.ShowModal;
end;

if key=vk_insert then
begin
openstat := 0;
baseform.ShowModal;
end;

if (key=vk_delete) and (baselist.ItemIndex<>-1) and (MessageDlg('Удалить выделенные записи ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
begin
update.DeleteSQL.Text := 'DELETE FROM "data/bases.db" WHERE code = "'+baselist.Selected.Caption+'"';
update.ExecSQL(ukDelete);
refreshbases;
end;

end;
end;

procedure Tbasesform.FormClose(Sender: TObject; var Action: TCloseAction);
begin
loginform.FormShow(Sender)
end;

procedure Tbasesform.FormShow(Sender: TObject);
begin
refreshbases;
end;

end.
