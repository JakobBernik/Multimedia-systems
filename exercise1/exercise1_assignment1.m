#Assignment 1: Basic image processing

  # a):
  Origin=imread('umbrellas.jpg');
  figure(1);
  imshow(Origin);
  figure(2);
  imagesc(Origin);
 
  # b):
  Img1=Origin;
  [h,w,d]=size(Img1);
  #Img=rgb2gray(Img1); built-in function
  Img1=im2double(Img1);
  Img1=mean(Img1,3); #performs mean operation between all 3 channels of Img1 3rd dimension
  Img1=uint8(255*Img1);
  figure(3); 
  imshow(Img1);
  figure(4);
  imagesc(Img1);
  
  # c): 
  figure(5);
  colormap('jet');
  imagesc(Img1);
  figure(6);
  colormap('bone');
  imagesc(Img1);
  figure(7);
  colormap('gray'); 
  imagesc(Img1);
  
  # d):
  Img2=Origin;
  Img3=Img2(100:200,200:400,:);
  Img2(100:200,200:400,3)=0;
  figure(8);
  imagesc(Img2);
  figure(9);
  imagesc(Img3);
  
  # e):
  Img4=Img1;
  Img4(100:200,200:400)=255-Img4(100:200,200:400);
  figure(10);
  imagesc(Img4);
  colormap('gray');
  
  # f):
  Img5=Img1 > 150;
  figure(11);
  imagesc(Img5);
  colormap('gray');
  
  # g):
  Img6=uint8(im2double(Img1)*64);
  figure(12);
  imagesc(Img6);
  colormap('gray');
  figure(13);
  imshow(Img6);
  #imshow just shows the image as it is, while imagesc also scales that image to the full extent of the current colormap(histstretch).
  #that's why the imagesc's output is pretty much unchanged.
  
  