video=read_video('./sintel');
[h,w,c,n]=size(video);
%matrix3=cell2mat(struct2cell(load('matrix3.mat')));
invert=minus(zeros(n,n),matrix3);
p=median(invert(:));
[idx,netsim,dpsim,expref]=apcluster(invert, -3000); %vrne vse indexe...
unikati=unique(idx);
m=length(idx);
for i=1:length(unikati)
    t=sprintf('%d',unikati(i));
    subplot(4,3,i);
    imshow(video(:,:,:,unikati(i)));
    title(t);
end

    
