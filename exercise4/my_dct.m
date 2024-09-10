function dct=my_dct(y)
N=length(y);
dct=zeros(1,N);
idx=linspace(0,N-1,N);
for i=0:N-1
    dct(1,i+1)=sum(y.*cos(pi/N*(idx+0.5)*i));
end    





%{
[h,w]=size(y);
if(h>w)
y=y';
end
l=length(y);
dct=zeros(1,l);
for i=0:l-1
    for j=0:l-1
     dct(1,i+1)=dct(1,i+1)+y(1,j+1)*cos(pi/l*(j+0.5)*(i));
    end
    %dct(1,i)=sum(y.*cos(mat.*idx(1,i)));
end
%}
