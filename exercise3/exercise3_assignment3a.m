kernel = gaussian_kernel(41,7);
C=conv(y,kernel);
plot(y);
hold on
plot(C);
sound(C,fs);
