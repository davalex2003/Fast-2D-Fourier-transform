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

elseif (number == 3)

else (number = 4);

end
