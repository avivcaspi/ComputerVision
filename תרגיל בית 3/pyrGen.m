function [Gaussian, Laplacian] = pyrGen(image, n)
    [Gaussian, Laplacian] = pyrGenRecurse(image, n, 0);
end

function [Gaussian, Laplacian] = pyrGenRecurse(image, n, i)
    if n==1
        Gaussian = {image};
        Laplacian = {image};
    else
        Gaussian = {image};
        sigma = 2 ^ 2;
        if i == 0
            i
            imageGausseFiltered = imgaussfilt(image, sigma);
        else
            imageGausseFiltered = image;
            for k=1:i
                k
                imageGausseFiltered = imgaussfilt(imageGausseFiltered, sigma);
            end
        end
        Laplacian = {Gaussian{1} - imageGausseFiltered};
        [G, L] = pyrGenRecurse(imageGausseFiltered, n-1, i+1);
        Gaussian = [Gaussian; G];
        Laplacian = [Laplacian; L];
    end
end