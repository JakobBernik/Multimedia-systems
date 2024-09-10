video=read_video('./bigbuck');
[h,w,c,n]=size(video);
diffs=uint16(zeros(n-1,1));
for i= 1:n-1
R1=video(:,:,1,i);
G1=video(:,:,2,i);
B1=video(:,:,3,i);

R2=video(:,:,1,i+1);
G2=video(:,:,2,i+1);
B2=video(:,:,3,i+1);

red1= imhist(R1,8);
green1= imhist(G1,8);
blue1= imhist(B1,8);

red2= imhist(R2,8);
green2= imhist(G2,8);
blue2= imhist(B2,8);

 vector1=[red1;green1;blue1];

 vector2=[red2;green2;blue2];
 hellinger=sqrt(0.5*(sum(minus(vector1,vector2).^2)));
 diffs(i)=hellinger;
end
 maximum=max(diffs(:));
 threshold=maximum*0.25;
 transitions=[];
 i=1;
 while i<n
    if(diffs(i)>threshold)
       prvaSlika = i-1; 
       transitions=[transitions prvaSlika];
       i=i+2;
    end
    i=i+1;
 end    
 [h,w]=size(transitions);
 for i=1:w*5
    k=round(mod(i-1,5));
    l=floor((i-1)/5);
    j=transitions(l+1);
    subplot(w,5,i);
    imshow(video(:,:,:,j+k));
 end