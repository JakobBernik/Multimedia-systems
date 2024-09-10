#Assignment 2: Histograms

  # c): 
  p=imread('phone.jpg');
  h=histstretch(p);
  figure(1);
  imshow(p);
  figure(2);
  imshow(h);
  figure(3);
  imagesc(p);
  colormap('gray');
  figure(4);
  hist(p,255);
  figure(5);
  hist(h,255);