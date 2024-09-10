z=-pi:1/10:pi-1/10;
N=length(z);
cs=zeros(N,N);
for i=1:N
   cs(i,:)=cos(pi/N*z*(i-1));
   plot(z,cs(i,:));
   xlim([-pi pi]);
   hold on
end    