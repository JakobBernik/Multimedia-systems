y = [1 2 3 4 5 4 3 4 5 6 7 8 9 8 7 6 5 4 3 4 5 4 3 2 1];
dct=my_dct(y);
N=length(dct);
idct=zeros(1,N);
idx=linspace(1,N-1,N-1);
result = zeros(1,N);
for i=1:N
    reconstructed = my_idct([dct(1,1:i) zeros(1,N-i)]);
    subplot(1,2,2);
    plot(y-reconstructed);
    xlim([0 30]);
    ylim([-9 9]);
    legend("Razlika");
    subplot(1,2,1);
    plot(y); 
    hold on
    plot(reconstructed);
    legend("signal","rekonstruiran signal");
    hold off
    pause
end