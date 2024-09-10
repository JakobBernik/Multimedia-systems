video=read_video('./bigbuck');
[h,w,c,n]=size(video);
v=VideoWriter('CropedBuck.avi','Uncompressed AVI');
open(v);
Hues=zeros(h, w, 1, n);
trackX=zeros(n-1);
trackY=zeros(n-1);

for i=1:n-1
    frame1=rgb2hsv(video(:,:,:,i));
    frame2=rgb2hsv(video(:,:,:,i+1));
    diff=abs(frame1(:,:,1)-frame2(:,:,1));
    f=fspecial('average', 40); %filter average of size 40
    diff=imfilter(diff, f, 'same');
    Hues(:,:,:,i)=diff;
    [dx, dy]=find(diff==max(diff(:)));
    trackX(i)=dx(1);
    trackY(i)=dy(1);
    %imagesc(diff);
    %pause(0.05);
        xmin=min(max(dx-50, 1), h-100); % poskrbi da je dobljeni kvadrat vedno 100*100
        ymin=min(max(dy-50, 1), w-100);
    croped=video(xmin:xmin+100, ymin:ymin+100,:,i); %izrez slike
        file=sprintf('image%d.jpg',i);
        imwrite(croped,file); 
        im=imread(file);
        writeVideo(v,im);
end
  delete *jpg;
  close(v);