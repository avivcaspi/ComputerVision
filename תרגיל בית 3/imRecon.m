function reconImage = imRecon(Laplacians)
    % reconstruct image from laplacian pyramid by sum over all levels 
    % (no need to upsize the lower levels)
    reconImage = zeros(size(Laplacians{1}));
    for i=0:size(Laplacians)-1
        reconImage = reconImage + Laplacians{i + 1};
    end
end
