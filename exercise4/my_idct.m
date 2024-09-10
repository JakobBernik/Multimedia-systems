function idct=my_idct(dct)
N=length(dct);
idct=zeros(1,N);
idx=linspace(1,N-1,N-1);
for i=1:N
    idct(1,i)=1/N*dct(1,1)+sum(2/N*dct(1,2:N).*cos(pi/N*idx.*(i-1+0.5)));
end 


%{
[h,w]=size(dct);
if(h>w)
dct=dct';
end
l=length(dct);
y=zeros(1,l);
y=y+1/l*dct(1,1);
%vec1=2/l*dct;
%vec2=pi/l*idx;
for i=1:l
    for j=2:l
      y(1,i)=y(1,i)+y(1,j)*cos(pi/l*(j-1)*(i-1));
    end    
    %y(1,i)=y(1,i)+sum(vec1.*cos(vec2.*(idx(1,i)+0.5)));
end
%}