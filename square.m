clear; clc;
n = [1 2 3 4; 6 7 8 9];
fft2(n)
n1 = [1 3; 6 8];
n2 = [2 4; 7 9];
n1 = new_fft(n1);
n2 = new_fft(n2);
res = n;
for i = 1:(size(n1,1))
  for j = 1:(size(n1,1))
    res(i,j) = n1(i,j) + n2(i,j) * W(log2(size(n1,1)),j - 1);
    res(i, j + size(n1,1)) = n1(i,j) - n2(i,j) * W(log2(size(n1,1)),j - 1);
  endfor
endfor
res
