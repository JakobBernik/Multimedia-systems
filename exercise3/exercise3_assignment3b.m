kernel = gaussian_kernel(41,7);
kernel(1,2:2:end)=kernel(1,2:2:end).*-1;
C=conv(y,kernel);
plot(C);
