function y = Delay(in,duration)
[w,h]=size(in);
if(w>h)
in=in.';   
end
y=in;
y(1,duration:end)= y(1,duration:end)+in(1,1:end-duration+1);
