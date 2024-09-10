%classes = load('classes2.mat');
%image_list = load('list2.mat');
%classes = classes.classes(1:120);
%image_list = image_list.list(1:120);
load_data;
%feats = calculate_feat_vectors_using_cnn({image_list});
feats=cell2mat(struct2cell(load('feats.mat')));
[l,k]=size(feats);
distances = zeros(l-1,1);
indexes = zeros(l-1,1);
j = 1;
for i = 1:l
    if i == 100
        continue;
    end
    indexes(j)=i;
    distances(j)=compute_Hellinger_distance(feats(100),feats(i));
    j = j + 1;
end
[~,indx] = sort(distances);
sorted_indexes = indexes(indx);
subplot(1,6,1);
imshow(image_list{1}{100});
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