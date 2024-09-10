function [trackX, trackY] = track_point(frames, startX, startY, patchSize, searchSize)
        [height, width, ~, n] = size(frames);
        image = rgb2gray(frames(:, :, :, 1)); % convert image to grayscale
        x1 = max(1, startX - patchSize / 2);
        y1 = max(1, startY - patchSize / 2);
        x2 = min(width, startX + patchSize / 2 - 1);
        y2 = min(height, startY + patchSize / 2 - 1);
        patch = image(y1:y2, x1:x2); % cut the reference patch (template) from the first frame
        % initialize the output
        trackX = zeros(1, n);
        trackY = zeros(1, n);
        trackX(1) = startX;
        trackY(1) = startY;
        for i = 2:n 
            % TODO: cut a region of seachSize times searchSize with the center in the point's previous position (i-1).
            x3 = max(1, trackX(i-1) - searchSize / 2);
            y3 = max(1,  trackY(i-1)- searchSize / 2);
            x4 = min(width, trackX(i-1) + searchSize / 2 - 1);
            y4 = min(height, trackY(i-1) + searchSize / 2 - 1);
             % TODO: convert the region to grayscale
            region = rgb2gray(frames(y3:y4, x3:x4,:,i));
             % TODO: compare the region to template using normxcorr2
            C = normxcorr2(patch, region);
            % TODO: select best match (maximum) and determine its position
            [y, x]=find(C==max(C(:)));
            trackX(i)=x3+x(1);
            trackY(i)=y3+y(1);
        end