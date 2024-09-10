function y = MyDelay(in,addOn,duration)
[Win,Hin]=size(in);
[WaddOn,HaddOn]=size(addOn);
if(Win>Hin)
in=in.';   
end
if(WaddOn>HaddOn)
addOn=addOn.';   
end
y=in;
y(1,duration:end)= addOn(1,1:end-duration-1);