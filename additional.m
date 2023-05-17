% Функция для подсчёта Фурье-образа матрицы размера 2 на 2 по определению
function fourier_image = additional(matr)
  % Инициализируем нулями возвращаемую матрицу.
  fourier_image = zeros(2, 2);
  
  % Предварительное вычисление W(1, i).
  W_i = W(1, 1:2);
  % Предварительное вычисление W(1, j).
  W_j = W(1, 1:2);
  
  % Основной цикл вычисления Фурье-образа.
  % Используем цикл parfor, который позволяет разбить независимые 
  % друг от друга вычисления на процессы, вычисляемые параллельно.
  parfor i = 1:2
    for j = 1:2
      fourier_image(i,j) = matr(1,1) + matr(1,2)*W_i(i) + matr(2,1)*W_j(j) + matr(2,2)*W_i(i)*W_j(j);
    endfor
  end
  tmp = fourier_image(1,1);
  fourier_image(1,1) = fourier_image(2,2);
  fourier_image(2,2) = tmp;
endfunction
