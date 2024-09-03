unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons;

type

  { TFmain }

  TFmain = class(TForm)
    book_name_edit: TEdit;
    to_next_button: TButton;
    publication_date_label: TLabel;
    Previouss: TButton;
    book_author_edit: TEdit;
    publication_date_edit: TEdit;
    book_cost_edot: TEdit;
    book_cost_label: TLabel;
    is_available_edit: TCheckBox;
    book_name_label: TLabel;
    book_author_label: TLabel;
    is_available_label: TLabel;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure to_next_buttonClick(Sender: TObject);
    procedure PrevioussClick(Sender: TObject);
  private
    procedure GetRow(i: integer);
    procedure editdata(i:integer);
  public

  end;

var
  Fmain: TFmain;
  Data: TStringList;
  cur_row: integer;

implementation

{$R *.lfm}

{ TFmain }


procedure TFmain.FormShow(Sender: TObject);
Begin
  Data := TStringList.create;
  cur_row := 0;
  if FileExists('data.txt') then begin
     Data.LoadFromFile('data.txt');
      getRow(cur_row);
  end;
end;

procedure TFmain.to_next_buttonClick(Sender: TObject);
begin
 editdata(cur_row);
 if cur_row < data.count-1 then
    begin
      cur_row := cur_row + 1;
      getRow(cur_row);
    end
    else
   begin
     data.add('');
     cur_row += 1;
     book_name_edit.Clear;
     book_author_edit.clear;
     is_available_edit.checked := False;
     publication_date_edit.clear;
     book_cost_edot.clear;
   end;
end;

procedure TFmain.PrevioussClick(Sender: TObject);
begin
 editdata(cur_row);
 if cur_row > 0 then
    begin
      cur_row := cur_row - 1;
      getRow(cur_row);
    end;
end;

procedure TFmain.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  editdata(cur_row);
  data.saveToFile('data.txt')
end;

procedure TFmain.GetRow(i: integer);
var str: string;
begin
   str := Data.Strings[i];

   book_name_edit.text:=copy(str, 1, pos(',',str)-1);
   delete(str,1,pos(',',str));

   book_author_edit.text:=copy(str, 1, pos(',',str)-1);
   delete(str,1,pos(',',str));

   if copy(str, 1, pos(',',str)-1) = 'True' then
      is_available_edit.checked := True
   else
      is_available_edit.checked := False;
   delete(str,1,pos(',',str));

   publication_date_edit.text:=copy(str, 1, pos(',',str)-1);
   delete(str,1,pos(',',str));

   book_cost_edot.text:=str;
end;

procedure TFmain.editdata(i:integer);
var str:string;
begin
   if is_available_edit.checked = True then
      str:= 'True'
   else str:='False';
   data.strings[i]:= book_name_edit.text + ',' + book_author_edit.text + ',' +  str + ',' + publication_date_edit.text + ',' + book_cost_edot.Text;
end;

end.

