#Assignment 3: Color spaces

  #Q1:
  
  # c):
  t=imread('trucks.jpg');
  p = rgb2hsv(t);
  o=p;
  [h,w,d] = size(o);
  mask = (o(:,:,1)<0.72 & o(:,:,1)>0.5 & o(:,:,2)>0.9);
  o(:,:,1:2)=o(:,:,1:2).*mask;
  figure(1);
  imshow(o);
  