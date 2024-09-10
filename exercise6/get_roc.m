function [R, auc, optimal_point, F] = get_roc(scores, groundtruth)
    n = length(scores);
    R = zeros(2, n+2);
    R(:,n+2) = [1, 1];
    sorted_scores = sort(scores, 'descend');
    optimal_distance = 2;
    optimal_point = [0, 0, 0];
    F = 0;
    for i=2:n+1
        predicted_truth = scores > sorted_scores(i - 1);
        TP = sum(groundtruth & predicted_truth);
        FP = sum(predicted_truth) - TP;
        TN = sum(~(groundtruth | predicted_truth));
        FN = sum(~predicted_truth) - TN;
        R(1,i) = TP / (TP + FN); %TPR value
        R(2,i) = FP / (FP + TN); %FPR value
        point_distance = abs(0 - R(2,i)) + abs(1 - R(1,i));
        if optimal_distance > point_distance
            optimal_distance = point_distance;
            optimal_point = [R(1,i), R(2,i), sorted_scores(i - 1)];
            F = 2 / ((TP + FP + TP +FN) / TP);
        end
    end
    auc=trapz( R(2, :), R(1, :), 2); 
    %trapz performs numerical integration via the trapezoidal method.
    %This method approximates the integration over an interval by breaking the area down into trapezoids
    %with more easily computable areas.
    
    
    
