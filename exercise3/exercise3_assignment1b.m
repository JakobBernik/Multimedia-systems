A=0.5; %amplitude
f=440;
fs= 44100; %frequency
ts=1/44100; %time interval
t=0:ts:0.005-ts; %samples to 1s
phase= pi/4; %phase
y=A*sin(2*pi*f*t+phase);
y = y + A*rand(1,length(y));
%plot(t,y);
sound(y,fs);