function potentials = unary_potentials(probability, unary_weight)
          potentials = -1*unary_weight*log(probability);  
end
