load_data;
l = length(image_list{1});
ncc = zeros(l-1,1);
indexes = zeros(l-1,1);
j = 1;
for i = 1:l
    if i == 5
        continue;
    end
    indexes(j)=i;
    ncc(j)=compute_NCC_distance(image_list{1}{5},image_list{1}{i});
    j = j + 1;
end
[~,indx] = sort(ncc,'descend');
sorted_indexes = indexes(indx);
subplot(1,6,1);
imshow(image_list{1}{5});
subplot(1,6,2);
imshow(image_list{1}{sorted_indexes(1)});
subplot(1,6,3);
imshow(image_list{1}{sorted_indexes(2)});
subplot(1,6,4);
imshow(image_list{1}{sorted_indexes(3)});
subplot(1,6,5);
imshow(image_list{1}{sorted_indexes(4)});
subplot(1,6,6);
imshow(image_list{1}{sorted_indexes(5)});