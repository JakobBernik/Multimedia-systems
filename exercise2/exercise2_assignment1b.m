
  video=read_video('./bigbuck');
  num=size(video,4);
    figure(1);
  for i= 1:num
    imshow(video(:,:,:,i));
    refresh();
    pause(0.03);
  end
  for i= 2:num
    imshowpair(video(:,:,:,i-1),video(:,:,:,i),'diff');
    refresh();
    pause(0.03);
  end
  
  
  
  