%Kvantizirane slike lahko shranimo z manj prostora, saj se v samem postopku
%kvantizacije veèji del koeficientov bloka slike ki ga obdelujemo spremeni
%v 0, kar pomeni da na sam izgled slike po izbrani stopnji kvantizacije
%ne vpliva ter ga zato lahko zanemarimo.
load('Qkoef.mat');
Compressed = norm2huff(Qkoef);
%save('Compressed.mat','Compressed');
% 26% osnovne velikosti