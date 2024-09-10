N=8;
dctMat= dct_coef(N);
Block=zeros(N,N);  % Preallocate matrix
for i = 1:N
    for j = 1:N
        Block = dctMat(i,:)' * dctMat(j,:);
        subplot(N,N,((i-1)*N) + j);
        imshow(Block);
    end
end
    