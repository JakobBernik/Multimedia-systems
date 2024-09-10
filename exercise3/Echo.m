function y = Echo(in,echoes,faktors)
[w,h]=size(in);
if(w>h)
in=in.';   
end
y=in;
for i=1:length(echoes)
    y(1,echoes(i):end)= y(1,echoes(i):end)+in(1,1:end-echoes(i)+1).*faktors(i);
end    
