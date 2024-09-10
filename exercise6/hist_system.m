load_data;
histogram_matrix = compute_histograms(image_list);
l = length(histogram_matrix);
distances = zeros(l-1,1);
indexes = zeros(l-1,1);
j = 1;
for i = 1:l
    if i == 5
        continue;
    end
    indexes(j)=i;
    distances(j)=compute_Hellinger_distance(histogram_matrix(5,:),histogram_matrix(i,:));
    j = j + 1;
end
[~,indx] = sort(distances);
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