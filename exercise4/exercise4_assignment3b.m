img=imread('cameraman.bmp');
origin=img;
l=length(img);
r=rem(l,8);
Qmat=quantization_matrix(42);
if(r~=1)
    img=padarray(img,[r/2 r/2],'both');        
end
blockNum = length(img)/8;
subplot(1,3,1);
imshow(origin);
Qkoef=zeros(l,l);
for i=0:blockNum-1
    for j=0:blockNum-1
    block=double(img(i*8+1:i*8+8,j*8+1:j*8+8));
    block=block-128;
    block=my_dct2(block);
    block=block./Qmat;
    block=round(block);
    block=block.*Qmat;
    Qkoef(i*8+1:i*8+8,j*8+1:j*8+8)=block;
    block=my_idct2(block);
    block=block+128;
    img(i*8+1:i*8+8,j*8+1:j*8+8)=uint8(block);
    end
end
Qkoef=uint8(Qkoef);
%save('Qkoef.mat','Qkoef');
subplot(1,3,2);
imshow(img);
subplot(1,3,3);
imshow(imabsdiff(origin,img));




