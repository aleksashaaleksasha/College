uses GraphABC;
uses module_draw;

var level := 0;
  
var x1 := real(400);
var x2 := real(800);
var x3 := real(600);
var y1 := real(454);
var y2 := real(454);
var y3 := real(108);
var length := real(400);


procedure KeyDown(k: integer);
begin
    
    case k of
      VK_C : level+=1;
      VK_Z : if level>0 then level-=1;
      VK_W : (y1,y2,y3):=(y1-25,y2-25,y3-25);
      VK_S : (y1,y2,y3):=(y1+25,y2+25,y3+25);
      VK_A : (x1,x2,x3):=(x1-25,x2-25,x3-25);
      VK_D : (x1,x2,x3):=(x1+25,x2+25,x3+25);
      VK_Q : (x1,y1,x2,y2,x3,y3,length):=((x1-window.Center.X)*0.8+window.Center.x,(y1-window.Center.y)*0.8+window.Center.y,(x2-window.Center.X)*0.8+window.Center.x,(y2-window.Center.y)*0.8+window.Center.y,(x3-window.Center.X)*0.8+window.Center.x,(y3-window.Center.y)*0.8+window.Center.y,length*0.8);
      VK_E : (x1,y1,x2,y2,x3,y3,length):=((x1-window.Center.X)*1.2+window.Center.x,(y1-window.Center.y)*1.2+window.Center.y,(x2-window.Center.X)*1.2+window.Center.x,(y2-window.Center.y)*1.2+window.Center.y,(x3-window.Center.X)*1.2+window.Center.x,(y3-window.Center.y)*1.2+window.Center.y,length*1.2);
    end;
  
    window.Clear;
    
    TextOut(0,0,'Z - уменьшить глубину прорисовки');
    TextOut(0,15,'C - увеличить глубину прорисовки');
    TextOut(0,30,'Q - уменьшить масштаб');
    TextOut(0,45,'E - увеличить масштаб');
    TextOut(0,60,'W,A,S,D - двигать фигуру');
  
    Draw(x1,y1,length,pi/3,level);
    Draw(x2,y2,length, pi,level);
    Draw(x3,y3,length,-pi/3,level);
    
end;


begin
  window.Caption:='Снежиночка Коха ❄';
  SetWindowSize(1200,600);
  Window.IsFixedSize := true;
  ClearWindow;
  
  TextOut(0,0,'Z - уменьшить глубину прорисовки');
  TextOut(0,15,'C - увеличить глубину прорисовки');
  TextOut(0,30,'Q - уменьшить масштаб');
  TextOut(0,45,'E - увеличить масштаб');
  TextOut(0,60,'W,A,S,D - двигать фигуру');
  
  Draw(x1,y1,length,pi/3,level);
  Draw(x2,y2,length, pi,level);
  Draw(x3,y3,length,-pi/3,level);
  
  OnKeyDown:= KeyDown;
end.