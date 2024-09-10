 video=read_video('./shaky');
  [h,w,c,n]=size(video);
  v=VideoWriter('smooth.avi','Uncompressed AVI');
  open(v);
  figure(1);
  imagesc(video(:,:,:,1));
  [X,Y]=ginput(1);
  close();
  X=round(X);
  Y=round(Y);
  [trackX, trackY]=track_point(video,X,Y,25,200);
  [smoothX,smoothY]=smooth_trajectory(trackX,trackY);
  for i= 1:n
    dx=X-smoothX(i);
    dy=Y-smoothY(i);
    %video(:,:,:,i)=imtranslate(video(:,:,:,i),[dx,dy]);
    image=zeros(h,w,c,1,'uint8');
    x1=1;y1=1;
    x2=w;y2=h;
    x3=1;y3=1;
    x4=w;y4=h;
    if(dx>0)
       x2=x2-dx;
       x3=y3+dx;
    elseif(dx<0)
       x1=x1-dx;
       x4=x4+dx;
    end
    if(dy>0)
        y2=y2-dy;
        y3=y3+dy;
    elseif(dy<0)
        y1=y1-dy;
        y4=y4+dy;
    end
    image(y3:y4,x3:x4,:,1)=video(y1:y2,x1:x2,:,i);
        file=sprintf('image%d.jpg',i);
        imwrite(image,file); 
        im=imread(file);
        writeVideo(v,im);
  end
  delete *jpg;
  close(v);
    %convolution -kernel, glajenje glede na kernel gausian je normalno
    %razporejen