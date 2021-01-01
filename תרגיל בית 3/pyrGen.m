function [Gaussian, Laplacian] = pyrGen(image, n)
    [Gaussian, Laplacian] = pyrGenRecurse(image, image, n, 2);
end

function [Gaussian, Laplacian] = pyrGenRecurse(image, last_level, n, i)
    if n==1
        Gaussian = {last_level};
        Laplacian = {last_level};
    else
        Gaussian = {last_level};
        sigma = 2 ^ i;
        imageGausseFiltered = imgaussfilt(image, sigma);
        Laplacian = {Gaussian{1} - imageGausseFiltered};
        [G, L] = pyrGenRecurse(image, imageGausseFiltered, n-1, i+1);
        Gaussian = [Gaussian; G];
        Laplacian = [Laplacian; L];
    end
end