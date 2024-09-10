function y2=my_idct2(dct)

l=length(dct);
y2X=zeros(l,l);
y2=zeros(l,l);
for i=1:l
    y2X(i,:)=my_idct(dct(i,:));
end

for i=1:l
    y2(:,i)=my_idct(y2X(:,i)')';
end 
%{
l=length(dct);
y2=zeros(l,l);
idx=linspace(1,l,l);
for i=1:l
    tmp=cos(pi/l*idx(1,i)*(idx(1,i)*0.5));
    for j=1:l
        y2(i,j)=1/l*dct(1,1)+sum(2/l*dct(i,:).*tmp.*cos(pi/l*(idx*(idx(1,j)+0.5))));
    end
end
%}

