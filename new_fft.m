% Основная функция для подсчёта Фурье-образа квадратной матрицы.
function ans = new_fft(original_matrix)
  % База рекурсии - вызываем функцию additional для матрицы размером 2 на 2, 
  % которая считает Фурье-образ по определению.
  if (size(original_matrix,1) == 2) % По условию - исходная матрица квадратная, 
                                    % поэтому достаточно проверить одну сторону.
    ans = additional(original_matrix);
  else
    % Делим матрицу на 4 части.
    first_part = original_matrix(1:2:end, 1:2:end);
    second_part = original_matrix(1:2:end, 2:2:end);
    thirst_part = original_matrix(2:2:end, 1:2:end);
    last_part = original_matrix(2:2:end, 2:2:end);
    
    % Рекурсивно считаем Фурье-образ каждой части.
    value_first = new_fft(first_part);
    value_second = new_fft(second_part);
    value_thirst = new_fft(thirst_part);
    value_last = new_fft(last_part);
    
    % Запоминаем размер оригинальной матрицы.
    % По условию - она квадратная.
    size_original_matrix = size(original_matrix, 1);
    
    % Предварительно вычисляем значения функции W.
    % Данные действия необходимы для экономии времени
    % во время вычисления Фурье-образа основной матрицы.
    W_vals = zeros(1, size_original_matrix-1);
    for k = 1:size_original_matrix - 1
        W_vals(k) = W(log2(size_original_matrix), k - 1);
    end
    
    % Готовим матрицу для ответа - создаём нулевую матрицу,
    % которая имеет размер исходной матрицы.
    ans = zeros(size(original_matrix), size(original_matrix));
    
    % Основной цикл вычисления Фурье-образа.
    % Используем цикл parfor, который позволяет разбить независимые 
    % друг от друга вычисления на процессы, вычисляемые параллельно.
    parfor i = 1:(size_original_matrix / 2)
      for j = 1:(size_original_matrix / 2)
        W_val = W_vals(j);
        W_val_i = W_vals(i);
        W_val_ij = W_vals(i+j - 1);
        
        % Во время каждой итерации цикла мы вычисляем 4 элемента искомого Фурье-образа.
        ans(i, j) = value_first(i,j) + value_second(i,j)*W_val + value_thirst(i,j)*W_val_i + value_last(i,j)*W_val_ij;
        ans(i + size(original_matrix,1)/2, j) = value_first(i,j) + value_second(i,j)*W_val - value_thirst(i,j)*W_val_i - value_last(i,j)*W_val_ij;
        ans(i, j + size(original_matrix,1)/2) = value_first(i,j) - value_second(i,j)*W_val + value_thirst(i,j)*W_val_i - value_last(i,j)*W_val_ij;
        ans(i + size(original_matrix,1)/2, j + size(original_matrix,1)/2) = value_first(i,j) - value_second(i,j)*W_val - value_thirst(i,j)*W_val_i + value_last(i,j)*W_val_ij;
      end
    end
  end
end
