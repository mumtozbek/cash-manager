unit udialog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, db;

type
  Tfirmsform = class(TForm)
    Label1: TLabel;
    name: TEdit;
    save: TButton;
    cancel: TButton;
    procedure cancelClick(Sender: TObject);
    procedure nameKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  firmsform: Tfirmsform;

implementation

uses Unit1;

{$R *.dfm}

procedure Tfirmsform.cancelClick(Sender: TObject);
begin
close;
end;

procedure Tfirmsform.nameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
save.SetFocus;
end;

end.
