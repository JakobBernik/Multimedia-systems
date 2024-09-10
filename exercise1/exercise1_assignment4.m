#Assignment 4: Homography

  # a):
  Img=imread('monitor.jpg');
  figure(1);
  imshow(Img);
  #[X,Y,btns]=ginput(4);
  #save points.mat X Y ;
  load points.mat;
  figure(2);
  imshow(Img);
  patch(X,Y,'white');
  #b):
  Source=imread('city.jpg');
  [h,w,~]=size(Source);
  Z =[0,0,h,h];
  W =[w,0,0,w];
  H=estimate_homography(Z,W,X,Y);
  kordO=ones(4,3);
  kordO(:,1)=round(Z);
  kordO(:,2)=round(W);
  kordN=ones(4,3);
  kordN(:,1)=round(X);
  kordN(:,2)=round(Y);
  for i=1:kordO(3,1)# i,j pixel source ,vec pixel na novi sliki  
    for j=1:kordO(1,2)
      vec=H*[i;j;1];
      vec=round(vec./vec(3));
      Img(vec(2),vec(1),:)=Source(i,j,:);
   end
  end  
  figure(3);
  imshow(Img);  
  
  
  