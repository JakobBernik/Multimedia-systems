A=0.5; %amplitude
f=440; %frequency
fs= 44100; % sample frequency
ts=1/44100; %time interval
t=0:ts:1-ts; %samples to 1s
phase= pi/4; %phase
y=A*sin(2*pi*f*t+phase);
plot(t,y);
sound(y,fs);
