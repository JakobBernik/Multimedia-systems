#Assignment 2: Histograms

  # b):
  Img=imread('umbrellas.jpg');
  Img=rgb2gray(Img);
  Img=reshape(Img,numel(Img),1);
  figure(1);
  hist(Img,10);
  figure(2);
  hist(Img,25);
  figure(3);
  hist(Img,50);
  #Q1:oblika histograma se z ve�anjem �tevila vrednosti spreminja zaradi natan�nosti s katero se podatki razporejajo po x osi.
  # pri manjsem �tevilu mo�nosti(manj�e �tevilo vrednosti) se ve� vrednosti, ki bi se pri ve�jem �tevilu mo�nosti za razporejanje
  #(ve� vrednosti) slikale v vsaka svojo vrdednost, pri le tem slikajo v istega. zato nam tak histogram predstavi manj informacije
  # o sliki kot histogram z ve�jim �tevilom mo�nih vrednosti.
   