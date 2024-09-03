Uses crt;
const MaxList = 10;
  
  Type StatNode=record
       elements: array[0..MaxList-1] of integer;
       cnt : integer;
       end;
  
  var show_menu : boolean; Spisok : StatNode;
      
  
  procedure NewNode();
  begin
    if Spisok.cnt <> MaxList-1 then begin
      readln(Spisok.elements[Spisok.cnt]);
      Spisok.cnt += 1;
    end;
  end;
  
  
  procedure stat_view_spisok();
  var i,c,selected,d : integer;
  begin
    i := 2;
    if Spisok.cnt >= 3 then while True do begin
      ClrScr;
      writeln('Просмотр списка:');
      write('   ');
      if i = Spisok.cnt then begin
        i := 0;
        selected := Spisok.cnt-1;
        write(Spisok.elements[Spisok.cnt-2], ' | ');
        write(Spisok.elements[Spisok.cnt-1], ' | ');
        write(Spisok.elements[i]);
      end else if i = 1 then begin
        selected := i - 1;
        write(Spisok.elements[Spisok.cnt-1], ' | ');
        write(Spisok.elements[i-1], ' | ');
        write(Spisok.elements[i]);
      end else begin
        selected := i - 1;
        write(Spisok.elements[i-2], ' | ');
        write(Spisok.elements[i-1], ' | ');
        write(Spisok.elements[i]);
      end;
      writeln(' → ');
      writeln('2 – Далее по списку');
      writeln('9 – Удалить элемент посередине');
      writeln('0 – Выйти из просмотра');
      readln(c);
      case c of
        2 : i += 1;
        9 : begin
              for d := selected to Spisok.cnt-1 do begin
                Spisok.elements[d] := Spisok.elements[d+1]
              end;
              Spisok.elements[Spisok.cnt] := 0;
              Spisok.cnt -= 1;
            end;
        0 : break;
      end;
      
      //readln();
    end else begin ClrScr; writeln('Просмотр списка:'); for i := 0 to Spisok.cnt-1 do write(Spisok.elements[i],' '); writeln; writeln('Нажмите Enter для выхода'); readln; end;
    
  end;
  
procedure stat_menu();
  Var i:char;
  begin
    show_menu := True;
    while show_menu do
    begin
      ClrScr;
      WriteLn('1 – Создать элемент списка ');
      Writeln('2 – Просмотреть весь список ');
      WriteLn('3 – Выход ');
      //i:=readkey;
      readLn(i);
      case i of
        '1':NewNode();
        '2':stat_view_spisok();
        '3':show_menu := False;
      end;
  end;
  end;
  
  



Type Pint=^intr;
     intr=record
       a:integer;
       next:Pint;
     end;
     
     
Procedure din_create(Var Hed:Pint);
Var C,B:Pint;
    a:integer;
begin
  new(C);
  readln(C^.a);
  if hed=nil then
    begin
      hed:=c;
      hed^.next:=Hed;
    end      else
    begin
      b:=hed;
      while b^.next<>hed do
        b:=b^.next;
        c^.next:=Hed;
        b^.next:=c;
    end;
end;
 
 
Procedure din_view_spisok(Var Hed:Pint);
Var C,S:Pint;
    i:integer;
begin
  c:=Hed;
  S:=nil;
  if c=nil then
  begin
   WriteLn('Список пуст(');
   readLn;
   exit;
  end;
 repeat
    ClrScr;
    WriteLn('Текущий элемент – ', C^.a);
    WriteLn('1 – Назад');
    WriteLn('2 – Далее');
    WriteLn('3 – Закончить просмотр');
    readLn(i);
    case i of
    1:begin
        s:=C;
        c:=hed;
         While C^.next<>s do
           c:=c^.next;
      end;
    2:c:=C^.next;
    3:break;
    end;
 until False;
end;
 
 
Function din_menu(Var Sp:pint) : boolean;
Var i  :char;
begin
  din_menu := true;
  WriteLn('1 – Создать элемент списка ');
  Writeln('2 – Просмотреть весь список ');
  WriteLn('3 – Выход ');
  //i:=readkey;
  readLn(i);
  case i of
    '1':din_create(Sp);
    '2':din_view_spisok(sp);
    '3':din_menu:=false;
  end;
end;

procedure din_menu();
Var spsk:Pint; F:boolean;
Begin
  ClrScr;
  spsk:=nil;
  repeat
    f := din_menu(spsk);
    clrscr;
  until not F;
end;
  
  
  
  
var menu : boolean; h : char;
begin
  menu := True;
    while menu do
    begin
      ClrScr;
      WriteLn('1 – Статическая память');
      Writeln('2 – Динамическая память');
      WriteLn('3 – Выход ');
      readLn(h);
      case h of
        '1': stat_menu();
        '2': din_menu();
        '3': menu := False;
      end;
  end;
end.