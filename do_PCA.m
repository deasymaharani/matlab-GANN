function [ data_std,COEFF,SCORE,LATENT,var_exp] = do_PCA( dataInput )
    [m,n] = size(dataInput);
    data_std=zscore(dataInput);
    [COEFF,SCORE,LATENT] = princomp(data_std);
    var_exp=cumsum(var(SCORE))/sum(var(SCORE));
end