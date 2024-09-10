init;
[R1, auc1, op1, F1] = get_roc(C1, groundtruth);
[R2, auc2, op2, F2] = get_roc(C2, groundtruth);
plot(R1(2,:),R1(1,:));
xlim([0, 1]);
ylim([0, 1]);
hold on
plot(R2(2,:),R2(1,:));
legend('C1','C2');
title(sprintf('C1: T= %.3g, F = %.3g, AUC= %.3g; C2: T= %.3g, F = %.3g, AUC= %.3g', op1(1,3), F1, auc1, op2(1,3), F2, auc2));

