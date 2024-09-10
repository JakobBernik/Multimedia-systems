function dct2=my_dct2(y)

l=length(y);
dct2X=zeros(l,l);
dct2=zeros(l,l);
for i=1:l
    dct2X(i,:)=my_dct(y(i,:));
end     
for i=1:l
    dct2(:,i)=my_dct(dct2X(:,i)')';
end 
%{
l=length(y);
dct2=zeros(l,l);
idx=linspace(0,l-1,l);
for i=1:l
    tmp=cos(pi/l*(idx(1,i)+0.5)*idx(1,i));
    for j=1:l
        dct2(i,j)=sum(y(i,:).*tmp.*cos(pi/l*(idx+0.5)*idx(1,j)));
    end
end
%}