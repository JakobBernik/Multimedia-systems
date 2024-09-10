A=0.5; %amplitude
f=440; %frequency
fs= 44100; % sample frequency
ts=1/44100; %time interval
t=0:ts:0.005-ts; %samples to 1s
y=A*sin(2*pi*f*t);
v=2*pi*f*t;
triangle=y-A*sin(3*v)/9+A*sin(5*v)/25-A*sin(7*v)/49+A*sin(9*v)/81-A*sin(11*v)/121+A*sin(13*v)/169-A*sin(15*v)/225;
sawtooth=-(2*A/pi)*atan(ones(1,length(v))./tan(pi*f*t));
square=A*y./abs(y);   
plot(t,square);
hold on
sound(square,fs);
pause(1);
plot(t,triangle);
sound(triangle,fs);
pause(1);
plot(t,sawtooth);
sound(sawtooth,fs);