function score = pairwise_potential_prefactor(img,x1,y1,x2,y2, pairwise_weight)

    if x1 == x2
        score = pairwise_weight;
    else
        score = 0;
        
end
