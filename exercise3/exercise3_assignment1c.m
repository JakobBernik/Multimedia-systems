A=1; %amplitude
f=440;
fs= 44100; %frequency
ts=1/44100; %time interval
t=0:ts:1-ts; %samples to 1s
phase= pi/4; %phase
y1=A*sin(2*pi*f*t);
plot(t,y1);
hold on
y2=0.1*sin(2*pi*f*7*t);
plot(t,y2);
y3=0.3*sin(2*pi*f*5*t);
plot(t,y3);
y4=0.5*sin(2*pi*f*3*t);
plot(t,y4);
y12=y1+y2;
y13=y1+y3;
y14=y1+y4;
y=y1+y2+y3+y4;
plot(t,y);

sound(y1,fs);
pause(1);
sound(y2,fs);
pause(1);
sound(y3,fs);
pause(1);
sound(y4,fs);
pause(1);
sound(y12,fs);
pause(1);
sound(y13,fs);
pause(1);
sound(y14,fs);
pause(1);
sound(y,fs);
