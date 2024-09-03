unit Edit;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons;

type

  { TfEdit }

  TfEdit = class(TForm)
    book_cost: TEdit;
    bSave: TBitBtn;
    bSave1: TBitBtn;
    CBNote: TComboBox;
    book_name: TEdit;
    book_author: TEdit;
    book_year: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  fEdit: TfEdit;

implementation

{$R *.lfm}

{ TfEdit }

procedure TfEdit.FormShow(Sender: TObject);
begin
  book_name.SetFocus;
end;

end.

