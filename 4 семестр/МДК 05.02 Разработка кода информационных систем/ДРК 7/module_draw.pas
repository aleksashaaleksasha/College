Unit module_draw;
uses GraphABC;
procedure Draw(x, y, length, u : real; t : integer);


procedure Draw2(var x, y : real; length, u : real; t : integer);


begin
  Draw(x,y,length,u,t);
  x := x + length*cos(u);
  y := y - length*sin(u);
end;


begin 
  if t > 0 then begin
    length := length/3;
    Draw2(x,y,length,u,t-1);
    Draw2(x,y,length,u+pi/3,t-1);
    Draw2(x,y,length,u-pi/3,t-1);
    Draw2(x,y,length,u,t-1);
  end else line(Round(x), Round(y), Round(x+cos(u)*length), Round(y-sin(u)*length));
end;

begin
  
end.