A = imread('graphics.jpg');
B = rgb2gray(A);
Bt = fft2(double(B));
Btsort = sort(abs(Bt(:)));
thresh = Btsort(floor((0.98)*length(Btsort)));
ind = abs(Bt)>thresh;
Atlow = Bt.*ind;
Alow = uint8(real(ifft2(Atlow)));
imshow(Alow)
