% Функция для вычисления коэффициента-бабочки
function butterfly_coefficient = W(s, y)
  butterfly_coefficient = exp((-2*pi*y*i)/(2^s));
endfunction
