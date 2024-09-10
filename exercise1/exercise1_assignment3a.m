#Assignment 3: Color spaces

  # a):
  Img=imread('trucks.jpg');
  figure(1);
  imshow(Img);
  figure(2);
  imshow(Img(:,:,1));
  figure(3);
  imshow(Img(:,:,2));
  figure(4);
  imshow(Img(:,:,3));
  Img2=uint8(255*rgb2hsv(Img));
  figure(5);
  colormap('gray');
  imagesc(Img2(:,:,1));
  figure(6);
  colormap('gray');
  imagesc(Img2(:,:,2));
  figure(7);
  colormap('gray');
  imagesc(Img2(:,:,3));
  
   #Q1: pri RGB naèinu nam doloèene vrednosti povejo koliko doloèene barve(Red,Green,Blue) sestavlja našo barvo v toèki.
   #Pri HSV naèinu pa le to doloèamo z željenim odtenkom(Hue), nasièenostjo(Saturation) in Svetlost(Value/Brightness) naše barve.
   #torej pri HSV naèinu našo željeno barvo(odtenek) doloèimo že z H, nato pa z S in V doloèimo še stopnji nasièenosti barve in njeno svetlost.

   #Q2: razlike v posameznih kanalih se med RGB in HSV naèinom razlikujejo. Pri RGB naèinu bi sprememba na posameznem kanalu pomenila 
   #zgolj presežek/primankljaj doloèene barve v barvi rezultata, kar bi posledièno implicitno poleg barve same slike spremenilo tudi njeno svetlost in nasièenost.
   #medtem pa bi pri HSV naèinu spremembe na posameznih kanalih sliko spremenile na razlicne naèine saj z S in V kanalom ne spreminjamo same osnovne barve 
   #temveè zgolj njeno nasièenost in svetlost. sprememba H pa bi nam popolnoma spremenila sam odtenek slike.   