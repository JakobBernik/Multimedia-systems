video=read_video('./sintel');
newVideo=video;
[h,w,c,n]=size(video);
%matrix3=cell2mat(struct2cell(load('matrix3.mat')));
invert=minus(zeros(n,n),matrix3);
p=median(invert(:));
[idx,netsim,dpsim,expref]=apcluster(invert, -3000);
unikati=unique(idx);
m=length(idx);
for i=1:m
    image=imresize(video(:,:,:,idx(i)),0.2);
    [ih,iw,ic]=size(image);
    fin=n;
    if(i<m)
    fin=idx(i+1);    
    end
    for j=idx(i):fin
        newVideo(1:ih,1:iw,:,j)=image;
    end
end
for i=1:n
   imshow(newVideo(:,:,:,i));
   pause(0.05);
end    
    

    
