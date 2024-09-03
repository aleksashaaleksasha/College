var x,y : real;
begin
  readln(x);
  if (x < -10) then y := ln(x)-ln(x)
    else if ( x < (-1)) then y := Power(x, 0.1*x)/(x*x) - x
    else if (x < 3) then y := (cos(x)/exp(x))*((-x)/44)
    else y :=(cos(2*x)/tan(x))*(Power(x, 0.1*x)/log10(x));
    if y <> y then writeln('При x = ', x:5:1,' функция y не имеет решений')
    else writeln('При x = ', x:5:1, ' значение функции y = ',y:6:2);
end.