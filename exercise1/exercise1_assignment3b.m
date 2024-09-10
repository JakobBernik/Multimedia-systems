#Assignment 3: Color spaces

  # b):
  Img=imread('trucks.jpg');
  figure(1);
  imshow(Img);
  Img2=Img;
  Img2(:,:,3)=Img(:,:,3)<200; #threshold
  figure(2);
  imshow(Img2);
  
  Img3=rgb2hsv(Img);
  figure(3);
  imshow(Img3);
  High=Img3(:,:,1)<0.72; #zgornja meja
  Low=Img3(:,:,1)>0.5;   #spodnja meja
  Img3=isolate_color(Img3,High&Low); # izolira barvo
  figure(4);
  imshow(Img3);
  I = ones(20, 255, 3);
  I(:, :, 1) = ones(20,1) * linspace(0, 1, 255);
  figure(5);
  image([0, 1], [0, 1], hsv2rgb(I)); #nariše
  
  #Q1: da, saj se v sliki vidi pomankanje modre barve.
  