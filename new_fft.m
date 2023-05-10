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
        ans(i, j) = value_first(i,j) + value_second(i,j)*W(log2(size(n,1)),j - 1) + value_thirst(i,j)*W(log2(size(n,1)),i - 1) + value_last(i,j)*W(log2(size(n,1)),i+j - 2);
        ans(i + size(n,1)/2, j) = value_first(i,j) + value_second(i,j)*W(log2(size(n,1)),j - 1) - value_thirst(i,j)*W(log2(size(n,1)),i - 1) - value_last(i,j)*W(log2(size(n,1)),i+j - 2);
        ans(i, j + size(n,1)/2) = value_first(i,j) - value_second(i,j)*W(log2(size(n,1)),j - 1) + value_thirst(i,j)*W(log2(size(n,1)),i - 1) - value_last(i,j)*W(log2(size(n,1)),i+j - 2);
        ans(i + size(n,1)/2, j + size(n,1)/2) = value_first(i,j) - value_second(i,j)*W(log2(size(n,1)),j- 1) - value_thirst(i,j)*W(log2(size(n,1)),i - 1) + value_last(i,j)*W(size(n,1),i+j - 2);
      endfor
    endfor
  end
endfunction
