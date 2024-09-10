function mat=compute_histograms(images)
    l=length(images{1});
    mat=[];
    for i=1:l
        histogram=myhist3(images{1}{i},8);
        mat=[mat; histogram(:)'];
    end 
end