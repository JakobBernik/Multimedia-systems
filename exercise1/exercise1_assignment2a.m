#Assignment 2: Histograms

  # a): 
  Img=imread('umbrellas.jpg');
  Img=rgb2gray(Img);
  [H10,bins10]=myhist(Img,10);
  [H25,bins25]=myhist(Img,25);
  [H50,bins50]=myhist(Img,50);
  figure(1);
  bar(H10);
  figure(2);
  bar(H25);
  figure(3);
  bar(H50);
  #histogram ima ožje stolpce, rezultat je bolj natanèen.