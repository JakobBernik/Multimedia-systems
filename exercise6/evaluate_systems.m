classes = load('classes2.mat');
image_list = load('list2.mat');
classes = classes.classes(1:120);
image_list = image_list.list(1:120);
histogram_matrix = compute_histograms({image_list});
feats=cell2mat(struct2cell(load('feats2.mat')));
l = length(image_list);
scores = [];
groundtruth = [];

for i=1:l
    distances = zeros(l-1, 1);
    res = classes{i};
    truth = zeros(l-1, 1);
    
    for j = 1:l-1
        distances(j)=compute_Hellinger_distance(histogram_matrix(i, :), histogram_matrix(j, :));
        if strcmp(classes{j}, res)
            truth(j)=1;
        end
    end
    
    for j = i+1:length(distances)
        distances(j-1)=compute_Hellinger_distance(histogram_matrix(i, :), histogram_matrix(j, :));
        if strcmp(classes{j-1}, res)
            truth(j-1)=1;
        end
    end
    scores = [scores, distances'];
    groundtruth = [groundtruth, truth'];
end
one = ones(1, length(scores));
scores = one - scores;
[R, auc, op , F]= get_roc(scores, groundtruth);

R=R'
figure(3)
plot(R(:,2), R(:,1));

hold on

scores = [];
groundtruth = [];

for i=1:l
    distances = zeros(l-1, 1);
    res = classes{i};
    truth = zeros(l-1, 1);
    
    for j = 1:l-1
        distances(j)=compute_NCC_distance(image_list{i}, image_list{j});
        if strcmp(classes{j}, res)
            truth(j)=1;
        end
    end
    
    for j = i+1:length(distances)
        distances(j-1)=compute_NCC_distance(image_list{i}, image_list{j});
        if strcmp(classes{j-1}, res)
            truth(j-1)=1;
        end
    end
    scores = [scores, distances'];
    groundtruth = [groundtruth, truth'];
end

[R, auc, op , F]= get_roc(scores, groundtruth);

R=R'
figure(3)
plot(R(:,2), R(:,1));

hold on

scores = [];
groundtruth = [];

for i=1:l
    distances = zeros(l-1, 1);
    res = classes{i};
    truth = zeros(l-1, 1);
    
    for j = 1:l-1
        distances(j)=compute_Hellinger_distance(feats(i), feats(j));
        if strcmp(classes{j}, res)
            truth(j)=1;
        end
    end
    
    for j = i+1:length(distances)
        distances(j-1)=compute_Hellinger_distance(feats(i), feats(j));
        if strcmp(classes{j-1}, res)
            truth(j-1)=1;
        end
    end
    scores = [scores, distances'];
    groundtruth = [groundtruth, truth'];
end
one = ones(1, length(scores));
scores = one - scores;
[R, auc, op , F]= get_roc(scores, groundtruth);

R=R'
figure(3)
plot(R(:,2), R(:,1));
legend('Histogram','NCC','CNN');
xlabel('false positive rate');
ylabel('true positive rate');