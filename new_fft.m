function ans = new_fft(n)
  if (size(n,1) == 2 && size(n,2) == 2) 
    ans = additional(n);
  else  
    first = n(1:2:end, 1:2:end);
    value_first = new_fft(first);
    second = n(1:2:end, 2:2:end);
    value_second = new_fft(second);
    thirst = n(2:2:end, 1:2:end);
    value_thirst = new_fft(thirst);
    last = n(2:2:end, 2:2:end);
    value_last = new_fft(last);
    ans = n;
    for i = 1:(size(n, 1) / 2)
      for j = 1:(size(n, 2) / 2)
        ans(i, j) = first(i,j) + second(i,j)*W(log2(size(n,1)),i) + thirst(i,j)*W(log2(size(n,1)),j) + last(i,j)*W(log2(size(n,1)),i+j);
        ans(i + size(n,1)/2, j) = first(i,j) - second(i,j)*W(log2(size(n,1)),i) + thirst(i,j)*W(log2(size(n,1)),j) - last(i,j)*W(log2(size(n,1)),i+j);
        ans(i, j + size(n,1)/2) = first(i,j) - second(i,j)*W(log2(size(n,1)),i) - thirst(i,j)*W(log2(size(n,1)),j) - last(i,j)*W(log2(size(n,1)),i+j);
        ans(i + size(n,1)/2, j + size(n,1)/2) = first(i,j) - second(i,j)*W(log2(size(n,1)),i) - thirst(i,j)*W(log2(size(n,1)),j) + last(i,j)*W(log2(size(n,1)),i+j);
      endfor
    endfor
  end
endfunction