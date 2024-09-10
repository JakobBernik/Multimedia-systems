A=[1 3; 7 1];
B=[ 2 0 1 2; 7 1 4 6; 5 2 0 4];
vecA=size(A);
vecB=size(B);
C=zeros(vecB(1)-vecA(1)+1, vecB(2)-vecA(2)+1);
vecC=size(C);

for i = 1:vecC(1)
    for j = 1:vecC(2)
        C(i,j)=sum(sum(A.*B(i:i+vecA(1)-1, j:j+vecA(2)-1)));
    end
end
[x, y]=find(C==max(C(:)));
B(x:x+vecA(1)-1, y:y+vecA(2)-1)