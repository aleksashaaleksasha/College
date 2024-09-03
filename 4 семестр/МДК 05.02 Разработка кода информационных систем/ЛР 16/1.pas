const MAXSIZE = 50;
type Stack = record  { стек рассчитан на 50 символов }
      tags: array[1..MAXSIZE] of char;
      size: integer; { число элементов }
     end;
     
     
     
procedure Push( var S: Stack; x: char);
begin
  if S.size = MAXSIZE then Exit;  // выход, если произошло переполнение стека
  S.size := S.size + 1;
  S.tags[S.size] := x; // добавляем элемент
end;



function Pop ( var S:Stack ): char;
begin
  if S.size = 0 then begin
    Result := char(255); // 255 - пустой символ, ошибка - стек пуст
    Exit;
  end;
  Result := S.tags[S.size];
  S.size := S.size - 1;
end;



function isEmptyStack ( S: Stack ): Boolean;
begin
  Result := (S.size = 0);
end;



var file1, file2: text; x: char; stek: Stack;
begin
  assign(file1, 'input.txt');
  assign(file2, 'output.txt');
  reset(file1);
  rewrite(file2);
  while not eof(file1) do begin readln(file1, x); push(stek, x); end;
  if isemptystack(stek) then writeln('пустовато в файле') else begin while (stek.size > 0) do writeln(file2, Pop(stek)); end;
  close(file1);
  close(file2);
  print('копирование завершено')
end.