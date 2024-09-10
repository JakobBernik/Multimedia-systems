#histstretch.m
function S = histstretch(I)
  [h,w]=size(I);  
  v_min_IN=min(I(:));
  v_max_IN=max(I(:));
  v_max_OUT=255;
  v_min_OUT=0;
  f=(v_max_OUT-v_min_OUT)/(v_max_IN-v_min_IN);
  S=uint8((double(I) - v_min_IN)* f); %formula s predavanj
end
  #Q1:ker se po uporabi take funkcije nad sliko njen histogram raztegne oz. transformira.
  #taka funkcija je imagesc (imadjust)?