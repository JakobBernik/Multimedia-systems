function feats = calculate_feat_vectors_using_cnn(image_list)
    net = load('imagenet-vgg-f.mat');
    l=length(image_list{1});
    feats= [];
    for i=1:l
        im = image_list{1}{i};
        im_ = single(im);
        im_ = imresize(im_, net.meta.normalization.imageSize(1:2));
        im_ = im_ - net.meta.normalization.averageImage;
        res = vl_simplenn(net, im_);
        feats =[feats; res(20).x(:)'];
    end
end