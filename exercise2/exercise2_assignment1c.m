%Assignment 1: Video stabilization
  %c):
  video=read_video('./shaky');
  num=size(video,4);
  figure(1);
  imagesc(video(:,:,:,1));
  [X,Y]=ginput(1);
  close();
  [trackX, trackY]=track_point(video,round(X),round(Y),20,70);
  %for i = 1:num
   % imshow(video(:,:,:,i));
   % hold on
   % plot(trackX(i), trackY(i),'r.','MarkerSize',20);
   % pause(0.05);
  %end
  imagesc(video(:,:,:,num));
  hold on
  plot(trackX,trackY,'r.','MarkerSize',3);
  hold on
  plot(trackX,trackY);