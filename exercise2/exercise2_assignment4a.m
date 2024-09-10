video=read_video('./sintel');
[h,w,c,n]=size(video);
matrix=zeros(n,n,'uint64');
%for i=1:n
%    imshow(video(:,:,:,i));
%    pause(0.05);
%end

for i=1:n
    videoHSV1=rgb2hsv(video(:,:,:,i));
    H1=videoHSV1(:,:,1);
    S1=videoHSV1(:,:,2);
    V1=videoHSV1(:,:,3);
    hue1= imhist(H1,8);
    
    sat1= imhist(S1,8);
    val1= imhist(V1,8);
    vecHsv1=[hue1;sat1;val1];
    %vecHsv1=vecHsv1/norm(vecHsv1);
    
 for j=1:i
  if(j~=i)
      videoHSV2=rgb2hsv(video(:,:,:,j));
      H2=videoHSV2(:,:,1);
      S2=videoHSV2(:,:,2);
      V2=videoHSV2(:,:,3);
      hue2= imhist(H2,8);
      sat2= imhist(S2,8);
      val2= imhist(V2,8);
      vecHsv2=[hue2;sat2;val2];
      %vecHsv2=vecHsv2/norm(vecHsv2);
      euclidean=sqrt((sum(minus(vecHsv1,vecHsv2).^2)));
      matrix(i,j)=euclidean;
      matrix(j,i)=euclidean;
  end
 end
end
    
