function CoefMat = dct_coef(N)
[cols,rows]=meshgrid(0:N-1);
CoefMat=sqrt(2/N)*cos(pi/N*(cols+0.5).*rows); 
CoefMat(1,:)=CoefMat(1,:)/sqrt(2); 
