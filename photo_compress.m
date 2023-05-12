function photo_compress(name, k)
  A = imread(name);
  B = rgb2gray(A);
  transpose = false;
  if (size(B,1) == size(B,2))
      Bt = fft2(double(B));
  elseif (size(B,1) > size(B,2))
      transpose = true;
      Bt = square(double(B));
  else
      Bt = square(double(B));
  end
  Btsort = sort(abs(Bt(:)));
  thresh = Btsort(floor((k)*length(Btsort)));
  ind = abs(Bt)>thresh;
  Atlow = Bt.*ind;
  Alow = uint8(real(ifft2(Atlow)));
  if (transpose)
    Alow = rot90(Alow, -1);
  end
  imshow(Alow);
end
