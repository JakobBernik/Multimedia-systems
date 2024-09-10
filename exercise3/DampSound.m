function y= DampSound(frequency,fs,duration);
ts=1/fs; %time interval
t=0:ts:duration-ts; %samples to 1s
y= sin(2*pi*frequency*t).*exp(-t);