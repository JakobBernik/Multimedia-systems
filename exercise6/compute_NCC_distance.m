function ncc = compute_NCC_distance(reference_image,my_image)
    gray_ri = rgb2gray(reference_image);
    gray_i = rgb2gray(my_image);
    reference_vector= double(gray_ri(:));
    my_vector = double(gray_i(:));
    N =length(reference_vector);
    ref_mean = mean(reference_vector);
    my_mean = mean(my_vector);
    ncc = 1 / N * (sum((reference_vector - ref_mean) .* (my_vector - my_mean)) / (sqrt(1 / N * sum((reference_vector - ref_mean) .^ 2 )) * sqrt(1 / N * sum((my_vector - my_mean) .^2 ))));
end