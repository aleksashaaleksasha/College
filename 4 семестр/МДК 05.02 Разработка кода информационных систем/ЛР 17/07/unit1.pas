unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Calendar, EditBtn,
  StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Calendar1: TCalendar;
    DateEdit1: TDateEdit;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var  dt: TDateTime;
begin
  dt:= Date;

end;

end.

