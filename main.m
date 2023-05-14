clear; clc;
disp('Выберите нужный вариант:');
disp('1. Сжатие фотографии');
disp('2. Размер рандомного массива');
disp('3. Экспорт массива из .csv файла');
disp('4. Ввод массива вручную');
number = input('Введите число: ');
while (number != 1 && number != 2 && number != 3 && number != 4)
  number = input('Введите число: ');
end
if (number == 1)
  photo = input('Введите путь и название файла: ', 's');
  try
    A = imread(photo);
    k = input('Введите степень сжатия: ');
    photo_compress(photo, k);
  catch exception
    disp('Ошибка при открытии фотографии.');
  end
elseif (number == 2)
    norm = true;
    n1 = input('Введите количество строк массива: ');
    n2 = input('Введите количество столбцов массива: ');
    if (log2(n1) != fix(log2(n1)) || log2(n2) != fix(log2(n2)))
      disp('Неподходящий размер массива');
      norm = false;
    endif
    if (n1 != n2)
      if (n2 / n1 != 2 && n1 / n2 != 2)
        disp('Неподходящий размер массива');
        norm = false;
      endif
    endif
    if (norm)
      A = randi([1, 100], n1, n2)
      if (n1 == n2)
        B = fft2(A)
      else
        B = square(A)
      endif
    endif
elseif (number == 3)

else

end
