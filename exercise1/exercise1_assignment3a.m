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
  
   #Q1: pri RGB na�inu nam dolo�ene vrednosti povejo koliko dolo�ene barve(Red,Green,Blue) sestavlja na�o barvo v to�ki.
   #Pri HSV na�inu pa le to dolo�amo z �eljenim odtenkom(Hue), nasi�enostjo(Saturation) in Svetlost(Value/Brightness) na�e barve.
   #torej pri HSV na�inu na�o �eljeno barvo(odtenek) dolo�imo �e z H, nato pa z S in V dolo�imo �e stopnji nasi�enosti barve in njeno svetlost.

   #Q2: razlike v posameznih kanalih se med RGB in HSV na�inom razlikujejo. Pri RGB na�inu bi sprememba na posameznem kanalu pomenila 
   #zgolj prese�ek/primankljaj dolo�ene barve v barvi rezultata, kar bi posledi�no implicitno poleg barve same slike spremenilo tudi njeno svetlost in nasi�enost.
   #medtem pa bi pri HSV na�inu spremembe na posameznih kanalih sliko spremenile na razlicne na�ine saj z S in V kanalom ne spreminjamo same osnovne barve 
   #temve� zgolj njeno nasi�enost in svetlost. sprememba H pa bi nam popolnoma spremenila sam odtenek slike.   