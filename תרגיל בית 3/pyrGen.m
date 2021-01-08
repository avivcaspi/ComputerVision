function [Gaussian, Laplacian] = pyrGen(image, n)
    [Gaussian, Laplacian] = pyrGenRecurse(image, image, n, 2);
end

function [Gaussian, Laplacian] = pyrGenRecurse(image, last_level, n, i)
    if n==1 % last level does not use gaussian
        Gaussian = {last_level};
        Laplacian = {last_level};
    else
        Gaussian = {last_level};
        sigma = 2 ^ i;
        % calculate the next gaussian pyramid level
        imageGausseFiltered = imgaussfilt(image, sigma);
        % use the gaussian pyramid to calculate the laplacian level
        Laplacian = {Gaussian{1} - imageGausseFiltered};
        % recuresive call for the next level of the pyramid
        [G, L] = pyrGenRecurse(image, imageGausseFiltered, n-1, i+1);
        Gaussian = [Gaussian; G];
        Laplacian = [Laplacian; L];
    end
end