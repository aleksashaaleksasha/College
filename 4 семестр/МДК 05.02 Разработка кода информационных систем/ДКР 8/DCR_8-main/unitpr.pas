unit unitPr;
{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ComCtrls,
  ExtCtrls, Math, Types;

type

  { TFont }

  TFont = class(TForm)
    ButtonProstoyRaschet: TButton;
    SlozhniyeProcenti: TMemo;
    SlozhnayaSumma: TMemo;
    month_stavka_edit: TEdit;
    months_nmbr_edit: TEdit;
    vklad_sum_edit: TEdit;
    ProstayaFormula: TImage;
    SlozhnayaFormula: TImage;
    KolvoMes: TLabel;
    StavkaNaMes: TLabel;
    SummaVklada: TLabel;
    ProstayaPoluchennayaSumma: TLabel;
    ProstoyPoluchenniyProcent: TLabel;
    SlozhnayaPoluchennayaSumma: TLabel;
    SlozhniyPoluchenniyProcent: TLabel;
    ProstayaSumma: TMemo;
    ProstiyeProcenti: TMemo;
    procedure ButtonProstoyRaschetClick(Sender: TObject);

  private

  public

  end;

var
  Font: TFont;
  sum, months, stavka : real;

implementation

{$R *.lfm}

{ TFont }

procedure TFont.ButtonProstoyRaschetClick(Sender: TObject);
var PrRas, SlRas : real;
begin
  if not(month_stavka_edit.text = '') then
  stavka:=strtofloat (month_stavka_edit.Text);

  if not(months_nmbr_edit.text = '') then
  months:=strtofloat(months_nmbr_edit.Text);

  if not(vklad_sum_edit.text = '') then
  sum :=strtofloat(vklad_sum_edit.Text);

  PrRas:= sum*stavka/100*months/12;
  ProstiyeProcenti.text:=floattostr(PrRas);
  ProstayaSumma.text:=floattostr(PrRas+sum);

  SlRas := sum * Power(1 + (stavka/(100*12)), months);
  SlozhnayaSumma.text:=floattostr(SlRas);
  SlozhniyeProcenti.text:=floattostr(SlRas-sum);
end;

end.
