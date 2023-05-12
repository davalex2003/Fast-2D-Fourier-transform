function ans = square(n);
  transpose = false;
  if (size(n,1) > size(n,2))
    n = rot90(n, 1);
    transpose = true;
  end
  n1 = n(:, 1:2:end);
  n2 = n(:, 2:2:end);
  n1 = new_fft(n1);
  n2 = new_fft(n2);
  ans = n;
  for i = 1:(size(n1,1))
    for j = 1:(size(n1,1))
      ans(i,j) = n1(i,j) + n2(i,j) * W(log2(size(n1,1)) + 1,j - 1);
      ans(i, j + size(n1,1)) = n1(i,j) - n2(i,j) * W(log2(size(n1,1)) + 1,j - 1);
    endfor
  endfor
endfunction
