function H = findProjective(pts)
% finds H for which pts(1:2, :) = H * pts(3:4,:)
% pts - matrix (4xn), n is number of pts
% and 4 is the indices of the points
% pts(1:2,i) - (x,y) of the point i from image 1
% pts(3:4,i) - (x,y) of the corresponding point  from image 2


A = zeros(size(pts, 2) * 2 ,9);% Building A matrix

% Each pair of 2d points creates 2 rows in the matrix as we saw in the
% tutorial
for i = 1:size(pts, 2)
    j = 2 * i - 1;
    A(j, :) = [pts(3:4, i)', 1,  zeros(1,3), -pts(1,i) * pts(3:4,i)', -pts(1,i)]; 
    A(j + 1, :) = [zeros(1,3), pts(3:4, i)', 1, -pts(2,i) * pts(3:4,i)', -pts(2,i)];
end

% Using SVD decomposition to get V (right eigenvectors matrix)
[~,~,V] = svd(A); 

% the last column of V is the eigen vector that corresponds to the smallest
% eigen value so it minimize ||Ah|| (as h)
H = V(:,9);
%H = H ./ H(9);

% Reshape the vector to fit matrix form
H = reshape(H, [3,3]).';

end

