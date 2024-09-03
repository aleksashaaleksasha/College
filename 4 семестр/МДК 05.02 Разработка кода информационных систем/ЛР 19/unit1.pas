unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons;

type

  { TfMain }

  TfMain = class(TForm)
    Button0: TButton;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    ClearAllButton: TButton;
    ClearElementButton: TButton;
    ClearNumberButton: TButton;
    CommaButton: TButton;
    DivideButton: TButton;
    DivideOnXButton: TButton;
    InputFieldButton: TEdit;
    EqualButton: TButton;
    MinusButton: TButton;
    MultiplyButton: TButton;
    PlusButton: TButton;
    SquarerootButton: TButton;
    SquareButton: TButton;
    procedure ClearElementButtonClick(Sender: TObject);
    procedure ClearNumberButtonClick(Sender: TObject);
    procedure ClearAllButtonClick(Sender: TObject);
    procedure SquarerootButtonClick(Sender: TObject);
    procedure DivideOnXButtonClick(Sender: TObject);
    procedure SquareButtonClick(Sender: TObject);
    procedure ClickZnak(Sender: TObject);
    procedure ClickBut(Sender: TObject);
    procedure EqualButtonClick(Sender: TObject);
    procedure CommaButtonClick(Sender: TObject);

  private

  public

  end;

var
  fMain: TfMain;
  a, b, c: real;
  znak : string;
implementation

{$R *.lfm}

{ TfMain }

procedure TfMain.CommaButtonClick(Sender: TObject);
var k2:AnsiString;
  k1:int64;
begin
  k2:=InputFieldButton.Text;
  k1:= Pos(',',k2);
   if k1 = 0 then
      InputFieldButton.Text:=InputFieldButton.Text + (Sender as TButton).Caption
   else
    ShowMessage('введите число 😞');
end;

procedure TfMain.ClickBut(Sender: TObject);
begin
  InputFieldButton.Text:=InputFieldButton.Text + (Sender as TButton).Caption;
end;


procedure TfMain.ClearNumberButtonClick(Sender: TObject);
var
  str: string;
begin
  str:= InputFieldButton.Text;
  if str <> '' then
  delete(str, Length(str),1);
  InputFieldButton.Text:=str;
end;


procedure TfMain.EqualButtonClick(Sender: TObject);
begin
  if InputFieldButton.Text = '' then
     ShowMessage('введите число 😞')
  else
  begin
  b:= strtoFLoat(InputFieldButton.Text);
  InputFieldButton.Clear;
  case znak of
  '+' : c:= a+b;
  '-' : c:= a-b;
  '*' : c:=a*b;
  '/': if b = 0 then
     showmessage('я запрещаю делить на ноль 😡')
  else c:=a/b;
  end;
  end;

  InputFieldButton.Text:= FloatToStr(c);

end;


procedure TfMain.DivideOnXButtonClick(Sender: TObject);
begin
  if InputFieldButton.Text = '' then
     ShowMessage('введите число 😞')
  else
  begin
  a:= strToFloat(InputFieldButton.Text);
  if InputFieldButton.Text = '0' then
     ShowMessage('я запрещаю делить на ноль 😡')
  else
  begin
  a:= 1/(a);
  InputFieldButton.Text:=FloatToStr(a);
  a:=0;
  end;
  end;
end;


procedure TfMain.ClearElementButtonClick(Sender: TObject);
begin
  InputFieldButton.Clear;
end;

procedure TfMain.ClearAllButtonClick(Sender: TObject);
begin
  InputFieldButton.Clear;
  a:=0;
  b:=0;
  c:=0;
end;



procedure TfMain.SquarerootButtonClick(Sender: TObject);
begin
  if InputFieldButton.Text = '' then
     ShowMessage('введите число 😞')
  else
  begin
  a:= strToFloat(InputFieldButton.Text);
  if a>=0 then
  begin
  a:= sqrt(a);
  InputFieldButton.Text:=FloatToStr(a);
  a:=0;
  end
  else
      ShowMessage('здесь нельзя отрицательные')
  end;
end;



procedure TfMain.SquareButtonClick(Sender: TObject);
begin
  if InputFieldButton.Text = '' then
     ShowMessage('введите число 😞')
  else
  begin
  a:= strToFloat(InputFieldButton.Text);
  a:= sqr(a);
  InputFieldButton.Text:=FloatToStr(a);
  a:=0;
  end; ;
end;

procedure TfMain.ClickZnak(Sender: TObject);
begin
   if InputFieldButton.Text = '' then
      ShowMessage('введите число 😞')
   else
   begin
        a:= strToFloat(InputFieldButton.Text);
        InputFieldButton.clear;
        znak:=(Sender as TButton).Caption;
   end;
end;

end.

