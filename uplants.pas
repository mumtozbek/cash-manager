unit uplants;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, db;

type
  Tfplants = class(TForm)
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
  fplants: Tfplants;

implementation

uses Unit1;

{$R *.dfm}

procedure Tfplants.cancelClick(Sender: TObject);
begin
close;
end;

procedure Tfplants.nameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
save.SetFocus;
end;

end.
