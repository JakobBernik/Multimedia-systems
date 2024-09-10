video=read_video('./bigbuck');
[h,w,c,n]=size(video);
for i=1:n-1
    frame1=rgb2hsv(video(:,:,:,i));
    frame2=rgb2hsv(video(:,:,:,i+1));
    diff=abs(frame1(:,:,1)-frame2(:,:,1));
    imagesc(diff);
    pause(0.05);
end