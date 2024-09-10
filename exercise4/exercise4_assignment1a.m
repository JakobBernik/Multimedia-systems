y= [1 2 3 4 5 4 3 4 3 2 3 4 5 6 7 8 7 8 9 8 7 8 7 6 5 4 3 2 3 4 3 4 5 4 3 2 1];
%y=y';
%load handel
dct=my_dct(y);
idct=my_idct(dct);
subplot(1,3,1);
plot(y);
%ylim([-1.5 1.5]);
subplot(1,3,2);
plot(dct);
%ylim([-1.5 1.5]);
subplot(1,3,3);
plot(idct);
%ylim([-1.5 1.5]);