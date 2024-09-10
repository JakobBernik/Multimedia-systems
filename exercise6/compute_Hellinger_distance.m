function Hellinger = compute_Hellinger_distance(h1,h2)
    Hellinger = sqrt(0.5*sum((sqrt(double(h1))-sqrt(double(h2))).^2));
end