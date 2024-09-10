%{ 
    A=1; %amplitude
    f=500;
    fs= 44100; %frequency
    ts=1/44100; %time interval
    t=0:ts:1-ts; %samples to 1s
    phase= pi/4; %phase
    y=A*sin(2*pi*f*t); 
%}
fourier=abs(fft(y)/1000);
fourier=fourier(1,1:44100/2+1);
plot(fourier);

