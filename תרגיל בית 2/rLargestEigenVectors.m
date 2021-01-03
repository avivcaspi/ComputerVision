function [eigen_vectors] = rLargestEigenVectors(X, r)
%rLargestEigenVectors Calculate r largest eigen vector of the cov matrix of
% X

[~,~,V] = svd(X, 'econ'); 

eigen_vectors = V(:, 1:r);

end

