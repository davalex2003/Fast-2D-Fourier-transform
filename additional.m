function retval = additional(matr)
  retval = matr;
  for i = 1:size(matr,1)
    for j = 1:size(matr,2)
      retval(i,j) = matr(1,1) + matr(1,2)*W(1, i) + matr(2,1)*W(1, j) + matr(2,2)*W(1, i)*W(1, j);
    endfor
  endfor
  tmp = retval(1,1);
  retval(1,1) = retval(2,2);
  retval(2,2) = tmp;
endfunction
